-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 16, 2025 at 06:41 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `giftopia_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`) VALUES
(1, 'Mugs', 'mugs', 'assets/images/mugnew.png'),
(2, 'Clothing', 'clothing', 'assets/images/clothnew.png'),
(3, 'Jewelry', 'jewelry', 'assets/images/jewnew.png'),
(4, 'Cakes', 'cakes', 'assets/images/cake.webp'),
(5, 'Toys', 'toys', 'assets/images/toysnew.png'),
(6, 'Teddy Bear', 'teddy-bear', 'assets/images/Untitled design (9).png'),
(7, 'Electronics', 'electronics', 'assets/images/Elecnew.png'),
(8, 'Flower Bouquets', 'flower-bouquets', 'assets/images/flowernew.png'),
(9, 'Chocolate', 'chocolate', 'assets/images/chocolatenew.png'),
(10, 'Shoes', 'shoes', 'assets/images/shoenew.png'),
(11, 'Perfume', 'perfume', 'assets/images/perfumenew.png'),
(12, 'Gift Boxes', 'gift-boxes', 'assets/images/Giftbox1.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_number` varchar(20) NOT NULL,
  `user_id` int DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `recipient_name` varchar(255) NOT NULL,
  `recipient_phone` varchar(20) NOT NULL,
  `delivery_address` text NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `gift_wrapping` tinyint(1) DEFAULT '0',
  `gift_message` text,
  `payment_method` varchar(50) DEFAULT 'cash_on_delivery',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  `occasion` varchar(100) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `stock` int DEFAULT '10',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category_id`, `occasion`, `featured`, `stock`, `created_at`) VALUES
(1, 'Custom Photo Mug', 'Personalized ceramic mug with your photo printed on both sides. Dishwasher safe.', 850.00, 'assets/images/Untitled design (1).png', 1, 'Birthday', 1, 50, '2025-12-13 13:48:26'),
(2, 'Printed T-Shirt', '100% Cotton t-shirt with custom design printing. Available in all sizes.', 2200.00, 'assets/images/Untitled design (3).png', 2, 'Anniversary', 1, 35, '2025-12-13 13:48:26'),
(3, 'Silver Earrings Set', 'Beautiful sterling silver earrings with gemstone accents. Hypoallergenic.', 1570.00, 'assets/images/Untitled design (4).png', 3, 'Graduation', 1, 25, '2025-12-13 13:48:26'),
(4, 'Rose Bouquet', 'Fresh red roses bouquet with baby breath and wrapping.', 2500.00, 'assets/images/Untitled design (5).png', 8, 'Anniversary', 1, 20, '2025-12-13 13:48:26'),
(5, 'Chocolate Cake', '3-layer chocolate cake with custom message. Serves 8-10 people.', 3500.00, 'assets/images/Untitled design (6).png', 4, 'Birthday', 1, 15, '2025-12-13 13:48:26'),
(6, 'Premium Smart Watch', 'Water-resistant smartwatch with fitness tracking and notifications.', 12950.00, 'assets/images/Untitled design (7).png', 7, 'Graduation', 1, 30, '2025-12-13 13:48:26'),
(7, 'Men\'s Casual Shoes', 'Genuine leather casual shoes with memory foam insole.', 5200.00, 'assets/images/Untitled design (8).png', 10, NULL, 0, 40, '2025-12-13 13:48:26'),
(8, 'Soft Teddy Bear', '60cm soft plush teddy bear with ribbon. Perfect gift for all ages.', 1250.00, 'assets/images/Untitled design (9).png', 6, 'Birthday', 1, 60, '2025-12-13 13:48:26'),
(9, 'Premium Chocolate Box', 'Assorted Belgian chocolates in decorative gift box.', 1800.00, 'assets/images/Untitled design (10).png', 9, 'Thank You', 0, 45, '2025-12-13 13:48:26'),
(10, 'Luxury Perfume Set', 'Eau de parfum set with 3 different fragrances for her.', 3200.00, 'assets/images/Untitled design (11).png', 11, 'Anniversary', 1, 28, '2025-12-13 13:48:26'),
(11, 'Body Cream Set', 'Moisturizing body cream set with lavender and coconut scents.', 1200.00, 'assets/images/Untitled design (12).png', 11, NULL, 0, 55, '2025-12-13 13:48:26'),
(12, 'Girls Party Frock', 'Beautiful silk frock with embroidery for special occasions.', 3380.00, 'assets/images/Untitled design (13).png', 2, 'Birthday', 0, 20, '2025-12-13 13:48:26'),
(13, 'Personalized Necklace', 'Custom name necklace with 18K gold plating.', 2850.00, 'assets/images/jewnew.png', 3, 'Anniversary', 1, 18, '2025-12-13 13:48:26'),
(14, 'Wireless Earbuds', 'Noise-cancelling wireless earbuds with 30hr battery life.', 8500.00, 'assets/images/Elecnew.png', 7, 'Graduation', 1, 25, '2025-12-13 13:48:26'),
(15, 'Remote Control Car', 'RC car with 2.4GHz remote control and rechargeable battery.', 3200.00, 'assets/images/toysnew.png', 5, 'Birthday', 0, 30, '2025-12-13 13:48:26'),
(16, 'Birthday Gift Box', 'Curated birthday gift box with 5 surprise items.', 4500.00, 'assets/images/Giftbox1.png', 12, 'Birthday', 1, 40, '2025-12-13 13:48:26'),
(17, 'Romantic Gift Box', 'Special anniversary box with romantic items.', 3800.00, 'assets/images/giftbox2.png', 12, 'Anniversary', 1, 35, '2025-12-13 13:48:26'),
(18, 'Graduation Gift Box', 'Congratulations gift box for graduates.', 4200.00, 'assets/images/giftbox3.png', 12, 'Graduation', 1, 30, '2025-12-13 13:48:26'),
(19, 'Luxury Gift Hamper', 'Premium gift hamper with imported items.', 6500.00, 'assets/images/B3.png', 12, 'Anniversary', 1, 15, '2025-12-13 13:48:26'),
(20, 'Mixed Flower Bouquet', 'Seasonal mixed flowers with decorative vase.', 2800.00, 'assets/images/flowernew.png', 8, 'Thank You', 0, 25, '2025-12-13 13:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `full_name`, `phone`, `address`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@giftopia.com', 'Admin User', '0712345678', 'Admin Address', 'admin', '2025-12-13 13:48:27'),
(2, 'john_doe', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'john@example.com', 'John Doe', '0712345678', '123 Main Street, Colombo', 'user', '2025-12-13 13:48:27'),
(4, 'slnilamessa', '123456789', 'slnilamessa@gmail.com', 'Gayan Kumara', '+94779584216', NULL, 'user', '2025-12-14 10:55:31');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
