-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2020 at 01:26 PM
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
-- Database: `p_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `update_date`) VALUES
(1, 'Walton', '2020-04-28 06:54:46'),
(2, 'Samsung', '2020-04-28 07:07:36'),
(3, 'Nokia', '2020-04-28 06:55:38'),
(6, 'Fassion', '2020-04-28 06:55:52'),
(7, 'Bata', '2020-04-28 07:08:06'),
(8, 'Loto', '2020-04-28 07:08:11');

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
  `image` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `session_id`, `product_id`, `product_name`, `price`, `quantity`, `image`, `date`) VALUES
(39, '7ilril1gvtovsrj8jq6hng0gtv', 9, 'Nokia sortware', 280, 1, 'f3b8f683b2.jpg', '2020-04-30 06:38:52'),
(41, 'duo0p52rm8tic1vjh9vh481bp2', 6, 'Jewellery for women', 36000, 2, '8bd59e22db.jpg', '2020-05-01 02:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `update_date`) VALUES
(3, 'Software', '2020-04-28 06:09:56'),
(4, 'Footwears', '2020-04-28 06:39:52'),
(5, 'Jewellery', '2020-04-28 06:10:31'),
(6, 'Clothing', '2020-04-28 06:10:45'),
(7, 'Mobile', '2020-04-28 06:44:38'),
(8, 'Laptop', '2020-04-28 06:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `company_address`
--

CREATE TABLE `company_address` (
  `id` int(11) NOT NULL,
  `company_address` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_address`
--

INSERT INTO `company_address` (`id`, `company_address`, `date`) VALUES
(1, '500 Lorem Ipsum Dolor Sit,\r\n\r\n22-56-2-9 Sit Amet, Lorem,\r\n\r\nBangladesh', '2020-05-27 11:10:09');

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
  `image` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `subject`, `message`, `status`, `date`) VALUES
