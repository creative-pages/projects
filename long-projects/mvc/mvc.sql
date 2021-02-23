-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:20 AM
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
-- Database: `mvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `date`) VALUES
(1, 'Nokia', '2020-05-02 04:26:41'),
(2, 'Samsung', '2020-05-02 04:26:41'),
(3, 'Walton', '2020-05-02 04:27:22'),
(4, 'Bata', '2020-05-02 04:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `title`, `date`) VALUES
(1, 'Coding', 'Coding', '2020-05-02 02:45:27'),
(2, 'Health', 'Health', '2020-05-02 02:45:27'),
(3, 'Lifestyle', 'Lifestyle', '2020-05-02 02:45:41'),
(4, 'PHP Love', 'PHP Love', '2020-05-03 05:13:41'),
(43, 'Walton Laptop ', 'Walton Laptop ', '2020-05-03 05:18:25'),
(50, 'Test Title', 'Test Title', '2020-05-05 09:04:20'),
(51, 'Re-check', 'Category re-check', '2020-05-05 09:04:33'),
(54, 'Test', 'Final Test', '2020-05-05 09:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `cat_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `cat_id`, `date`) VALUES
(1, 'First Title Will Be Go Here', 'Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...', 1, '2020-05-03 11:21:18'),
(2, 'Second post title will be here', 'Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...', 2, '2020-05-03 11:21:18'),
(4, 'Forth post will be here..', 'Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...Post Content will be here...', 4, '2020-05-03 11:22:09'),
(10, 'Ramadan food cooking.3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam, repellendus sit nulla officia animi necessitatibus numquam repudiandae suscipit, reiciendis? Doloremque ullam nam consectetur eligendi repellendus dolore dignissimos, vel porro numquam?', 43, '2020-05-05 11:10:29'),
(11, 'Final Test Check', 'Check Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic ducimus expedita accusamus iste molestiae neque quo distinctio quam! Eos consequatur eligendi nihil, sapiente incidunt quis nulla hic ab beatae iste.', 54, '2020-05-05 12:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `ui`
--

CREATE TABLE `ui` (
  `id` int(11) NOT NULL,
  `color` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ui`
--

INSERT INTO `ui` (`id`, `color`) VALUES
(1, '#f788f3');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`, `date`) VALUES
(1, 'admin', 'admin', 1, '2020-05-04 14:49:15'),
(3, 'ashraful', 'ashraful', 3, '2020-05-05 16:25:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ui`
--
ALTER TABLE `ui`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ui`
--
ALTER TABLE `ui`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
