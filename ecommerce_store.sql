-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2026 at 03:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address_type` varchar(50) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(150) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `customer_id`, `address_type`, `city`, `street`, `postal_code`) VALUES
(1, 1, 'Home', 'Dammam', 'King Fahd Road', '32271'),
(2, 2, 'Home', 'Khobar', 'Prince Turki Street', '34447');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'electronics'),
(2, 'clothing'),
(3, 'home & kitchen'),
(4, 'sports');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `phone`) VALUES
(1, 'Ahmed', 'Ali', 'ahmed@example.com', '0500000001'),
(2, 'Sara', 'Mohammed', 'sara@example.com', '0500000002');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_order_report`
-- (See below for the actual view)
--
CREATE TABLE `customer_order_report` (
`first_name` varchar(50)
,`last_name` varchar(50)
,`order_id` int(11)
,`order_date` datetime
,`status` varchar(50)
,`total_amount` decimal(10,2)
,`payment_method` varchar(50)
,`payment_status` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `low_stock_report`
-- (See below for the actual view)
--
CREATE TABLE `low_stock_report` (
`product_name` varchar(100)
,`category_name` varchar(100)
,`stock_quantity` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`, `total_amount`) VALUES
(1, 1, '2026-08-29 19:35:44', 'Shipped', 385.00),
(2, 2, '2026-08-30 16:59:45', 'Processing', 340.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 1, 85.00),
(2, 1, 2, 2, 150.00),
(3, 2, 4, 1, 250.00),
(4, 2, 5, 1, 90.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL DEFAULT 'Pending',
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_status`, `amount`, `payment_date`) VALUES
(1, 1, 'Credit Card', 'Paid', 385.00, '2026-08-31 17:41:14'),
(2, 2, 'Apple Pay', 'Paid', 340.00, '2026-08-31 17:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock_quantity`, `category_id`) VALUES
(1, 'Wireless Mouse', 'Ergonomic wireless mouse', 85.00, 49, 1),
(2, 'Mechanical Keyboard', 'RGB mechanical keyboard', 150.00, 28, 1),
(3, 'Cotton T-Shirt', 'Comfortable cotton t-shirt', 80.00, 100, 2),
(4, 'Coffee Maker', 'Automatic coffee maker', 250.00, 19, 3),
(5, 'Football', 'Professional size football', 90.00, 49, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_sales_report`
-- (See below for the actual view)
--
CREATE TABLE `product_sales_report` (
`product_name` varchar(100)
,`category_name` varchar(100)
,`units_sold` decimal(32,0)
,`revenue` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Structure for view `customer_order_report`
--
DROP TABLE IF EXISTS `customer_order_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_order_report`  AS SELECT `customers`.`first_name` AS `first_name`, `customers`.`last_name` AS `last_name`, `orders`.`order_id` AS `order_id`, `orders`.`order_date` AS `order_date`, `orders`.`status` AS `status`, `orders`.`total_amount` AS `total_amount`, `payments`.`payment_method` AS `payment_method`, `payments`.`payment_status` AS `payment_status` FROM ((`customers` join `orders` on(`customers`.`customer_id` = `orders`.`customer_id`)) left join `payments` on(`orders`.`order_id` = `payments`.`order_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `low_stock_report`
--
DROP TABLE IF EXISTS `low_stock_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `low_stock_report`  AS SELECT `products`.`product_name` AS `product_name`, `categories`.`category_name` AS `category_name`, `products`.`stock_quantity` AS `stock_quantity` FROM (`products` join `categories` on(`products`.`category_id` = `categories`.`category_id`)) WHERE `products`.`stock_quantity` < 30 ;

-- --------------------------------------------------------

--
-- Structure for view `product_sales_report`
--
DROP TABLE IF EXISTS `product_sales_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_sales_report`  AS SELECT `products`.`product_name` AS `product_name`, `categories`.`category_name` AS `category_name`, sum(`order_items`.`quantity`) AS `units_sold`, sum(`order_items`.`quantity` * `order_items`.`unit_price`) AS `revenue` FROM ((`products` join `categories` on(`products`.`category_id` = `categories`.`category_id`)) join `order_items` on(`products`.`product_id` = `order_items`.`product_id`)) GROUP BY `products`.`product_id`, `products`.`product_name`, `categories`.`category_name` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `uq_customer_email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