(3, 'Ashraful', 'ashraful@gmail.com', 1782763376, 'Reply for your message.', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', 1, '2020-04-30 04:46:27'),
(4, 'Arif Hossain', 'arif2@gmail.com', 1782763385, 'Again Message', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', 0, '2020-04-30 04:47:27'),
(5, 'Arif Hossain', 'arif2@gmail.com', 1782763385, 'Again Message', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', 0, '2020-04-30 04:47:38'),
(7, 'Problem Check', 'arif@gmail.com', 1782763384, 'For Aivey', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', 0, '2020-04-30 05:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `copyright_number`
--

CREATE TABLE `copyright_number` (
  `id` int(11) NOT NULL,
  `copy_right` text NOT NULL,
  `number_one` varchar(11) NOT NULL,
  `number_two` varchar(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `copyright_number`
--

INSERT INTO `copyright_number` (`id`, `copy_right`, `number_one`, `number_two`, `logo`, `update_time`) VALUES
(1, 'Training with live project &amp; All rights Reseverd 2021', '01713458584', '01813458545', 'logo-4eaf5.png', '2020-04-30 15:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `address`, `city`, `country`, `zip_code`, `phone`, `email`, `password`, `date`) VALUES
(1, 'Arif Aivey', 'Banani', 'Dhaka', 'Bangladesh', 1213, 1782763384, 'arif@gmail.com', '1111111111', '2020-04-29 08:24:42'),
(2, 'Ashraful', 'Bhola', 'Bhola', 'Bangladesh', 12222, 1782763376, 'ashraful@gmail.com', '2222222222', '2020-04-29 08:26:52');

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
  `status` int(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`id`, `customer_id`, `product_id`, `product_name`, `quantity`, `price`, `image`, `status`, `date`) VALUES
(1, 1, 9, 'Nokia sortware', 3, 280, 'f3b8f683b2.jpg', 0, '2020-04-29 14:28:41'),
(3, 1, 11, 'Walton Jewellery', 5, 45000, 'e6caf09611.jpg', 0, '2020-04-29 14:28:41'),
(4, 1, 6, 'Jewellery for women', 1, 36000, '8bd59e22db.jpg', 2, '2020-04-29 14:35:28'),
(6, 1, 10, 'Loto shoes', 2, 1800, '9cf82a1068.png', 2, '2020-04-29 14:39:52'),
(7, 1, 2, 'Baby clothes', 4, 320, 'ae1326245e.jpg', 2, '2020-04-29 14:39:52'),
(10, 1, 11, 'Walton Jewellery', 2, 45000, 'e6caf09611.jpg', 1, '2020-04-29 14:51:07'),
(11, 1, 10, 'Loto shoes', 3, 1800, '9cf82a1068.png', 0, '2020-04-29 14:51:07'),
(12, 1, 11, 'Walton Jewellery', 1, 45000, 'e6caf09611.jpg', 0, '2020-04-30 06:37:08'),
(13, 1, 9, 'Nokia sortware', 1, 280, 'f3b8f683b2.jpg', 0, '2020-04-30 06:37:37'),
(14, 1, 11, 'Walton Jewellery', 2, 45000, 'e6caf09611.jpg', 0, '2020-04-30 06:37:37');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `image` varchar(20) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `brand_id`, `category_id`, `description`, `price`, `image`, `type`, `update_date`) VALUES
(1, 'Walton Laptop', 1, 8, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?', 32000, '665a2f8193.png', 1, '2020-04-28 11:28:42'),
(2, 'Baby clothes', 6, 6, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;', 320, 'ae1326245e.jpg', 2, '2020-04-28 11:20:02'),
(4, 'Samsung Mobile Phone 4G', 2, 7, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;', 18000, '72c974b901.png', 2, '2020-04-28 08:44:47'),
(5, 'Nokia sortware', 3, 3, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;', 180, 'b4641e5692.png', 1, '2020-04-28 08:45:28'),
(6, 'Jewellery for women', 6, 5, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;', 36000, '8bd59e22db.jpg', 1, '2020-04-28 11:19:41'),
(7, 'Samsung headphone', 2, 3, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;', 250, '585eedee5b.png', 1, '2020-04-28 08:48:59'),
(9, 'Nokia sortware', 3, 3, '&lt;p&gt;Nokia ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, saepe, atque. Aspernatur fuga omnis voluptas, velit quod eaque magni nobis similique atque esse facilis reiciendis eius incidunt delectus quam ipsum?&lt;/p&gt;', 280, 'f3b8f683b2.jpg', 2, '2020-04-28 11:19:19'),
(10, 'Loto shoes', 8, 4, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates dicta sint, vitae repellat facere porro rerum cumque qui reprehenderit earum quos nemo autem aliquid, possimus velit, minima expedita molestiae illo.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates dicta sint, vitae repellat facere porro rerum cumque qui reprehenderit earum quos nemo autem aliquid, possimus velit, minima expedita molestiae illo.&lt;/p&gt;', 1800, '9cf82a1068.png', 1, '2020-04-28 10:16:48'),
(11, 'Walton Jewellery', 1, 5, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates dicta sint, vitae repellat facere porro rerum cumque qui reprehenderit earum quos nemo autem aliquid, possimus velit, minima expedita molestiae illo.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates dicta sint, vitae repellat facere porro rerum cumque qui reprehenderit earum quos nemo autem aliquid, possimus velit, minima expedita molestiae illo.&lt;/p&gt;', 45000, 'e6caf09611.jpg', 1, '2020-04-28 11:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `title`, `image`, `date`) VALUES
(1, 'Test Title Jachai', 'd7428bb03f.jpg', '2020-04-30 10:21:24'),
(2, 'Test Title Tester Check', '2070c3554f.jpg', '2020-04-30 10:21:56'),
(3, 'It is the author post', '60e4b2472c.jpg', '2020-04-30 09:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `social`
--

CREATE TABLE `social` (
  `id` int(11) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `google` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `social`
--

INSERT INTO `social` (`id`, `facebook`, `twitter`, `google`, `mail`, `update_date`) VALUES
(1, 'https://web.facebook.com/arif22hossain', 'https://twitter.com/arifaivey', 'https://google-plus.com/arifaivey', 'arifh3261@gmail.com', '2020-05-27 10:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `top_brand`
--

CREATE TABLE `top_brand` (
  `id` int(11) NOT NULL,
  `first_brand` int(11) NOT NULL,
  `second_brand` int(11) NOT NULL,
  `third_brand` int(11) NOT NULL,
  `fourth_brand` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `top_brand`
--

INSERT INTO `top_brand` (`id`, `first_brand`, `second_brand`, `third_brand`, `fourth_brand`, `update_time`) VALUES
(1, 1, 3, 2, 6, '2020-04-30 06:30:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `level` int(1) NOT NULL,
  `image` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `level`, `image`, `date`) VALUES
(1, 'Arif Aivey', 'admin', 'admin@gmail.com', 'adminadmin', 1, '846dfdbe9b.png', '2020-04-27 10:39:43'),
(2, 'Ashraful Khan', 'ashraful', 'ashraful@gmail.com', 'ashrafulashraful', 2, 'ed308520fc.png', '2020-04-28 03:38:22'),
(3, '4th Admin', 'admin4', 'admin4@gmail.com', 'admin4admin4', 2, '7984adedb2.jpg', '2020-04-29 07:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `customer_id`, `product_id`, `product_name`, `image`, `price`, `date`) VALUES
(2, 1, 11, 'Walton Jewellery', 'e6caf09611.jpg', 45000, '2020-04-30 03:52:57'),
(4, 1, 10, 'Loto shoes', '9cf82a1068.png', 1800, '2020-04-30 03:59:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `company_address`
--
ALTER TABLE `company_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compare`
--
ALTER TABLE `compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `copyright_number`
--
ALTER TABLE `copyright_number`
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
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_brand`
--
ALTER TABLE `top_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `company_address`
--
ALTER TABLE `company_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `compare`
--
ALTER TABLE `compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `copyright_number`
--
ALTER TABLE `copyright_number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social`
--
ALTER TABLE `social`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `top_brand`
--
ALTER TABLE `top_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
