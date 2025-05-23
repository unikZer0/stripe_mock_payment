const cors = require("cors");
const express = require("express");
const mysql = require("mysql2/promise");
const { v4: uuidv4 } = require("uuid");
const bodyParser = require('body-parser');

require("dotenv").config();

const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);

const app = express();
const port = process.env.PORT || 8000;
app.use(cors());
app.use(express.static('public'));
app.post("/webhook", express.raw({ type: "application/json" }), async (req, res) => {
  const sig = req.headers["stripe-signature"];
  let event;

  try {
    event = stripe.webhooks.constructEvent(req.body, sig, 'whsec_04a8cfa28f692e67745d72973e0a4ce92bb04db24a6bea6b5df0e4eee93f969d');//get this key from command stripe login
  } catch (err) {
    console.error("Webhook Error:", err.message);
    return res.status(400).send(`Webhook Error: ${err.message}`);
  }

  try {
    switch (event.type) {
      case "checkout.session.completed":
        const session = event.data.object;
        const orderData = {
          status: 'completed',
          updated_at: new Date()
        };
        await conn.query(
          'UPDATE orders SET ? WHERE session_id = ?',
          [orderData, session.id]
        );
        const [orders] = await conn.query(
          'SELECT order_id FROM orders WHERE session_id = ?',
          [session.id]
        );
        const order_id = orders.length ? orders[0].order_id : null;
        if (!order_id) {
          console.error("Order not found for session_id:", session.id);
          return res.status(404).send("Order not found");
        }
        const paymentData = {
          payment_id: session.payment_intent,
          order_id: order_id,
          payment_status: session.payment_status,
          payment_method: session.payment_method_types[0],
          amount: session.amount_total / 100,
          currency: session.currency,
          payment_intent_id: session.payment_intent
        };
        console.log(paymentData);
        
        await conn.query('INSERT INTO payments SET ?', paymentData);
        
        // Update product stock
        const [orderItems] = await conn.query(
          'SELECT product_id, quantity FROM order_items WHERE order_id = ?',
          [order_id]
        );

        for (const item of orderItems) {
          await conn.query(
            'UPDATE products SET stock = stock - ? WHERE product_id = ?',
            [item.quantity, item.product_id]
          );
        }

        console.log("Order completed:", order_id);
        break;

      default:
        console.log(`Unhandled event type ${event.type}`);
    }

    res.json({ received: true });
  } catch (error) {
    console.error("Error processing webhook:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

app.use(bodyParser.json());

// Database connection
let conn = null;

const initMySQL = async () => {
  try {
    conn = await mysql.createConnection({
      host: process.env.DB_HOST || "localhost",
      user: process.env.DB_USER || "root",
      password: process.env.DB_PASSWORD || "",
      database: process.env.DB_NAME || "stripe_payment_v2",
    });
    console.log("Database connected successfully");
  } catch (error) {
    console.error("Database connection failed:", error);
    process.exit(1);
  }
};

// Routes
app.get('/', (req, res) => {
  res.json({ message: 'API is running' });
});

// Checkout endpoint
app.post('/checkout', async (req, res) => {
  try {
    const { user_id, order_items } = req.body;

    if (!user_id || !order_items || !Array.isArray(order_items)) {
      return res.status(400).json({ error: "Invalid request data" });
    }

    // Validate user exists
    const [user] = await conn.query('SELECT * FROM users WHERE user_id = ?', [user_id]);
    if (!user.length) {
      return res.status(404).json({ error: "User not found" });
    }

    let totalAmount = 0;
    const lineItems = [];

    for (const item of order_items) {
      const { product_id, quantity } = item;
      
      const [product] = await conn.query('SELECT * FROM products WHERE product_id = ?', [product_id]);
      if (!product.length) {
        return res.status(404).json({ error: `Product with ID ${product_id} not found` });
      }

      if (product[0].stock < quantity) {
        return res.status(400).json({ error: `Insufficient stock for product ${product[0].name}` });
      }

      const subtotal = product[0].price * quantity;
      totalAmount += subtotal;

      lineItems.push({
        price_data: {
          currency: "lak",
          product_data: {
            name: product[0].name,
            description: product[0].description
          },
          unit_amount: Math.round(product[0].price * 100), 
        },
        quantity: quantity,
      });
    }

    const orderId = uuidv4();
    
    // Create Stripe checkout session
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ["card"],
      line_items: lineItems,
      mode: "payment",
      success_url: `http://localhost:8888/success.html?id=${orderId}`,
      cancel_url: `http://localhost:8888/cancel.html?id=${orderId}`,
    });

    // Create order
    const orderData = {
      OID: orderId,
      user_id: user_id,
      status: 'pending',
      totalAmount: totalAmount,
      session_id: session.id
    };

    const [orderResult] = await conn.query('INSERT INTO orders SET ?', orderData);
    const order_id = orderResult.insertId;

    // Create order items
    for (const item of order_items) {
      const { product_id, quantity } = item;
      const [product] = await conn.query('SELECT price FROM products WHERE product_id = ?', [product_id]);
      
      const orderItemData = {
        order_id: order_id,
        product_id: product_id,
        quantity: quantity,
        price: product[0].price,
        subtotal: product[0].price * quantity
      };

      await conn.query('INSERT INTO order_items SET ?', orderItemData);
    }

    res.json({
      sessionId: session.id,
      url: session.url,
      orderId: orderId
    });

  } catch (error) {
    console.error("Checkout error:", error);
    res.status(500).json({ error: "Checkout failed", details: error.message });
  }
});

// Get order details
app.get('/api/order/:id', async (req, res) => {
  try {
    const orderId = req.params.id;
    
    const [order] = await conn.query(`
      SELECT o.*, u.name as user_name, u.email as user_email
      FROM orders o
      JOIN users u ON o.user_id = u.user_id
      WHERE o.order_id = ?
    `, [orderId]);

    if (!order.length) {
      return res.status(404).json({ error: "Order not found" });
    }

    const [orderItems] = await conn.query(`
      SELECT oi.*, p.name as product_name, p.description
      FROM order_items oi
      JOIN products p ON oi.product_id = p.product_id
      WHERE oi.order_id = ?
    `, [orderId]);

    const [payment] = await conn.query(`
      SELECT * FROM payments WHERE order_id = ?
    `, [orderId]);

    res.json({
      order: order[0],
      items: orderItems,
      payment: payment[0] || null
    });

  } catch (error) {
    console.error("Error fetching order:", error);
    res.status(500).json({ error: "Failed to fetch order details" });
  }
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: "Something broke!" });
});

// Start server
app.listen(port, async () => {
  await initMySQL();
  console.log(`Server started at port ${port}`);
});
