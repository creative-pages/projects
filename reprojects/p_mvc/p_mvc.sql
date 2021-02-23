-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:30 AM
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
-- Database: `p_mvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `title`, `date`) VALUES
(1, 'Education', 'Walton Love', '2020-05-06 06:00:04'),
(3, 'Sports', 'Footballs', '2020-05-06 06:00:20'),
(4, 'Lifestyle', 'It is the author post', '2020-05-06 06:00:20'),
(5, 'Cooking', 'Learn cooking Check', '2020-05-06 08:51:02'),
(12, 'Health', 'Do some exercise everyday.', '2020-05-07 03:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `cat` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `cat`, `date`) VALUES
(1, 'First title will be go here', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus nam error, laboriosam quo quis rerum nobis pariatur. Obcaecati repudiandae expedita repellat deleniti cumque laborum inventore, facilis, amet delectus dolore, necessitatibus.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus nam error, laboriosam quo quis rerum nobis pariatur. Obcaecati repudiandae expedita repellat deleniti cumque laborum inventore, facilis, amet delectus dolore, necessitatibus.', 12, '2020-05-06 10:59:15'),
(2, 'Second title will be go here', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus nam error, laboriosam quo quis rerum nobis pariatur. Obcaecati repudiandae expedita repellat deleniti cumque laborum inventore, facilis, amet delectus dolore, necessitatibus.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus nam error, laboriosam quo quis rerum nobis pariatur. Obcaecati repudiandae expedita repellat deleniti cumque laborum inventore, facilis, amet delectus dolore, necessitatibus.', 4, '2020-05-06 10:59:15'),
(4, 'Fourth will be go here', 'Fourth ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus nam error, laboriosam quo quis rerum nobis pariatur. Obcaecati repudiandae expedita repellat deleniti cumque laborum inventore, facilis, amet delectus dolore, necessitatibus.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus nam error, laboriosam quo quis rerum nobis pariatur. Obcaecati repudiandae expedita repellat deleniti cumque laborum inventore, facilis, amet delectus dolore, necessitatibus.', 3, '2020-05-06 10:59:53'),
(5, '5th post title', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit pariatur, doloremque non ut illum similique eligendi corporis maxime, et laudantium vel quasi. Vitae magnam cumque blanditiis, rerum ullam. Odit, cupiditate.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit pariatur, doloremque non ut illum similique eligendi corporis maxime, et laudantium vel quasi. Vitae magnam cumque blanditiis, rerum ullam. Odit, cupiditate.', 3, '2020-05-07 03:36:16'),
(6, 'Validation Check', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit pariatur, doloremque non ut illum similique eligendi corporis maxime, et laudantium vel quasi. Vitae magnam cumque blanditiis, rerum ullam. Odit, cupiditate.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit pariatur, doloremque non ut illum similique eligendi corporis maxime, et laudantium vel quasi. Vitae magnam cumque blanditiis, rerum ullam. Odit, cupiditate.', 1, '2020-05-07 05:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `ui`
--

CREATE TABLE `ui` (
  `id` int(11) NOT NULL,
  `color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ui`
--

INSERT INTO `ui` (`id`, `color`) VALUES
(1, '#ff0000');

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
(1, 'admin', 'admin', 1, '2020-05-06 15:37:50'),
(3, 'ashraful', 'ashraful', 3, '2020-05-07 09:03:53'),
(4, 'arafat', 'arafat', 2, '2020-05-07 09:04:01');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ui`
--
ALTER TABLE `ui`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
