-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 09:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `cust_id`, `address`) VALUES
(1, 2, 'uyuyuijo, trxreju, yttuyo'),
(2, 2, 'ytfreso, ytdjk, ytrkm'),
(3, 3, 'iggtryt, uyfreuyo, uyyruy'),
(4, 2, 'buvhj, htry, hyuyhkj'),
(5, 3, 'utcch, tdyyuh, uytruy');

-- --------------------------------------------------------

--
-- Table structure for table `catagories`
--

CREATE TABLE `catagories` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catagories`
--

INSERT INTO `catagories` (`id`, `name`) VALUES
(1, 'Electrical'),
(2, 'Clothing'),
(3, 'Food'),
(4, 'Healthcare'),
(5, 'Pharmaceuticals');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `status` enum('active','inactive','block') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `status`) VALUES
(1, 'Fahad Hossain', 'fhdhossin@exmple.com', NULL, NULL, 'active'),
(2, 'Nizm Uddin', 'nzmuddin@exmple.com', NULL, NULL, 'inactive'),
(3, 'Mehedi Nihn', 'mehidinihn@exmple.com', NULL, NULL, 'block'),
(4, 'mhim Hssn', 'mhinhssn@exmple.com', NULL, NULL, 'active'),
(5, 'Smim Hssn', 'smimhssn@exmple.com', NULL, NULL, 'block');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `total_amount` decimal(7,2) NOT NULL,
  `dis_amount` decimal(7,2) NOT NULL,
  `net_amount` decimal(7,2) NOT NULL,
  `status` enum('placed','processing','shipping','delivered') NOT NULL,
  `pay_status` enum('paid','unpaid') NOT NULL,
  `pay_type` enum('online','cash') NOT NULL,
  `transaction_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cust_id`, `total_amount`, `dis_amount`, `net_amount`, `status`, `pay_status`, `pay_type`, `transaction_id`) VALUES
(1, 5, 5600.00, 500.00, 5550.00, 'shipping', 'unpaid', 'cash', 'hg45787bhnu'),
(2, 1, 7880.00, 578.00, 8640.00, 'delivered', 'paid', 'online', 'ihbygctf6990'),
(3, 5, 78400.00, 600.00, 78000.00, 'placed', 'paid', 'online', 'gcijj098532'),
(4, 3, 98500.00, 9000.00, 89000.00, 'processing', 'unpaid', 'cash', 'uyvctfy0986543'),
(5, 3, 99999.99, 5000.00, 99999.99, 'shipping', 'paid', 'cash', '0uydrrwdup0864');

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `number` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`id`, `cust_id`, `number`) VALUES
(1, 3, '0234579'),
(2, 1, '2589965'),
(3, 4, '09754322'),
(4, 4, '098643'),
(5, 1, '098642');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `status` enum('available','unavailable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `cat_id`, `description`, `status`) VALUES
(1, 'Phone', 1, NULL, 'available'),
(2, 'Charger', 1, NULL, 'unavailable'),
(3, 'Laptop', 1, NULL, 'available'),
(4, 'Fan', 1, NULL, 'unavailable'),
(5, 'Light', 1, NULL, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `colour` varchar(9) NOT NULL,
  `size` varchar(5) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `stock_quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `prod_id`, `colour`, `size`, `price`, `stock_quantity`) VALUES
(1, 1, 'Black', '6.5\'\'', 5500.00, 567),
(2, 1, 'Red', '6.5\'\'', 56000.00, 749),
(3, 5, 'Blue', '45', 3000.00, 675),
(4, 5, 'Green', '42', 5000.00, 765),
(5, 2, 'White', '34', 700.00, 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `catagories`
--
ALTER TABLE `catagories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catagories`
--
ALTER TABLE `catagories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `catagories` (`id`);

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
