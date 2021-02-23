-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2020 at 06:43 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPassword` varchar(32) NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `adminName`, `adminUser`, `adminEmail`, `adminPassword`, `level`) VALUES
(1, 'Arif Hossain', 'admin', 'admin@gmail.com', '1bbd886460827015e5d605ed44252251', 0);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandId`, `brandName`) VALUES
(1, 'Walton'),
(2, 'Samsung'),
(3, 'Nokia'),
(6, 'Ipone'),
(7, 'Symphony'),
(8, 'Bata'),
(9, 'Loto'),
(10, 'Jines'),
(11, 'Fashion');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryName`) VALUES
(4, 'Accessories'),
(5, 'Software'),
(14, 'Mobile Phone'),
(15, 'Laptop'),
(16, 'Desktop'),
(17, 'Sports And Fitness'),
(18, 'Footwear'),
(19, 'Jewellery'),
(20, 'Clothing'),
(21, 'Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `compare`
--

CREATE TABLE `compare` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip_code` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `address`, `city`, `country`, `zip_code`, `phone`, `email`, `password`) VALUES
(11, 'Arif', 'Banani', 'Dhaka', 'Bangladesh', '1213', '01782763384', 'arif11@gmail.com', '1bbd886460827015e5d605ed44252251'),
(12, 'Arif Hossain', 'Bhola', 'Gulshan', 'Bangladesh', '1213', '01782763385', 'arif@gmail.com', '1bbd886460827015e5d605ed44252251'),
(13, 'Ashraful', 'Bhola', 'Bhola', 'Bangladesh', '12222', '01782763376', 'ashraful@gmail.com', 'd27d320c27c3033b7883347d8beca317');

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`id`, `customer_id`, `product_id`, `product_name`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(17, 12, 4, 'LED TV', 1, 20000, 'f9e21d7e70.png', '2020-04-21 07:39:51', 2),
(18, 12, 9, 'LED TV WRAPABLE', 2, 10934, 'dd5c006c62.png', '2020-04-21 08:09:11', 0),
(19, 12, 9, 'LED TV WRAPABLE', 5, 27335, 'dd5c006c62.png', '2020-04-21 08:10:51', 0),
(20, 12, 7, 'Wireless mouse', 1, 3456, '78e3fa7c58.png', '2020-04-21 08:11:17', 0),
(21, 13, 7, 'Wireless mouse', 1, 3456, '78e3fa7c58.png', '2020-04-21 10:08:43', 0),
(22, 13, 4, 'LED TV', 5, 100000, 'f9e21d7e70.png', '2020-04-21 10:08:43', 0),
(23, 13, 9, 'LED TV WRAPABLE', 3, 16401, 'dd5c006c62.png', '2020-04-21 10:08:43', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `brand_id`, `description`, `price`, `image`, `type`) VALUES
(1, 'Walton Laptop Passion++', 4, 1, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur ex placeat nobis maxime rerum quaerat dolore quidem illum! Fugiat earum quidem quibusdam dolorem asperiores nisi, vel voluptas ab exercitationem, quasi.</p>', 32500, '2f6eb9afab.png', 1),
(2, 'Walton mobile GM3+', 14, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur ex placeat nobis maxime rerum quaerat dolore quidem illum! Fugiat earum quidem quibusdam dolorem asperiores nisi, vel voluptas ab exercitationem, quasi.', 8500, '42d6309cad.png', 2),
(4, 'LED TV', 4, 1, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur ex placeat nobis maxime rerum quaerat dolore quidem illum! Fugiat earum quidem quibusdam dolorem asperiores nisi, vel voluptas ab exercitationem, quasi.</p>', 20000, 'f9e21d7e70.png', 1),
(6, 'keyboard with out wire.', 5, 2, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, quidem, culpa. Esse soluta corrupti eaque ea, voluptas id, dolores eos ex dignissimos debitis voluptatem beatae iste nesciunt iure dolore perspiciatis.</p>', 3456, '9558c15715.png', 1),
(7, 'Wireless mouse', 4, 3, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, quidem, culpa. Esse soluta corrupti eaque ea, voluptas id, dolores eos ex dignissimos debitis voluptatem beatae iste nesciunt iure dolore perspiciatis.</p>', 3456, '78e3fa7c58.png', 1),
(8, 'Baby clothes', 20, 11, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, quidem, culpa. Esse soluta corrupti eaque ea, voluptas id, dolores eos ex dignissimos debitis voluptatem beatae iste nesciunt iure dolore perspiciatis.</p>', 354, '9df907ab64.jpg', 2),
(9, 'LED TV WRAPABLE', 16, 2, '<p>NLorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, quidem, culpa. Esse soluta corrupti eaque ea, voluptas id, dolores eos ex dignissimos debitis voluptatem beatae iste nesciunt iure dolore perspiciatis.</p>', 5467, 'dd5c006c62.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

CREATE TABLE `wish_list` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wish_list`
--

INSERT INTO `wish_list` (`id`, `customer_id`, `product_id`, `product_name`, `price`, `image`) VALUES
(13, 12, 4, 'LED TV', 20000, 'f9e21d7e70.png'),
(14, 12, 9, 'LED TV WRAPABLE', 5467, 'dd5c006c62.png'),
(17, 13, 7, 'Wireless mouse', 3456, '78e3fa7c58.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `compare`
--
ALTER TABLE `compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `compare`
--
ALTER TABLE `compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wish_list`
--
ALTER TABLE `wish_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
