-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:16 AM
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
-- Database: `a_mvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `date`) VALUES
(1, 'Book', '2020-05-10 04:18:02'),
(2, 'Health', '2020-05-10 04:18:02'),
(3, 'Food', '2020-05-10 04:18:22'),
(4, 'Lifestyle', '2020-05-10 04:18:22'),
(16, 'Walton', '2020-05-10 15:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `num_one` varchar(11) NOT NULL,
  `num_two` varchar(11) NOT NULL,
  `mail_one` varchar(255) NOT NULL,
  `mail_two` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `num_one`, `num_two`, `mail_one`, `mail_two`, `date`) VALUES
(1, '01782763384', '01786763382', 'arif@gmail.com', 'aivey@gmail.com', '2020-05-11 12:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `page_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `body`, `page_id`, `date`) VALUES
(1, 'About Us', 1, '2020-05-12 05:35:40'),
(2, 'Contact Us <strong>Test</strong>Test							', 2, '2020-05-12 12:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `subtitle` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `header`
--

INSERT INTO `header` (`id`, `title`, `subtitle`, `logo`, `date`) VALUES
(1, 'Website Title', 'Blog - This the subtitle of the website.', 'p1.jpg', '2020-05-11 12:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `tags` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `name`, `status`, `title`, `description`, `keywords`, `tags`, `author`, `date`) VALUES
(1, 'About Us', 1, 'About Us || Blog Post Website', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'HTML, CSS, PHP', 'php, development', 'Arif', '2020-05-12 05:35:05'),
(2, 'Contact Us', 1, 'Contact Us || Blog Post Website', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore asperiores velit aliquid repellendus voluptates dolorum sit optio laborum rerum.', 'contact, blog post', 'html, css', 'Arif', '2020-05-12 05:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(40) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `post_by` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `image`, `cat_id`, `status`, `post_by`, `date`) VALUES
(3, 'Third title', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae quia at nisi deleniti veritatis dolorum, quaerat delectus, error ducimus perspiciatis. Ipsum quibusdam itaque deserunt libero, saepe quis excepturi eum laudantium?\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae quia at nisi deleniti veritatis dolorum, quaerat delectus, error ducimus perspiciatis. Ipsum quibusdam itaque deserunt libero, saepe quis excepturi eum laudantium?', '8522d9747651d80a596e95fb8288ec78.jpg', 4, 2, 'admin', '2020-05-10 05:32:51'),
(4, 'Fourth title', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae quia at nisi deleniti veritatis dolorum, quaerat delectus, error same country ducimus perspiciatis. Ipsum quibusdam itaque deserunt libero, saepe me quis excepturi eum laudantium?\r\nLorem ipsum dolor sit amet, same consectetur adipisicing elit. Repudiandae quia at nisi you deleniti veritatis dolorum, quaerat delectus, error ducimus perspiciatis. Ipsum quibusdam itaque deserunt libero, saepe quis excepturi eum laudantium?', '924b77abd717107f1b29f4aca6d95c81.jpg', 1, 1, 'editor', '2020-05-10 05:32:51'),
(5, 'It is the author post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim modi repudiandae tempora, pariatur assumenda quos possimus consequatur dignissimos quidem, nisi veritatis qui totam laboriosam at, omnis aivey fugiat deserunt provident.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Enim modi repudiandae tempora, pariatur assumenda quos possimus consequatur dignissimos quidem, nisi veritatis qui totam laboriosam at, omnis voluptate fugiat deserunt provident.', 'e43a0b8d518eab4386685cfc81147909.jpg', 2, 1, 'admin', '2020-05-11 03:28:16'),
(6, 'It is the author post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim modi repudiandae tempora, pariatur assumenda quos possimus consequatur dignissimos quidem, nisi veritatis qui totam laboriosam at, same omnis voluptate fugiat deserunt provident.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Enim modi repudiandae tempora, pariatur assumenda quos possimus consequatur dignissimos quidem, nisi veritatis qui totam laboriosam at, omnis voluptate fugiat deserunt provident.', '8baeba1dae7b676cccc3ed6453d852ba.jpg', 16, 2, 'admin', '2020-05-11 03:30:25'),
(7, 'Test Title Tester', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim modi repudiandae tempora, pariatur assumenda quos possimus consequatur dignissimos quidem, nisi veritatis qui totam laboriosam at, omnis voluptate fugiat deserunt provident.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Enim modi repudiandae tempora, pariatur assumenda quos possimus consequatur dignissimos quidem, nisi veritatis qui totam laboriosam at, omnis voluptate fugiat deserunt provident.', 'b1e6263b1e299e09efef121127dddae3.jpg', 1, 1, 'admin', '2020-05-11 03:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `level`, `date`) VALUES
(1, 'admin', 'admin', 1, '2020-05-10 09:57:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
