

const stripe = Stripe('pk_test_51RQ0e44c05uxt3S1Jyxe3UdmBquWBHa7AxJ3QewZwGlsJPCfBcr2D5KRdcGmaixV5r2Iqrann7XTwGrf5Bu3oKy900fzmwnhSe')
const placeorder = async =(data)=>{
 const bodyData = {
    "user": {
        "name": data.name,
        "address": data.address
    },
    "product": {
        "name": "unik",
        "price": 20,
        "quantity": 2
    },
 }
 const response = axios.post('http://localhost:8000/checkout',bodyData)
    const sessionId = response.data.sessionId
    stripe.redirectToCheckout({
        sessionId
    })
}
