-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2025 at 08:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stripe_payment_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `OID` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `OID`, `user_id`, `status`, `totalAmount`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'c3d369ba-eccb-4176-a3ac-790ea0e49e63', 1, 'pending', 400000.00, 'cs_test_b1dooNQl2APBl21H9bDGAVzSy0MWRBUrQwrHswO1kuUSgxzQBqh3i3afza', '2025-05-23 08:01:27', '2025-05-23 08:01:27'),
(2, 'd413b169-533b-4c65-add3-f50282f24056', 1, 'pending', 400000.00, 'cs_test_b18yc2G1mxRmyBfRd79b6qcRo1SDRgzn2pjVo38qrfC8UuEfesUoQhMe0P', '2025-05-23 08:04:00', '2025-05-23 08:04:00'),
(3, 'dd676a69-4298-4bb1-b927-1f26aed6f93a', 1, 'pending', 400000.00, 'cs_test_b1b6ESlEnbF5zjWrfhBDiVDvabCjYCQTDxxAg7pLnGtqIDDiYK5C3paY7z', '2025-05-23 08:07:00', '2025-05-23 08:07:00'),
(4, 'd91a31c9-a296-475d-b065-14ed9611fe27', 1, 'pending', 400000.00, 'cs_test_b1sSu1L4qltqd6rNGeJEdNBFcdncMIyQZgPnOaiClZrbuGjGgZDZRe9cin', '2025-05-23 08:13:16', '2025-05-23 08:13:16'),
(5, '5762f177-591c-415d-9eb8-111527e39686', 1, 'pending', 400000.00, 'cs_test_b1Mq6OxqkhaSvcNQ3PbZcSOe0gYW0aFjUoRVUyXvF2PCKxRGix0xB8OcOx', '2025-05-23 08:15:36', '2025-05-23 08:15:36'),
(6, '3dc11360-b536-4272-8706-2d9dd72b1654', 1, 'pending', 400000.00, 'cs_test_b16ALqKpcBzMHeGH7aa1aIigEciXZ77xcIVcCKYjGCDlAUDLVZYmL6kG1w', '2025-05-23 08:34:53', '2025-05-23 08:34:53'),
(7, '3fd236e5-b70f-43b6-9036-62104afa309e', 1, 'completed', 400000.00, 'cs_test_b1GEvMpADNtADKmi1LQfqtaEaOw048y8I8trAzj2nVPX9NAqvlDjeTt88A', '2025-05-23 08:43:49', '2025-05-23 08:44:01'),
(8, '3d3aecef-3605-4005-a123-bdf78dec7d95', 1, 'completed', 400000.00, 'cs_test_b1QcVOWahVFKM8olQS9yR0RAMoQ87iDW5kVm4pitbfi9RrOKDORec2ufDh', '2025-05-23 08:47:44', '2025-05-23 08:47:55'),
(9, 'f71a3ba6-5ab9-4193-973b-35339472ceae', 1, 'completed', 400000.00, 'cs_test_b1hRYOa8eQab2gr8npb2axKS1BcFYaYfHcsoXVV0v9rrwpjb4HMa1WhIPI', '2025-05-23 08:48:32', '2025-05-23 08:48:45'),
(10, 'f1149046-b989-441c-a4c0-3719826c86fc', 1, 'completed', 600000.00, 'cs_test_b1ephvACdjvN7U8lI9giIf77N4FfDMMWvfEQP0JhxTEBJevRe3dJrCZ1yr', '2025-05-23 09:01:41', '2025-05-23 09:01:52'),
(11, '475cea87-bf92-441a-a82f-1e0a9c9c44bd', 1, 'completed', 400000.00, 'cs_test_b1fNIc0dPQ4oZfcFcUuHePrCGWR6loGSrZyH0zRz6Blb11yQbESGWm63Ay', '2025-05-23 18:12:33', '2025-05-23 18:13:02'),
(12, 'e27a2a8c-13e7-4051-9163-490ac7c2c229', 1, 'completed', 400000.00, 'cs_test_b1xbwhnDOaeJW5Fk9UAx9FCrVmxkEstuLzauMf6JhpcvdQmYG4Z4qJASQV', '2025-05-23 18:13:45', '2025-05-23 18:16:00'),
(13, '869ae103-3ec5-491d-ba61-180b8da17fe2', 1, 'completed', 400000.00, 'cs_test_b1ggNl4n0tHCd2tE6OMuFaH2r6gi0pKR6J4M0TPDM29VJkOKD4JtBoa7KO', '2025-05-23 18:16:03', '2025-05-23 18:16:19'),
(14, '201994d4-0d75-4516-9d6c-a6973130b3bb', 1, 'pending', 400000.00, 'cs_test_b1ydVlo9ajhXEV8YP01fI3cnTvd9IawBNlLCokxJwcLEFzFVAIq6n2VHwS', '2025-05-23 18:16:26', '2025-05-23 18:16:26'),
(15, 'adc7fffc-15be-4d45-b61c-bc4c5acf1441', 1, 'pending', 400000.00, 'cs_test_b14Xn9TdES7yWHCFzySX0NDFESAboeyoqcrv4EuUE6suPa81eOqw0BWWZr', '2025-05-23 18:19:00', '2025-05-23 18:19:00'),
(16, '60c107a5-c678-4cd8-b815-96e1d0b7a4d6', 1, 'completed', 400000.00, 'cs_test_b1PcI45DAwggvkzfsX2jfEUj2YPLzVPUZKR5YCxZe5jSgYXu5uFZaJDhya', '2025-05-23 18:24:30', '2025-05-23 18:24:40'),
(17, 'fcdda1af-a4a5-4c23-9316-cbb74d3ba066', 1, 'pending', 400000.00, 'cs_test_b1Tamwu1Whct1eJXTho6tAKYIk71NahdN3rCZqczjAu6DiifXffZUn7tts', '2025-05-23 18:24:42', '2025-05-23 18:24:42'),
(18, 'd8e44f4e-c233-40ea-9ec4-8362bbacb5b3', 1, 'completed', 400000.00, 'cs_test_b1pgCfbrVZanCkg8D3LzU3qrVCw85olGQkvJ04bdJPyjiVEi0VMNaEnXEk', '2025-05-23 18:24:49', '2025-05-23 18:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`, `subtotal`, `created_at`) VALUES
(6, 1, 1, 2, 100000.00, 200000.00, '2025-05-23 08:01:27'),
(7, 1, 2, 1, 200000.00, 200000.00, '2025-05-23 08:01:27'),
(8, 2, 1, 2, 100000.00, 200000.00, '2025-05-23 08:04:00'),
(9, 2, 2, 1, 200000.00, 200000.00, '2025-05-23 08:04:00'),
(10, 3, 1, 2, 100000.00, 200000.00, '2025-05-23 08:07:00'),
(11, 3, 2, 1, 200000.00, 200000.00, '2025-05-23 08:07:00'),
(12, 4, 1, 2, 100000.00, 200000.00, '2025-05-23 08:13:16'),
(13, 4, 2, 1, 200000.00, 200000.00, '2025-05-23 08:13:16'),
(14, 5, 1, 2, 100000.00, 200000.00, '2025-05-23 08:15:36'),
(15, 5, 2, 1, 200000.00, 200000.00, '2025-05-23 08:15:36'),
(16, 6, 1, 2, 100000.00, 200000.00, '2025-05-23 08:34:53'),
(17, 6, 2, 1, 200000.00, 200000.00, '2025-05-23 08:34:53'),
(18, 7, 1, 2, 100000.00, 200000.00, '2025-05-23 08:43:49'),
(19, 7, 2, 1, 200000.00, 200000.00, '2025-05-23 08:43:49'),
(20, 8, 1, 2, 100000.00, 200000.00, '2025-05-23 08:47:44'),
(21, 8, 2, 1, 200000.00, 200000.00, '2025-05-23 08:47:44'),
(22, 9, 1, 2, 100000.00, 200000.00, '2025-05-23 08:48:32'),
(23, 9, 2, 1, 200000.00, 200000.00, '2025-05-23 08:48:32'),
(24, 10, 1, 2, 100000.00, 200000.00, '2025-05-23 09:01:41'),
(25, 10, 2, 2, 200000.00, 400000.00, '2025-05-23 09:01:41'),
(26, 11, 1, 2, 100000.00, 200000.00, '2025-05-23 18:12:33'),
(27, 11, 2, 1, 200000.00, 200000.00, '2025-05-23 18:12:33'),
(28, 12, 1, 2, 100000.00, 200000.00, '2025-05-23 18:13:45'),
(29, 12, 2, 1, 200000.00, 200000.00, '2025-05-23 18:13:45'),
(30, 13, 1, 2, 100000.00, 200000.00, '2025-05-23 18:16:03'),
(31, 13, 2, 1, 200000.00, 200000.00, '2025-05-23 18:16:03'),
(32, 14, 1, 2, 100000.00, 200000.00, '2025-05-23 18:16:26'),
(33, 14, 2, 1, 200000.00, 200000.00, '2025-05-23 18:16:26'),
(34, 15, 1, 2, 100000.00, 200000.00, '2025-05-23 18:19:00'),
(35, 15, 2, 1, 200000.00, 200000.00, '2025-05-23 18:19:00'),
(36, 16, 1, 2, 100000.00, 200000.00, '2025-05-23 18:24:30'),
(37, 16, 2, 1, 200000.00, 200000.00, '2025-05-23 18:24:30'),
(38, 17, 1, 2, 100000.00, 200000.00, '2025-05-23 18:24:42'),
(39, 17, 2, 1, 200000.00, 200000.00, '2025-05-23 18:24:42'),
(40, 18, 1, 2, 100000.00, 200000.00, '2025-05-23 18:24:49'),
(41, 18, 2, 1, 200000.00, 200000.00, '2025-05-23 18:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `payment_intent_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_status`, `payment_method`, `amount`, `currency`, `payment_intent_id`, `created_at`, `updated_at`) VALUES
('pi_3RRrGg4c05uxt3S10rvqXK0b', 8, 'paid', 'card', 400000.00, 'lak', 'pi_3RRrGg4c05uxt3S10rvqXK0b', '2025-05-23 08:47:55', '2025-05-23 08:47:55'),
('pi_3RRrHU4c05uxt3S102wxWoWA', 9, 'paid', 'card', 400000.00, 'lak', 'pi_3RRrHU4c05uxt3S102wxWoWA', '2025-05-23 08:48:45', '2025-05-23 08:48:45'),
('pi_3RRrUC4c05uxt3S10VPK9k7E', 10, 'paid', 'card', 600000.00, 'lak', 'pi_3RRrUC4c05uxt3S10VPK9k7E', '2025-05-23 09:01:52', '2025-05-23 09:01:52'),
('pi_3RS05Z4c05uxt3S11g4KAg5X', 11, 'paid', 'card', 400000.00, 'lak', 'pi_3RS05Z4c05uxt3S11g4KAg5X', '2025-05-23 18:13:02', '2025-05-23 18:13:02'),
('pi_3RS08l4c05uxt3S1067CZ3tY', 13, 'paid', 'card', 400000.00, 'lak', 'pi_3RS08l4c05uxt3S1067CZ3tY', '2025-05-23 18:16:19', '2025-05-23 18:16:19'),
('pi_3RS08S4c05uxt3S10MaqRcJ7', 12, 'paid', 'card', 400000.00, 'lak', 'pi_3RS08S4c05uxt3S10MaqRcJ7', '2025-05-23 18:16:00', '2025-05-23 18:16:00'),
('pi_3RS0Gp4c05uxt3S113vqMDwD', 16, 'paid', 'card', 400000.00, 'lak', 'pi_3RS0Gp4c05uxt3S113vqMDwD', '2025-05-23 18:24:40', '2025-05-23 18:24:40'),
('pi_3RS0HE4c05uxt3S11GUBz9gj', 18, 'paid', 'card', 360000.00, 'lak', 'pi_3RS0HE4c05uxt3S11GUBz9gj', '2025-05-23 18:25:05', '2025-05-23 18:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Product A', 'Description for Product A', 100000.00, 84, '2025-05-20 08:34:27', '2025-05-23 18:25:05'),
(2, 'Product B', 'Description for Product B', 200000.00, 41, '2025-05-20 08:34:27', '2025-05-23 18:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_code_usages`
--

CREATE TABLE `promotion_code_usages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `promo_code_id` varchar(255) DEFAULT NULL,
  `promo_code` varchar(255) DEFAULT NULL,
  `discount_amount` DECIMAL(10,2) DEFAULT NULL,
  `used_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john@example.com', '2025-05-20 08:34:27', '2025-05-23 07:59:37'),
(2, 'Jane Smith', 'jane@example.com', '2025-05-20 08:34:27', '2025-05-23 07:59:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_item_order` (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payment_order` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `promotion_code_usages`
--
ALTER TABLE `promotion_code_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promotion_code_usages`
--
ALTER TABLE `promotion_code_usages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `promotion_code_usages`
--
ALTER TABLE `promotion_code_usages`
  ADD CONSTRAINT `promotion_code_usages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `promotion_code_usages_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `promotion_code_usages_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
