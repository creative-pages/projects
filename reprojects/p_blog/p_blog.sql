-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:26 AM
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
-- Database: `p_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(5) NOT NULL,
  `category_id` int(2) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(50) NOT NULL,
  `post_by` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `category_id`, `title`, `content`, `photo`, `post_by`, `status`, `date_time`) VALUES
(7, 6, 'Fish Fish Fish Fish', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus veniam, illo temporibus ut aliquam perspiciatis dolor corporis minus vitae quo ducimus eveniet dolore nam, fugiat laboriosam molestias quae iste voluptates.', '140420105950.png', 'Admin Arif', 1, '2020-04-14 08:06:33'),
(9, 9, 'What is dollar?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus veniam, illo temporibus ut aliquam perspiciatis dolor corporis minus vitae quo ducimus eveniet dolore nam, fugiat laboriosam molestias quae iste voluptates.	', '140420115145.png', 'Admin Arif', 1, '2020-04-14 09:51:45'),
(10, 1, 'Where is the money book?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus veniam, illo temporibus ut aliquam perspiciatis dolor corporis minus vitae quo ducimus eveniet dolore nam, fugiat laboriosam molestias quae iste voluptates.	', '140420115210.png', 'Admin Arif', 1, '2020-04-14 09:52:10'),
(11, 9, 'Dollar dollar dollar', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus veniam, illo temporibus ut aliquam perspiciatis dolor corporis minus vitae quo ducimus eveniet dolore nam, fugiat laboriosam molestias quae iste voluptates.	', '140420115236.png', 'Admin Arif', 1, '2020-04-14 09:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(2) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `status`, `create_time`, `update_time`) VALUES
(1, 'Motivational Book', 1, '2020-04-14 04:00:22', '2020-04-14 05:15:01'),
(4, 'Spices love', 1, '2020-04-14 04:17:20', '2020-04-14 05:25:03'),
(5, 'Fish', 0, '2020-04-14 06:03:44', '2020-04-14 09:39:13'),
(6, 'Fish Fry', 1, '2020-04-14 06:03:53', '2020-04-14 06:03:53'),
(7, 'Movie', 0, '2020-04-14 09:29:40', '2020-04-14 09:39:20'),
(8, 'Song', 0, '2020-04-14 09:29:47', '2020-04-14 09:39:08'),
(9, 'Dollar', 1, '2020-04-14 09:30:02', '2020-04-14 09:39:05'),
(11, 'dfghjkl', 0, '2020-04-15 04:48:14', '2020-04-15 04:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `header`
--

CREATE TABLE `header` (
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `logo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `header`
--

INSERT INTO `header` (`title`, `subtitle`, `logo`) VALUES
('Blog Posts', 'Cooking item post form many countries all over the world.', '150420075837.png');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `page` varchar(50) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `page`, `update_time`, `date_time`) VALUES
(19, 'Home', 'home.php', '2020-04-17 09:28:02', '2020-04-17 09:28:02'),
(25, 'About Us', 'about-us.php', '2020-04-17 09:55:21', '2020-04-17 09:55:21'),
(26, 'Contact Us', 'contact-us.php', '2020-04-17 09:58:09', '2020-04-17 09:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `photo` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `status`, `photo`, `create_time`, `update_time`) VALUES
(1, 'Admin', 'admin@gmail.com', 'adminarif', 'ef775988943825d2871e1cfa75473ec0', 1, '', '2020-04-15 03:56:34', '2020-04-14 01:55:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
