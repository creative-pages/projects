-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2020 at 11:54 AM
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
CREATE DATABASE IF NOT EXISTS `a_mvc` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `a_mvc`;

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
--
-- Database: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog`;

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
  `name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `category_id`, `title`, `content`, `photo`, `name`, `status`, `create_time`) VALUES
(9, 14, 'Please return love.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At veritatis nobis quidem cupiditate est reiciendis incidunt, enim accusamus aspernatur magni officia sunt nemo quis repellat, quasi qui, dignissimos eaque consequuntur.Lorem ipsum dolor sit amet, consectetur adipisicing elit. At veritatis nobis quidem cupiditate est reiciendis incidunt, enim accusamus aspernatur magni officia sunt nemo quis repellat, quasi qui, dignissimos eaque consequuntur.', '110420072814.png', 'Admin', 1, '2020-04-11 17:28:14');

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
(12, 'Book', 1, '2020-04-11 11:35:06', '2020-04-11 12:15:52'),
(13, 'Fish Fry', 1, '2020-04-11 11:35:09', '2020-04-11 13:25:40'),
(14, 'Selfish Love', 1, '2020-04-11 11:35:12', '2020-04-11 13:25:41'),
(16, 'Jalmuri', 1, '2020-04-11 13:25:58', '2020-04-11 13:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `status`, `photo`, `date_time`, `update_time`) VALUES
(1, 'Admin', 'admin', '1bbd886460827015e5d605ed44252251', 1, '', '2020-04-11 04:28:13', '2020-04-11 04:28:13'),
(2, 'Kamal', 'kamal', '12345678', 1, '', '2020-07-23 05:55:31', '2020-07-23 05:55:31');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `blog_2`
--
CREATE DATABASE IF NOT EXISTS `blog_2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog_2`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `date`) VALUES
(1, 'JAVA', '2020-04-23 04:16:45'),
(2, 'PHP', '2020-04-23 04:16:45'),
(3, 'HTML', '2020-04-23 04:16:45'),
(4, 'CSS', '2020-04-23 04:16:45'),
(24, 'Testers', '2020-04-23 16:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `fname`, `lname`, `email`, `message`, `status`, `date`) VALUES
(2, 'Sharif', 'Hossain', 'sharif@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, '2020-04-25 02:53:40'),
(3, 'Ashraful', 'Hossain', 'ashraful@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&lt;br /&gt;tempor incididunt ut labore et', 1, '2020-04-25 04:40:22'),
(4, 'Shohag', 'Khan', 'shohag@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&lt;br /&gt;tempor incididunt ut labore et', 0, '2020-04-25 04:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `footer`
--

CREATE TABLE `footer` (
  `id` int(11) NOT NULL,
  `copy_right` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `footer`
--

INSERT INTO `footer` (`id`, `copy_right`) VALUES
(1, 'Copyright Training with live project');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `name`, `content`) VALUES
(1, 'About Us', '&lt;p&gt;About ipsum dolor sit amet, consectetur adipisicing elit. Nam, quae. Voluptatum, blanditiis, quia. Tempora ex veritatis quos assumenda maxime, quod rem mollitia numquam enim distinctio quaerat, cupiditate possimus consequuntur deleniti?&lt;/p&gt;'),
(4, 'Privacy', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam, quae. Voluptatum, blanditiis, quia. Tempora ex veritatis quos assumenda maxime, quod rem mollitia numquam enim distinctio quaerat, cupiditate possimus consequuntur deleniti?&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam, quae. Voluptatum, blanditiis, quia. Tempora ex veritatis quos assumenda maxime, quod rem mollitia numquam enim distinctio quaerat, cupiditate possimus consequuntur deleniti?&lt;/p&gt;'),
(9, 'Portfolio', '&lt;p&gt;About us..Some text will be go here. Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here. Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.&lt;/p&gt;\r\n&lt;p&gt;About me..Some text will be go here. Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here. Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.Some text will be go here.&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `category_id`, `title`, `content`, `image`, `author`, `user_id`, `tags`, `date`) VALUES
(1, 1, 'Our post title- JAVA', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;', 'f627e38ef7.png', 'admin', 1, 'JAVA, Programming', '2020-04-23 04:21:17'),
(2, 2, 'Our post title- PHP', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'post2.png', 'author', 7, 'PHP, Programming', '2020-04-23 04:21:17'),
(3, 3, 'Our post title- HTML', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;', '29de5be044.png', 'admin', 1, 'HTML, Web development', '2020-04-23 04:24:22'),
(4, 4, 'Our post title- CSS', '&lt;p&gt;Lorem styleshet dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;', '3ebb551857.png', 'editor', 8, 'CSS', '2020-04-23 04:24:22'),
(5, 1, 'Java is too dificult!', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'post2.png', 'author', 7, 'Java Basic, Java Advance', '2020-04-23 04:32:11'),
(6, 3, 'HTML || Mother language for development.', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;', 'post2.png', 'editor', 8, 'Mother language, HTML', '2020-04-23 04:32:11'),
(8, 4, 'Tester to Css', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&lt;br /&gt;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,&lt;br /&gt;quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&lt;br /&gt;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&lt;br /&gt;cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non&lt;br /&gt;proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&lt;br /&gt;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,&lt;br /&gt;quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&lt;br /&gt;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&lt;br /&gt;cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non&lt;br /&gt;proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;', '035ab64846.png', 'editor', 8, 'test, test post', '2020-04-24 03:05:57'),
(15, 2, 'It is the author post', '&lt;p&gt;&lt;span&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&amp;lt;br /&amp;gt;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,&amp;lt;br /&amp;gt;quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&amp;lt;br /&amp;gt;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&amp;lt;br /&amp;gt;cillum dolore eu fugiat nulla pariatur.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&amp;lt;br /&amp;gt;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,&amp;lt;br /&amp;gt;quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&amp;lt;br /&amp;gt;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&amp;lt;br /&amp;gt;cillum dolore eu fugiat nulla pariatur.&lt;/span&gt;&lt;/p&gt;', '5fb758115b.png', 'author', 7, 'php, development', '2020-04-25 12:25:03');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `image`, `title`, `date`) VALUES
(5, '53f1ffd0c8.jpg', 'HTML || Mother language for development.', '2020-04-26 08:51:02'),
(6, '0d7f38f9d5.jpg', 'Test Title Tester Check', '2020-04-26 08:50:23'),
(7, 'd4b0afd4bb.jpg', 'Our post title- PHP', '2020-04-26 08:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `social`
--

CREATE TABLE `social` (
  `id` int(11) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `google` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `social`
--

INSERT INTO `social` (`id`, `facebook`, `twitter`, `linkedin`, `google`) VALUES
(1, 'www.facebook.com/arif22hossain', 'www.twitter.com', 'www.linkedin.com', 'www.google.com/arif22hossain');

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `id` int(11) NOT NULL,
  `theme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`id`, `theme`) VALUES
(1, 'green');

-- --------------------------------------------------------

--
-- Table structure for table `title_slogan`
--

CREATE TABLE `title_slogan` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slogan` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `title_slogan`
--

INSERT INTO `title_slogan` (`id`, `title`, `slogan`, `logo`) VALUES
(1, 'Blog Templates', 'Our Website Slogan: Bloging', 'logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `role` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `details`, `role`, `date`) VALUES
(1, 'Arif', 'admin', 'admin', 'arif@gmail.com', 'Banani, Dhaka', 1, '2020-04-23 04:33:10'),
(7, 'Arafat', 'author', 'author', 'arafat@gmail.com', 'Bhola, Bangladesh', 2, '2020-04-25 08:34:45'),
(8, 'Omor', 'editor', 'editor', 'omor@gmail.com', 'Bhola, Bangladesh', 3, '2020-04-25 08:34:57'),
(12, 'Saiful', 'arif2', 'arif2', 'arif2@gmail.com', 'Mosharof Bazar', 3, '2020-04-26 01:49:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `title_slogan`
--
ALTER TABLE `title_slogan`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `title_slogan`
--
ALTER TABLE `title_slogan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Database: `b_blog`
--
CREATE DATABASE IF NOT EXISTS `b_blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `b_blog`;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(2) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `post_by` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `category_id`, `content`, `image`, `post_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cooking fish blog\'s', 17, 'Lorem2 ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.', '20200723030459.png', 'Admin', 2, '2020-07-23 12:17:13', '2020-07-23 13:14:45'),
(4, 'Learn cooking Check', 14, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.', '20200723024207.png', 'Admin', 1, '2020-07-23 12:42:07', '2020-07-23 12:42:07'),
(5, 'How to buy a mouse from showroom', 16, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.', '20200723031151.png', 'Admin', 2, '2020-07-23 13:11:51', '2020-07-23 13:48:20'),
(6, 'How to buy a shirt', 17, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.', '20200723034637.png', 'Admin', 1, '2020-07-23 13:46:37', '2020-07-23 13:46:37'),
(7, 'Fashion show', 19, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.', '20200723034728.png', 'Admin', 1, '2020-07-23 13:47:28', '2020-07-23 13:47:28'),
(8, 'Men Pants', 21, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est nihil, a fugiat facilis aliquid, aperiam quas dolorem quae accusamus itaque. In autem, eos asperiores natus quas quasi obcaecati totam expedita.', '20200723034750.png', 'Admin', 1, '2020-07-23 13:47:50', '2020-07-23 14:18:14');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(2) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `status`, `date_time`, `update_time`) VALUES
(1, 'Shoes', 2, '2020-07-23 08:46:37', '2020-07-23 10:04:23'),
(2, 'Walton Laptop', 2, '2020-07-23 08:48:06', '2020-07-23 10:54:43'),
(5, 'Tester', 2, '2020-07-23 08:51:02', '2020-07-23 09:35:09'),
(14, 'Arafat', 1, '2020-07-23 09:11:09', '2020-07-23 13:48:41'),
(16, 'Walton Mouse', 1, '2020-07-23 09:35:27', '2020-07-23 13:52:56'),
(17, 'Dollar Money', 1, '2020-07-23 09:35:42', '2020-07-23 11:09:00'),
(18, 'Love', 2, '2020-07-23 10:55:58', '2020-07-23 10:56:05'),
(19, 'Fashion', 1, '2020-07-23 13:46:46', '2020-07-23 13:46:46'),
(20, 'Ladies', 1, '2020-07-23 13:46:55', '2020-07-23 13:46:55'),
(21, 'Man', 1, '2020-07-23 13:47:03', '2020-07-23 13:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `status`, `image`, `date_time`, `update_time`) VALUES
(1, 'Arif Hossain', 'admin', '11111111', 1, '', '2020-07-23 06:42:50', '2020-07-23 06:42:50');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `b_lms`
--
CREATE DATABASE IF NOT EXISTS `b_lms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `b_lms`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(5) NOT NULL,
  `book_name` varchar(70) DEFAULT NULL,
  `book_image` varchar(100) DEFAULT NULL,
  `book_author_name` varchar(50) DEFAULT NULL,
  `book_pub_name` varchar(50) DEFAULT NULL,
  `book_pur_date` varchar(50) DEFAULT NULL,
  `book_price` int(5) NOT NULL,
  `book_qty` int(5) DEFAULT NULL,
  `book_avail_qty` int(5) DEFAULT NULL,
  `librarian_username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `book_image`, `book_author_name`, `book_pub_name`, `book_pur_date`, `book_price`, `book_qty`, `book_avail_qty`, `librarian_username`) VALUES
(6, 'শেষ২', '200716073719.png', 'Arif', 'Pocha', '2020-07-26', 23, 22, 21, 'kamal2'),
(7, 'শেষ End', '200716083123.png', 'আরিফ Hossain', 'হতাশা', '2020-07-15', 232, 5, 4, 'kamal2'),
(8, 'Football', '200716074248.png', 'আরিফ', 'Pocha', '2020-07-24', 333, 8, 8, 'kamal2'),
(9, 'Cricket', '200716074308.png', 'Kamal', 'Hopeless', '2020-07-19', 654, 10, 9, 'kamal2'),
(10, 'Fish Fry', '200716083235.png', 'Saddam', 'Main', '2020-07-04', 3456, 6, 5, 'kamal2');

-- --------------------------------------------------------

--
-- Table structure for table `issue_books`
--

CREATE TABLE `issue_books` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `book_issue_date` varchar(20) NOT NULL,
  `book_return_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue_books`
--

INSERT INTO `issue_books` (`id`, `student_id`, `book_id`, `book_issue_date`, `book_return_date`, `date_time`) VALUES
(1, 4, 9, '16-07-2020', '16-07-20', '2020-07-16 11:18:56'),
(2, 1, 7, '16-07-2020', '16-07-20', '2020-07-16 11:20:12'),
(3, 8, 8, '16-07-2020', '16-07-20', '2020-07-16 11:20:21'),
(4, 1, 8, '16-07-2020', '16-07-20', '2020-07-16 11:22:09'),
(5, 4, 10, '16-07-2020', '16-07-20', '2020-07-16 11:22:18'),
(6, 8, 10, '16-07-2020', '16-07-20', '2020-07-16 11:22:27'),
(7, 1, 6, '16-07-2020', '16-07-20', '2020-07-16 12:30:09'),
(8, 4, 7, '16-07-2020', '', '2020-07-16 12:30:15'),
(9, 8, 8, '16-07-2020', '16-07-20', '2020-07-16 12:30:21'),
(10, 1, 9, '16-07-2020', '', '2020-07-16 12:30:29'),
(11, 4, 10, '16-07-2020', '16-07-20', '2020-07-16 12:30:35'),
(12, 8, 10, '16-07-2020', '', '2020-07-16 12:30:44'),
(13, 4, 6, '16-07-2020', '16-07-20', '2020-07-16 12:53:07'),
(14, 4, 6, '16-07-2020', '16-07-20', '2020-07-16 12:56:04'),
(15, 8, 6, '16-07-2020', '', '2020-07-16 12:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `id` int(3) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id`, `fname`, `lname`, `email`, `username`, `password`, `date_time`) VALUES
(1, 'Kamal', 'Hasan', 'kamal@gmail.com', 'kamal2', '123456', '2020-07-15 15:30:32');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `roll` int(6) NOT NULL,
  `reg` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `roll`, `reg`, `email`, `username`, `password`, `phone`, `image`, `status`, `date_time`) VALUES
(1, 'Arif', 'Hossain', 435444, 444443, 'arif@gmail.com', 'admin', '$2y$10$4dZqj6b95kBZ0qDe.wr1He05Mhccn1z6GCyksTkBurfYNeR.Gjpxe', '01782763384', NULL, 1, '2020-07-15 12:14:13'),
(2, 'Ashraful', 'Khan', 435445, 444444, 'arif2@gmail.com', 'admin2', '$2y$10$.dOuuD5c6qBlk/.qPvYbHevhEySxhAJ60coX.c0dnDzmuA.1qf35i', '01782763384', NULL, 0, '2020-07-15 12:41:40'),
(4, 'Arafat', 'Bodullah', 435446, 444445, 'arif3@gmail.com', 'admin3', '$2y$10$/7FPpAtOOvh/Ixjj0VdRZ.Hnz24kLEdhnKmAlUQUXCNSjnGdwWvmS', '01782763384', NULL, 1, '2020-07-15 12:52:08'),
(5, 'Kamal', 'Hasan', 435447, 444446, 'kamal@gmail.com', 'kamal', '$2y$10$Hz6BxShXykn/P6HSN0T3hOWqv6sYifnPog3vtymvA9L7GsPWY.q.C', '01782763376', NULL, 0, '2020-07-15 13:10:08'),
(8, 'Omor', 'Bodullah', 435448, 444447, 'arif6@gmail.com', 'admin9', '$2y$10$BX.QPYA4VuAn0dkzETXRjOJD3m0T2znWQwR/eOkhz9mfFSTk1I02G', '01782763384', NULL, 1, '2020-07-15 13:32:20'),
(9, 'Simon', 'DJ', 234567, 234567, 'saimon@gmail.com', 'saimon', '123456', '01782763384', NULL, 1, '2020-07-16 14:39:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_books`
--
ALTER TABLE `issue_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `issue_books`
--
ALTER TABLE `issue_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `b_php_ajax`
--
CREATE DATABASE IF NOT EXISTS `b_php_ajax` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `b_php_ajax`;

-- --------------------------------------------------------

--
-- Table structure for table `auto_save`
--

CREATE TABLE `auto_save` (
  `content_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auto_save`
--

INSERT INTO `auto_save` (`content_id`, `content`, `status`) VALUES
(1, 'Aivey  Hossain', 'draft'),
(2, 'Arif Hossain', 'draft'),
(3, 'kamal', 'draft'),
(4, 'Jamal', 'draft'),
(5, 'Sharif', 'draft'),
(6, 'dfghjk', 'draft'),
(7, 'Jamal Mama is good.', 'draft'),
(8, 'I love Aivey.\n[Arif+Aivey]LOVE.AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA.', 'draft');

-- --------------------------------------------------------

--
-- Table structure for table `refresh`
--

CREATE TABLE `refresh` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `refresh`
--

INSERT INTO `refresh` (`id`, `content`) VALUES
(5, 'I love you Aivey.');

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `id` int(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`id`, `name`, `username`, `email`, `date`) VALUES
(1, 'Arif', 'arif', 'arif@gmail.com', '2020-07-24 14:39:37'),
(2, 'Sharif', 'sharif', 'sharif@gmail.com', '2020-07-24 14:39:37'),
(3, 'Kamal', 'kamal', 'kamal@gmail.com', '2020-07-24 14:39:37'),
(4, 'Arafat', 'arafat', 'arafat@gmail.com', '2020-07-24 14:39:37'),
(5, 'Omor', 'omor', 'omor@gmail.com', '2020-07-24 14:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `skill` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`id`, `skill`) VALUES
(1, 'JavaScript'),
(2, 'HTML'),
(3, 'CSS'),
(4, 'PHP'),
(5, 'JAVA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`) VALUES
(1, 'ashraful'),
(2, 'arif'),
(3, 'sharif'),
(4, 'shohag'),
(5, 'arafat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto_save`
--
ALTER TABLE `auto_save`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `refresh`
--
ALTER TABLE `refresh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto_save`
--
ALTER TABLE `auto_save`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `refresh`
--
ALTER TABLE `refresh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `search`
--
ALTER TABLE `search`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `b_sms`
--
CREATE DATABASE IF NOT EXISTS `b_sms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `b_sms`;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `roll` int(6) NOT NULL,
  `class` int(1) NOT NULL,
  `city` varchar(50) NOT NULL,
  `p_contact` varchar(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `roll`, `class`, `city`, `p_contact`, `image`, `date_time`) VALUES
(1, 'Arif Hossain Aivey', 777777, 5, 'Dhaka', '01782763384', '200717122442.png', '2020-07-17 10:24:42'),
(3, 'Aarafat Hossain', 435499, 7, 'Barisan', '01782763385', '200717015305.png', '2020-07-17 10:29:25'),
(5, 'Omor', 435440, 6, 'Bhola', '01782763386', '200717015514.png', '2020-07-17 10:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `image`, `status`, `date_time`) VALUES
(2, 'Kamal Hasan', 'kamal@gmail.com', 'kamals', '111111', '200717031058.png', 1, '2020-07-17 04:33:00'),
(5, 'Jamal Hasan', 'kalam@gmail.com', 'jamals', '111111', '200717063407.png', 0, '2020-07-17 04:34:07'),
(6, 'Jamal Mama', 'jamalmama@gmail.com', 'jamalmama', '111111', '200717063445.png', 1, '2020-07-17 04:34:45'),
(7, 'Arafat Hossain', 'arafat@gmail.com', 'arafat', '111111', '200717064000.png', 0, '2020-07-17 04:40:00'),
(10, 'Aslam', 'aslam@gmail.com', 'aslams', '111111', '200717032600.png', 0, '2020-07-17 13:26:00'),
(11, 'Kawser', 'kawers@gmail.com', 'kawers', '111111', '200717033111.png', 0, '2020-07-17 13:31:11'),
(12, 'Ripon', 'ripons@gmail.com', 'ripons', '111111', '200717033206.png', 0, '2020-07-17 13:32:06'),
(13, 'Finger', 'finger@gmail.com', 'finger', '111111', '200717033354.png', 1, '2020-07-17 13:33:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roll` (`roll`);

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
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Database: `employee`
--
CREATE DATABASE IF NOT EXISTS `employee` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `employee`;

-- --------------------------------------------------------

--
-- Table structure for table `alogin`
--

CREATE TABLE `alogin` (
  `id` int(11) NOT NULL,
  `email` tinytext NOT NULL,
  `password` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alogin`
--

INSERT INTO `alogin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `nid` int(20) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `dept` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `pic` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `firstName`, `lastName`, `email`, `password`, `birthday`, `gender`, `contact`, `nid`, `address`, `dept`, `degree`, `pic`) VALUES
(101, 'Mehadi', 'Hassan', 'mehadi@xyz.corp', '1234', '1997-08-13', 'Male', '01919', 12121, 'Razarbagh', 'IT', 'Head', 'images/me.png'),
(102, 'Test', 'Pilot', 'testpilot@gmail.com', '1234', '2018-01-01', 'Male', '0202', 303, 'Ad_______', 'CSE', 'CSE', 'images/no.jpg'),
(103, 'Steven', 'Wilson', 'wilson@xyz.corp', '1234', '1990-02-02', 'Male', '5252', 6262, 'Thames, UK', 'Creative', 'MSc', 'images/sw-google.png'),
(104, 'Guthrie', 'Govan', 'guthrie@xyz.corp', '1234', '1971-12-01', 'Male', '9595', 5959, 'Chemsford, USA', 'Creative', 'MSc', 'images/test.jpg'),
(105, 'Elon', 'Musk', 'elon@spacex.com', '1234', '1971-06-28', 'Male', '8585', 5858, 'LA, USA', 'SpaceTech', 'BSc', 'images/330px-Elon_Musk_Royal_Society.jpg'),
(106, 'Hacker', 'Man', 'hackerman@xyz.corp', '1234', '1990-02-02', 'Male', '7575', 5757, 'Underground, Dhaka', 'NetworkSecurity', 'MSc', 'images/hacker.png'),
(107, 'Wonder ', 'Woman', 'woman@xyz.corp', '1234', '1993-03-03', 'Female', '4545', 5454, 'USA', 'Defense ', 'MS', 'images/no.jpg'),
(108, 'Andrew', ' Ng', 'andrew@xyz.corp', '1234', '1976-04-16', 'Male', '758758', 857857, 'USA', 'AI', 'PhD', 'images/download.jpeg'),
(109, 'Ian ', 'Goodfellow', 'ian@xyz.corp', '1234', '1985-01-01', 'Male', '852852', 258258, 'USA', 'AI', 'PhD', 'images/1-5.jpg'),
(110, 'Christopher ', 'Manning', 'christopher@xyz.corp', '1234', '1965-09-18', 'Male', '147147', 741741, 'USA', 'NLP', 'PhD', 'images/download (1).jpeg'),
(111, 'Jon', 'Snow', 'john@xyz.corp', '1234', '2011-02-01', 'Male', '0187282', 112233, 'Winterfell', 'Management', 'BSc.', 'images/jon-snow.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave`
--

CREATE TABLE `employee_leave` (
  `id` int(11) DEFAULT NULL,
  `token` int(11) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `reason` char(100) DEFAULT NULL,
  `status` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_leave`
--

INSERT INTO `employee_leave` (`id`, `token`, `start`, `end`, `reason`, `status`) VALUES
(101, 301, '2019-04-07', '2019-04-08', 'Sick Leave', 'Approved'),
(102, 305, '2019-04-07', '2019-04-08', 'Urgent Family Cause', 'Approved'),
(103, 306, '2019-04-08', '2019-04-08', 'Concert Tour', 'Approved'),
(101, 307, '2019-04-14', '2019-04-30', 'Want to see GOT', 'Pending'),
(105, 308, '2019-04-26', '2019-04-30', 'Launching Tesla Model Y', 'Pending'),
(111, 309, '2019-04-09', '2019-04-13', 'Visit to Kings Landing', 'Pending'),
(104, 310, '2019-04-08', '2019-04-09', 'Emergency Leave', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pid` int(11) NOT NULL,
  `eid` int(11) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `subdate` date DEFAULT '0000-00-00',
  `mark` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pid`, `eid`, `pname`, `duedate`, `subdate`, `mark`, `status`) VALUES
(213, 101, 'Database', '2019-04-07', '2019-04-04', 10, 'Submitted'),
(214, 102, 'Test', '2019-04-10', '0000-00-00', 0, 'Due'),
(215, 105, 'Tesla Model Y', '2019-04-19', '2019-04-06', 10, 'Submitted'),
(216, 106, 'Hack', '2019-05-04', '2019-04-05', 5, 'Submitted'),
(217, 111, 'Do Nothing', '2019-04-02', '2019-04-01', 8, 'Submitted'),
(218, 105, 'Tesla Model X', '2019-04-03', '2019-04-03', 10, 'Submitted'),
(219, 101, 'PHP', '2019-04-07', '0000-00-00', 0, 'Due'),
(220, 110, 'Data Analysis', '2019-04-16', '2019-04-04', 8, 'Submitted'),
(221, 110, 'Data Analysis', '2019-04-16', '2019-04-04', 7, 'Submitted'),
(222, 103, 'Statistical', '2019-04-19', '2019-04-04', 6, 'Submitted'),
(223, 108, 'Software Scema', '2019-04-09', '2019-04-02', 3, 'Submitted'),
(224, 107, 'Security Check', '2019-04-26', '2019-04-05', 9, 'Submitted'),
(225, 109, 'ML', '2019-04-03', '2019-04-04', 6, 'Submitted');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `eid` int(11) NOT NULL,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`eid`, `points`) VALUES
(101, 10),
(102, 0),
(103, 6),
(104, 0),
(105, 20),
(106, 5),
(107, 9),
(108, 3),
(109, 6),
(110, 15),
(111, 8);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `base` int(11) NOT NULL,
  `bonus` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `base`, `bonus`, `total`) VALUES
(101, 55000, 10, 60500),
(102, 16500, 0, 16500),
(103, 65000, 6, 68900),
(104, 78000, 0, 78000),
(105, 105000, 20, 126000),
(106, 60000, 5, 63000),
(107, 77000, 9, 83930),
(108, 50000, 3, 51500),
(109, 85000, 6, 90100),
(110, 47000, 15, 54050),
(111, 45000, 8, 48600);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alogin`
--
ALTER TABLE `alogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employee_leave`
--
ALTER TABLE `employee_leave`
  ADD PRIMARY KEY (`token`),
  ADD KEY `employee_leave_ibfk_1` (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `project_ibfk_1` (`eid`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alogin`
--
ALTER TABLE `alogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `employee_leave`
--
ALTER TABLE `employee_leave`
  MODIFY `token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_leave`
--
ALTER TABLE `employee_leave`
  ADD CONSTRAINT `employee_leave_ibfk_1` FOREIGN KEY (`id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rank`
--
ALTER TABLE `rank`
  ADD CONSTRAINT `rank_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `flipmart`
--
CREATE DATABASE IF NOT EXISTS `flipmart` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `flipmart`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mrs. Elvera Legros', 'Jaydon Schamberger', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(2, 'Bennett Murazik', 'Dr. Aron Weimann V', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(3, 'Alexa Kuhn', 'Alexanne Reilly', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(4, 'Miss Zella Mraz II', 'Miss Angeline Will Jr.', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(5, 'Eileen Kub', 'Brayan Beatty', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(6, 'Obie Shanahan', 'Prof. Stanley Upton I', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(7, 'Katrine Hartmann', 'Mr. Edgardo Konopelski IV', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(8, 'Nichole Kshlerin', 'Dr. Lamont Wiegand Jr.', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(9, 'River Ebert', 'Dr. Maria Keeling II', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(10, 'Dr. Garth Cummings DDS', 'Samanta Roob', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Berniece Treutel', 'Rex Reinger', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(2, 'Emmanuel Herzog', 'Jamir Pagac', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(3, 'Dr. Telly Wolff', 'Sydney Conn', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(4, 'Rene Friesen', 'Kane Jacobi', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(5, 'Miss Sunny Quigley', 'Ms. Jazmin Strosin', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(6, 'Vanessa Mills', 'Quinn Sauer', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(7, 'Fletcher Veum II', 'Tiara Ward', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(8, 'Geoffrey Bogisich', 'Jean Huel', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(9, 'Lexus Pouros', 'Kevon Terry', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(10, 'Diego Morissette DDS', 'Delilah Collins DVM', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_19_061233_create_brands_table', 1),
(5, '2020_05_21_080725_create_categories_table', 1),
(6, '2020_05_21_114655_create_sub_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `cat_id`, `subcat_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Miss Fabiola O\'Reilly', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41'),
(2, 5, 'Ms. Antoinette Skiles I', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41'),
(3, 7, 'Barry Dare', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41'),
(4, 3, 'Lori Baumbach I', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41'),
(5, 9, 'Martin Torphy DVM', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(6, 4, 'Mr. Henderson Goyette II', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(7, 8, 'Dolores Cremin', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(8, 2, 'Roslyn Sipes', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(9, 5, 'Alejandrin Leffler III', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(10, 8, 'Prof. Naomie Bergstrom', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$5IMekGGe/s9bpoi2HgjKZOKxUsxv1gduAPEG3xBbbyoAwYSW9Yjsy', NULL, '2020-05-22 00:33:38', '2020-05-22 00:33:38'),
(2, 'Grayce Padberg PhD', 'ckeeling@crooks.com', NULL, '$2y$10$RQHLhAwzmE8HaaEDpWvrAOG8d2W4hq3p.2AWP/gi4CHI69jfatLP2', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(3, 'Gabriel Kunde', 'lee04@hotmail.com', NULL, '$2y$10$HiEX72YQXth.ELR3SZEqh.jr4RxAtHCLDJzN0r0BExFgp6d8EYwXG', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(4, 'Prof. Orin Hamill Jr.', 'martine88@hotmail.com', NULL, '$2y$10$8OLlkbtbU.Bs5MhK.H9N1O/fS5ac/F6nYV23SFoxjGPewmsIKvsP.', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(5, 'Dr. Sebastian Walker', 'parker.billie@yahoo.com', NULL, '$2y$10$LNIpnGmN7H0GjIa9026DXuDD2z9G4fzEFE38CXpDT6EuZf1VKEqRq', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(6, 'Brennan Dickens', 'lisette23@pollich.com', NULL, '$2y$10$jb75hOmf7ItzAWzBErvExuN7V2o4BSLvGRNZtX1J7lbj.nimS7o6G', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(7, 'Dr. Twila Marks Jr.', 'qmoore@gmail.com', NULL, '$2y$10$.JwJvKCV4STcFHX.beitau89lJfwEFMCbzp4zS2f1sLxkk7PMlinG', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40'),
(8, 'Adelle Boyle MD', 'progahn@barrows.com', NULL, '$2y$10$d0kIKSYnMYFXcTqQV7HTm.SKoyrpH5YGQT.WfbWURbwP56d9FsrGq', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40'),
(9, 'Dr. Green Batz MD', 'rowena.gaylord@yahoo.com', NULL, '$2y$10$bkkbU5zOhwYO5qVdN3ic6.LZ3e2eelquAuroBFRZeEddg8PbOrRwy', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40'),
(10, 'Roosevelt Kuhic', 'maximus18@yahoo.com', NULL, '$2y$10$cbfbvu3lJ9lkImi6UNvj4OTFoJud6JagrwZ/X/ZK1Rz8qE4BbNqKG', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40'),
(11, 'Asha Graham II', 'feil.chauncey@yahoo.com', NULL, '$2y$10$I.y2kRDiwlwvxfrC37gdve0qrH1jHc6YpO5jCcGaYC/i/9DbFsLnS', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Database: `graphic_corner`
--
CREATE DATABASE IF NOT EXISTS `graphic_corner` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `graphic_corner`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'admin',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullname`, `email`, `password`, `status`, `create_time`, `update_time`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin@gmail.com', 'admin', '2020-08-31 04:58:27', '2020-11-10 10:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `main_file` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `session_id`, `product_id`, `main_file`, `price`, `quantity`, `date_time`) VALUES
(24, 'cpqpg3lt9vnmf7r30o13p09odb', 20, 'jquery60b34b4181.zip', '3434', 0, '2020-11-14 16:50:51'),
(32, 'dq8o879c0a3pvaiq0h2jbputfu', 22, 'wordpress-5e5ee2a3528.zip', '343', 0, '2020-11-18 03:26:42'),
(33, 'dq8o879c0a3pvaiq0h2jbputfu', 17, 'laravel-htaccess-master46b4cbc7e2.zip', '433', 0, '2020-11-18 03:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '0',
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `categoryName`, `keywords`, `description`, `serial`, `date_time`, `update_time`) VALUES
(1, 'Premium Lungi', 'Premium Lungi, lungi, lungi online, white lungi, rowdy lungi, lungi price, cotton lungi, black lungi', 'Buy Lungi at Best Price.', '0', '2020-09-15 07:12:49', '2020-09-15 08:38:06'),
(2, 'Men\'s Vest', 'Men\'s Vest, vests, suit vest, rich star vest, polo vest, mens sweater vest, tuxedo vest\r\n\r\n', 'Vests For Men - Buy men\'s innerwear vests online at great price from Wardrobebd. Shop today & enjoy great discounts! ✯ Easy returns and exchanges ✯ Free Shipping ✯ COD', '0', '2020-09-15 09:10:59', '2020-09-15 11:42:28'),
(3, 'Sandals', 'Sandals, flip flops, nike slides, tory burch sandals, platform sandals, adidas slides', 'Free shipping BOTH ways on Sandals from our vast selection of styles. Fast delivery, and 24/7/365 real-person service with a smile.', '0', '2020-09-15 07:14:36', '2020-09-15 11:44:44'),
(5, 'Children Socks', 'Children Socks, kids socks, crazy socks for kids, baby knee high socks, boys slipper socks, kids slipper socks', 'Find the best socks for children based on what customers said', '0', '2020-09-15 07:15:57', '2020-09-15 09:38:38'),
(6, 'Home Wear', 'Home Wear, Home Wear in Bangladesh, buy Home Wear online in Bangladesh, online store for Home Wear, Shop online for Home Wear, online shopping for Home Wear, Online shopping for Home Wear in Bangladesh, reviews and prices', 'Home Wear Online. Shop for Home Wear in Bangladesh âœ¯ Buy latest range of Home Wear at Wardrobebd.', '0', '2020-09-15 07:16:18', '2020-09-15 09:35:39'),
(7, 'Islamic Wear', 'Islamic Wear, islamic clothing, modest dresses, dresses for muslim', 'Attractive Islamic wear for muslim man and women in Bangladesh  including modest dress quality with customizable options in sizes at best discounted prices', '0', '2020-09-15 07:17:42', '2020-09-15 09:17:59'),
(8, 'Home Accessories', 'Home Accessories, home decor items, wall art decor, framed wall art, wall art canvas, decorative items, decorative wall mirrors', 'Because the details matter. For modern and unique home decor, mirrors, vases, picture frames, vases and more, shop online.', '0', '2020-09-15 07:33:45', '2020-09-15 09:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contest`
--

CREATE TABLE `contest` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `software` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `format` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `file` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `reject_reason` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contest`
--

INSERT INTO `contest` (`id`, `customer_id`, `title`, `software`, `version`, `size`, `color`, `format`, `tag`, `delivery_time`, `price`, `description`, `file`, `type`, `status`, `reject_reason`, `create_time`) VALUES
(13, 1, 'Contest 1', 'Adobe Photoshop', '', '', '', 'AI', 'template,designs,extradfd', '2', '343', 'dfdfdfd', '104293798_200487911140874_8530015037216052051_n1aac47cc44.png', 'contest', 'accepted', '', '2020-11-15 07:31:37'),
(14, 1, 'Eid', 'Adobe Photoshop', 'Adobe CC CS6', '34', 'RGB', 'AI,MS WORD', 'book,template,extradfd', '2', '343', 'jhjhgjhj', '0001 (2)a4fba75757.jpg,0001a4fba75757.jpg', 'contest', 'accepted', '', '2020-11-15 09:04:55'),
(15, 1, 'contest5', 'Adobe Photoshop,Adobe Illustrator', 'Adobe CC 14', '37', 'RGB', 'AI,MS WORD', 'template,designs,extradfd', '2', '343', 'hghjhjhj', '0001 (2)aea3057213.jpg,0001aea3057213.jpg,laravel7aea3057213.jpg', 'contest', 'accepted', '', '2020-11-16 03:52:32'),
(16, 1, 'Eid', 'Adobe Photoshop,Adobe Indesign', 'Adobe CC 14', '34', 'RGB', 'AI,DOC', 'vector,extra', '2', '343', 'yuyuyyu', 'screencapture-localhost-e-shop-2020-06-18-13_31_51a975fc9c2b.png,laravel7a975fc9c2b.jpg,php-v7-logoa975fc9c2b.jpg', 'custom_order', 'accepted', '', '2020-11-16 04:09:36'),
(22, 1, 'Customer order 3', 'Adobe Photoshop,Adobe Indesign', 'Adobe CC 15', '37', 'RGB', 'AI,ALT', 'template,vector,extra', '3', '566', 'dfdfdddffd', '104293798_200487911140874_8530015037216052051_n8952a1eaf3.png,0001 (2)8952a1eaf3.jpg,00018952a1eaf3.jpg', 'custom_order', 'accepted', '', '2020-11-16 10:43:57'),
(26, 1, 'Eid', 'Adobe Photoshop,Adobe Illustrator', 'Adobe CC 20', '', '', 'AI', 'designs,vector,boss', '3', '454', 'rerer', '104293798_200487911140874_8530015037216052051_nebfd2c16b9.png,0001 (2)ebfd2c16b9.jpg,0001ebfd2c16b9.jpg', 'custom_order', 'pending', '', '2020-11-16 10:56:11'),
(27, 1, 'Eid', 'Adobe Photoshop,Adobe Illustrator', 'Adobe CC 20', '', '', 'AI', 'designs,vector,boss', '3', '454', 'rerer', '104293798_200487911140874_8530015037216052051_nb77c4127bd.png,0001 (2)b77c4127bd.jpg,0001b77c4127bd.jpg', 'custom_order', 'pending', '', '2020-11-16 10:56:13'),
(30, 1, 'Eid', 'Adobe Photoshop,Adobe Illustrator', 'Adobe CC 20', '', '', 'AI', 'designs,vector,boss', '3', '454', 'rerer', '104293798_200487911140874_8530015037216052051_n45785dfef4.png,0001 (2)45785dfef4.jpg,000145785dfef4.jpg', 'custom_order', 'pending', '', '2020-11-16 10:56:18'),
(31, 1, 'Eid', 'Adobe Photoshop,Adobe Illustrator', 'Adobe CC 20', '', '', 'AI', 'designs,vector,boss', '3', '454', 'rerer', '104293798_200487911140874_8530015037216052051_nb18e975ffd.png,0001 (2)b18e975ffd.jpg,0001b18e975ffd.jpg', 'custom_order', 'pending', '', '2020-11-16 10:56:24'),
(33, 1, 'Eid', 'Adobe Photoshop,Adobe Illustrator', 'Adobe CC 20', '', '', 'AI', 'designs,vector,boss', '3', '454', 'rerer', '104293798_200487911140874_8530015037216052051_ncc207c49c1.png,0001 (2)cc207c49c1.jpg,0001cc207c49c1.jpg', 'custom_order', 'accepted', '', '2020-11-16 10:56:28'),
(34, 1, 'contest a', 'Adobe Photoshop,Adobe Indesign', 'Adobe CC 14', '34', 'CMYK', 'AI,DOC', 'book,template,extra', '3', '343', 'hjhjhjh', '0001 (2)0b6f0d324e.jpg,screencapture-localhost-e-shop-2020-06-18-13_31_510b6f0d324e.png', 'contest', 'accepted', '', '2020-11-16 10:58:43'),
(36, 1, 'contest a', 'Adobe Photoshop,Adobe Indesign', 'Adobe CC 14', '34', 'CMYK', 'AI,DOC', 'book,template,extra', '3', '343', 'hjhjhjh', '0001 (2)bbaf813e7c.jpg,screencapture-localhost-e-shop-2020-06-18-13_31_51bbaf813e7c.png', 'contest', 'rejected', 'dfdfdfdf', '2020-11-16 10:58:46'),
(39, 1, 'Contest last', 'Adobe Photoshop', 'Adobe CC 14', '34', 'CMYK', 'AI,DOC', 'template,designs,extra', '4', '455', 'dfdfdfdf', 'Screenshot (15)7abb550382.png,Screenshot (14) - Copy7abb550382.png', 'contest', 'pending', '', '2020-11-17 03:12:05'),
(40, 1, 'custom order radio button', 'Adobe Illustrator', 'Adobe CC CS6', 'fd', 'CMYK', 'AI,DOC', 'template,designs,errere', '1', '343', 'dfdf', 'Screenshot (58)6f004b090b.png', 'custom_order', 'pending', '', '2020-11-20 06:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `contest_submit`
--

CREATE TABLE `contest_submit` (
  `id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `seller_id` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `main_file` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contest_submit`
--

INSERT INTO `contest_submit` (`id`, `contest_id`, `seller_id`, `rating`, `image`, `main_file`, `status`, `price`, `create_time`) VALUES
(1, 13, 'Admin', 2, '0001b493f6dac6.jpg', '', '', '', '2020-11-19 09:29:21'),
(2, 13, 'Admin', 3, '104293798_200487911140874_8530015037216052051_ncb6f12d653.png', '', '', '', '2020-11-15 15:38:02'),
(3, 14, 'Admin', 4, 'laravel72222631460.jpg', '', '', '', '2020-11-16 03:22:42'),
(4, 14, '7', 5, '0001 (2)bba0e37c2c.jpg', '', '', '', '2020-11-19 09:29:25'),
(5, 15, '7', 3, 'php-v7-logo01afe99367.jpg', 'jquery42dab0bc45.zip', 'confirmed', '240.1', '2020-11-19 09:31:24'),
(6, 15, 'Admin', 2, 'screencapture-localhost-e-shop-2020-06-18-13_31_514f128850cf.png', '', '', '', '2020-11-19 09:29:29'),
(7, 16, 'Admin', 2, '0001 (2)8dc5f47dd2.jpg', '', '', '', '2020-11-19 09:29:32'),
(8, 34, 'Admin', 5, '104293798_200487911140874_8530015037216052051_n85b49bd269.png', '', 'confirmed', '240.1', '2020-11-19 09:29:43'),
(9, 33, 'Admin', 0, 'screencapture-localhost-e-shop-2020-06-18-13_31_510158c65b8f.png', '', '', '', '2020-11-16 16:02:49'),
(10, 33, 'Admin', 4, '0001 (2)5a9bdfb0e9.jpg', '', '', '', '2020-11-19 09:29:37'),
(11, 14, 'Admin', 0, 'Screenshot (58)166f09c2e2.png', '', '', '', '2020-11-21 05:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'customer',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `email`, `password`, `phone`, `address_1`, `address_2`, `country`, `city`, `postal_code`, `status`, `create_date`, `update_date`) VALUES
(1, 'Omor Faruk', 'omor@gmail.com', 'omor@gmail.com', '01782763385', 'Bhola, Barisal', 'Bapta', 'BD', 'Bhola', '1234', 'customer', '2020-11-11 06:01:04', '2020-11-11 09:24:18'),
(2, 'Aklima Akter', 'aklima@gmail.com', 'aklima@gmail.com', '01782363386', 'Ilisha, Barisal', 'Bapta', 'Pakistan', 'Lalmohon', '1235', 'customer', '2020-11-11 06:18:57', '2020-11-11 09:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `customer_message`
--

CREATE TABLE `customer_message` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_message`
--

INSERT INTO `customer_message` (`id`, `customer_id`, `subject`, `message`, `type`, `status`, `create_time`) VALUES
(1, '1', 'Test', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus quia dolores repellat reprehenderit autem aspernatur omnis, et quos optio aut similique eum ullam nesciunt possimus quaerat porro, explicabo velit, accusantium.', 'sent', '1', '2020-11-16 14:45:03'),
(2, '1', 'Test 2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus quia dolores repellat reprehenderit autem aspernatur omnis, et quos optio aut similique eum ullam nesciunt possimus quaerat porro, explicabo velit, accusantium.', 'reply', '0', '2020-11-16 14:45:57'),
(3, '1', 'jamal', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus quia dolores repellat reprehenderit autem aspernatur omnis, et quos optio aut similique eum ullam nesciunt possimus quaerat porro, explicabo velit, accusantium.Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus quia dolores repellat reprehenderit autem aspernatur omnis, et quos optio aut similique eum ullam nesciunt possimus quaerat porro, explicabo velit, accusantium.', 'reply', '1', '2020-11-16 15:00:09'),
(4, '1', 'Test', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus quia dolores repellat reprehenderit autem aspernatur omnis, et quos optio aut similique eum ullam nesciunt possimus quaerat porro, explicabo velit, accusantium.Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus quia dolores repellat reprehenderit autem aspernatur omnis, et quos optio aut similique eum ullam nesciunt possimus quaerat porro, explicabo velit, accusantium.', 'sent', '1', '2020-11-16 16:04:54'),
(5, '1', 'Test', 'reply', 'reply', '1', '2020-11-16 16:49:05'),
(6, '1', 'Test', 'trrtrtrrtr fdfdfdf', 'reply', '1', '2020-11-16 17:38:11'),
(7, '1', 'Test', 'Final reply test', 'reply', '0', '2020-11-17 02:46:22'),
(8, '1', 'Test', 'customer Lorem ipsum dolor sit amet consectetur adipisicing, elit. Consectetur officiis fugiat ratione, incidunt maiores provident, magnam neque sint a animi sunt minus, earum quaerat excepturi. Illo deserunt dolorem fugiat itaque!', 'sent', '0', '2020-11-17 03:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `main_file` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `date` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`id`, `customer_id`, `product_id`, `main_file`, `quantity`, `price`, `date`, `date_time`, `status`) VALUES
(8, 2, 17, 'laravel-htaccess-master46b4cbc7e2.zip', 0, 433, '11-2020', '2020-11-14 05:55:40', 1),
(9, 2, 18, 'laravel-htaccess-master8ff380205f.zip', 0, 343, '11-2020', '2020-11-14 05:57:03', 0),
(11, 1, 17, 'laravel-htaccess-master46b4cbc7e2.zip', 0, 433, '11-2020', '2020-11-14 07:03:49', 0),
(12, 2, 20, 'jquery60b34b4181.zip', 0, 3434, '10-2020', '2020-11-14 16:51:14', 0),
(13, 1, 14, 'laravel-htaccess-masterd44328f711.zip', 0, 434, '11-2020', '2020-11-16 11:15:08', 0),
(14, 1, 21, 'jquery65d78d0a9a.zip', 0, 34343, '11-2020', '2020-11-16 11:16:23', 0),
(15, 1, 21, 'jquery65d78d0a9a.zip', 0, 34343, '11-2020', '2020-11-16 12:19:09', 0),
(16, 1, 20, 'jquery60b34b4181.zip', 0, 3434, '11-2020', '2020-11-16 12:23:47', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `seller_id` varchar(255) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `tag` varchar(450) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `software` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `format` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `total_sale` int(11) NOT NULL,
  `sub_price` varchar(255) NOT NULL,
  `price` varchar(11) NOT NULL,
  `offer` varchar(255) NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  `main_file` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `reject_reason` text NOT NULL,
  `day` varchar(11) NOT NULL,
  `month` varchar(11) NOT NULL,
  `year` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `seller_id`, `cat_id`, `sub_cat_id`, `tag`, `title`, `description`, `software`, `version`, `format`, `color`, `total_sale`, `sub_price`, `price`, `offer`, `images`, `main_file`, `status`, `reject_reason`, `day`, `month`, `year`, `create_time`, `update_time`) VALUES
(14, '7', 5, 3, 'vector,extradfd', 'Peon', 'ddfdf', 'Adobe Illustrator', 'Adobe CC 17', 'AI,ALT,DOC,PNG', 'RGB', 1, '434', '434', '', '79927634_3392930650725408_5603146092711159520_nd44328f711.jpg,104293798_200487911140874_8530015037216052051_nd44328f711.png', 'laravel-htaccess-masterd44328f711.zip', 'accepted', '', '12-11-2020', '11-2020', 2020, '2020-11-12 08:18:27', '2020-11-19 08:35:26'),
(17, 'Admin', 7, 0, 'template,extra', 'Design', 'dfdfdffeerer', 'Adobe Illustrator', 'Adobe CC 14', 'AI,PNG', 'CMYK', 3, '433', '433', 'offer3', '0001 (2)46b4cbc7e2.jpg,000146b4cbc7e2.jpg,screencapture-localhost-e-shop-2020-06-18-13_31_5146b4cbc7e2.png', 'laravel-htaccess-master46b4cbc7e2.zip', 'pending', '', '12-11-2020', '11-2020', 2019, '2020-11-12 10:18:28', '2020-11-19 08:35:35'),
(18, 'Admin', 8, 9, 'designs,vector,extradfd3', 'Assistant', 'hjhjhjhj', 'Adobe Illustrator', 'Adobe CC 14', 'AI,EPS,ALT', 'RGB', 1, '343', '343', 'offer', '00018ff380205f.jpg,screencapture-localhost-e-shop-2020-06-18-13_31_518ff380205f.png,laravel78ff380205f.jpg', 'laravel-htaccess-master8ff380205f.zip', 'accepted', '', '13-11-2020', '11-2020', 2020, '2020-11-13 04:54:44', '2020-11-19 08:35:42'),
(19, '7', 7, 19, 'template,designs,ddddd', 'test', 'jkkjjjkjkj', 'Adobe Photoshop', 'Adobe CC 17', 'AI,PSD,DOC,PDF,MS WORD', 'RGB', 0, '34', '34', 'fffff', '0001 (2)2d9962707a.jpg,00012d9962707a.jpg', 'laravel-htaccess-master2d9962707a.zip', 'rejected', 'Lorem ipsum dolor sit, amet consectetur, adipisicing elit. Consequatur velit repellat neque soluta officia explicabo, enim repellendus, fuga illo reiciendis commodi necessitatibus eveniet architecto, placeat dicta vitae libero fugiat tempore.\r\nLorem ipsum dolor sit, amet consectetur, adipisicing elit. Consequatur velit repellat neque soluta officia explicabo, enim repellendus, fuga illo reiciendis commodi necessitatibus eveniet architecto, placeat dicta vitae libero fugiat tempore.', '13-11-2020', '10-2020', 2020, '2020-11-13 05:12:59', '2020-11-19 08:35:47'),
(20, '7', 7, 20, 'designs,vector,ooo', 'test', 'fdgtnhtj', 'Adobe Illustrator', 'Adobe CC (Legacy)', 'AI,ALT,DOC,PNG', 'RGB', 0, '150', '150', '', 'screencapture-localhost-e-shop-2020-06-18-13_31_5160b34b4181.png,laravel760b34b4181.jpg,php-v7-logo60b34b4181.jpg', 'jquery60b34b4181.zip', 'rejected', 'Test Lorem ipsum dolor sit, amet consectetur, adipisicing elit. Consequatur velit repellat neque soluta officia explicabo, enim repellendus, fuga illo reiciendis commodi necessitatibus eveniet architecto, placeat dicta vitae libero fugiat tempore. Lorem ipsum dolor sit, amet consectetur, adipisicing elit. Consequatur velit repellat neque soluta officia explicabo, enim repellendus, fuga illo reiciendis commodi necessitatibus eveniet architecto, placeat dicta vitae libero fugiat tempore.', '13-11-2020', '11-2020', 2020, '2020-11-13 06:48:36', '2020-11-19 08:35:53'),
(21, '7', 7, 0, 'designs', 'test accepted', 'test accepted', 'Adobe Photoshop', 'Adobe CC 14', 'AI,PNG', 'RGB', 2, '789', '789', 'offer', '000165d78d0a9a.jpg,screencapture-localhost-e-shop-2020-06-18-13_31_5165d78d0a9a.png,laravel765d78d0a9a.jpg', 'jquery65d78d0a9a.zip', 'accepted', '', '18-11-2020', '11-2020', 2020, '2020-11-13 15:58:07', '2020-11-19 08:36:07'),
(22, '7', 7, 17, 'template,designs,extra', 'Product', 'dfdfdfdfd', 'Adobe Photoshop', 'Adobe CC 15', 'AI,DOC', 'RGB', 5, '343', '343', 'offer3', 'Screenshot (52)e5ee2a3528.png,Screenshot (24)e5ee2a3528.png,Screenshot (23)e5ee2a3528.png', 'wordpress-5e5ee2a3528.zip', 'accepted', '', '17-11-2020', '11-2020', 2020, '2020-11-17 04:54:44', '2020-11-19 08:36:11'),
(23, '7', 5, 0, 'template,designs,fdfd', 'Product date test', 'Product date test', 'Adobe Indesign', 'Adobe CC 18', 'AI,SVG', 'RGB', 0, '454', '454', '', '79927634_3392930650725408_5603146092711159520_n76cd629ef7.jpg,104293798_200487911140874_8530015037216052051_n76cd629ef7.png,0001 (2)76cd629ef7.jpg', 'jquery76cd629ef7.zip', 'pending', '', '19-11-2020', '11-2020', 2020, '2020-11-19 04:13:03', '2020-11-19 08:36:16'),
(24, '7', 8, 20, 'book,vector,errer', 'Test product', 'ddgee', 'Adobe Photoshop', 'Adobe CC 16', 'AI,ALT', 'RGB', 0, '360', '371.3', '', 'IMG_20200321_171209_0034b7812b5.jpg,IMG_20200321_171147_9034b7812b5.jpg', 'jquery034b7812b5.zip', 'pending', '', '19-11-2020', '11-2020', 2020, '2020-11-19 13:34:33', '2020-11-19 13:49:43'),
(26, 'Admin', 8, 20, 'template,designs,errere', 'admin test', 'dfdfdf', 'Adobe Illustrator', 'Adobe CC 14', 'AI,ALT', 'RGB', 0, '200', '206.5', 'egege', 'rPxQd3306dd9f4740.jpg,wyYWT2G06dd9f4740.jpg', 'how-to-integrate-2checkout-payment-gateway-using-php06dd9f4740.zip', 'accepted', '', '19-11-2020', '11-2020', 2020, '2020-11-19 13:40:55', '2020-11-19 13:44:37'),
(27, '7', 8, 21, 'template,vector,fdfd', 'Test product', 'dfdfd', 'Adobe Photoshop', 'Adobe CC 14', 'AI,EPS', 'RGB', 0, '343', '353.79', '', 'Screenshot (62)d9fbc9429e.png,Screenshot (61)d9fbc9429e.png', 'TimeCircles-masterd9fbc9429e.zip', 'pending', '', '19-11-2020', '11-2020', 2020, '2020-11-19 15:15:47', '2020-11-19 15:15:47'),
(28, '7', 8, 0, 'template,designs,errer', 'Product date test', 'dfdfd', 'Adobe Illustrator', 'Adobe CC 21', 'AI,SVGZ', 'RGB', 0, '4343', '4473.79', '', 'Screenshot (62)37d7b78325.png,Screenshot (61)37d7b78325.png', 'TimeCircles-master37d7b78325.zip', 'pending', '', '19-11-2020', '11-2020', 2020, '2020-11-19 15:18:05', '2020-11-19 15:18:05'),
(29, '7', 8, 21, 'template,designs,errere', 'admin test', 'dfdf', 'Adobe Photoshop', 'Adobe CC CS6', 'AI,DOC', 'CMYK', 0, '343', '353.79', 'egege', 'Screenshot (62)fddb376a9f.png,Screenshot (61)fddb376a9f.png,Screenshot (60)fddb376a9f.png', 'TimeCircles-masterfddb376a9f.zip', 'pending', '', '19-11-2020', '11-2020', 2020, '2020-11-19 15:29:29', '2020-11-19 15:29:29'),
(30, 'Admin', 8, 19, '', 'tag test', 'dfdfd', 'Adobe Photoshop', 'Adobe CC 14', 'AI,ALT', 'RGB', 0, '45', '46.85', 'egege', 'Screenshot (74)cebb05a305.png', 'TimeCircles-mastercebb05a305.zip', 'accepted', '', '04-12-2020', '12-2020', 2020, '2020-12-04 03:55:38', '2020-12-04 03:55:38'),
(31, 'Admin', 8, 20, 'template, Arif, template, designs, Name', 'tag test', 'dfdf', 'Adobe Photoshop', 'Adobe CC 14', 'AI,DOC,MS WORD', 'CMYK', 0, '45', '46.85', 'egege', 'Screenshot (74)a04cae7235.png', 'TimeCircles-mastera04cae7235.zip', 'accepted', '', '04-12-2020', '12-2020', 2020, '2020-12-04 03:58:48', '2020-12-04 03:58:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_request`
--

CREATE TABLE `product_request` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `customer_id`, `product_id`, `rating`, `create_time`, `update_time`) VALUES
(1, 1, 22, 4, '2020-11-17 08:18:49', '2020-11-19 06:50:55'),
(10, 1, 17, 3, '2020-11-17 09:04:12', '2020-11-17 09:04:44'),
(11, 2, 22, 4, '2020-11-17 09:22:24', '2020-11-19 06:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `address_one` varchar(255) NOT NULL,
  `address_two` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `checked` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'seller',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `first_name`, `last_name`, `email`, `password`, `country`, `city`, `postal_code`, `address_one`, `address_two`, `phone`, `photo`, `checked`, `status`, `create_time`, `update_time`) VALUES
(7, 'Arafat', 'Hossain', 'arafat@gmail.com', 'arafat@gmail.com', 'CH', 'Bhola', '1234', 'Bhola, Bapta', '', '01782763384', 'dbf09686aa.png', 'checked', 'seller', '2020-11-10 14:51:06', '2020-11-11 05:34:42');

-- --------------------------------------------------------

--
-- Table structure for table `seller_bank`
--

CREATE TABLE `seller_bank` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_address` text NOT NULL,
  `routing_number` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL,
  `swift_code` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seller_bank`
--

INSERT INTO `seller_bank` (`id`, `seller_id`, `account_name`, `account_number`, `bank_name`, `bank_address`, `routing_number`, `iban`, `swift_code`, `create_date`, `update_date`) VALUES
(1, 7, 'Arif Hossain', '232324434', 'Islami Bank', 'Bhola', '34343', '45454', '45454', '2020-11-19 08:02:09', '2020-11-19 08:05:39');

-- --------------------------------------------------------

--
-- Table structure for table `seller_message`
--

CREATE TABLE `seller_message` (
  `id` int(11) NOT NULL,
  `seller_id` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seller_message`
--

INSERT INTO `seller_message` (`id`, `seller_id`, `subject`, `message`, `type`, `status`, `create_time`) VALUES
(1, '7', 'sent ', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius quibusdam nisi, aut libero recusandae molestiae distinctio pariatur. Alias numquam sint reprehenderit, consequuntur libero, enim, non illum laboriosam beatae ipsum, id!', 'sent', '1', '2020-11-16 17:07:52'),
(2, '7', 'Seen test', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Molestias dolores amet illum officia odio soluta esse aliquid nesciunt eaque, minus non ab, eius, dignissimos eveniet ex distinctio error modi odit.', 'sent', '1', '2020-11-16 17:11:54'),
(3, '7', 'reply test', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Assumenda totam, sed officiis possimus nobis eaque! Odit dolorem tempore, ab temporibus mollitia libero. Maxime debitis qui blanditiis numquam, quia! Maxime, accusantium?', 'reply', '1', '2020-11-16 17:14:47'),
(4, '7', 'Test', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat autem quaerat unde illo reprehenderit libero reiciendis blanditiis! Quaerat, perspiciatis! Veritatis saepe et blanditiis mollitia beatae nulla minus aut ad obcaecati.', 'reply', '1', '2020-11-16 17:21:24'),
(5, '7', 'Seen test', 'dfdfdfd', 'reply', '1', '2020-11-16 17:50:50'),
(6, '7', 'sent', 'reply test 23', 'reply', '1', '2020-11-17 02:31:57'),
(7, '7', 'Test', 'Lorem, ipsum, dolor sit amet consectetur adipisicing elit. Quam laudantium, sed, accusantium, laborum impedit optio illo eum, nulla quidem enim modi at aperiam. Maiores dolorem voluptatum atque est minima, dolor.', 'sent', '0', '2020-11-17 03:58:23');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_cat_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subCategoryName` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_cat_id`, `cat_id`, `subCategoryName`, `keywords`, `description`, `create_time`, `update_time`) VALUES
(1, 3, 'Men', 'Men', 'Men', '2020-09-15 07:19:15', '2020-09-15 07:19:15'),
(2, 3, 'Women', 'Women', 'Women', '2020-09-15 07:19:31', '2020-09-15 07:19:31'),
(3, 3, 'Children', 'Children', 'Children', '2020-09-15 07:19:46', '2020-09-15 07:19:46'),
(6, 6, 'Men\'s T-Shirt', 'Men\'s T-Shirt', 'Men\'s T-Shirt', '2020-09-15 07:21:34', '2020-09-15 07:21:34'),
(7, 6, 'Women\'s T-Shirt', 'Women\'s T-Shirt', 'Women\'s T-Shirt', '2020-09-15 07:21:51', '2020-09-15 07:21:51'),
(8, 6, 'Children\'s T-Shirt', 'Children\'s T-Shirt', 'Children\'s T-Shirt', '2020-09-15 07:22:16', '2020-09-15 07:22:16'),
(9, 6, 'Men\'s Trouser', 'Men\'s Trouser', 'Men\'s Trouser', '2020-09-15 07:23:52', '2020-09-15 07:23:52'),
(10, 6, 'Women\'s Trouser', 'Women\'s Trouser', 'Women\'s Trouser', '2020-09-15 07:24:04', '2020-09-15 07:24:04'),
(11, 6, 'Children\'s Trouser', 'Children\'s Trouser', 'Children\'s Trouser', '2020-09-15 07:24:31', '2020-09-15 07:24:31'),
(13, 7, 'Hijab', 'Hijab', 'Hijab', '2020-09-15 07:26:43', '2020-09-15 07:26:43'),
(14, 7, 'Burkha', 'Burkha', 'Burkha', '2020-09-15 07:29:47', '2020-09-15 07:29:47'),
(15, 7, 'Shrug', 'Shrug', 'Shrug', '2020-09-15 07:30:01', '2020-09-15 07:30:01'),
(16, 7, 'Men\'s Thobe', 'Men\'s Thobe', 'Men\'s Thobe', '2020-09-15 07:30:38', '2020-09-15 07:30:38'),
(17, 7, 'Men\'s Panjabi', 'Men\'s Panjabi', 'Men\'s Panjabi', '2020-09-15 07:30:58', '2020-09-15 07:30:58'),
(18, 7, 'Men\'s Tupi', 'Men\'s Tupi', 'Men\'s Tupi', '2020-09-15 07:31:11', '2020-09-15 07:31:11'),
(19, 7, 'Janamaz', 'Janamaz', 'Janamaz', '2020-09-15 07:31:56', '2020-09-15 07:31:56'),
(20, 7, 'Tasbih', 'Tasbih', 'Tasbih', '2020-09-15 07:32:39', '2020-09-15 07:32:39'),
(21, 7, 'Attar', 'Attar', 'Attar', '2020-09-15 07:33:06', '2020-09-15 07:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `tagName` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `tagName`, `create_time`, `update_time`) VALUES
(1, 'vector', '2020-11-10 03:47:04', '2020-11-10 03:47:04'),
(3, 'designs', '2020-11-10 03:49:32', '2020-11-10 03:54:32'),
(4, 'template', '2020-11-11 10:39:30', '2020-11-11 10:39:30'),
(5, 'book', '2020-11-12 16:13:28', '2020-11-12 16:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

CREATE TABLE `wish_list` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wish_list`
--

INSERT INTO `wish_list` (`id`, `customer_id`, `product_id`, `product_title`, `price`, `date_time`) VALUES
(10, 2, 21, '', 34343, '2020-11-13 18:36:25'),
(12, 1, 21, '', 34343, '2020-11-14 07:03:30'),
(13, 2, 20, '', 3434, '2020-11-14 16:49:41'),
(14, 2, 19, '', 343434, '2020-11-17 06:28:54'),
(15, 1, 19, '', 343434, '2020-11-17 09:15:20');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `seller_id`, `amount`, `status`, `create_time`, `update_time`) VALUES
(2, 7, '85', 'confirmed', '2020-11-19 10:47:33', '2020-11-19 10:48:03'),
(3, 7, '60', 'confirmed', '2020-11-19 10:47:44', '2020-11-19 11:57:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `name` (`categoryName`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contest`
--
ALTER TABLE `contest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contest_submit`
--
ALTER TABLE `contest_submit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `customer_message`
--
ALTER TABLE `customer_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_request`
--
ALTER TABLE `product_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `seller_bank`
--
ALTER TABLE `seller_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_message`
--
ALTER TABLE `seller_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contest`
--
ALTER TABLE `contest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `contest_submit`
--
ALTER TABLE `contest_submit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_message`
--
ALTER TABLE `customer_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_request`
--
ALTER TABLE `product_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seller_bank`
--
ALTER TABLE `seller_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_message`
--
ALTER TABLE `seller_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wish_list`
--
ALTER TABLE `wish_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `laravel_7`
--
CREATE DATABASE IF NOT EXISTS `laravel_7` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `laravel_7`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `user_id`, `brand_name`, `brand_image`, `created_at`, `updated_at`) VALUES
(3, 1, 'Walton Loves', 'images/brand/1666805031317644.png', '2020-05-15 22:39:35', '2020-05-16 00:32:29'),
(4, 1, 'Symphony', 'images/brand/1666805013223044.png', '2020-05-15 22:42:51', '2020-05-16 00:32:12'),
(6, 1, 'Walton', 'images/brand/1666804752124924.png', '2020-05-15 23:53:47', '2020-05-16 00:28:03'),
(7, 1, 'Samsung', 'images/brand/1666859616099817.png', '2020-05-16 15:00:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `category_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Mobile', NULL, '2020-05-14 10:02:01', NULL),
(7, 2, 'Laptop', NULL, '2020-05-14 11:42:15', NULL),
(8, 2, 'Fassion', NULL, '2020-05-14 11:45:09', NULL),
(9, 2, 'Again Test', NULL, '2020-05-15 01:32:49', NULL),
(10, 2, 'Arafat', NULL, NULL, NULL),
(12, 2, 'Cock', NULL, '2020-05-15 02:53:49', NULL),
(13, 2, 'Again Test', NULL, '2020-05-15 03:04:48', '2020-05-15 09:19:44'),
(14, 2, 'Tester', NULL, '2020-05-15 03:04:52', NULL),
(15, 2, 'Keyboard', NULL, '2020-05-15 03:04:59', NULL),
(16, 2, 'Bag', NULL, '2020-05-15 03:05:06', NULL),
(17, 2, 'Pen', NULL, '2020-05-15 03:05:10', '2020-05-17 01:55:04'),
(18, 2, 'Pencils', NULL, '2020-05-15 03:05:18', '2020-05-15 09:23:41'),
(19, 1, 'Love You', NULL, '2020-05-15 03:05:21', '2020-05-15 04:57:26'),
(20, 1, 'Our House', NULL, '2020-05-15 03:05:24', '2020-05-15 09:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2020_05_14_093520_create_categories_table', 3),
(5, '2020_05_15_154939_create_brands_table', 4),
(6, '2020_05_16_063426_create_multiple_images_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `multiple_images`
--

CREATE TABLE `multiple_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multiple_images`
--

INSERT INTO `multiple_images` (`id`, `images`, `created_at`, `updated_at`) VALUES
(1, 'images/multi_img/1666808362016499.png', '2020-05-16 01:25:25', NULL),
(2, 'images/multi_img/1666808362342006.png', '2020-05-16 01:25:25', NULL),
(3, 'images/multi_img/1666808362622080.png', '2020-05-16 01:25:26', NULL),
(4, 'images/multi_img/1666808363013829.png', '2020-05-16 01:25:26', NULL),
(5, 'images/multi_img/1666808363672256.png', '2020-05-16 01:25:27', NULL),
(6, 'images/multi_img/1666808393911387.png', '2020-05-16 01:25:56', NULL),
(7, 'images/multi_img/1666808394517847.png', '2020-05-16 01:25:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Arif Hossain', 'arif@gmail.com', '$2y$10$7RNxk.RgcxYCeVe7trBG2OwoMA53uuKH4WdTV0eqAdDw.Pvy1fEOq', 'IciujBgL41dI4NOWr02wdM5JV4Q0vi0vZ7wvF6yABxQvxcm5jIMl8YbsgL0c', '2020-05-16 04:19:55', '2020-05-16 16:26:01'),
(2, 'Arafat Hossain', 'arafat@gmail.com', '$2y$10$WGgUxfbwwIvfpI4wrVZ2Luv9yVUtui5dfNF18/C/QNAOS85vvdvNO', NULL, '2020-05-16 04:20:16', '2020-05-16 04:53:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiple_images`
--
ALTER TABLE `multiple_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `multiple_images`
--
ALTER TABLE `multiple_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `lms`
--
CREATE DATABASE IF NOT EXISTS `lms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lms`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(5) NOT NULL,
  `book_name` varchar(70) NOT NULL,
  `book_image` varchar(100) NOT NULL,
  `book_author_name` varchar(50) NOT NULL,
  `book_publications_name` varchar(50) NOT NULL,
  `book_purchase_date` varchar(50) NOT NULL,
  `book_price` varchar(50) NOT NULL,
  `book_qty` int(5) NOT NULL,
  `available_qty` int(5) NOT NULL,
  `librarian_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `book_image`, `book_author_name`, `book_publications_name`, `book_purchase_date`, `book_price`, `book_qty`, `available_qty`, `librarian_username`) VALUES
(1, 'Arif', '20200410053120.png', 'Arif Hossain', 'Publications', '2020-04-15', '23456', 35, 55, 'librarian_username'),
(2, 'My Crush', '20200410055140.png', 'Aivey Hossain', 'পচা Publications', '2020-04-15', '345567', 58, 3, 'arafathossain'),
(5, 'Pran Pakhi', '20200410054553.png', 'Aivey Hossain', 'Love Publications', '2020-04-24', '100000', 47, 9, 'arafathossain'),
(6, 'Choto Vai', '20200410055140.png', 'Ashrafull', 'Family Publications', '2020-04-20', '200', 20, 9, 'arafathossain'),
(7, 'Bangla', '20200410054553.png', 'Kamal', 'Government', '2018-02-05', '500', 100, 60, 'arafathossain');

-- --------------------------------------------------------

--
-- Table structure for table `issue_books`
--

CREATE TABLE `issue_books` (
  `id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `books_id` int(5) NOT NULL,
  `book_issue_date` varchar(20) NOT NULL,
  `book_return_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue_books`
--

INSERT INTO `issue_books` (`id`, `student_id`, `books_id`, `book_issue_date`, `book_return_date`, `date_time`) VALUES
(1, 2, 2, '10-Apr-20', '10-Apr-20', '2020-04-10 09:32:34'),
(2, 2, 2, '10-Apr-20', '10-Apr-20', '2020-04-10 09:35:30'),
(3, 2, 2, '10-Apr-20', '', '2020-04-10 09:36:30'),
(4, 1, 6, '10-Apr-20', '', '2020-04-10 10:35:57'),
(5, 1, 5, '10-Apr-20', '', '2020-04-10 10:36:18'),
(6, 1, 7, '10-Apr-20', '', '2020-04-10 11:02:52'),
(7, 5, 5, '10-Apr-20', '', '2020-04-10 15:28:06'),
(8, 2, 1, '10-Apr-20', '', '2020-04-10 15:37:55'),
(9, 4, 2, '10-Apr-20', '', '2020-04-10 15:38:01'),
(10, 9, 6, '10-Apr-20', '', '2020-04-10 15:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `id` int(3) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id`, `fname`, `lname`, `email`, `username`, `password`, `date_time`) VALUES
(1, 'Arafat', 'Hossin', 'arafat@gmail.com', 'arafathossain', '11111111', '2020-04-09 12:46:31'),
(2, 'Omor', 'Hasan', 'omor@gmail.com', 'omorhasan', '00000000', '2020-04-10 12:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(6) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `roll` int(6) NOT NULL,
  `reg` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `roll`, `reg`, `email`, `username`, `password`, `phone`, `image`, `status`, `date_time`) VALUES
(1, 'Arif', 'Hossain', 111111, 111111, 'arif@gmail.com', 'arifhossain', '$2y$10$cmlbqJqgLMoWCZ3D8yj1y.ELmgOTSrNYw./BJ8V7c761FdvVRbYLS', 1482763384, NULL, 1, '2020-04-09 10:55:33'),
(2, 'Aivey', 'Hossain', 222222, 222222, 'arif2@gmail.com', 'arifhossain2', '$2y$10$INTZz2Ep6j/R5afW9GKFpeefYT36Dce/h/3V6Ks2lh/Tk4.17D1r6', 1482763385, NULL, 1, '2020-04-09 10:56:17'),
(3, 'Omor', 'Hasan', 0, 0, 'omor@gmail.com', 'omorhasan', '$2y$10$Bik231OapnFTKQlGTii5D.m50EU2Fme3sYah6UZoT1NOGgQaLkpJe', 1882763384, NULL, 1, '2020-04-10 12:39:56'),
(4, 'Kamal', 'Hasan', 555555, 555555, 'kamal@gmail.com', 'kamalhasan', '55555555', 1782763384, NULL, 1, '2020-04-10 14:16:58'),
(5, 'Jamal', 'Hasan', 666666, 666666, 'jamal@gmail.com', 'jamalhasan', '66666666', 1782763384, NULL, 1, '2020-04-10 14:16:58'),
(8, 'Kamal', 'Hasan', 555555, 555555, 'kamal22@gmail.com', 'kamalhasan22', '55555555', 1782763384, NULL, 1, '2020-04-10 14:17:45'),
(9, 'Jamal', 'Hasan', 666666, 666666, 'jamal22@gmail.com', 'jamalhasan22', '66666666', 1782763384, NULL, 1, '2020-04-10 14:17:45'),
(10, 'Dady', 'Baba', 333333, 333333, 'dady@gmail.com', 'dadybaba', '33333333', 1882763384, NULL, 1, '2020-04-10 14:54:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_books`
--
ALTER TABLE `issue_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `issue_books`
--
ALTER TABLE `issue_books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Database: `mvc`
--
CREATE DATABASE IF NOT EXISTS `mvc` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mvc`;

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
--
-- Database: `oop`
--
CREATE DATABASE IF NOT EXISTS `oop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `oop`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `date_time`) VALUES
(1, 'Test', 'test@gmail.com', '123456', '2020-08-10 15:27:52'),
(3, 'Test2', 'test2@gmail.com', '123456', '2020-08-12 01:34:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'All_sql', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"a_mvc\",\"blog\",\"blog_2\",\"b_blog\",\"b_lms\",\"b_php_ajax\",\"b_sms\",\"employee\",\"flipmart\",\"graphic_corner\",\"laravel_7\",\"lms\",\"mvc\",\"oop\",\"phpmyadmin\",\"portal\",\"p_blog\",\"p_flipmart\",\"p_laravel_7\",\"p_lms\",\"p_mvc\",\"p_shop\",\"shop\",\"sms\",\"wardrobe\",\"wordpress\",\"work\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"p_blog\",\"table\":\"users\"},{\"db\":\"oop\",\"table\":\"users\"},{\"db\":\"p_lms\",\"table\":\"students\"},{\"db\":\"p_lms\",\"table\":\"librarian\"},{\"db\":\"p_lms\",\"table\":\"books\"},{\"db\":\"p_lms\",\"table\":\"issue_books\"},{\"db\":\"lms\",\"table\":\"books\"},{\"db\":\"db_students\",\"table\":\"tch_info\"},{\"db\":\"db_students\",\"table\":\"std_details\"},{\"db\":\"db_students\",\"table\":\"private\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'blog', 'blog', '{\"sorted_col\":\"`blog`.`category_id`  DESC\"}', '2020-04-11 17:35:15'),
('root', 'sms', 'users', '{\"sorted_col\":\"`users`.`password`  ASC\"}', '2020-04-08 07:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-12-22 10:52:57', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `portal`
--
CREATE DATABASE IF NOT EXISTS `portal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `portal`;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `order_id`, `file`, `date_time`) VALUES
(1, 1, 1, '2ce49aa1ba61662469005a97e0ae4e881597723528358841330.png', '2020-08-18 04:05:28'),
(2, 1, 2, '93bdc98aca74dcedf4aacfee09b34c0b15977238871615459455.png', '2020-08-18 04:11:27'),
(3, 1, 3, '2ce49aa1ba61662469005a97e0ae4e8815977240391087498698.png', '2020-08-18 04:13:59'),
(4, 1, 4, '08b16ac8f2b8c77dfa4838b957f2a3b815977242639033465.png', '2020-08-18 04:17:43'),
(5, 1, 4, '93bdc98aca74dcedf4aacfee09b34c0b15977242632121738747.png', '2020-08-18 04:17:43'),
(6, 1, 5, '2018ed77f223d29abc8c3cedb10515c915977244621500673058.png', '2020-08-18 04:21:02'),
(7, 1, 5, '08b16ac8f2b8c77dfa4838b957f2a3b81597724462535472788.png', '2020-08-18 04:21:02'),
(8, 1, 5, '93bdc98aca74dcedf4aacfee09b34c0b159772446299443475.png', '2020-08-18 04:21:02'),
(9, 1, 6, '93bdc98aca74dcedf4aacfee09b34c0b15977246452024205234.png', '2020-08-18 04:24:05'),
(10, 1, 7, '2ce49aa1ba61662469005a97e0ae4e8815977334431997040866.png', '2020-08-18 06:50:43'),
(11, 1, 8, '0b54e48e27c74e72d2f6ff0209643e0e1597765134980922544.png', '2020-08-18 15:38:54'),
(12, 1, 8, '2ce49aa1ba61662469005a97e0ae4e8815977651351477972347.png', '2020-08-18 15:38:55'),
(13, 1, 8, '2018ed77f223d29abc8c3cedb10515c91597765135916300372.png', '2020-08-18 15:38:55'),
(14, 1, 8, '08b16ac8f2b8c77dfa4838b957f2a3b815977651351414794762.png', '2020-08-18 15:38:55'),
(15, 1, 8, '93bdc98aca74dcedf4aacfee09b34c0b15977651351879907010.png', '2020-08-18 15:38:55'),
(16, 1, 9, '2ce49aa1ba61662469005a97e0ae4e881597768396393855424.png', '2020-08-18 16:33:16'),
(17, 1, 9, '2018ed77f223d29abc8c3cedb10515c91597768396716722427.png', '2020-08-18 16:33:16'),
(18, 1, 9, '08b16ac8f2b8c77dfa4838b957f2a3b815977683961330679428.png', '2020-08-18 16:33:16'),
(19, 1, 10, '2ce49aa1ba61662469005a97e0ae4e8815977685541592081504.png', '2020-08-18 16:35:54'),
(20, 1, 10, '2018ed77f223d29abc8c3cedb10515c915977685551459844473.png', '2020-08-18 16:35:55'),
(21, 1, 10, '08b16ac8f2b8c77dfa4838b957f2a3b815977685551641161564.png', '2020-08-18 16:35:55'),
(22, 1, 10, '93bdc98aca74dcedf4aacfee09b34c0b1597768555971190060.png', '2020-08-18 16:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `state` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `subject`, `description`, `state`, `status`, `date_time`) VALUES
(1, 1, 'Test', 'Message', 'sent', 1, '2020-08-15 15:20:28'),
(2, 2, 'Test2', 'Message2', 'reply', 0, '2020-08-15 15:21:05'),
(3, 8, 'Test2', 'll', 'sent', 0, '2020-08-17 03:24:26'),
(4, 1, 'Test Again', 'dhjkljhgfds', 'sent', 0, '2020-08-17 15:19:45'),
(5, 2, 'Test2', 'dfdfgd', 'sent', 1, '2020-08-17 15:22:55'),
(6, 1, 'Test2', 'dfdfgd', 'reply', 0, '2020-08-17 15:23:07'),
(7, 6, 'Test Again', 'df', 'sent', 0, '2020-08-17 15:23:55'),
(8, 1, 'Test2', 'dfd', 'reply', 0, '2020-08-17 15:24:15'),
(9, 6, 'Test', 'gf56', 'sent', 0, '2020-08-17 15:24:59'),
(10, 1, 'Test Again', '56789876543', 'reply', 0, '2020-08-17 15:26:48'),
(11, 1, 'Test2', '345678ikjmhndfqw67riygl', 'sent', 0, '2020-08-17 15:26:59'),
(12, 1, 'Subject: Test2', 'insertMessage', 'reply', 0, '2020-08-20 08:24:20'),
(13, 3, 'Subject: Test2', 'insertMessage', 'reply', 0, '2020-08-20 08:28:56'),
(14, 5, 'Subject: Test2', 'insertMessage', 'reply', 0, '2020-08-20 08:29:47'),
(15, 3, 'Test2', 'Reply check', 'reply', 0, '2020-08-20 08:35:04'),
(16, 1, 'Test Again', 'Please do it..', 'reply', 0, '2020-08-20 08:42:20'),
(17, 6, 'Test Again', 'final test reply message', 'sent', 0, '2020-08-20 08:50:25'),
(18, 6, 'Test Again', 'final test reply message', 'reply', 0, '2020-08-20 08:51:18'),
(19, 6, 'Test', 'Last reply Last reply', 'reply', 0, '2020-08-20 08:51:56'),
(20, 6, 'user check', 'user check', 'sent', 0, '2020-08-20 08:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payer_id` varchar(255) NOT NULL,
  `payer_email` varchar(255) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `payment_id`, `payer_id`, `payer_email`, `amount`, `currency`, `payment_status`, `date_time`) VALUES
(1, 1, 'PAYID-L44SHGI2E547409DT0156248', 'MLCKP2LTP45MN', 'sb-bxohi2929801@personal.example.com', 4.00, 'USD', 'approved', '2020-08-16 12:17:17'),
(2, 1, 'PAYID-L44SQEY45G09650882576345', 'MLCKP2LTP45MN', 'sb-bxohi2929801@personal.example.com', 4.00, 'USD', 'approved', '2020-08-16 12:36:08'),
(3, 2, 'PAYID-L44V3DQ5A75460566124902K', 'MLCKP2LTP45MN', 'sb-bxohi2929801@personal.example.com', 2.50, 'USD', 'approved', '2020-08-16 16:24:14'),
(4, 0, 'PAYID-L45C3QI41162181SV049472B', 'MLCKP2LTP45MN', 'sb-bxohi2929801@personal.example.com', 5.80, 'USD', 'approved', '2020-08-17 07:12:54'),
(5, 1, 'PAYID-L45VM2A7FG98745NV063721C', 'MLCKP2LTP45MN', 'sb-bxohi2929801@personal.example.com', 14.00, 'USD', 'approved', '2020-08-18 04:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `place_order`
--

CREATE TABLE `place_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_title` text NOT NULL,
  `nda` varchar(255) NOT NULL,
  `job_desc` text NOT NULL,
  `job_type` varchar(255) NOT NULL,
  `return_file_type` varchar(255) NOT NULL,
  `bg_option` varchar(255) NOT NULL,
  `image_complexity` float NOT NULL,
  `myDecimal` float NOT NULL,
  `job_services` text NOT NULL,
  `tat` int(11) NOT NULL,
  `image_qty` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `total_price` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `paid` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `place_order`
--

INSERT INTO `place_order` (`id`, `user_id`, `order_title`, `nda`, `job_desc`, `job_type`, `return_file_type`, `bg_option`, `image_complexity`, `myDecimal`, `job_services`, `tat`, `image_qty`, `unit_price`, `total_price`, `status`, `paid`, `date_time`, `update_time`) VALUES
(2, 1, 'Arif', '', 'rrtr', 'clipping path', 'jpg,png,psd,tiff,html', 'original', 2, 0, 'Photo Cut Out,Clipping Path,Background Removal,Drop Shadow,Natural Shadow,Reflection Shadow,Mirror Effect,Photo Retouching,Mannequin Removal,Crop-Resizing,E-Commerce Optimization,I am Not Certain', 24, 1, 0, 2.3, 0, 'no', '2020-08-18 04:11:27', '2020-08-19 16:33:08'),
(3, 1, 'Test1', '', 'fgfg', 'grfg', 'jpg,ssd', 'color', 2, 0, '', 48, 1, 0, 2, 2, 'no', '2020-08-18 04:13:59', '2020-08-19 16:27:13'),
(4, 1, 'Arif', '', 'fgtf', '', 'jpg,png,psd,html', 'color', 7, 0, 'Photo Cut Out,Clipping Path,Background Removal,Drop Shadow,Natural Shadow,Reflection Shadow,Mirror Effect,Photo Retouching,Mannequin Removal,Crop-Resizing,E-Commerce Optimization', 48, 2, 0, 14, 4, 'yes', '2020-08-15 11:10:11', '2020-08-19 12:15:56'),
(6, 1, 'Arif', 'nda', 'dfdf', 'fdf', 'jpg', 'white', 0, 34, '', 48, 1, 0, 44.2, 2, 'no', '2020-08-18 04:24:05', '2020-08-19 16:32:42'),
(7, 1, 'Arif', '', 'fgfg', 'gf', 'jpg', 'white', 2, 0, '', 0, 1, 0, 2, 1, 'refunded', '2020-08-18 06:50:43', '2020-08-19 16:34:05'),
(9, 1, 'Test', '', 'dfdge', 'gedfdge', 'jpg', 'transparent', 2, 0, '', 72, 0, 0, 5.1, 3, 'no', '2020-08-18 16:33:16', '2020-08-20 13:00:34'),
(10, 1, 'Testfd', '', 'fgdgr', '', 'jpg', 'original', 7, 0, 'Clipping Path with Transparent Background,Layer & Channel Masking,Glamour Retouching with Digital Make up,Glamour Retouching,Real Estate Photo Editing', 48, 0, 0, 28, 0, 'refunded', '2020-08-18 16:35:54', '2020-08-19 16:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `place_quote`
--

CREATE TABLE `place_quote` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quote_title` text NOT NULL,
  `quote_desc` text NOT NULL,
  `service_type` text NOT NULL,
  `return_file_types` varchar(255) NOT NULL,
  `retouching_opt` varchar(255) NOT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `bg_option` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `qty_image` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `total_price` float NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `place_quote`
--

INSERT INTO `place_quote` (`id`, `user_id`, `quote_title`, `quote_desc`, `service_type`, `return_file_types`, `retouching_opt`, `delivery_time`, `bg_option`, `file`, `qty_image`, `unit_price`, `total_price`, `status`, `date_time`, `update_time`) VALUES
(45, 1, 'dfd', 'dfd', 'Clipping Path with Transparent Background', 'jpg', 'no', '48h', 'white', 'arifh3261@gmail.com1602323619.zip', 4, 0, 0, 0, '2020-10-10 09:53:39', '2020-10-10 09:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `quote_files`
--

CREATE TABLE `quote_files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quote_files`
--

INSERT INTO `quote_files` (`id`, `user_id`, `quote_id`, `file`, `date_time`) VALUES
(1, 1, 1, '08b16ac8f2b8c77dfa4838b957f2a3b815976682652095362733.png', '2020-08-17 12:44:25'),
(2, 1, 2, '2018ed77f223d29abc8c3cedb10515c915976683971216097436.png', '2020-08-17 12:46:37'),
(3, 1, 2, '08b16ac8f2b8c77dfa4838b957f2a3b81597668398217477758.png', '2020-08-17 12:46:38'),
(4, 1, 2, '93bdc98aca74dcedf4aacfee09b34c0b1597668398728576170.png', '2020-08-17 12:46:38'),
(5, 1, 3, '08b16ac8f2b8c77dfa4838b957f2a3b81597672541226839569.png', '2020-08-17 13:55:41'),
(6, 1, 3, '93bdc98aca74dcedf4aacfee09b34c0b1597672542825640829.png', '2020-08-17 13:55:42'),
(7, 1, 4, '08b16ac8f2b8c77dfa4838b957f2a3b815976725501862703652.png', '2020-08-17 13:55:50'),
(8, 1, 5, '2018ed77f223d29abc8c3cedb10515c915976725601672944810.png', '2020-08-17 13:56:00'),
(9, 1, 6, '08b16ac8f2b8c77dfa4838b957f2a3b815977276402014500461.png', '2020-08-18 05:14:00'),
(10, 1, 6, '93bdc98aca74dcedf4aacfee09b34c0b1597727640395643046.png', '2020-08-18 05:14:00'),
(11, 1, 7, '2ce49aa1ba61662469005a97e0ae4e881597745139762356300.png', '2020-08-18 10:05:39'),
(12, 1, 7, '2018ed77f223d29abc8c3cedb10515c91597745139751641567.png', '2020-08-18 10:05:39'),
(13, 1, 7, '08b16ac8f2b8c77dfa4838b957f2a3b815977451391796581464.png', '2020-08-18 10:05:39'),
(14, 1, 7, '93bdc98aca74dcedf4aacfee09b34c0b15977451391358321790.png', '2020-08-18 10:05:39'),
(15, 1, 8, '2ce49aa1ba61662469005a97e0ae4e881597745253671301248.png', '2020-08-18 10:07:33'),
(16, 1, 8, '2018ed77f223d29abc8c3cedb10515c915977452531864264149.png', '2020-08-18 10:07:33'),
(17, 1, 8, '08b16ac8f2b8c77dfa4838b957f2a3b81597745253648159751.png', '2020-08-18 10:07:33'),
(18, 1, 8, '93bdc98aca74dcedf4aacfee09b34c0b1597745254253364600.png', '2020-08-18 10:07:34'),
(19, 1, 9, '2ce49aa1ba61662469005a97e0ae4e8815977523391941789835.png', '2020-08-18 12:05:39'),
(20, 1, 9, '08b16ac8f2b8c77dfa4838b957f2a3b8159775233939736043.png', '2020-08-18 12:05:39'),
(21, 1, 10, '08b16ac8f2b8c77dfa4838b957f2a3b815977701831514168811.png', '2020-08-18 17:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `vat_id` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `company`, `position`, `country`, `city`, `phone`, `address_1`, `address_2`, `zip_code`, `vat_id`, `website`, `image`, `checked`, `status`, `date_time`, `update_time`) VALUES
(1, 'Arif5', 'arifh3261@gmail.com', 'arifh3261@gmail.com', 'Facebook5', 'Developer5', 'ES', 'Bhola5', '+880 1782763385', 'Bhola5', 'Bapta5', '12135', '454655', 'www.arifh5.com', 'c03814a437.png', 1, 1, '2020-08-04 06:02:07', '2020-08-20 05:05:30'),
(2, 'Kamal', 'kamal@gmail.com', 'kamal@gmail.com', 'Youtube', 'Editor', 'IT', 'Barisal', '+880 1782763383', 'Bhola8', 'Bapta', '466', '465', 'www.arifh7.com', '0b5abe59ba.png', 1, 4, '2020-08-04 06:03:38', '2020-08-20 04:01:11'),
(5, 'Shohag', 'shohag@gmail.com', 'shohag@gmail.com', 'Company', '', 'SE', '', '01782863367', '', '', '', '', '', '45b8d07116.png', 1, 2, '2020-08-20 04:08:20', '2020-08-20 10:51:56'),
(6, 'Arafat', 'arafat@gmail.com', 'arafat@gmail.com', 'Company', '', 'ES', '', '01782863457', '', '', '', '', '', '45b8d07115.png', 1, 0, '2020-08-20 04:12:06', '2020-08-20 11:35:16'),
(7, 'New Administrator', 'administrtor@gmail.com', 'administrtor@gmail.com', '', '', '', '', '', '', '', '', '', '', NULL, 1, 3, '2020-08-20 05:57:44', '2020-08-20 06:18:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `place_order`
--
ALTER TABLE `place_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `place_quote`
--
ALTER TABLE `place_quote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quote_files`
--
ALTER TABLE `quote_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `place_order`
--
ALTER TABLE `place_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `place_quote`
--
ALTER TABLE `place_quote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `quote_files`
--
ALTER TABLE `quote_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Database: `p_blog`
--
CREATE DATABASE IF NOT EXISTS `p_blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `p_blog`;

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
--
-- Database: `p_flipmart`
--
CREATE DATABASE IF NOT EXISTS `p_flipmart` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `p_flipmart`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Newell Labadie', 'Dr. Dallin Mayer DVM', 1, '2020-05-23 06:12:06', '2020-05-23 06:12:06', NULL),
(2, 'Ms. Leanne Krajcik', 'Mabelle Will', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL),
(3, 'Mr. Alfonzo Hill DDS', 'Jerrell Vandervort', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL),
(4, 'Marjory Reinger', 'Lupe Schultz', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL),
(5, 'Miss Lempi Luettgen', 'Mr. Leone Herzog', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL),
(6, 'Garth Cronin', 'Mustafa Williamson', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL),
(7, 'Everardo Bins', 'Jazmin Kub', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL),
(8, 'William Zboncak DVM', 'Miss Letha Parisian', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL),
(9, 'Melany Green', 'Rosella McDermott', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL),
(10, 'Vicente Heathcote', 'Gabriel Balistreri', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rick Larkin', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(2, 'Darien Romaguera', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(3, 'Aletha Corkery MD', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(4, 'Mrs. Clementine Abbott', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(5, 'Faye Barton', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(6, 'Pete Green', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(7, 'Emmalee Stokes', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(8, 'Hanna Hyatt', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(9, 'Geovanni Ernser', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(10, 'Dr. Deborah Jacobson DDS', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_23_030918_create_brands_table', 1),
(5, '2020_05_23_073807_create_categories_table', 1),
(6, '2020_05_23_073953_create_sub_categories_table', 1),
(7, '2020_05_23_074219_create_sub_sub_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` tinyint(4) NOT NULL,
  `sub_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `cat_id`, `sub_category_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Dr. Albin Fisher V', 1, '2020-05-23 06:12:07', '2020-05-23 06:12:07'),
(2, 7, 'Rasheed Emard', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(3, 9, 'Mr. Terence Franecki', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(4, 7, 'Rasheed Miller', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(5, 7, 'Prof. Joaquin Pagac Sr.', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(6, 6, 'Prof. Lyric Nitzsche PhD', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(7, 1, 'Ms. Georgianna Ryan', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(8, 1, 'Madie Lang', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(9, 9, 'Rick Hintz', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(10, 4, 'Nathaniel Murray', 1, '2020-05-23 06:12:08', '2020-05-23 06:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` tinyint(4) NOT NULL,
  `sub_cat_id` tinyint(4) NOT NULL,
  `sub_sub_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$lgqha4Ud0KpCdctpsN.6qeWH6/rFd.Ph52hcf3Pqiupuol5ASRAQe', NULL, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(2, 'Kraig Reichel', 'lcummerata@kub.com', NULL, '$2y$10$/6faGjWGZVEblyonuiKHo.vNOf7HRsK1brWIFFHhFJeFqSTJWJ3QS', NULL, '2020-05-23 06:12:08', '2020-05-23 06:12:08'),
(3, 'Amber Robel', 'bkirlin@bruen.com', NULL, '$2y$10$yGOiX6YB6isxl2mwApqsQO.jSBTVpn7kR0ck9jxPcbtzkkZjSqKPG', NULL, '2020-05-23 06:12:09', '2020-05-23 06:12:09'),
(4, 'Mortimer Rosenbaum', 'medhurst.kasandra@hotmail.com', NULL, '$2y$10$0IOzmPiT9klh9ULdi5rBWuSKVmwVIK2zs1/z48x7PLZSPgldbee6.', NULL, '2020-05-23 06:12:09', '2020-05-23 06:12:09'),
(5, 'Dee Fahey', 'rick66@zieme.info', NULL, '$2y$10$hf36AekL5SVleD7IBSWCgeZzEK1Ievl0pVPd9uijEbFaPXpi96X5.', NULL, '2020-05-23 06:12:09', '2020-05-23 06:12:09'),
(6, 'Laurie Kilback', 'moen.ally@lockman.com', NULL, '$2y$10$Clld0nuWriU57ILyRbGzx.YGeK./O8jLWzrmFGC0U3K1zQickVPsq', NULL, '2020-05-23 06:12:10', '2020-05-23 06:12:10'),
(7, 'Mrs. Nola Schmitt', 'bryce.brown@kovacek.net', NULL, '$2y$10$F.Vtm4zgM0Waqw4peLSlsuCeCj5AxOEVeVAPne9ul.t7fKgQVF20K', NULL, '2020-05-23 06:12:10', '2020-05-23 06:12:10'),
(8, 'Maia Auer DVM', 'jabari.stamm@gmail.com', NULL, '$2y$10$rb8AElYN3P1YGr4qD9Ri0OKJ.BDl1p4fGM9OuyZIdtfkdB096.Bb2', NULL, '2020-05-23 06:12:10', '2020-05-23 06:12:10'),
(9, 'Cristopher Keeling', 'rkoepp@hotmail.com', NULL, '$2y$10$.kd1JNWuTxAGlXCOpJoP/OBpAFuV94gLtKyVfDLrU96oEGUwl3.9K', NULL, '2020-05-23 06:12:10', '2020-05-23 06:12:10'),
(10, 'Allan Halvorson', 'kub.heather@hotmail.com', NULL, '$2y$10$L22EZqbskkFd/uWl.R74ge9rtQrs12V4u2kimi89kAcMC2Tt6lEr2', NULL, '2020-05-23 06:12:11', '2020-05-23 06:12:11'),
(11, 'Esther Gerlach', 'jazmyne08@mckenzie.com', NULL, '$2y$10$hPkQ9lOAw7K77i6jAc/5CuoOZmTgC6.PsB6uvIL69qgLE0qcXHJ5S', NULL, '2020-05-23 06:12:11', '2020-05-23 06:12:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Database: `p_laravel_7`
--
CREATE DATABASE IF NOT EXISTS `p_laravel_7` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `p_laravel_7`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_image`, `created_at`, `updated_at`) VALUES
(1, 'Nokia', 'images/brand/1666935799654829.png', '2020-05-17 10:14:14', '2020-05-17 11:10:59'),
(2, 'Samsung', 'images/brand/1666935781807582.png', '2020-05-17 10:15:15', '2020-05-17 11:10:42'),
(3, 'Symphony', 'images/brand/1666935765419887.png', '2020-05-17 10:15:23', '2020-05-17 11:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `category_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 'Laptop', NULL, '2020-05-17 05:00:26', NULL),
(2, 4, 'Computer', NULL, '2020-05-17 05:03:59', '2020-05-17 05:03:59'),
(3, 4, 'Fashion', NULL, '2020-05-17 05:07:20', NULL),
(4, 1, 'Love', NULL, '2020-05-17 05:08:53', NULL),
(5, 1, 'Tester', NULL, '2020-05-17 05:11:02', NULL),
(6, 1, 'Test', NULL, '2020-05-17 05:11:06', NULL),
(7, 1, 'Again Test', NULL, '2020-05-17 05:11:09', NULL),
(8, 1, 'Keyboard', NULL, '2020-05-17 05:11:20', NULL),
(9, 1, 'Mouse', '2020-05-18 05:10:56', '2020-05-17 05:11:26', '2020-05-18 05:10:56'),
(11, 1, 'Home Love', NULL, '2020-05-17 05:11:41', '2020-05-18 05:11:24'),
(14, 1, 'Bata Shoe', NULL, '2020-05-17 05:12:02', '2020-05-17 06:00:59'),
(21, 1, 'Brash', NULL, '2020-05-18 05:11:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2020_05_17_035539_create_categories_table', 3),
(5, '2020_05_17_154013_create_brands_table', 4),
(6, '2020_05_17_171142_create_multi_imgs_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `multi_imgs`
--

CREATE TABLE `multi_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_imgs`
--

INSERT INTO `multi_imgs` (`id`, `images`, `created_at`, `updated_at`) VALUES
(1, 'images/multiimg/1666939755886549.png', '2020-05-17 12:13:52', NULL),
(2, 'images/multiimg/1666939756150528.png', '2020-05-17 12:13:52', NULL),
(3, 'images/multiimg/1666939756310026.png', '2020-05-17 12:13:52', NULL),
(4, 'images/multiimg/1666939756547225.png', '2020-05-17 12:13:53', NULL),
(5, 'images/multiimg/1666939835808467.png', '2020-05-17 12:15:08', NULL),
(6, 'images/multiimg/1666939836066774.png', '2020-05-17 12:15:08', NULL),
(7, 'images/multiimg/1666939836257191.png', '2020-05-17 12:15:09', NULL),
(8, 'images/multiimg/1666939836516178.png', '2020-05-17 12:15:09', NULL),
(9, 'images/multiimg/1666939836714986.png', '2020-05-17 12:15:09', NULL),
(10, 'images/multiimg/1666939859788977.png', '2020-05-17 12:15:31', NULL),
(11, 'images/multiimg/1666939860091129.png', '2020-05-17 12:15:31', NULL),
(12, 'images/multiimg/1666939860296388.png', '2020-05-17 12:15:31', NULL),
(13, 'images/multiimg/1667003815481445.png', '2020-05-18 05:12:05', NULL),
(14, 'images/multiimg/1667003817312261.png', '2020-05-18 05:12:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Arif', 'arif@gmail.com', NULL, '$2y$10$x9YqrmKecYJi0nzxCYtKcey7ChkteCyteuTMxR99v54lK2QEbK89y', 'C4FsABgQ4WDC0Qo4bqcneAAxrzfuWy6G7m5ERT219HiGMFL8YVciuy4gRLRK', '2020-05-16 21:33:24', '2020-05-18 03:29:26'),
(2, 'Arif Aivey', 'arifaivey@gmail.com', NULL, '$2y$10$7U8rNLGkC9StAY/Mcv2NX.6mGP4RJnXaD.O9nUmgiPN4UKizgFKEW', NULL, '2020-05-16 21:34:14', '2020-05-18 02:43:10'),
(3, 'Arafat Hossain', 'arafat@gmail.com', NULL, '$2y$10$7nvcI1srHjZ8bIUbNJ3m9eU/eRh4qtQmdXc/YCONn.Aa1ksR2s/k.', NULL, '2020-05-16 21:34:30', '2020-05-16 21:34:30'),
(4, 'Ashraful', 'ashraful@gmail.com', '2020-05-18 03:37:50', '$2y$10$B3i3T11zawexaGyUTJccWed3If2MLcFXdQjFDLMFUIcReYBw7DqkK', NULL, '2020-05-16 21:34:55', '2020-05-18 03:37:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `p_lms`
--
CREATE DATABASE IF NOT EXISTS `p_lms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `p_lms`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(5) NOT NULL,
  `book_name` varchar(70) NOT NULL,
  `book_image` varchar(100) NOT NULL,
  `book_author_name` varchar(50) NOT NULL,
  `book_publications_name` varchar(50) NOT NULL,
  `book_purchase_date` varchar(50) NOT NULL,
  `book_price` varchar(10) NOT NULL,
  `book_qty` int(5) NOT NULL,
  `available_qty` int(5) NOT NULL,
  `librarian_username` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `book_image`, `book_author_name`, `book_publications_name`, `book_purchase_date`, `book_price`, `book_qty`, `available_qty`, `librarian_username`, `date_time`) VALUES
(8, 'Choto Vai', '200413051332.png', 'Ashrafull', 'Family Publications', '2020-04-06', '346', 12, 11, 'adminarif', '2020-04-13 03:13:32'),
(9, 'Pran Pakhi', '200413051418.png', 'Arif Hossain', 'Love Publications', '2020-04-30', '345', 13, 11, 'adminarif', '2020-04-13 03:14:18'),
(10, 'Selfish', '200413051418.png', 'Arif Hossain', 'Selfish love', '2020-04-30', '345', 15, 15, 'adminarif', '2020-04-13 03:14:18'),
(11, 'Quarrel', '200413051442.png', 'Aivey Hossain', 'Family Publications', '2020-04-09', '3545', 20, 20, 'adminarif', '2020-04-13 03:14:42'),
(12, 'Taka Dollar', '200413052332.png', 'Ashrafull', 'Money Publications', '2020-04-08', '353', 11, 10, 'adminarif', '2020-04-13 03:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `issue_books`
--

CREATE TABLE `issue_books` (
  `id` int(5) NOT NULL,
  `book_id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `book_issue_date` varchar(20) NOT NULL,
  `book_return_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue_books`
--

INSERT INTO `issue_books` (`id`, `book_id`, `student_id`, `book_issue_date`, `book_return_date`, `date_time`) VALUES
(1, 11, 7, '13-04-2020', '13-04-20', '2020-04-13 05:16:01'),
(9, 8, 11, '13-04-2020', '', '2020-04-13 06:14:07'),
(10, 9, 11, '13-04-2020', '13-04-20', '2020-04-13 06:14:17'),
(11, 11, 12, '13-04-2020', '13-04-20', '2020-04-13 06:22:07'),
(12, 9, 12, '13-04-2020', '', '2020-04-13 06:22:16'),
(13, 10, 10, '13-04-2020', '13-04-20', '2020-04-13 08:31:15'),
(14, 10, 10, '13-04-2020', '13-04-20', '2020-04-13 08:31:27'),
(15, 8, 13, '13-04-2020', '13-04-20', '2020-04-13 08:54:03'),
(16, 11, 13, '13-04-2020', '', '2020-04-13 08:54:12'),
(17, 12, 14, '13-04-2020', '', '2020-04-13 08:54:22'),
(18, 9, 10, '13-04-2020', '', '2020-04-13 11:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `id` int(3) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id`, `fname`, `lname`, `email`, `username`, `password`, `date_time`) VALUES
(1, 'Arafat', 'Hasan', 'admin@gmail.com', 'adminarif', '99999999', '2020-04-12 15:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(5) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `roll` int(6) NOT NULL,
  `reg` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `roll`, `reg`, `email`, `username`, `password`, `phone`, `image`, `status`, `date_time`) VALUES
(5, 'Kamal', 'Hossain', 555555, 555555, 'arifh3261@gmail.com', 'arifhossain', '$2y$10$jrS3AM4em00TWV21MsTolewE0/l/TW9dcEunzZ2o1Ta8zSw/PueIu', '01882763384', NULL, 0, '2020-04-12 14:01:56'),
(7, 'Kamal', 'Hossain', 555555, 555555, 'aivey@gmai.com', 'kamalhasan', '$2y$10$psjb88HhveyT6iqBYSz/weD4MQpZHTT2suopKahLvKsv6fxvrBkIS', '01882763384', NULL, 1, '2020-04-12 14:03:07'),
(8, 'Arif', 'Hossain', 666666, 777777, 'kamal@gmai.com', 'admin', '$2y$10$PWP/Q8MdKUhyZUESr/yMiupjWm.lL2H/Ed8UP/mOjKfeu5pBfRg2K', '01482763384', NULL, 0, '2020-04-12 14:11:33'),
(10, 'Kamal', 'Hossain', 555555, 555555, 'aivey8@gmai.com', 'jjjjjjjj', '$2y$10$pR2J4tCKKYBNDauHYz1/1eCja83jJ2L1vIM.8/1FyQRmVN2z0WU9e', '01482763384', NULL, 1, '2020-04-12 14:29:15'),
(11, 'Admin', 'Hossain', 999999, 999999, 'admin@gmail.com', 'adminarif', '$2y$10$RaoJLmCim96GIPFIbHl1EOQxOVPgm6cMD5q3FByi/e18by9D43.3.', '01882763384', NULL, 1, '2020-04-12 14:48:52'),
(12, 'Omor', 'Hasan', 555555, 345678, 'omor@gmail.com', 'omorhasan', '$2y$10$t6Soh.mWtThnxCfwAJrsN.lI7XQS/DHyDvMhw1KXR4puhqmn9SOGu', '01882763384', NULL, 1, '2020-04-13 06:21:15'),
(13, 'Subahan', 'Molla', 444444, 333333, 'sobahan@gmail.com', 'sobahamolla', '$2y$10$lXYJ/w1//YwESpODo0DvwOCcf1MLlldkRCIwJyxr0Lfgz2acvrNb6', '01782763384', NULL, 1, '2020-04-13 08:52:33'),
(14, 'Mukta', 'Molla', 444444, 333333, 'mukta@gmail.com', 'muktamolla', '$2y$10$T30wKahScGCw5YHdG8ynluS77VQOXeVENo7edfJCY4pKEbK5UWk7e', '01782763384', NULL, 1, '2020-04-13 08:52:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_books`
--
ALTER TABLE `issue_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `issue_books`
--
ALTER TABLE `issue_books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Database: `p_mvc`
--
CREATE DATABASE IF NOT EXISTS `p_mvc` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `p_mvc`;

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
--
-- Database: `p_shop`
--
CREATE DATABASE IF NOT EXISTS `p_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `p_shop`;

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
--
-- Database: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `shop`;

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

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `session_id`, `product_id`, `product_name`, `price`, `quantity`, `image`) VALUES
(55, 'jggjcigfq9cli1tc2pgklmat2h', 4, 'LED TV', 20000, 1, 'f9e21d7e70.png'),
(64, '54blkeo58icmueek8hbl5utp0q', 4, 'LED TV', 20000, 1, 'f9e21d7e70.png');

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

--
-- Dumping data for table `compare`
--

INSERT INTO `compare` (`id`, `customer_id`, `product_id`, `product_name`, `price`, `image`) VALUES
(35, 12, 7, 'Wireless mouse', 3456, '78e3fa7c58.png');

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
(13, 'Ashraful', 'Bhola', 'Bhola', 'Bangladesh', '12222', '01782763376', 'ashraful@gmail.com', 'd27d320c27c3033b7883347d8beca317'),
(14, '', '', '', '', '', '01782763384', '', 'd41d8cd98f00b204e9800998ecf8427e');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `compare`
--
ALTER TABLE `compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
--
-- Database: `sms`
--
CREATE DATABASE IF NOT EXISTS `sms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sms`;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `roll` int(6) NOT NULL,
  `class` int(1) NOT NULL,
  `city` varchar(20) NOT NULL,
  `p_contact` int(15) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `roll`, `class`, `city`, `p_contact`, `photo`, `date_time`) VALUES
(5, 'Arif Hossain', 555555, 8, 'Mymensing', 1782763384, '555555.png', '2020-04-08 15:10:45'),
(7, 'Aivey', 666666, 6, 'Dhaka', 1782763384, '666666.png', '2020-04-08 16:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `photo`, `status`, `date_time`) VALUES
(11, 'Test', 'test@gmail.com', 'test1234', 'dd4b21e9ef71e1291183a46b913ae6f2', 'test1234.png', 'active', '2020-04-08 16:40:36'),
(12, 'Arif', 'arif@gmail.com', 'aiveyhossain', '30e535568de1f9231e7d9df0f4a5a44d', 'aiveyhossain.png', 'active', '2020-04-08 17:00:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roll` (`roll`);

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
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Database: `wardrobe`
--
CREATE DATABASE IF NOT EXISTS `wardrobe` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wardrobe`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '0',
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `categoryName`, `keywords`, `description`, `serial`, `date_time`, `update_time`) VALUES
(1, 'Premium Lungi', 'Premium Lungi, lungi, lungi online, white lungi, rowdy lungi, lungi price, cotton lungi, black lungi', 'Buy Lungi at Best Price.', '0', '2020-09-15 07:12:49', '2020-09-15 08:38:06'),
(2, 'Men\'s Vest', 'Men\'s Vest, vests, suit vest, rich star vest, polo vest, mens sweater vest, tuxedo vest\r\n\r\n', 'Vests For Men - Buy men\'s innerwear vests online at great price from Wardrobebd. Shop today & enjoy great discounts! ✯ Easy returns and exchanges ✯ Free Shipping ✯ COD', '0', '2020-09-15 09:10:59', '2020-09-15 11:42:28'),
(3, 'Sandals', 'Sandals, flip flops, nike slides, tory burch sandals, platform sandals, adidas slides', 'Free shipping BOTH ways on Sandals from our vast selection of styles. Fast delivery, and 24/7/365 real-person service with a smile.', '0', '2020-09-15 07:14:36', '2020-09-15 11:44:44'),
(4, 'Women\'s Innerwear', 'Women\'s Innerwear, jockey innerwear for womens, womens innerwear online shopping, inner wear for girls, inner wear online\r\n\r\n', 'Explore our collection of women\'s innerwear including camisoles, tees, tank tops, leggings, and slips for women. Find AIRism and HEATTECH camis and leggings.', '0', '2020-09-15 07:15:20', '2020-09-15 11:46:43'),
(5, 'Children Socks', 'Children Socks, kids socks, crazy socks for kids, baby knee high socks, boys slipper socks, kids slipper socks', 'Find the best socks for children based on what customers said', '0', '2020-09-15 07:15:57', '2020-09-15 09:38:38'),
(6, 'Home Wear', 'Home Wear, Home Wear in Bangladesh, buy Home Wear online in Bangladesh, online store for Home Wear, Shop online for Home Wear, online shopping for Home Wear, Online shopping for Home Wear in Bangladesh, reviews and prices', 'Home Wear Online. Shop for Home Wear in Bangladesh âœ¯ Buy latest range of Home Wear at Wardrobebd.', '0', '2020-09-15 07:16:18', '2020-09-15 09:35:39'),
(7, 'Islamic Wear', 'Islamic Wear, islamic clothing, modest dresses, dresses for muslim', 'Attractive Islamic wear for muslim man and women in Bangladesh  including modest dress quality with customizable options in sizes at best discounted prices', '0', '2020-09-15 07:17:42', '2020-09-15 09:17:59'),
(8, 'Home Accessories', 'Home Accessories, home decor items, wall art decor, framed wall art, wall art canvas, decorative items, decorative wall mirrors', 'Because the details matter. For modern and unique home decor, mirrors, vases, picture frames, vases and more, shop online.', '0', '2020-09-15 07:33:45', '2020-09-15 09:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `order_id` varchar(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `ip_address`, `date_time`) VALUES
(1, '95.217.203.187', '2020-09-15 07:08:14'),
(2, '173.252.111.6', '2020-09-15 07:28:04'),
(3, '173.252.111.3', '2020-09-15 07:28:04'),
(4, '173.252.111.29', '2020-09-15 07:28:04'),
(5, '173.252.127.16', '2020-09-15 09:51:59'),
(6, '173.252.127.117', '2020-09-15 09:51:59'),
(7, '66.220.149.5', '2020-09-15 09:52:00'),
(8, '::1', '2020-11-09 11:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `delivery_charge` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_cat_id` varchar(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `size` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `available_qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `offer` int(11) NOT NULL DEFAULT 0,
  `sub_price` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_request`
--

CREATE TABLE `product_request` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_cat_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subCategoryName` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_cat_id`, `cat_id`, `subCategoryName`, `keywords`, `description`, `create_time`, `update_time`) VALUES
(1, 3, 'Men', 'Men', 'Men', '2020-09-15 07:19:15', '2020-09-15 07:19:15'),
(2, 3, 'Women', 'Women', 'Women', '2020-09-15 07:19:31', '2020-09-15 07:19:31'),
(3, 3, 'Children', 'Children', 'Children', '2020-09-15 07:19:46', '2020-09-15 07:19:46'),
(4, 4, 'Top', 'Top', 'Top', '2020-09-15 07:20:19', '2020-09-15 07:20:19'),
(5, 4, 'Bottom', 'Bottom', 'Bottom', '2020-09-15 07:20:37', '2020-09-15 07:20:37'),
(6, 6, 'Men\'s T-Shirt', 'Men\'s T-Shirt', 'Men\'s T-Shirt', '2020-09-15 07:21:34', '2020-09-15 07:21:34'),
(7, 6, 'Women\'s T-Shirt', 'Women\'s T-Shirt', 'Women\'s T-Shirt', '2020-09-15 07:21:51', '2020-09-15 07:21:51'),
(8, 6, 'Children\'s T-Shirt', 'Children\'s T-Shirt', 'Children\'s T-Shirt', '2020-09-15 07:22:16', '2020-09-15 07:22:16'),
(9, 6, 'Men\'s Trouser', 'Men\'s Trouser', 'Men\'s Trouser', '2020-09-15 07:23:52', '2020-09-15 07:23:52'),
(10, 6, 'Women\'s Trouser', 'Women\'s Trouser', 'Women\'s Trouser', '2020-09-15 07:24:04', '2020-09-15 07:24:04'),
(11, 6, 'Children\'s Trouser', 'Children\'s Trouser', 'Children\'s Trouser', '2020-09-15 07:24:31', '2020-09-15 07:24:31'),
(12, 6, 'Women\'s Maxi', 'Women\'s Maxi', 'Women\'s Maxi', '2020-09-15 07:25:15', '2020-09-15 07:25:15'),
(13, 7, 'Hijab', 'Hijab', 'Hijab', '2020-09-15 07:26:43', '2020-09-15 07:26:43'),
(14, 7, 'Burkha', 'Burkha', 'Burkha', '2020-09-15 07:29:47', '2020-09-15 07:29:47'),
(15, 7, 'Shrug', 'Shrug', 'Shrug', '2020-09-15 07:30:01', '2020-09-15 07:30:01'),
(16, 7, 'Men\'s Thobe', 'Men\'s Thobe', 'Men\'s Thobe', '2020-09-15 07:30:38', '2020-09-15 07:30:38'),
(17, 7, 'Men\'s Panjabi', 'Men\'s Panjabi', 'Men\'s Panjabi', '2020-09-15 07:30:58', '2020-09-15 07:30:58'),
(18, 7, 'Men\'s Tupi', 'Men\'s Tupi', 'Men\'s Tupi', '2020-09-15 07:31:11', '2020-09-15 07:31:11'),
(19, 7, 'Janamaz', 'Janamaz', 'Janamaz', '2020-09-15 07:31:56', '2020-09-15 07:31:56'),
(20, 7, 'Tasbih', 'Tasbih', 'Tasbih', '2020-09-15 07:32:39', '2020-09-15 07:32:39'),
(21, 7, 'Attar', 'Attar', 'Attar', '2020-09-15 07:33:06', '2020-09-15 07:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `status`, `create_time`, `update_time`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin@gmail.com', 0, '2020-08-31 04:58:27', '2020-08-31 04:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

CREATE TABLE `wish_list` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `name` (`categoryName`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip_address` (`ip_address`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_request`
--
ALTER TABLE `product_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_request`
--
ALTER TABLE `product_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wish_list`
--
ALTER TABLE `wish_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-10-18 04:19:28', '2020-10-18 04:19:28', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'Employee Management System', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'arifh3261@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:79:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:31:\"wp-hr-manager/wp-hr-manager.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentytwenty', 'yes'),
(41, 'stylesheet', 'twentytwenty', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '48748', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1618546761', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'initial_db_version', '48748', 'yes'),
(96, 'wp_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:15:\"wphr_hr_manager\";a:2:{s:4:\"name\";s:10:\"HR Manager\";s:12:\"capabilities\";a:23:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:18:\"wphr_list_employee\";b:1;s:20:\"wphr_create_employee\";b:1;s:18:\"wphr_view_employee\";b:1;s:18:\"wphr_edit_employee\";b:1;s:20:\"wphr_delete_employee\";b:1;s:18:\"wphr_create_review\";b:1;s:18:\"wphr_delete_review\";b:1;s:18:\"wphr_manage_review\";b:1;s:24:\"wphr_manage_announcement\";b:1;s:19:\"wphr_manage_jobinfo\";b:1;s:17:\"wphr_view_jobinfo\";b:1;s:22:\"wphr_manage_department\";b:1;s:23:\"wphr_manage_designation\";b:1;s:25:\"wphr_leave_create_request\";b:1;s:17:\"wphr_leave_manage\";b:1;s:16:\"wphr_leave_mails\";b:1;s:23:\"wphr_manage_hr_settings\";b:1;s:20:\"wphr_create_document\";b:1;s:18:\"wphr_edit_document\";b:1;s:18:\"wphr_view_document\";b:1;s:20:\"wphr_delete_document\";b:1;}}s:8:\"employee\";a:2:{s:4:\"name\";s:8:\"Employee\";s:12:\"capabilities\";a:11:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:18:\"wphr_list_employee\";b:1;s:18:\"wphr_view_employee\";b:1;s:18:\"wphr_edit_employee\";b:1;s:17:\"wphr_view_jobinfo\";b:1;s:25:\"wphr_leave_create_request\";b:1;s:20:\"wphr_create_document\";b:1;s:18:\"wphr_edit_document\";b:1;s:18:\"wphr_view_document\";b:1;s:20:\"wphr_delete_document\";b:1;}}}', 'yes'),
(97, 'fresh_site', '0', 'yes'),
(98, 'cron', 'a:11:{i:1603097368;a:1:{s:32:\"wphr_per_minute_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"per_minute\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}}i:1603099169;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1603124369;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1603124370;a:2:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1603167567;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1603167581;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1603167585;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1603168588;a:1:{s:27:\"wphr_daily_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1603600588;a:1:{s:28:\"wphr_weekly_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1603685968;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(99, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'recovery_keys', 'a:1:{s:22:\"kbBLnyLMEuvSIil72eQrxC\";a:2:{s:10:\"hashed_key\";s:34:\"$P$B/61vqaaCd5GChU5rfhxQsDGneZbpb1\";s:10:\"created_at\";i:1603087941;}}', 'yes'),
(114, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1603087918;s:15:\"version_checked\";s:5:\"5.5.1\";s:12:\"translations\";a:0:{}}', 'no'),
(116, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(117, 'theme_mods_twentytwenty', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(123, '_site_transient_timeout_browser_44a5e524f134e3228c7b0b16c2224ffc', '1603599583', 'no'),
(124, '_site_transient_browser_44a5e524f134e3228c7b0b16c2224ffc', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"86.0.4240.75\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(125, '_site_transient_timeout_php_check_fb6df547cfb7d95cb9b49b8301cad3ab', '1603599584', 'no'),
(126, '_site_transient_php_check_fb6df547cfb7d95cb9b49b8301cad3ab', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(130, 'can_compress_scripts', '1', 'no'),
(142, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1603087923;s:7:\"checked\";a:4:{s:5:\"astra\";s:5:\"2.5.5\";s:14:\"twentynineteen\";s:3:\"1.7\";s:15:\"twentyseventeen\";s:3:\"2.4\";s:12:\"twentytwenty\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:4:{s:5:\"astra\";a:6:{s:5:\"theme\";s:5:\"astra\";s:11:\"new_version\";s:5:\"2.5.5\";s:3:\"url\";s:35:\"https://wordpress.org/themes/astra/\";s:7:\"package\";s:53:\"https://downloads.wordpress.org/theme/astra.2.5.5.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.3\";}s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.7.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}', 'no'),
(143, 'recently_activated', 'a:0:{}', 'yes'),
(148, 'finished_updating_comment_type', '1', 'yes'),
(150, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1603087923;s:7:\"checked\";a:3:{s:19:\"akismet/akismet.php\";s:5:\"4.1.6\";s:9:\"hello.php\";s:5:\"1.7.2\";s:31:\"wp-hr-manager/wp-hr-manager.php\";s:3:\"2.8\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:31:\"wp-hr-manager/wp-hr-manager.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/wp-hr-manager\";s:4:\"slug\";s:13:\"wp-hr-manager\";s:6:\"plugin\";s:31:\"wp-hr-manager/wp-hr-manager.php\";s:11:\"new_version\";s:3:\"2.8\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wp-hr-manager/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/wp-hr-manager.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/wp-hr-manager/assets/icon-256x256.png?rev=1736312\";s:2:\"1x\";s:66:\"https://ps.w.org/wp-hr-manager/assets/icon-128x128.png?rev=1736312\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wp-hr-manager/assets/banner-1544x500.png?rev=2070782\";s:2:\"1x\";s:68:\"https://ps.w.org/wp-hr-manager/assets/banner-772x250.png?rev=2070782\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(151, 'fs_active_plugins', 'O:8:\"stdClass\":3:{s:7:\"plugins\";a:1:{s:22:\"wp-hr-manager/freemius\";O:8:\"stdClass\":4:{s:7:\"version\";s:7:\"2.4.0.1\";s:4:\"type\";s:6:\"plugin\";s:9:\"timestamp\";i:1602995770;s:11:\"plugin_path\";s:31:\"wp-hr-manager/wp-hr-manager.php\";}}s:7:\"abspath\";s:26:\"C:\\xampp\\htdocs\\wordpress/\";s:6:\"newest\";O:8:\"stdClass\":5:{s:11:\"plugin_path\";s:31:\"wp-hr-manager/wp-hr-manager.php\";s:8:\"sdk_path\";s:22:\"wp-hr-manager/freemius\";s:7:\"version\";s:7:\"2.4.0.1\";s:13:\"in_activation\";b:0;s:9:\"timestamp\";i:1602995770;}}', 'yes'),
(152, 'fs_debug_mode', '', 'yes'),
(153, 'fs_accounts', 'a:7:{s:21:\"id_slug_type_path_map\";a:1:{i:1296;a:3:{s:4:\"slug\";s:13:\"wp-hr-manager\";s:4:\"type\";s:6:\"plugin\";s:4:\"path\";s:31:\"wp-hr-manager/wp-hr-manager.php\";}}s:11:\"plugin_data\";a:1:{s:13:\"wp-hr-manager\";a:16:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:4:\"path\";s:31:\"wp-hr-manager/wp-hr-manager.php\";}s:20:\"is_network_activated\";b:0;s:17:\"install_timestamp\";i:1602995770;s:17:\"was_plugin_loaded\";b:1;s:21:\"is_plugin_new_install\";b:1;s:16:\"sdk_last_version\";N;s:11:\"sdk_version\";s:7:\"2.4.0.1\";s:16:\"sdk_upgrade_mode\";b:1;s:18:\"sdk_downgrade_mode\";b:0;s:19:\"plugin_last_version\";N;s:14:\"plugin_version\";s:3:\"2.8\";s:19:\"plugin_upgrade_mode\";b:1;s:21:\"plugin_downgrade_mode\";b:0;s:17:\"connectivity_test\";a:6:{s:12:\"is_connected\";b:1;s:4:\"host\";s:9:\"localhost\";s:9:\"server_ip\";s:3:\"::1\";s:9:\"is_active\";b:1;s:9:\"timestamp\";i:1602995770;s:7:\"version\";s:3:\"2.8\";}s:15:\"prev_is_premium\";b:0;s:21:\"is_pending_activation\";b:1;}}s:13:\"file_slug_map\";a:1:{s:31:\"wp-hr-manager/wp-hr-manager.php\";s:13:\"wp-hr-manager\";}s:7:\"plugins\";a:1:{s:13:\"wp-hr-manager\";O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";N;s:5:\"title\";s:13:\"WP-HR Manager\";s:4:\"slug\";s:13:\"wp-hr-manager\";s:12:\"premium_slug\";s:21:\"wp-hr-manager-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";s:3:\"all\";s:19:\"is_wp_org_compliant\";b:1;s:22:\"premium_releases_count\";N;s:4:\"file\";s:31:\"wp-hr-manager/wp-hr-manager.php\";s:7:\"version\";s:3:\"2.8\";s:11:\"auto_update\";N;s:4:\"info\";N;s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:7:\"Premium\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_3dcdd297d8b052f4cc1fa5e68338b\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"1296\";s:7:\"updated\";N;s:7:\"created\";N;s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:9:\"unique_id\";s:32:\"b281168080d699bf848c2cbdea0521b5\";s:13:\"admin_notices\";a:1:{s:13:\"wp-hr-manager\";a:1:{s:18:\"activation_pending\";a:8:{s:7:\"message\";s:198:\"You should receive an activation email for <b>WP-HR Manager</b> to your mailbox at <b>arifh3261@gmail.com</b>. Please make sure you click the activation button in that email to complete the install.\";s:5:\"title\";s:7:\"Thanks!\";s:4:\"type\";s:7:\"success\";s:6:\"sticky\";b:1;s:2:\"id\";s:18:\"activation_pending\";s:10:\"manager_id\";s:13:\"wp-hr-manager\";s:6:\"plugin\";s:13:\"WP-HR Manager\";s:10:\"wp_user_id\";N;}}}s:6:\"addons\";a:1:{i:1296;a:7:{i:0;O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:5:\"title\";s:17:\"WP-HR Recruitment\";s:4:\"slug\";s:16:\"wphr-recruitment\";s:12:\"premium_slug\";s:24:\"wphr-recruitment-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";N;s:19:\"is_wp_org_compliant\";b:0;s:22:\"premium_releases_count\";i:12;s:4:\"file\";N;s:7:\"version\";N;s:11:\"auto_update\";N;s:4:\"info\";O:14:\"FS_Plugin_Info\":13:{s:9:\"plugin_id\";s:4:\"1298\";s:11:\"description\";s:240:\"If you are already using WP-HR Manager and want to smoothly integrate your recruitment process - this is the plugin for you.  \n\nWP-HR Recruitment will enable you to quickly add vacancies and potential recruits into a stream-lined process...\";s:17:\"short_description\";s:116:\"Recruitment made easy: Add vacancies; display on your site; online applications; track interviews; monitor progress.\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1298/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1298/card_banner.png\";s:15:\"selling_point_0\";s:37:\"Manage vacancies within WP-HR Manager\";s:15:\"selling_point_1\";s:45:\"Monitor and report on the recruitment process\";s:15:\"selling_point_2\";s:31:\"Advertise roles on your website\";s:11:\"screenshots\";N;s:2:\"id\";s:2:\"88\";s:7:\"updated\";s:19:\"2018-05-05 15:36:43\";s:7:\"created\";s:19:\"2017-08-17 23:46:45\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_1a007c505f1d64c18a2f47ba9e953\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"1298\";s:7:\"updated\";s:19:\"2020-10-14 13:12:22\";s:7:\"created\";s:19:\"2017-08-17 22:22:59\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:1;O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:5:\"title\";s:16:\"WP-HR Attendance\";s:4:\"slug\";s:15:\"wphr-attendance\";s:12:\"premium_slug\";s:23:\"wphr-attendance-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";N;s:19:\"is_wp_org_compliant\";b:0;s:22:\"premium_releases_count\";i:11;s:4:\"file\";N;s:7:\"version\";N;s:11:\"auto_update\";N;s:4:\"info\";O:14:\"FS_Plugin_Info\":13:{s:9:\"plugin_id\";s:4:\"1314\";s:11:\"description\";s:253:\"Enable employees to check in and out, accurately recording their working hours.  The system works directly from the employee\'s profile dashboard or you can import data in CSV format from other apps.  Admins can set office hours and add unlimited shifts.\";s:17:\"short_description\";s:38:\"Track and monitor employee attendance.\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1314/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1314/card_banner.png\";s:15:\"selling_point_0\";s:65:\"Enable employees to check in and out - record their working hours\";s:15:\"selling_point_1\";s:31:\"Specify office hours and shifts\";s:15:\"selling_point_2\";s:50:\"View reports on attendance with WP--HR Manager Pro\";s:11:\"screenshots\";N;s:2:\"id\";s:2:\"89\";s:7:\"updated\";s:19:\"2018-12-28 14:31:32\";s:7:\"created\";s:19:\"2017-08-22 20:51:23\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_287705a8d62f3d9852ecdfb47e88d\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"1314\";s:7:\"updated\";s:19:\"2020-10-13 20:35:14\";s:7:\"created\";s:19:\"2017-08-22 19:59:27\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:2;O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:5:\"title\";s:15:\"WP-HR Documents\";s:4:\"slug\";s:14:\"wphr-documents\";s:12:\"premium_slug\";s:22:\"wphr-documents-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";N;s:19:\"is_wp_org_compliant\";b:0;s:22:\"premium_releases_count\";i:3;s:4:\"file\";N;s:7:\"version\";N;s:11:\"auto_update\";N;s:4:\"info\";O:14:\"FS_Plugin_Info\":13:{s:9:\"plugin_id\";s:4:\"2446\";s:11:\"description\";s:759:\"If you need to create a library of files and documents for all employees or simply add a document for a single employee this plugin delivers.  You can create a library, add folders to help manage and locate documents of particular types - for example, add you Health and Safety guidelines in one folder, and your Employee Handbook in another.  You can also add documents to individual employee profiles, for example, a copy of their employment contract.  Finally, employees themselves can upload documents directly so if you need a copy of their ID or drivers licence, for example, you could ask them to add them directly to their profile in the new \'Documents\' section created by this plugin.  You can upload most formats - PDF, Word, Excel, image files etc.\";s:17:\"short_description\";s:57:\"Upload and manage HR files and documents in WP-HR Manager\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2446/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2446/card_banner.png\";s:15:\"selling_point_0\";s:42:\"Create a library of HR Documents and Files\";s:15:\"selling_point_1\";s:43:\"Add Folders to Easily Manage your Documents\";s:15:\"selling_point_2\";s:48:\"Upload Documents to Individual Employee Profiles\";s:11:\"screenshots\";N;s:2:\"id\";s:3:\"377\";s:7:\"updated\";s:19:\"2018-08-18 12:30:18\";s:7:\"created\";s:19:\"2018-08-15 14:47:18\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_4c0d0646a94caa7b6d66d2a515b07\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"2446\";s:7:\"updated\";s:19:\"2020-10-17 22:34:26\";s:7:\"created\";s:19:\"2018-08-15 11:28:31\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:3;O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:5:\"title\";s:16:\"WP-HR Add Fields\";s:4:\"slug\";s:11:\"wphr-fields\";s:12:\"premium_slug\";s:19:\"wphr-fields-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";N;s:19:\"is_wp_org_compliant\";b:0;s:22:\"premium_releases_count\";i:5;s:4:\"file\";N;s:7:\"version\";N;s:11:\"auto_update\";N;s:4:\"info\";O:14:\"FS_Plugin_Info\":13:{s:9:\"plugin_id\";s:4:\"2454\";s:11:\"description\";s:257:\"There are already a lot of useful fields in WP-HR Manager for recording employee information - but you may want more!   Now you can easily add many types of field to the employee\'s profile, enabling you to gather and manage exactly the information you need.\";s:17:\"short_description\";s:31:\"Add fields to Employee Profiles\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2454/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2454/card_banner.png\";s:15:\"selling_point_0\";s:31:\"Add fields to employee profiles\";s:15:\"selling_point_1\";s:53:\"Multiple field types - text, drop down, tick box etc.\";s:15:\"selling_point_2\";s:39:\"Collect additional employee information\";s:11:\"screenshots\";N;s:2:\"id\";s:3:\"379\";s:7:\"updated\";s:19:\"2018-08-21 19:28:21\";s:7:\"created\";s:19:\"2018-08-18 14:39:32\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_9aa3fe478e0a0b4092a8d046330a5\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"2454\";s:7:\"updated\";s:19:\"2020-10-14 13:17:02\";s:7:\"created\";s:19:\"2018-08-18 14:07:53\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:4;O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:5:\"title\";s:18:\"WP-HR SMS Messages\";s:4:\"slug\";s:8:\"wphr-sms\";s:12:\"premium_slug\";s:16:\"wphr-sms-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";N;s:19:\"is_wp_org_compliant\";b:0;s:22:\"premium_releases_count\";i:4;s:4:\"file\";N;s:7:\"version\";N;s:11:\"auto_update\";N;s:4:\"info\";O:14:\"FS_Plugin_Info\":13:{s:9:\"plugin_id\";s:4:\"2455\";s:11:\"description\";s:230:\"It\'s good to keep in touch with employees and SMS messages are now one of the most common means of communicating in the world - so why not integrate an SMS messaging service with WP-HR Manager to help your employee communications?\";s:17:\"short_description\";s:31:\"Keep in touch with SMS messages\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2455/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2455/card_banner.png\";s:15:\"selling_point_0\";s:26:\"SMS message your employees\";s:15:\"selling_point_1\";s:38:\"Integrates with multiple SMS suppliers\";s:15:\"selling_point_2\";N;s:11:\"screenshots\";N;s:2:\"id\";s:3:\"378\";s:7:\"updated\";s:19:\"2018-08-18 14:45:53\";s:7:\"created\";s:19:\"2018-08-18 14:31:46\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_ad12da38db8bce4fd2c753d932e51\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"2455\";s:7:\"updated\";s:19:\"2020-07-29 09:29:43\";s:7:\"created\";s:19:\"2018-08-18 14:14:31\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:5;O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:5:\"title\";s:21:\"WP-HR Mobile Check In\";s:4:\"slug\";s:12:\"wphr-checkin\";s:12:\"premium_slug\";s:20:\"wphr-checkin-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";N;s:19:\"is_wp_org_compliant\";b:0;s:22:\"premium_releases_count\";i:6;s:4:\"file\";N;s:7:\"version\";N;s:11:\"auto_update\";N;s:4:\"info\";O:14:\"FS_Plugin_Info\":13:{s:9:\"plugin_id\";s:4:\"2702\";s:11:\"description\";s:419:\"The addon works with WP-HR Manager and WP-HR Attendance to add the functionality to integrate our two (Apple and Android) phone apps.  Perfect for employees who don\'t have regular access to a PC, or who work remotely.  Ask them to check in when the start work and check out when they finish - you\'ll know who is working at any time.  Ideal for tracking lateness, over time, remote workers, time based projects and more.\";s:17:\"short_description\";s:55:\"Enable employees to check in/out on their mobile phones\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2702/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2702/card_banner.png\";s:15:\"selling_point_0\";s:45:\"One tap check in and check out (clock in/out)\";s:15:\"selling_point_1\";s:31:\"Andoid and Apple Apps available\";s:15:\"selling_point_2\";s:41:\"Perfect for tracking lateness and absence\";s:11:\"screenshots\";N;s:2:\"id\";s:3:\"436\";s:7:\"updated\";s:19:\"2018-10-26 12:32:42\";s:7:\"created\";s:19:\"2018-10-12 10:42:10\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_25d48b262650ffbed218efbd3a765\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"2702\";s:7:\"updated\";s:19:\"2020-10-13 20:33:47\";s:7:\"created\";s:19:\"2018-10-11 20:43:04\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:6;O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:5:\"title\";s:13:\"WPHR Training\";s:4:\"slug\";s:13:\"wphr-training\";s:12:\"premium_slug\";s:21:\"wphr-training-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";N;s:19:\"is_wp_org_compliant\";b:1;s:22:\"premium_releases_count\";i:5;s:4:\"file\";N;s:7:\"version\";N;s:11:\"auto_update\";N;s:4:\"info\";O:14:\"FS_Plugin_Info\":13:{s:9:\"plugin_id\";s:4:\"3818\";s:11:\"description\";s:303:\"This addon helps you assign training resources such as videos and documents to employees.  You can also check they read/watched the resource (great for compliance) and check their level of understanding with a simple test.  Employees can be asked to retake the test if they don\'t achieve a minimum mark.\";s:17:\"short_description\";N;s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/3818/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/3818/card_banner.png\";s:15:\"selling_point_0\";s:92:\"Add training videos or documents to employee profiles.  Bulk assign by job type or location.\";s:15:\"selling_point_1\";s:54:\"Set simple test to ensure understanding and compliance\";s:15:\"selling_point_2\";s:60:\"Get notified that employees have reviewed training materials\";s:11:\"screenshots\";N;s:2:\"id\";s:3:\"894\";s:7:\"updated\";s:19:\"2019-08-12 12:23:20\";s:7:\"created\";s:19:\"2019-06-25 15:47:19\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_b236370bb41af077964c77ec3341b\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"3818\";s:7:\"updated\";s:19:\"2020-10-15 14:29:47\";s:7:\"created\";s:19:\"2019-05-16 16:18:55\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}}}', 'yes'),
(154, 'fs_gdpr', 'a:1:{s:2:\"u1\";a:1:{s:8:\"required\";b:0;}}', 'yes'),
(155, 'wphr_modules', 'a:2:{s:3:\"hrm\";a:5:{s:5:\"title\";s:13:\"HR Management\";s:4:\"slug\";s:8:\"wphr-hrm\";s:11:\"description\";s:26:\"Human Resource Mnanagement\";s:8:\"callback\";s:35:\"\\WPHR\\HR_MANAGER\\HRM\\Human_Resource\";s:7:\"modules\";a:0:{}}s:16:\"wphr-hr-frontend\";a:5:{s:5:\"title\";s:11:\"HR Frontend\";s:4:\"slug\";s:16:\"wphr-hr-frontend\";s:11:\"description\";s:23:\"Human Resource Frontend\";s:8:\"callback\";s:48:\"\\WPHR\\HR_MANAGER\\WP_HR_FRONTEND\\WPHR_HR_Frontend\";s:7:\"modules\";a:0:{}}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(156, 'fs_api_cache', 'a:1:{s:55:\"get:/v1/plugins/1296/addons.json?enriched=true&count=50\";O:8:\"stdClass\":3:{s:6:\"result\";O:8:\"stdClass\":1:{s:7:\"plugins\";a:7:{i:0;O:8:\"stdClass\":38:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:12:\"developer_id\";s:3:\"240\";s:10:\"install_id\";s:6:\"771820\";s:4:\"slug\";s:16:\"wphr-recruitment\";s:5:\"title\";s:17:\"WP-HR Recruitment\";s:11:\"environment\";i:0;s:4:\"icon\";s:93:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1298/icons/f30f5146c5da1c5030748f8962573420.png\";s:15:\"default_plan_id\";s:4:\"1827\";s:5:\"plans\";i:1827;s:8:\"features\";N;s:17:\"money_back_period\";i:14;s:13:\"refund_policy\";s:8:\"flexible\";s:24:\"annual_renewals_discount\";N;s:22:\"renewals_discount_type\";s:0:\"\";s:11:\"is_released\";b:1;s:15:\"is_sdk_required\";b:1;s:18:\"is_pricing_visible\";b:1;s:19:\"is_wp_org_compliant\";b:0;s:6:\"is_off\";b:0;s:24:\"is_only_for_new_installs\";b:0;s:14:\"installs_limit\";N;s:14:\"installs_count\";i:125;s:21:\"active_installs_count\";i:47;s:19:\"free_releases_count\";i:0;s:22:\"premium_releases_count\";i:12;s:15:\"total_purchases\";i:1;s:19:\"total_subscriptions\";i:31;s:14:\"total_renewals\";i:49;s:8:\"earnings\";d:1351.91;s:10:\"commission\";s:35:\"{\"1000\":0.3,\"5000\":0.2,\"above\":0.1}\";s:17:\"accepted_payments\";i:0;s:7:\"plan_id\";s:1:\"0\";s:4:\"type\";s:6:\"plugin\";s:10:\"public_key\";s:32:\"pk_1a007c505f1d64c18a2f47ba9e953\";s:2:\"id\";s:4:\"1298\";s:7:\"created\";s:19:\"2017-08-17 22:22:59\";s:7:\"updated\";s:19:\"2020-10-14 13:12:22\";s:4:\"info\";O:8:\"stdClass\":13:{s:9:\"plugin_id\";s:4:\"1298\";s:3:\"url\";s:53:\"http://www.wphrmanager.com/plugins/wp-hr-recruitment/\";s:11:\"description\";s:240:\"If you are already using WP-HR Manager and want to smoothly integrate your recruitment process - this is the plugin for you.  \n\nWP-HR Recruitment will enable you to quickly add vacancies and potential recruits into a stream-lined process...\";s:17:\"short_description\";s:116:\"Recruitment made easy: Add vacancies; display on your site; online applications; track interviews; monitor progress.\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1298/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1298/card_banner.png\";s:15:\"selling_point_0\";s:37:\"Manage vacancies within WP-HR Manager\";s:15:\"selling_point_1\";s:45:\"Monitor and report on the recruitment process\";s:15:\"selling_point_2\";s:31:\"Advertise roles on your website\";s:11:\"screenshots\";N;s:2:\"id\";s:2:\"88\";s:7:\"created\";s:19:\"2017-08-17 23:46:45\";s:7:\"updated\";s:19:\"2018-05-05 15:36:43\";}}i:1;O:8:\"stdClass\":38:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:12:\"developer_id\";s:3:\"240\";s:10:\"install_id\";s:6:\"783450\";s:4:\"slug\";s:15:\"wphr-attendance\";s:5:\"title\";s:16:\"WP-HR Attendance\";s:11:\"environment\";i:0;s:4:\"icon\";s:93:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1314/icons/4541054639c4b9e0b5045c03a1653286.png\";s:15:\"default_plan_id\";s:4:\"1857\";s:5:\"plans\";i:1857;s:8:\"features\";s:19:\"1534,1535,1655,1656\";s:17:\"money_back_period\";i:14;s:13:\"refund_policy\";s:8:\"flexible\";s:24:\"annual_renewals_discount\";N;s:22:\"renewals_discount_type\";s:0:\"\";s:11:\"is_released\";b:1;s:15:\"is_sdk_required\";b:1;s:18:\"is_pricing_visible\";b:1;s:19:\"is_wp_org_compliant\";b:0;s:6:\"is_off\";b:0;s:24:\"is_only_for_new_installs\";b:0;s:14:\"installs_limit\";N;s:14:\"installs_count\";i:157;s:21:\"active_installs_count\";i:63;s:19:\"free_releases_count\";i:0;s:22:\"premium_releases_count\";i:11;s:15:\"total_purchases\";i:2;s:19:\"total_subscriptions\";i:40;s:14:\"total_renewals\";i:103;s:8:\"earnings\";d:1915.66;s:10:\"commission\";s:35:\"{\"1000\":0.3,\"5000\":0.2,\"above\":0.1}\";s:17:\"accepted_payments\";i:0;s:7:\"plan_id\";s:1:\"0\";s:4:\"type\";s:6:\"plugin\";s:10:\"public_key\";s:32:\"pk_287705a8d62f3d9852ecdfb47e88d\";s:2:\"id\";s:4:\"1314\";s:7:\"created\";s:19:\"2017-08-22 19:59:27\";s:7:\"updated\";s:19:\"2020-10-13 20:35:14\";s:4:\"info\";O:8:\"stdClass\":13:{s:9:\"plugin_id\";s:4:\"1314\";s:3:\"url\";s:52:\"http://www.wphrmanager.com/plugins/wp-hr-attendance/\";s:11:\"description\";s:253:\"Enable employees to check in and out, accurately recording their working hours.  The system works directly from the employee\'s profile dashboard or you can import data in CSV format from other apps.  Admins can set office hours and add unlimited shifts.\";s:17:\"short_description\";s:38:\"Track and monitor employee attendance.\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1314/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/1314/card_banner.png\";s:15:\"selling_point_0\";s:65:\"Enable employees to check in and out - record their working hours\";s:15:\"selling_point_1\";s:31:\"Specify office hours and shifts\";s:15:\"selling_point_2\";s:50:\"View reports on attendance with WP--HR Manager Pro\";s:11:\"screenshots\";N;s:2:\"id\";s:2:\"89\";s:7:\"created\";s:19:\"2017-08-22 20:51:23\";s:7:\"updated\";s:19:\"2018-12-28 14:31:32\";}}i:2;O:8:\"stdClass\":38:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:12:\"developer_id\";s:3:\"240\";s:10:\"install_id\";s:7:\"1863453\";s:4:\"slug\";s:14:\"wphr-documents\";s:5:\"title\";s:15:\"WP-HR Documents\";s:11:\"environment\";i:0;s:4:\"icon\";s:93:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2446/icons/abfb2f896dd14277634a53dbd0960998.png\";s:15:\"default_plan_id\";s:4:\"3763\";s:5:\"plans\";i:3763;s:8:\"features\";s:19:\"3003,3004,3005,3006\";s:17:\"money_back_period\";i:14;s:13:\"refund_policy\";s:8:\"flexible\";s:24:\"annual_renewals_discount\";N;s:22:\"renewals_discount_type\";s:0:\"\";s:11:\"is_released\";b:1;s:15:\"is_sdk_required\";b:1;s:18:\"is_pricing_visible\";b:1;s:19:\"is_wp_org_compliant\";b:0;s:6:\"is_off\";b:0;s:24:\"is_only_for_new_installs\";b:0;s:14:\"installs_limit\";N;s:14:\"installs_count\";i:128;s:21:\"active_installs_count\";i:66;s:19:\"free_releases_count\";i:0;s:22:\"premium_releases_count\";i:3;s:15:\"total_purchases\";i:3;s:19:\"total_subscriptions\";i:42;s:14:\"total_renewals\";i:96;s:8:\"earnings\";d:1868.16;s:10:\"commission\";s:35:\"{\"1000\":0.3,\"5000\":0.2,\"above\":0.1}\";s:17:\"accepted_payments\";i:0;s:7:\"plan_id\";s:1:\"0\";s:4:\"type\";s:6:\"plugin\";s:10:\"public_key\";s:32:\"pk_4c0d0646a94caa7b6d66d2a515b07\";s:2:\"id\";s:4:\"2446\";s:7:\"created\";s:19:\"2018-08-15 11:28:31\";s:7:\"updated\";s:19:\"2020-10-17 22:34:26\";s:4:\"info\";O:8:\"stdClass\":13:{s:9:\"plugin_id\";s:4:\"2446\";s:3:\"url\";N;s:11:\"description\";s:759:\"If you need to create a library of files and documents for all employees or simply add a document for a single employee this plugin delivers.  You can create a library, add folders to help manage and locate documents of particular types - for example, add you Health and Safety guidelines in one folder, and your Employee Handbook in another.  You can also add documents to individual employee profiles, for example, a copy of their employment contract.  Finally, employees themselves can upload documents directly so if you need a copy of their ID or drivers licence, for example, you could ask them to add them directly to their profile in the new \'Documents\' section created by this plugin.  You can upload most formats - PDF, Word, Excel, image files etc.\";s:17:\"short_description\";s:57:\"Upload and manage HR files and documents in WP-HR Manager\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2446/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2446/card_banner.png\";s:15:\"selling_point_0\";s:42:\"Create a library of HR Documents and Files\";s:15:\"selling_point_1\";s:43:\"Add Folders to Easily Manage your Documents\";s:15:\"selling_point_2\";s:48:\"Upload Documents to Individual Employee Profiles\";s:11:\"screenshots\";N;s:2:\"id\";s:3:\"377\";s:7:\"created\";s:19:\"2018-08-15 14:47:18\";s:7:\"updated\";s:19:\"2018-08-18 12:30:18\";}}i:3;O:8:\"stdClass\":38:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:12:\"developer_id\";s:3:\"240\";s:10:\"install_id\";s:7:\"1873052\";s:4:\"slug\";s:11:\"wphr-fields\";s:5:\"title\";s:16:\"WP-HR Add Fields\";s:11:\"environment\";i:0;s:4:\"icon\";s:93:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2454/icons/6aee6c701162b59add87c80cbb3c10c1.png\";s:15:\"default_plan_id\";s:4:\"3777\";s:5:\"plans\";i:3777;s:8:\"features\";N;s:17:\"money_back_period\";i:14;s:13:\"refund_policy\";s:8:\"flexible\";s:24:\"annual_renewals_discount\";N;s:22:\"renewals_discount_type\";s:0:\"\";s:11:\"is_released\";b:1;s:15:\"is_sdk_required\";b:1;s:18:\"is_pricing_visible\";b:1;s:19:\"is_wp_org_compliant\";b:0;s:6:\"is_off\";b:0;s:24:\"is_only_for_new_installs\";b:0;s:14:\"installs_limit\";N;s:14:\"installs_count\";i:115;s:21:\"active_installs_count\";i:67;s:19:\"free_releases_count\";i:0;s:22:\"premium_releases_count\";i:5;s:15:\"total_purchases\";i:2;s:19:\"total_subscriptions\";i:20;s:14:\"total_renewals\";i:48;s:8:\"earnings\";d:687.57;s:10:\"commission\";s:35:\"{\"1000\":0.3,\"5000\":0.2,\"above\":0.1}\";s:17:\"accepted_payments\";i:0;s:7:\"plan_id\";s:1:\"0\";s:4:\"type\";s:6:\"plugin\";s:10:\"public_key\";s:32:\"pk_9aa3fe478e0a0b4092a8d046330a5\";s:2:\"id\";s:4:\"2454\";s:7:\"created\";s:19:\"2018-08-18 14:07:53\";s:7:\"updated\";s:19:\"2020-10-14 13:17:02\";s:4:\"info\";O:8:\"stdClass\":13:{s:9:\"plugin_id\";s:4:\"2454\";s:3:\"url\";s:52:\"http://www.wphrmanager.com/product/wp-hr-add-fields/\";s:11:\"description\";s:257:\"There are already a lot of useful fields in WP-HR Manager for recording employee information - but you may want more!   Now you can easily add many types of field to the employee\'s profile, enabling you to gather and manage exactly the information you need.\";s:17:\"short_description\";s:31:\"Add fields to Employee Profiles\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2454/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2454/card_banner.png\";s:15:\"selling_point_0\";s:31:\"Add fields to employee profiles\";s:15:\"selling_point_1\";s:53:\"Multiple field types - text, drop down, tick box etc.\";s:15:\"selling_point_2\";s:39:\"Collect additional employee information\";s:11:\"screenshots\";N;s:2:\"id\";s:3:\"379\";s:7:\"created\";s:19:\"2018-08-18 14:39:32\";s:7:\"updated\";s:19:\"2018-08-21 19:28:21\";}}i:4;O:8:\"stdClass\":38:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:12:\"developer_id\";s:3:\"240\";s:10:\"install_id\";s:7:\"1873066\";s:4:\"slug\";s:8:\"wphr-sms\";s:5:\"title\";s:18:\"WP-HR SMS Messages\";s:11:\"environment\";i:0;s:4:\"icon\";s:93:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2455/icons/2ffdd6f41e188491ad718dc2bb65ee7e.png\";s:15:\"default_plan_id\";s:4:\"3778\";s:5:\"plans\";i:3778;s:8:\"features\";i:3953;s:17:\"money_back_period\";i:14;s:13:\"refund_policy\";s:8:\"flexible\";s:24:\"annual_renewals_discount\";N;s:22:\"renewals_discount_type\";s:0:\"\";s:11:\"is_released\";b:1;s:15:\"is_sdk_required\";b:1;s:18:\"is_pricing_visible\";b:1;s:19:\"is_wp_org_compliant\";b:0;s:6:\"is_off\";b:0;s:24:\"is_only_for_new_installs\";b:0;s:14:\"installs_limit\";N;s:14:\"installs_count\";i:9;s:21:\"active_installs_count\";i:7;s:19:\"free_releases_count\";i:0;s:22:\"premium_releases_count\";i:4;s:15:\"total_purchases\";i:0;s:19:\"total_subscriptions\";i:1;s:14:\"total_renewals\";i:0;s:8:\"earnings\";d:6.99;s:10:\"commission\";s:0:\"\";s:17:\"accepted_payments\";i:0;s:7:\"plan_id\";s:1:\"0\";s:4:\"type\";s:6:\"plugin\";s:10:\"public_key\";s:32:\"pk_ad12da38db8bce4fd2c753d932e51\";s:2:\"id\";s:4:\"2455\";s:7:\"created\";s:19:\"2018-08-18 14:14:31\";s:7:\"updated\";s:19:\"2020-07-29 09:29:43\";s:4:\"info\";O:8:\"stdClass\":13:{s:9:\"plugin_id\";s:4:\"2455\";s:3:\"url\";s:54:\"http://www.wphrmanager.com/product/wp-hr-sms-messages/\";s:11:\"description\";s:230:\"It\'s good to keep in touch with employees and SMS messages are now one of the most common means of communicating in the world - so why not integrate an SMS messaging service with WP-HR Manager to help your employee communications?\";s:17:\"short_description\";s:31:\"Keep in touch with SMS messages\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2455/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2455/card_banner.png\";s:15:\"selling_point_0\";s:26:\"SMS message your employees\";s:15:\"selling_point_1\";s:38:\"Integrates with multiple SMS suppliers\";s:15:\"selling_point_2\";N;s:11:\"screenshots\";N;s:2:\"id\";s:3:\"378\";s:7:\"created\";s:19:\"2018-08-18 14:31:46\";s:7:\"updated\";s:19:\"2018-08-18 14:45:53\";}}i:5;O:8:\"stdClass\":38:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:12:\"developer_id\";s:3:\"240\";s:10:\"install_id\";s:7:\"2032042\";s:4:\"slug\";s:12:\"wphr-checkin\";s:5:\"title\";s:21:\"WP-HR Mobile Check In\";s:11:\"environment\";i:0;s:4:\"icon\";s:93:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2702/icons/74419ef999421cb24384dfd5675b751b.png\";s:15:\"default_plan_id\";s:4:\"4216\";s:5:\"plans\";i:4216;s:8:\"features\";s:14:\"3219,3220,3221\";s:17:\"money_back_period\";i:14;s:13:\"refund_policy\";s:8:\"flexible\";s:24:\"annual_renewals_discount\";N;s:22:\"renewals_discount_type\";s:0:\"\";s:11:\"is_released\";b:1;s:15:\"is_sdk_required\";b:1;s:18:\"is_pricing_visible\";b:1;s:19:\"is_wp_org_compliant\";b:0;s:6:\"is_off\";b:0;s:24:\"is_only_for_new_installs\";b:0;s:14:\"installs_limit\";N;s:14:\"installs_count\";i:214;s:21:\"active_installs_count\";i:174;s:19:\"free_releases_count\";i:0;s:22:\"premium_releases_count\";i:6;s:15:\"total_purchases\";i:2;s:19:\"total_subscriptions\";i:16;s:14:\"total_renewals\";i:43;s:8:\"earnings\";d:1378.76;s:10:\"commission\";s:35:\"{\"1000\":0.3,\"5000\":0.2,\"above\":0.1}\";s:17:\"accepted_payments\";i:0;s:7:\"plan_id\";s:1:\"0\";s:4:\"type\";s:6:\"plugin\";s:10:\"public_key\";s:32:\"pk_25d48b262650ffbed218efbd3a765\";s:2:\"id\";s:4:\"2702\";s:7:\"created\";s:19:\"2018-10-11 20:43:04\";s:7:\"updated\";s:19:\"2020-10-13 20:33:47\";s:4:\"info\";O:8:\"stdClass\":13:{s:9:\"plugin_id\";s:4:\"2702\";s:3:\"url\";N;s:11:\"description\";s:419:\"The addon works with WP-HR Manager and WP-HR Attendance to add the functionality to integrate our two (Apple and Android) phone apps.  Perfect for employees who don\'t have regular access to a PC, or who work remotely.  Ask them to check in when the start work and check out when they finish - you\'ll know who is working at any time.  Ideal for tracking lateness, over time, remote workers, time based projects and more.\";s:17:\"short_description\";s:55:\"Enable employees to check in/out on their mobile phones\";s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2702/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/2702/card_banner.png\";s:15:\"selling_point_0\";s:45:\"One tap check in and check out (clock in/out)\";s:15:\"selling_point_1\";s:31:\"Andoid and Apple Apps available\";s:15:\"selling_point_2\";s:41:\"Perfect for tracking lateness and absence\";s:11:\"screenshots\";N;s:2:\"id\";s:3:\"436\";s:7:\"created\";s:19:\"2018-10-12 10:42:10\";s:7:\"updated\";s:19:\"2018-10-26 12:32:42\";}}i:6;O:8:\"stdClass\":39:{s:16:\"parent_plugin_id\";s:4:\"1296\";s:12:\"developer_id\";s:3:\"240\";s:10:\"install_id\";s:7:\"2656575\";s:4:\"slug\";s:13:\"wphr-training\";s:5:\"title\";s:13:\"WPHR Training\";s:11:\"environment\";i:0;s:4:\"icon\";s:93:\"//s3-us-west-2.amazonaws.com/freemius/plugins/3818/icons/815b260ec5f076e2c71401c05ad79ad2.png\";s:15:\"default_plan_id\";s:4:\"6457\";s:5:\"plans\";i:6457;s:8:\"features\";s:29:\"4895,5166,4896,4897,4898,6866\";s:17:\"money_back_period\";i:14;s:13:\"refund_policy\";s:8:\"flexible\";s:24:\"annual_renewals_discount\";N;s:22:\"renewals_discount_type\";s:0:\"\";s:11:\"is_released\";b:1;s:15:\"is_sdk_required\";b:1;s:18:\"is_pricing_visible\";b:1;s:19:\"is_wp_org_compliant\";b:1;s:6:\"is_off\";b:0;s:24:\"is_only_for_new_installs\";b:0;s:14:\"installs_limit\";N;s:14:\"installs_count\";i:26;s:21:\"active_installs_count\";i:15;s:19:\"free_releases_count\";i:0;s:22:\"premium_releases_count\";i:5;s:15:\"total_purchases\";i:3;s:19:\"total_subscriptions\";i:14;s:14:\"total_renewals\";i:28;s:8:\"earnings\";d:895.72;s:10:\"commission\";s:0:\"\";s:17:\"accepted_payments\";i:0;s:7:\"plan_id\";s:1:\"0\";s:4:\"type\";s:6:\"plugin\";s:10:\"public_key\";s:32:\"pk_b236370bb41af077964c77ec3341b\";s:2:\"id\";s:4:\"3818\";s:7:\"created\";s:19:\"2019-05-16 16:18:55\";s:7:\"updated\";s:19:\"2020-10-15 14:29:47\";s:4:\"info\";O:8:\"stdClass\":13:{s:9:\"plugin_id\";s:4:\"3818\";s:3:\"url\";s:50:\"http://www.wphrmanager.com/product/wp-hr-training/\";s:11:\"description\";s:303:\"This addon helps you assign training resources such as videos and documents to employees.  You can also check they read/watched the resource (great for compliance) and check their level of understanding with a simple test.  Employees can be asked to retake the test if they don\'t achieve a minimum mark.\";s:17:\"short_description\";N;s:10:\"banner_url\";s:61:\"//s3-us-west-2.amazonaws.com/freemius/plugins/3818/banner.png\";s:15:\"card_banner_url\";s:66:\"//s3-us-west-2.amazonaws.com/freemius/plugins/3818/card_banner.png\";s:15:\"selling_point_0\";s:92:\"Add training videos or documents to employee profiles.  Bulk assign by job type or location.\";s:15:\"selling_point_1\";s:54:\"Set simple test to ensure understanding and compliance\";s:15:\"selling_point_2\";s:60:\"Get notified that employees have reviewed training materials\";s:11:\"screenshots\";N;s:2:\"id\";s:3:\"894\";s:7:\"created\";s:19:\"2019-06-25 15:47:19\";s:7:\"updated\";s:19:\"2019-08-12 12:23:20\";}s:12:\"premium_slug\";s:21:\"wphr-training-premium\";}}}s:7:\"created\";i:1603087914;s:9:\"timestamp\";i:1603174314;}}', 'no'),
(159, 'wphr_settings_wphr-crm_subscription', 'a:8:{s:10:\"is_enabled\";s:3:\"yes\";s:13:\"email_subject\";s:55:\"Confirm your subscription to Employee Management System\";s:13:\"email_content\";s:289:\"Hello!\n\nThanks so much for signing up for our newsletter.\nWe need you to activate your subscription to the list(s): [contact_groups_to_confirm] by clicking the link below: \n\n[activation_link]Click here to confirm your subscription.[/activation_link]\n\nThank you,\n\nEmployee Management System\";s:7:\"page_id\";i:5;s:18:\"confirm_page_title\";s:23:\"You are now subscribed!\";s:20:\"confirm_page_content\";s:63:\"We\'ve added you to our email list. You\'ll hear from us shortly.\";s:17:\"unsubs_page_title\";s:24:\"You are now unsubscribed\";s:19:\"unsubs_page_content\";s:47:\"You are successfully unsubscribed from list(s):\";}', 'yes'),
(160, 'wphr_email_settings_employee-welcome', 'a:3:{s:7:\"subject\";s:37:\"Welcome {full_name} to {company_name}\";s:7:\"heading\";s:29:\"Welcome Onboard {first_name}!\";s:4:\"body\";s:1029:\"Dear {full_name},\r\n\r\nWelcome aboard as a <strong>{job_title}</strong> in our <strong>{dept_title}</strong> team at <strong>{company_name}</strong>! I am pleased to have you working with us. You were selected for employment due to the attributes that you displayed that appear to match the qualities I look for in an employee.\r\n\r\nI’m looking forward to seeing you grow and develop into an outstanding employee that exhibits a high level of care, concern, and compassion for others. I hope that you will find your work to be rewarding, challenging, and meaningful.\r\n\r\nYour <strong>{type}</strong> employment will start from <strong>{joined_date}</strong> and you will be reporting to <strong>{reporting_to}</strong>.\r\n\r\nPlease take your time and review our yearly goals so that you can know what is expected and make a positive contribution. Again, I look forward to seeing you grow as a professional while enhancing the lives of the clients entrusted in your care.\r\n\r\nSincerely,\r\nManager Name\r\nCEO, Company Name\r\n\r\n{login_info}\";}', 'yes'),
(161, 'wphr_email_settings_new-leave-request', 'a:3:{s:7:\"subject\";s:47:\"New leave request received from {employee_name}\";s:7:\"heading\";s:17:\"New Leave Request\";s:4:\"body\";s:333:\"Hello,\r\n\r\nA new leave request has been received from {employee_url}.\r\n\r\n<strong>Leave type:</strong> {leave_type}\r\n<strong>Date:</strong> {date_from} to {date_to}\r\n<strong>Duration:</strong> {no_days}\r\n<strong>Reason:</strong> {reason}\r\n\r\nPlease approve/reject this leave application by going following:\r\n\r\n{requests_url}\r\n\r\nThanks.\";}', 'yes'),
(162, 'wphr_email_settings_approved-leave-request', 'a:3:{s:7:\"subject\";s:36:\"Your leave request has been approved\";s:7:\"heading\";s:22:\"Leave Request Approved\";s:4:\"body\";s:193:\"Hello {employee_name},\r\n\r\nYour <strong>{leave_type}</strong> type leave request for <strong>{no_days}</strong> from {date_from} to {date_to} has been approved.\r\n\r\nRegards\r\nManager Name\r\nCompany\";}', 'yes'),
(163, 'wphr_email_settings_rejected-leave-request', 'a:3:{s:7:\"subject\";s:36:\"Your leave request has been rejected\";s:7:\"heading\";s:22:\"Leave Request Rejected\";s:4:\"body\";s:240:\"Hello {employee_name},\r\n\r\nYour <strong>{leave_type}</strong> type leave request for <strong>{no_days}</strong> from {date_from} to {date_to} has been rejected.\r\n\r\nThe reason of rejection is: {reject_reason}\r\n\r\nRegards\r\nManager Name\r\nCompany\";}', 'yes'),
(164, 'wphr_email_settings_new-task-assigned', 'a:3:{s:7:\"subject\";s:33:\"New task has been assigned to you\";s:7:\"heading\";s:17:\"New Task Assigned\";s:4:\"body\";s:164:\"Hello {employee_name},\r\n\r\nA new task <strong>{task_title}</strong> has been assigned to you by {created_by}.\r\nDue Date: {due_date}\r\n\r\nRegards\r\nManager Name\r\nCompany\";}', 'yes'),
(167, 'wp_wphr_version', '0.1', 'yes'),
(168, 'wp_wphr_db_version', '0.1', 'yes'),
(170, 'wphr_settings_hr-frontend-page', 'a:4:{s:8:\"emp_list\";i:6;s:11:\"emp_profile\";i:7;s:11:\"hr_dshboard\";i:8;s:10:\"my_profile\";s:1:\"9\";}', 'yes'),
(171, 'wphr_setup_wizard_ran', '1', 'yes'),
(173, 'wphr_settings_general', 'a:8:{s:13:\"gen_com_start\";s:10:\"18-10-2020\";s:19:\"gen_financial_month\";s:1:\"1\";s:11:\"date_format\";s:5:\"m-d-Y\";s:21:\"employee_leave_public\";s:1:\"1\";s:30:\"employee_assigned_leave_policy\";s:1:\"1\";s:24:\"line_manager_show_leaves\";s:1:\"1\";s:13:\"wphr_currency\";s:3:\"BDT\";s:15:\"wphr_debug_mode\";s:1:\"0\";}', 'yes'),
(174, 'wphr_settings_wphr-email_general', 'a:4:{s:9:\"from_name\";s:26:\"Employee Management System\";s:10:\"from_email\";s:19:\"arifh3261@gmail.com\";s:12:\"header_image\";s:0:\"\";s:11:\"footer_text\";s:53:\"Employee Management System  - Powered by WPHR Manager\";}', 'yes'),
(175, 'wphr_settings_widget', 'a:6:{s:11:\"birthday_id\";s:3:\"yes\";s:7:\"work_id\";s:3:\"yes\";s:9:\"office_id\";s:3:\"yes\";s:12:\"ebirthday_id\";s:3:\"yes\";s:8:\"ework_id\";s:3:\"yes\";s:8:\"inout_id\";s:3:\"yes\";}', 'yes'),
(177, 'mon', '8', 'yes'),
(178, 'tue', '8', 'yes'),
(179, 'wed', '8', 'yes'),
(180, 'thu', '8', 'yes'),
(181, 'fri', '8', 'yes'),
(182, 'sat', '8', 'yes'),
(183, 'sun', '0', 'yes'),
(186, '_wphr_company', 'a:8:{s:4:\"logo\";i:10;s:4:\"name\";s:16:\"Untitled Company\";s:7:\"address\";a:6:{s:9:\"address_1\";s:18:\"Banani, Dhaka-1213\";s:9:\"address_2\";s:0:\"\";s:4:\"city\";s:5:\"Dhaka\";s:5:\"state\";s:3:\"DHA\";s:3:\"zip\";s:0:\"\";s:7:\"country\";s:2:\"BD\";}s:5:\"phone\";s:0:\"\";s:3:\"fax\";s:0:\"\";s:6:\"mobile\";s:0:\"\";s:7:\"website\";s:0:\"\";s:8:\"currency\";s:3:\"USD\";}', 'yes'),
(194, 'recovery_mode_email_last_sent', '1603087940', 'yes'),
(357, '_site_transient_timeout_theme_roots', '1603089712', 'no'),
(358, '_site_transient_theme_roots', 'a:4:{s:5:\"astra\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}', 'no'),
(359, '_transient_health-check-site-status-result', '{\"good\":\"11\",\"recommended\":\"9\",\"critical\":\"0\"}', 'yes'),
(361, '_site_transient_timeout_community-events-d41d8cd98f00b204e9800998ecf8427e', '1603131133', 'no'),
(362, '_site_transient_community-events-d41d8cd98f00b204e9800998ecf8427e', 'a:4:{s:9:\"sandboxed\";b:0;s:5:\"error\";N;s:8:\"location\";a:1:{s:2:\"ip\";b:0;}s:6:\"events\";a:1:{i:0;a:10:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:75:\"Discussion Group: Writing a pitch for being accepted to speak at a WP event\";s:3:\"url\";s:68:\"https://www.meetup.com/learn-wordpress-discussions/events/273798352/\";s:6:\"meetup\";s:27:\"Learn WordPress Discussions\";s:10:\"meetup_url\";s:51:\"https://www.meetup.com/learn-wordpress-discussions/\";s:4:\"date\";s:19:\"2020-10-19 07:00:00\";s:8:\"end_date\";s:19:\"2020-10-19 08:00:00\";s:20:\"start_unix_timestamp\";i:1603116000;s:18:\"end_unix_timestamp\";i:1603119600;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"US\";s:8:\"latitude\";d:37.779998779297;s:9:\"longitude\";d:-122.41999816895;}}}}', 'no'),
(363, '_transient_timeout_feed_9bbd59226dc36b9b26cd43f15694c5c3', '1603131136', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(364, '_transient_feed_9bbd59226dc36b9b26cd43f15694c5c3', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:49:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"News –  – WordPress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:26:\"https://wordpress.org/news\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"WordPress News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Oct 2020 09:34:04 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"en-US\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://wordpress.org/?v=5.6-alpha-49172\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:57:\"\n		\n		\n		\n		\n		\n				\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:38:\"The Month in WordPress: September 2020\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"https://wordpress.org/news/2020/10/the-month-in-wordpress-september-2020/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Oct 2020 09:34:04 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Month in WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=9026\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:363:\"This month was characterized by some exciting announcements from the WordPress core team! Read on to catch up with all the WordPress news and updates from September.&#160; WordPress 5.5.1 Launch On September 1, the&#160; Core team released WordPress 5.5.1. This maintenance release included several bug fixes for both core and the editor, and many other [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Hari Shanker R\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:8713:\"\n<p>This month was characterized by some exciting announcements from the WordPress core team! Read on to catch up with all the WordPress news and updates from September.&nbsp;</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>WordPress 5.5.1 Launch</h2>\n\n\n\n<p>On September 1, the&nbsp; Core team released <a href=\"https://wordpress.org/news/2020/09/wordpress-5-5-1-maintenance-release/\">WordPress 5.5.1</a>. This maintenance release included several bug fixes for both core and the editor, and many other enhancements. You can update to the latest version directly from your WordPress dashboard or <a href=\"https://wordpress.org/download/\">download</a> it directly from WordPress.org. The next major release will be <a href=\"https://make.wordpress.org/core/5-6/\">version 5.6</a>.</p>\n\n\n\n<p>Want to be involved in the next release?&nbsp; You can help to build WordPress Core by following<a href=\"https://make.wordpress.org/core/\"> the Core team blog</a>, and joining the #core channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Gutenberg 9.1, 9.0, and 8.9 are out</h2>\n\n\n\n<p>The core team launched <a href=\"https://make.wordpress.org/core/2020/09/16/whats-new-in-gutenberg-16-september/\">version 9.0</a> of the Gutenberg plugin on September 16, and <a href=\"https://make.wordpress.org/core/2020/10/01/whats-new-in-gutenberg-30-september/\">version 9.1</a> on September 30. <a href=\"https://make.wordpress.org/core/2020/09/16/whats-new-in-gutenberg-16-september/\">Version 9.0</a> features some useful enhancements — like a new look for the navigation screen (with drag and drop support in the list view) and modifications to the query block (including search, filtering by author, and support for tags). <a href=\"https://make.wordpress.org/core/2020/10/01/whats-new-in-gutenberg-30-september/\">Version 9.1</a> adds improvements to global styles, along with improvements for the UI and several blocks. <a href=\"https://make.wordpress.org/core/2020/09/03/whats-new-in-gutenberg-2-september/\">Version 8.9</a> of Gutenberg, which came out earlier in September, enables the block-based widgets feature (also known as block areas, and was previously available in the experiments section) by default — replacing the default WordPress widgets to the plugin. You can find out more about the Gutenberg roadmap in the <a href=\"https://make.wordpress.org/core/2020/09/03/whats-next-in-gutenberg-september/\">What’s next in Gutenberg blog post</a>.</p>\n\n\n\n<p>Want to get involved in building Gutenberg? Follow <a href=\"https://make.wordpress.org/core/\">the Core team blog</a>, contribute to <a href=\"https://github.com/WordPress/gutenberg/\">Gutenberg on GitHub</a>, and join the #core-editor channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Twenty Twenty One is the WordPress 5.6 default theme</h2>\n\n\n\n<p><a href=\"https://make.wordpress.org/core/2020/09/23/introducing-twenty-twenty-one/\">Twenty Twenty One</a>, the brand new default theme for <a href=\"https://make.wordpress.org/core/5-6/\">WordPress 5.6</a>, has been announced! Twenty Twenty One is designed to be a blank canvas for the block editor, and will adopt a straightforward, yet refined, design. The theme has a limited color palette: a pastel green background color, two shades of dark grey for text, and a native set of system fonts. Twenty Twenty One will use a modified version of the <a href=\"https://wordpress.org/themes/seedlet/\">Seedlet theme</a> as its base. It will have a comprehensive system of nested CSS variables to make child theming easier, a native support for global styles, and full site editing.&nbsp;</p>\n\n\n\n<p>Follow the <a href=\"https://make.wordpress.org/core/\">Make/Core</a> blog if you wish to contribute to Twenty Twenty One. There will be weekly meetings every Monday at 15:00 UTC and triage sessions every Friday at 15:00 UTC in the #core-themes Slack channel. Theme development will happen <a href=\"https://github.com/wordpress/twentytwentyone.\">on GitHub</a>. </p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Reading:</h2>\n\n\n\n<ul><li>WordPress plugin authors can now <a href=\"https://meta.trac.wordpress.org/changeset/10255\">opt into confirming plugin updates via email</a>. This feature will allow plugin authors to approve any plugin updates over email before release.</li><li>September was the busiest month for online WordCamps so far, with seven events taking place: <a href=\"https://ogijima.wordcamp.org/2020/\">WordCamp Ogijima Online</a>, <a href=\"https://colombia.wordcamp.org/2020/\">WordCamp Colombia Online</a>, <a href=\"https://2020.asheville.wordcamp.org/2020/\">WordCamp Asheville, NC USA</a>, <a href=\"https://saopaulo.wordcamp.org/2020/\">WordCamp São Paulo, Brazil</a>, <a href=\"https://2020.virginiabeach.wordcamp.org/\">WordCamp Virginia Beach</a>, <a href=\"https://2020.lima.wordcamp.org/\">WordCamp Lima Peru</a>, and <a href=\"https://philadelphia.wordcamp.org/2020/\">WordCamp Philadelphia, PA, USA</a>. You can find live stream recaps of these events on their websites. The camps are also in the process of uploading their videos to <a href=\"https://wordpress.tv/\">WordPress.tv</a>. Check out the <a href=\"https://central.wordcamp.org/schedule/\">WordCamp Schedule</a> to follow upcoming online WordCamps!</li><li>The Themes team has added a <a href=\"https://meta.trac.wordpress.org/changeset/10240\">delist feature</a> to the themes directory. The feature will allow a theme to be temporarily hidden from search, while still making it available. The team may delist themes if they violate the <a href=\"https://make.wordpress.org/themes/handbook/review/required/\">Theme Directory guidelines</a>. </li><li>The Themes Team has also released its <a href=\"https://make.wordpress.org/themes/2020/09/25/new-package-to-allow-locally-hosting-webfonts/\">new web fonts Loader project</a>. The webfonts loader will allow theme developers to load web fonts from the user’s site, rather than through a third-party CDN. The project lives in the team’s <a href=\"https://github.com/WPTT/webfont-loader\">GitHub repository</a>.</li><li>The Support team is discussing<a href=\"https://make.wordpress.org/support/2020/09/talking-point-allowing-self-archival-of-topics/\"> the level of control users should have</a> over their support forum topics. The team is thinking of allowing users to archive their topics and lengthen time-to-edit to remove any semi-sensitive data. In a separate, but related, post, Support team members have started discussing <a href=\"https://make.wordpress.org/support/2020/09/talking-point-handling-support-for-commercial-users-on-the-wordpress-forums/\">how to curb support requests for commercial products</a>.</li><li>The Mobile team <a href=\"https://make.wordpress.org/core/2020/09/21/proposal-dual-licensing-gutenberg-under-gpl-v2-0-and-mpl-v2-0/\">came up with a proposal for dual licensing Gutenberg</a> under GPL 2.0 and MPL (Mozilla Public License) 2.0, so that non-WordPress software developers can potentially use it for their projects.  </li><li>Since Facebook and Instagram are deprecating oEmbeds, the Core Team <a href=\"https://make.wordpress.org/core/2020/09/22/facebook-and-instagram-embeds-to-be-deprecated-october-24th/\">will be removing Facebook and Instagram’s oEmbed endpoints</a> from WordPress core code. </li><li>Following extensive discussion, the Documentation team <a href=\"https://make.wordpress.org/docs/2020/09/14/external-linking-policy-meeting-notes-august-25th/\">has tentatively decided to allow external and commercial links in the WordPress documentation</a>. The team aims to publish a formal proposal that will be left open for feedback before finalizing it.</li><li>Members of the Polyglots and Marketing teams are celebrating the <a href=\"https://make.wordpress.org/polyglots/2020/09/09/lets-celebrate-international-translation-day-together/\">International Translation Day</a> for WordPress over the week of September 28 &#8211; October 4! Community members can join or organize translation events, or contribute to WordPress core, theme, or plugin translations during this period. </li><li><a href=\"https://wpaccessibilityday.org/\">WP Accessibility day</a> — a 24-hour global online event dedicated to addressing website accessibility in WordPress, is being held on October 2. The event is open for all and has <a href=\"https://wpaccessibilityday.org/#talk-time\">experts from all over the world as speakers</a>.</li></ul>\n\n\n\n<p><em>Have a story that we should include in the next “Month in WordPress” post? Please </em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><em>submit it here</em></a><em>.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"9026\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:57:\"\n		\n		\n		\n		\n		\n				\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"WordPress 5.5.1 Maintenance Release\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"https://wordpress.org/news/2020/09/wordpress-5-5-1-maintenance-release/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 01 Sep 2020 19:13:53 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8979\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:460:\"WordPress 5.5.1 is now available! This maintenance release features&#160;34 bug fixes, 5 enhancements, and&#160;5 bug fixes&#160;for the&#160;block&#160;editor. These bugs affect WordPress version 5.5, so you’ll want to upgrade. You can download WordPress 5.5.1 directly, or visit the&#160;Dashboard → Updates screen&#160;and click&#160;Update Now. If your sites support automatic background updates, they’ve already started the update process. [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"Jb Audras\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:9020:\"\n<p>WordPress 5.5.1 is now available!</p>\n\n\n\n<p>This maintenance release features&nbsp;<a rel=\"noreferrer noopener\" href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=5.5.1&amp;group=status&amp;col=id&amp;col=summary&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=status&amp;col=priority&amp;order=priority\" target=\"_blank\">34 bug fixes, 5 enhancements</a>, and&nbsp;<a rel=\"noreferrer noopener\" href=\"https://github.com/WordPress/gutenberg/pull/24828\" target=\"_blank\">5 bug fixes</a>&nbsp;for the&nbsp;block&nbsp;editor. These bugs affect WordPress version 5.5, so you’ll want to upgrade.</p>\n\n\n\n<p>You can <a href=\"https://wordpress.org/wordpress-5.5.1.zip\">download WordPress 5.5.1 directly</a>, or visit the<strong>&nbsp;Dashboard → Updates</strong> screen&nbsp;and click&nbsp;<strong>Update Now</strong>. If your sites support automatic background updates, they’ve already started the update process.</p>\n\n\n\n<p>WordPress 5.5.1 is a short-cycle maintenance release. The next major release will be <a href=\"https://make.wordpress.org/core/5-6/\">version 5.6</a>.</p>\n\n\n\n<p>To see a full list of changes, you can browse the&nbsp;<a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=5.5.1&amp;group=component&amp;col=id&amp;col=summary&amp;col=owner&amp;col=type&amp;col=priority&amp;col=component&amp;col=version&amp;order=priority\">list on Trac</a>, read the <a href=\"https://make.wordpress.org/core/2020/08/27/wordpress-5-5-1-rc1/\">5.5.1 RC1</a> and <a href=\"https://make.wordpress.org/core/2020/08/31/wordpress-5-5-1-rc2/\">5.5.1 RC2</a> posts, or visit the <a href=\"https://wordpress.org/support/wordpress-version/version-5-5-1/\">5.5.1 documentation page</a>.</p>\n\n\n\n<h2>Thanks and props!</h2>\n\n\n\n<p>The 5.5.1 release was led by <a href=\'https://profiles.wordpress.org/audrasjb/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>audrasjb</a>, <a href=\'https://profiles.wordpress.org/azhiyadev/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>azhiyadev</a>, <a href=\'https://profiles.wordpress.org/davidbaumwald/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>davidbaumwald</a>, <a href=\'https://profiles.wordpress.org/desrosj/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>desrosj</a>, <a href=\'https://profiles.wordpress.org/johnbillion/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>johnbillion</a>, <a href=\'https://profiles.wordpress.org/planningwrite/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>planningwrite</a>, <a href=\'https://profiles.wordpress.org/sergeybiryukov/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>sergeybiryukov</a> and <a href=\'https://profiles.wordpress.org/whyisjake/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>whyisjake</a>.</p>\n\n\n\n<p>Thank you to everyone who helped make WordPress 5.5.1 happen:</p>\n\n\n\n<a href=\"https://profiles.wordpress.org/wpamitkumar/\">Amit Dudhat</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/rarst/\">Andrey &#8220;Rarst&#8221; Savchenko</a>, <a href=\"https://profiles.wordpress.org/afragen/\">Andy Fragen</a>, <a href=\"https://profiles.wordpress.org/akissz/\">Angel Hess</a>, <a href=\"https://profiles.wordpress.org/avixansa/\">avixansa</a>, <a href=\"https://profiles.wordpress.org/bobbingwide/\">bobbingwide</a>, <a href=\"https://profiles.wordpress.org/brianhogg/\">Brian Hogg</a>, <a href=\"https://profiles.wordpress.org/chunkysteveo/\">chunkysteveo</a>, <a href=\"https://profiles.wordpress.org/claytoncollie/\">Clayton Collie</a>, <a href=\"https://profiles.wordpress.org/davidbaumwald/\">David Baumwald</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/dd32/\">dd32</a>, <a href=\"https://profiles.wordpress.org/demetris/\">demetris</a>, <a href=\"https://profiles.wordpress.org/ocean90/\">Dominik Schilling</a>, <a href=\"https://profiles.wordpress.org/dushakov/\">dushakov</a>, <a href=\"https://profiles.wordpress.org/elrae/\">Earle Davies</a>, <a href=\"https://profiles.wordpress.org/nrqsnchz/\">Enrique Sánchez</a>, <a href=\"https://profiles.wordpress.org/fjarrett/\">Frankie Jarrett</a>, <a href=\"https://profiles.wordpress.org/fullofcaffeine/\">fullofcaffeine</a>, <a href=\"https://profiles.wordpress.org/garrett-eclipse/\">Garrett Hyder</a>, <a href=\"https://profiles.wordpress.org/garyj/\">Gary Jones</a>, <a href=\"https://profiles.wordpress.org/gchtr/\">gchtr</a>, <a href=\"https://profiles.wordpress.org/azhiyadev/\">Hauwa</a>, <a href=\"https://profiles.wordpress.org/herregroen/\">Herre Groen</a>, <a href=\"https://profiles.wordpress.org/howdy_mcgee/\">Howdy_McGee</a>, <a href=\"https://profiles.wordpress.org/ipstenu/\">Ipstenu (Mika Epstein)</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\">Jb Audras</a>, <a href=\"https://profiles.wordpress.org/jeremyfelt/\">Jeremy Felt</a>, <a href=\"https://profiles.wordpress.org/jeroenrotty/\">Jeroen Rotty</a>, <a href=\"https://profiles.wordpress.org/joen/\">Joen A.</a>, <a href=\"https://profiles.wordpress.org/johannadevos/\">Johanna de Vos</a>, <a href=\"https://profiles.wordpress.org/johnbillion/\">John Blackbourn</a>, <a href=\"https://profiles.wordpress.org/johnjamesjacoby/\">John James Jacoby</a>, <a href=\"https://profiles.wordpress.org/psykro/\">Jonathan Bossenger</a>, <a href=\"https://profiles.wordpress.org/desrosj/\">Jonathan Desrosiers</a>, <a href=\"https://profiles.wordpress.org/jonathanstegall/\">Jonathan Stegall</a>, <a href=\"https://profiles.wordpress.org/joostdevalk/\">Joost de Valk</a>, <a href=\"https://profiles.wordpress.org/jorgefilipecosta/\">Jorge Costa</a>, <a href=\"https://profiles.wordpress.org/justinahinon/\">Justin Ahinon</a>, <a href=\"https://profiles.wordpress.org/akabarikalpesh/\">Kalpesh Akabari</a>, <a href=\"https://profiles.wordpress.org/khag7/\">Kevin Hagerty</a>, <a href=\"https://profiles.wordpress.org/knutsp/\">Knut Sparhell</a>, <a href=\"https://profiles.wordpress.org/kbjohnson90/\">Kyle B. Johnson</a>, <a href=\"https://profiles.wordpress.org/landau/\">landau</a>, <a href=\"https://profiles.wordpress.org/laxman-prajapati/\">Laxman Prajapati</a>, <a href=\"https://profiles.wordpress.org/gamerz/\">Lester Chan</a>, <a href=\"https://profiles.wordpress.org/mailnew2ster/\">mailnew2ster</a>, <a href=\"https://profiles.wordpress.org/clorith/\">Marius L. J.</a>, <a href=\"https://profiles.wordpress.org/markjaquith/\">Mark Jaquith</a>, <a href=\"https://profiles.wordpress.org/mapk/\">Mark Uraine</a>, <a href=\"https://profiles.wordpress.org/gothickgothickorguk/\">Matt Gibson</a>, <a href=\"https://profiles.wordpress.org/tw2113/\">Michael Beckwith</a>, <a href=\"https://profiles.wordpress.org/mikeyarce/\">Mikey Arce</a>, <a href=\"https://profiles.wordpress.org/batmoo/\">Mohammad Jangda</a>, <a href=\"https://profiles.wordpress.org/mukesh27/\">Mukesh Panchal</a>, <a href=\"https://profiles.wordpress.org/nabilmoqbel/\">Nabil Moqbel</a>, <a href=\"https://profiles.wordpress.org/krstarica/\">net</a>, <a href=\"https://profiles.wordpress.org/oakesjosh/\">oakesjosh</a>, <a href=\"https://profiles.wordpress.org/nosolosw/\">O André</a>, <a href=\"https://profiles.wordpress.org/omarreiss/\">Omar Reiss</a>, <a href=\"https://profiles.wordpress.org/ov3rfly/\">Ov3rfly</a>, <a href=\"https://profiles.wordpress.org/paddy/\">Paddy</a>, <a href=\"https://profiles.wordpress.org/casiepa/\">Pascal Casier</a>, <a href=\"https://profiles.wordpress.org/pbiron/\">Paul Biron</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rajeshsingh520/\">rajeshsingh520</a>, <a href=\"https://profiles.wordpress.org/ramiy/\">Rami Yushuvaev</a>, <a href=\"https://profiles.wordpress.org/rebasaurus/\">rebasaurus</a>, <a href=\"https://profiles.wordpress.org/riaanlom/\">riaanlom</a>, <a href=\"https://profiles.wordpress.org/youknowriad/\">Riad Benguella</a>, <a href=\"https://profiles.wordpress.org/kreppar/\">Rodrigo Arias</a>, <a href=\"https://profiles.wordpress.org/rtagliento/\">rtagliento</a>, <a href=\"https://profiles.wordpress.org/salvoaranzulla/\">salvoaranzulla</a>, <a href=\"https://profiles.wordpress.org/sanzeeb3/\">Sanjeev Aryal</a>, <a href=\"https://profiles.wordpress.org/sarahricker/\">sarahricker</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/sabernhardt/\">Stephen Bernhardt</a>, <a href=\"https://profiles.wordpress.org/sterndata/\">Steven Stern (sterndata)</a>, <a href=\"https://profiles.wordpress.org/webzunft/\">Thomas M</a>, <a href=\"https://profiles.wordpress.org/timothyblynjacobs/\">Timothy Jacobs</a>, <a href=\"https://profiles.wordpress.org/tobiasbg/\">TobiasBg</a>, <a href=\"https://profiles.wordpress.org/tobifjellner/\">tobifjellner (Tor-Bjorn Fjellner)</a>, <a href=\"https://profiles.wordpress.org/twentyzerotwo/\">TwentyZeroTwo</a>, <a href=\"https://profiles.wordpress.org/planningwrite/\">Winstina</a>, <a href=\"https://profiles.wordpress.org/wittich/\">wittich</a>, and <a href=\"https://profiles.wordpress.org/yoavf/\">Yoav Farhi</a>.\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8979\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:57:\"\n		\n		\n		\n		\n		\n				\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"The Month in WordPress: August 2020\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"https://wordpress.org/news/2020/09/the-month-in-wordpress-august-2020/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 01 Sep 2020 09:32:47 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Month in WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8983\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:362:\"August was special for WordPress lovers, as one of the most anticipated releases, WordPress 5.5, was launched. The month also saw several updates from various contributor teams, including the soft-launch of the Learn WordPress project and updates to Gutenberg. Read on to find out about the latest updates from the WordPress world. WordPress 5.5 Launch [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Hari Shanker R\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:9605:\"\n<p>August was special for WordPress lovers, as one of the most anticipated releases, WordPress 5.5, was launched. The month also saw several updates from various contributor teams, including the soft-launch of the Learn WordPress project and updates to Gutenberg. Read on to find out about the latest updates from the WordPress world.</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>WordPress 5.5 Launch</h2>\n\n\n\n<p>The team launched <a href=\"https://wordpress.org/news/2020/08/eckstine/\">WordPress 5.5</a> on August 11. The major release comes with a host of features like automatic updates for plugins and themes, enabling updates over uploaded ZIP files, a block directory, XML sitemaps, block patterns, inline image editing, and lazy-loading images, to name a few. WordPress 5.5 is now available in 50 languages too! You can update to the latest version directly from your WordPress dashboard or <a href=\"https://wordpress.org/download/\">download</a> it directly from WordPress.org. Subsequent to the 5.5 release, the <a href=\"https://make.wordpress.org/core/2020/08/27/wordpress-5-5-1-rc1/\">5.5.1 release candidate</a> came out on August 28, which will be followed by its official launch of the minor release on September 1.</p>\n\n\n\n<p>A record 805 people contributed to WordPress 5.5, hailing from 58 different countries. <a href=\'https://profiles.wordpress.org/audrasjb/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>audrasjb</a> has <a href=\"https://jeanbaptisteaudras.com/en/2020/08/wordpress-5-5-core-stats-contributions-by-country-company/\">compiled many more stats like that</a> and they’re well worth a read!</p>\n\n\n\n<p>Want to get involved in building WordPress Core? Follow<a href=\"https://make.wordpress.org/core/\"> the Core team blog</a>, and join the #core channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Gutenberg 8.7 and 8.8</h2>\n\n\n\n<p>The core team launched Gutenberg <a href=\"https://make.wordpress.org/core/2020/08/05/whats-new-in-gutenberg-august-5/\">8.7</a> and <a href=\"https://make.wordpress.org/core/2020/08/19/whats-new-in-gutenberg-august-19/\">8.8</a>. Version 8.7 saw many improvements to the Post Block suite, along with other changes like adding a block example to the Buttons block, consistently autosaving edits, and updating the group block description. Version 8.8 offers updates to Global Styles, the Post Block suite, and Template management. The release significantly improves the back-compatibility of the new Widget Screen, and also includes other important accessibility and mobile improvements to user interfaces like the Toolbar, navigation menus, and Popovers. For full details on the latest versions of these Gutenberg releases, visit these posts about <a href=\"https://make.wordpress.org/core/2020/08/05/whats-new-in-gutenberg-august-5/\">8.7</a> and <a href=\"https://make.wordpress.org/core/2020/08/19/whats-new-in-gutenberg-august-19/\">8.8</a>.</p>\n\n\n\n<p>Want to get involved in building Gutenberg? Follow <a href=\"https://make.wordpress.org/core/\">the Core team blog</a>, contribute to <a href=\"https://github.com/WordPress/gutenberg/\">Gutenberg on GitHub</a>, and join the #core-editor channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Check out the brand new Learn WordPress platform!</h2>\n\n\n\n<p><a href=\"https://learn.wordpress.org/\">Learn WordPress</a> is a brand new cross-team initiative led by the <a href=\"https://make.wordpress.org/community/\">WordPress Community team</a>, with support from the <a href=\"https://make.wordpress.org/training/\">training team</a>, the <a href=\"https://make.wordpress.org/tv/\">TV team</a>, and the <a href=\"https://make.wordpress.org/meta/\">meta team</a>. This platform is a learning repository on <a href=\"https://learn.wordpress.org/\">learn.wordpress.org</a>, where WordPress learning content will be made available. Video workshops published on the site will be followed up by supplementary discussion groups based on workshop content. The first of these discussion groups have been scheduled, and you can join an upcoming discussion <a href=\"https://www.meetup.com/learn-wordpress-discussions/events/\">on the dedicated meetup group</a>. The community team invites members to contribute to the project. You can apply to <a href=\"https://wordcampcentral.survey.fm/learn-wordpress-workshop-application\">present a workshop</a>, <a href=\"https://wordcampcentral.survey.fm/learn-wordpress-reviewer-application\">assist with reviewing</a> submitted workshops, and <a href=\"https://docs.google.com/spreadsheets/d/1A6BYIZAtqk3alBFtJBg-7Q7Y7NBLRnoRFbRTGho2rfI/edit\">add ideas for workshops</a> that you would like to see on the site. You can also apply<a href=\"https://wordcampcentral.survey.fm/learn-wordpress-discussion-group-leader-application\"> to be a discussion group leader</a> to organize discussions directly through the <a href=\"https://learn.wordpress.org\">learn.wordpress.org</a> platform. We are also creating a dedicated Learn WordPress working group and have <a href=\"https://make.wordpress.org/community/2020/08/24/learn-wordpress-working-group-call-for-volunteers/\">posted a call for volunteers</a>. Meetup organizers can use <a href=\"https://learn.wordpress.org/\">Learn WordPress</a> content for their meetup events (without applying as a discussion group leader). Simply ask your meetup group to watch one of the workshops in the weeks leading up to your scheduled event, and then host a discussion group for that content as your event.</p>\n\n\n\n<p>Want to get involved with the Community team? <a href=\"https://make.wordpress.org/community/\">Follow the Community blog</a>, or join them in the #community-events channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>. To organize a local WordPress community event, <a href=\"https://make.wordpress.org/community/handbook/virtual-events/welcome/applying-for-a-virtual-event/\">visit the handbook page</a>. </p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Reading:</h2>\n\n\n\n<ul><li>As <a href=\"https://make.wordpress.org/core/2020/03/11/all-women-release-squad/\">proposed previously</a>, WordPress 5.6 will have an all-women release squad. The team has <a href=\"https://make.wordpress.org/core/2020/08/13/wordpress-5-6-release-planning/\">started work on the 5.6 release planning</a>.</li><li>The community team has decided to <a href=\"https://make.wordpress.org/community/2020/08/04/announcement-flagship-events-in-2021/\">cancel in-person flagship WordPress events</a> in 2021. While new applications for flagship events in 2021 will not be accepted, organizers of existing flagship events (such as WordCamp US, Europe, and Asia) will have the option to move their event online. </li><li>The core team is working on <a href=\"https://core.trac.wordpress.org/ticket/37110\">updating the jQuery version</a> that comes with WordPress. As the first step, the <a href=\"https://make.wordpress.org/core/2020/06/29/updating-jquery-version-shipped-with-wordpress/\">team removed the jQuery Migrate 1.4.1 script </a>from WordPress 5.5. Those who wish to use jQuery migrate for maintaining plugin compatibility can install the <a href=\"https://wordpress.org/plugins/enable-jquery-migrate-helper/\">Enable jQuery Migrate Helper plugin</a>, which has currently reached the 100k installs mark. </li><li>The WordPress documentation team is continuing its discussion on modifying the external linking policy. The conversation is taking place on a <a href=\"https://docs.google.com/document/d/1i0ipOTmKPShSIMoFuEXnI3gkOOUrPJb9t4HMf30JWC0/edit#heading=h.l0cppyl5zvhs\">shared Google doc</a>. Feel free to add comments if you have any thoughts on the topic. </li><li>WordPress will <a href=\"https://core.trac.wordpress.org/ticket/51043#comment:7\">not drop support for PHP 5.6</a>, as initially decided, in order to maintain better version compatibility. The team has additionally come up with a <a href=\"https://make.wordpress.org/core/2020/08/24/proposal-dropping-support-for-old-php-versions-via-a-fixed-schedule/\">proposal to drop support for old PHP versions via a fixed schedule</a>.</li><li>The maiden edition of <a href=\"https://doaction.org/event/india-2020\">do_action India online</a> was held from August 15 to 23. The event, which was held online with collaboration tools, had 94 participants who built fully functional websites for five NGOs from across the country. You can read more about 2020 do_action events <a href=\"https://wordpressfoundation.org/2020/charity-hackathons-august-2020-report/\">on the WordPress Foundation blog</a>.</li><li>The Accessibility team has <a href=\"https://make.wordpress.org/accessibility/2020/08/25/accessibility-teams-goals-for-wordpress-5-6-and-beyond/\">published their goals for WordPress 5.6 and beyond</a> and has started working on them.</li><li><a href=\"https://minneapolis.wordcamp.org/2020/\">WordCamp Minneapolis/St. Paul</a> was held successfully on August 21. The event, which sold over 1400 tickets, had 18 speakers and 12 sponsors.</li><li>The Polyglots team has completed the translation <a href=\"https://make.wordpress.org/polyglots/2020/08/19/polyglots-handbook-reorganization-update/\">handbook structure organization</a>. The handbook now has clear guides for translators, PTEs/GTEs, global mentors, and Plugin/Theme authors.</li></ul>\n\n\n\n<p><em>Have a story that we should include in the next “Month in WordPress” post? Please </em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><em>submit it here</em></a><em>.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8983\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:63:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n\n\n\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:28:\"WordPress 5.5 “Eckstine”\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:44:\"https://wordpress.org/news/2020/08/eckstine/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 11 Aug 2020 19:03:52 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"5.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8799\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:354:\"Version 5.5 \"Eckstine\" of WordPress is available for download or update in your WordPress dashboard. With this release, your site gets new power in three major areas: \nspeed (lazy-loading images), search (sitemaps included by default), and security (auto-updates for plugins and themes), along with many new features and improvements to the block editor.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"enclosure\";a:3:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"url\";s:48:\"https://s.w.org/images/core/5.5/auto-updates.mp4\";s:6:\"length\";s:6:\"238264\";s:4:\"type\";s:9:\"video/mp4\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"url\";s:50:\"https://s.w.org/images/core/5.5/block-patterns.mp4\";s:6:\"length\";s:7:\"3518792\";s:4:\"type\";s:9:\"video/mp4\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"url\";s:56:\"https://s.w.org/images/core/5.5/inline-image-editing.mp4\";s:6:\"length\";s:7:\"3145140\";s:4:\"type\";s:9:\"video/mp4\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Matt Mullenweg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:71062:\"\n<p>Here it is! Named “Eckstine” in honor of Billy Eckstine, this latest and greatest version of WordPress is available for&nbsp;<a href=\"https://wordpress.org/download/\">download</a> or update in your dashboard.</p>\n\n\n\n<figure class=\"wp-block-image size-large\"><img loading=\"lazy\" width=\"632\" height=\"514\" src=\"https://i0.wp.com/wordpress.org/news/files/2020/08/Billy_duotone-1000px_quiche-sans-top.png?resize=632%2C514&#038;ssl=1\" alt=\"\" class=\"wp-image-8930\" srcset=\"https://i0.wp.com/wordpress.org/news/files/2020/08/Billy_duotone-1000px_quiche-sans-top.png?w=1000&amp;ssl=1 1000w, https://i0.wp.com/wordpress.org/news/files/2020/08/Billy_duotone-1000px_quiche-sans-top.png?resize=300%2C244&amp;ssl=1 300w, https://i0.wp.com/wordpress.org/news/files/2020/08/Billy_duotone-1000px_quiche-sans-top.png?resize=768%2C625&amp;ssl=1 768w\" sizes=\"(max-width: 632px) 100vw, 632px\" data-recalc-dims=\"1\" /></figure>\n\n\n\n<div class=\"wp-block-cover has-background-dim\" style=\"background-color:#f2edd4;min-height:300px\"><div class=\"wp-block-cover__inner-container\">\n<p class=\"has-text-align-center has-black-color has-text-color has-background has-large-font-size\" style=\"background-color:#f2edd4\">Welcome to WordPress 5.5.</p>\n\n\n\n<h3 class=\"has-text-align-center has-black-color has-text-color\">In WordPress 5.5, your site gets new power in three major areas: <br>speed, search, and security.</h3>\n</div></div>\n\n\n\n<div class=\"wp-block-columns has-white-background-color has-background\">\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:96%\">\n<h2>Speed</h2>\n\n\n\n<p><strong>Posts and pages feel faster, thanks to lazy-loaded images.</strong></p>\n\n\n\n<p>Images give your story a lot of impact, but they can sometimes make your site seem slow.</p>\n\n\n\n<p>In WordPress 5.5, images wait to load until they’re just about to scroll into view. The technical term is ‘lazy loading.’</p>\n\n\n\n<p>On mobile, lazy loading can also keep browsers from loading files meant for other devices. That can save your readers money on data — and help preserve battery life.</p>\n\n\n\n<h2>Search</h2>\n\n\n\n<p><strong>Say hello to your new sitemap.</strong></p>\n\n\n\n<p>WordPress sites work well with search engines.</p>\n\n\n\n<p>Now, by default, WordPress 5.5 includes an XML sitemap that helps search engines discover your most important pages from the very minute you go live.</p>\n\n\n\n<p>So more people will find your site sooner, giving you more time to engage, retain and convert them to subscribers, customers or whatever fits your definition of success.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n</div>\n\n\n\n<div class=\"wp-block-columns has-background\" style=\"background-color:#ebcd3d\">\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:96%\">\n<h2>Security</h2>\n\n\n\n<figure class=\"wp-block-video\"><video controls src=\"https://s.w.org/images/core/5.5/auto-updates.mp4\"></video><figcaption>Now you can choose to update plugins and themes automatically–or pick just a few–from the screens you’ve always used.</figcaption></figure>\n\n\n\n<p><strong>Auto-updates for Plugins and Themes</strong></p>\n\n\n\n<p>Now you can set plugins and themes to update automatically — or not! — in the WordPress admin. So you always know your site is running the latest code available.</p>\n\n\n\n<p>You can also turn auto-updates on or off for each plugin or theme you have installed — all on the same screens you’ve always used.</p>\n\n\n\n<p><strong>Update by uploading ZIP files</strong></p>\n\n\n\n<p>If updating plugins and themes manually is your thing, now that’s easier too — just upload a ZIP file.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n</div>\n\n\n\n<div class=\"wp-block-columns has-background\" style=\"background-color:#f2edd4\">\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:96%\">\n<h2>Highlights from the block editor</h2>\n\n\n\n<p>Once again, the latest WordPress release packs a long list of exciting new features for the block editor. For example:</p>\n\n\n\n<figure class=\"wp-block-video\"><video controls src=\"https://s.w.org/images/core/5.5/block-patterns.mp4\"></video></figure>\n\n\n\n<div class=\"wp-block-columns\">\n<div class=\"wp-block-column\">\n<h3>Block patterns</h3>\n\n\n\n<p>New block patterns make it simple and fun to create complex, beautiful layouts, using combinations of text and media that you can mix and match to fit your story.</p>\n\n\n\n<p>You will also find block patterns in a wide variety of plugins and themes, with more added all the time. Pick any of them from a single place — just click and go!</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<h3>The new block directory</h3>\n\n\n\n<p>Now it’s easier than ever to find the block you need. The new block directory is built right into the block editor, so you can install new block types to your site without ever leaving the editor.</p>\n\n\n\n<h3>Inline image editing</h3>\n\n\n\n<p>Crop, rotate, and zoom your photos right from the image block. If you spend a lot of time on images, this could save you hours!</p>\n</div>\n</div>\n\n\n\n<figure class=\"wp-block-video\"><video controls src=\"https://s.w.org/images/core/5.5/inline-image-editing.mp4\"></video></figure>\n\n\n\n<h3>And so much more.</h3>\n\n\n\n<p>The highlights above are a tiny fraction of the new block editor features you’ve just installed. Open the block editor and enjoy!</p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n</div>\n\n\n\n<div class=\"wp-block-columns has-white-background-color has-background\">\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:96%\">\n<h2>Accessibility</h2>\n\n\n\n<p>Every release adds improvements to the accessible publishing experience, and that remains true for WordPress 5.5.</p>\n\n\n\n<p>Now you can copy links in media screens and modal dialogs with a button, instead of trying to highlight a line of text.</p>\n\n\n\n<p>You can also move meta boxes with the keyboard, and edit images in WordPress with your assistive device, as it can read you the instructions in the image editor.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n</div>\n\n\n\n<div class=\"wp-block-columns has-black-color has-text-color has-background\" style=\"background-color:#ebcd3d\">\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:96%\">\n<h2>For developers</h2>\n\n\n\n<p>5.5 also brings a big box of changes just for developers.</p>\n\n\n\n<div class=\"wp-block-columns\">\n<div class=\"wp-block-column\">\n<h3>Server-side registered blocks in the REST API</h3>\n\n\n\n<p>The addition of block types endpoints means that JavaScript apps (like the block editor) can retrieve definitions for any blocks registered on the server.</p>\n\n\n\n<h3>Defining environments</h3>\n\n\n\n<p>WordPress now has a standardized way to define a site’s environment type (staging, production, etc). Retrieve that type with&nbsp;<code>wp_get_environment_type()</code>&nbsp;and execute only the appropriate code.</p>\n\n\n\n<h3>Dashicons</h3>\n\n\n\n<p>The Dashicons library has received its final update in 5.5. It adds 39 block editor icons along with 26 others.</p>\n\n\n\n<h3>Passing data to template files</h3>\n\n\n\n<p>The template loading functions (<code>get_header()</code>,&nbsp;<code>get_template_part()</code>, etc.) have a new&nbsp;<code>$args</code>&nbsp;argument. So now you can pass an entire array’s worth of data to those templates.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<h3>More changes for developers</h3>\n\n\n\n<ul><li>The PHPMailer library just got a major update, going from version 5.2.27 to 6.1.6.</li><li>Now get more fine-grained control of&nbsp;<code>redirect_guess_404_permalink()</code>.</li><li>Sites that use PHP’s OPcache will see more reliable cache invalidation, thanks to the new&nbsp;<code>wp_opcache_invalidate()</code>&nbsp;function during updates (including to plugins and themes).</li><li>Custom post types associated with the category taxonomy can now opt-in to supporting the default term.</li><li>Default terms can now be specified for custom taxonomies in&nbsp;<code>register_taxonomy()</code>.</li><li>The REST API now officially supports specifying default metadata values through&nbsp;<code>register_meta()</code>.</li><li>You will find updated versions of these bundled libraries: SimplePie, Twemoji, Masonry, imagesLoaded, getID3, Moment.js, and clipboard.js.</li></ul>\n</div>\n</div>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n</div>\n\n\n\n<div class=\"wp-block-columns has-white-background-color has-background\">\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:96%\">\n<h2>The Squad</h2>\n\n\n\n<p>Leading this release were&nbsp;<a href=\"http://ma.tt/\">Matt Mullenweg</a>,&nbsp;<a href=\"https://profiles.wordpress.org/whyisjake\">Jake Spurlock,</a> and&nbsp;<a href=\"https://dream-encode.com/blog/\">David Baumwald</a>. Supporting them was this highly enthusiastic release squad:</p>\n\n\n\n<ul><li><strong>Editor Tech</strong>: Ella Van Durpe (<a href=\'https://profiles.wordpress.org/ellatrix/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>ellatrix</a>)</li><li><strong>Editor Design</strong>: Michael Arestad (<a href=\'https://profiles.wordpress.org/michael-arestad/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>michael-arestad</a>)</li><li><strong>Core Tech</strong>: Sergey Biryukov (<a href=\'https://profiles.wordpress.org/sergeybiryukov/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>sergeybiryukov</a>)</li><li><strong>Media Tech: </strong>Andrew Ozz (<a href=\'https://profiles.wordpress.org/azaozz/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>azaozz</a>)</li><li><strong>Accessibility Tech</strong>: JB Audras (<a href=\'https://profiles.wordpress.org/audrasjb/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>audrasjb</a>)</li><li><strong>Docs Coordinator</strong>:&nbsp;Justin Ahinon (<a href=\'https://profiles.wordpress.org/justinahinon/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>justinahinon</a>)</li><li><strong>Marketing/Comms Coordinator</strong>: Mary Baum (<a href=\'https://profiles.wordpress.org/marybaum/\' class=\'mention\'><span class=\'mentions-prefix\'>@</span>marybaum</a>)</li></ul>\n\n\n\n<p>Joining the squad throughout the release cycle were <strong>805 generous volunteer contributors</strong> who collectively worked on over <strong><a href=\"https://core.trac.wordpress.org/milestone/5.5\">523</a> tickets on Trac</strong> and <strong>over 1660 pull requests on GitHub</strong>.</p>\n\n\n\n<p>Put on a Billy Eckstine playlist, click that update button (or&nbsp;<a href=\"https://wordpress.org/download/\">download it directly</a>), and check the profiles of the fine folks that helped:</p>\n\n\n<a href=\"https://profiles.wordpress.org/a2hosting/\">A2 Hosting</a>, <a href=\"https://profiles.wordpress.org/a4jpcom/\">a4jp . com</a>, <a href=\"https://profiles.wordpress.org/a6software/\">a6software</a>, <a href=\"https://profiles.wordpress.org/aaroncampbell/\">Aaron D. Campbell</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abderrahman/\">abderrahman</a>, <a href=\"https://profiles.wordpress.org/webcommsat/\">Abha Thakor</a>, <a href=\"https://profiles.wordpress.org/ibachal/\">Achal Jain</a>, <a href=\"https://profiles.wordpress.org/achbed/\">achbed</a>, <a href=\"https://profiles.wordpress.org/achyuthajoy/\">Achyuth Ajoy</a>, <a href=\"https://profiles.wordpress.org/acosmin/\">acosmin</a>, <a href=\"https://profiles.wordpress.org/acsnaterse/\">acsnaterse</a>, <a href=\"https://profiles.wordpress.org/adamsilverstein/\">Adam Silverstein</a>, <a href=\"https://profiles.wordpress.org/addiestavlo/\">Addie</a>, <a href=\"https://profiles.wordpress.org/addyosmani/\">addyosmani</a>, <a href=\"https://profiles.wordpress.org/adnanlimdi/\">adnan.limdi</a>, <a href=\"https://profiles.wordpress.org/adrian/\">adrian</a>, <a href=\"https://profiles.wordpress.org/airamerica/\">airamerica</a>, <a href=\"https://profiles.wordpress.org/ajayghaghretiya1/\">Ajay Ghaghretiya</a>, <a href=\"https://profiles.wordpress.org/ajitbohra/\">Ajit Bohra</a>, <a href=\"https://profiles.wordpress.org/akbarhusen/\">akbarhusen</a>, <a href=\"https://profiles.wordpress.org/akbarhusen429/\">akbarhusen429</a>, <a href=\"https://profiles.wordpress.org/akhileshsabharwal/\">Akhilesh Sabharwal</a>, <a href=\"https://profiles.wordpress.org/atachibana/\">Akira Tachibana</a>, <a href=\"https://profiles.wordpress.org/schlessera/\">Alain Schlesser</a>, <a href=\"https://profiles.wordpress.org/aljullu/\">Albert Juh&#233; Lluveras</a>, <a href=\"https://profiles.wordpress.org/xknown/\">Alex Concha</a>, <a href=\"https://profiles.wordpress.org/akirk/\">Alex Kirk</a>, <a href=\"https://profiles.wordpress.org/ajlende/\">Alex Lende</a>, <a href=\"https://profiles.wordpress.org/tellyworth/\">Alex Shiels</a>, <a href=\"https://profiles.wordpress.org/alishanvr/\">Ali Shan</a>, <a href=\"https://profiles.wordpress.org/ali11007/\">ali11007</a>, <a href=\"https://profiles.wordpress.org/allendav/\">Allen Snook</a>, <a href=\"https://profiles.wordpress.org/amaschas/\">amaschas</a>, <a href=\"https://profiles.wordpress.org/wpamitkumar/\">Amit Dudhat</a>, <a href=\"https://profiles.wordpress.org/anbumz/\">anbumz</a>, <a href=\"https://profiles.wordpress.org/andfinally/\">andfinally</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/andreamiddleton/\">Andrea Middleton</a>, <a href=\"https://profiles.wordpress.org/dontdream/\">Andrea Tarantini</a>, <a href=\"https://profiles.wordpress.org/andraganescu/\">Andrei Draganescu</a>, <a href=\"https://profiles.wordpress.org/aduth/\">Andrew Duthie</a>, <a href=\"https://profiles.wordpress.org/nacin/\">Andrew Nacin</a>, <a href=\"https://profiles.wordpress.org/anevins/\">Andrew Nevins</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/rarst/\">Andrey \"Rarst\" Savchenko</a>, <a href=\"https://profiles.wordpress.org/nosolosw/\">Andrés Maneiro</a>, <a href=\"https://profiles.wordpress.org/afragen/\">Andy Fragen</a>, <a href=\"https://profiles.wordpress.org/andizer/\">Andy Meerwaldt</a>, <a href=\"https://profiles.wordpress.org/apeatling/\">Andy Peatling</a>, <a href=\"https://profiles.wordpress.org/akissz/\">Angel Hess</a>, <a href=\"https://profiles.wordpress.org/angelasjin/\">Angela Jin</a>, <a href=\"https://profiles.wordpress.org/la-geek/\">Angelika Reisiger</a>, <a href=\"https://profiles.wordpress.org/rilwis/\">Anh Tran</a>, <a href=\"https://profiles.wordpress.org/wpgurudev/\">Ankit Gade</a>, <a href=\"https://profiles.wordpress.org/ankit-k-gupta/\">Ankit K Gupta</a>, <a href=\"https://profiles.wordpress.org/ankitmaru/\">Ankit Panchal</a>, <a href=\"https://profiles.wordpress.org/annezazu/\">Anne McCarthy</a>, <a href=\"https://profiles.wordpress.org/antpb/\">Anthony Burchell</a>, <a href=\"https://profiles.wordpress.org/ahortin/\">Anthony Hortin</a>, <a href=\"https://profiles.wordpress.org/atimmer/\">Anton Timmermans</a>, <a href=\"https://profiles.wordpress.org/antonisme/\">Antonis Lilis</a>, <a href=\"https://profiles.wordpress.org/apedog/\">apedog</a>, <a href=\"https://profiles.wordpress.org/archon810/\">archon810</a>, <a href=\"https://profiles.wordpress.org/argentite/\">argentite</a>, <a href=\"https://profiles.wordpress.org/arpitgshah/\">Arpit G Shah</a>, <a href=\"https://profiles.wordpress.org/passoniate/\">Arslan Ahmed</a>, <a href=\"https://profiles.wordpress.org/asalce/\">asalce</a>, <a href=\"https://profiles.wordpress.org/ashiagr/\">ashiagr</a>, <a href=\"https://profiles.wordpress.org/ashour/\">ashour</a>, <a href=\"https://profiles.wordpress.org/tacitonic/\">Atharva Dhekne</a>, <a href=\"https://profiles.wordpress.org/ajoah/\">Aur&#233;lien Joahny</a>, <a href=\"https://profiles.wordpress.org/aussi/\">aussi</a>, <a href=\"https://profiles.wordpress.org/automaton/\">automaton</a>, <a href=\"https://profiles.wordpress.org/avixansa/\">avixansa</a>, <a href=\"https://profiles.wordpress.org/ayeshrajans/\">Ayesh Karunaratne</a>, <a href=\"https://profiles.wordpress.org/backups/\">BackuPs</a>, <a href=\"https://profiles.wordpress.org/barry/\">Barry</a>, <a href=\"https://profiles.wordpress.org/barryceelen/\">Barry Ceelen</a>, <a href=\"https://profiles.wordpress.org/bartczyz/\">Bart Czyz</a>, <a href=\"https://profiles.wordpress.org/bartekcholewa/\">bartekcholewa</a>, <a href=\"https://profiles.wordpress.org/bartkalisz/\">bartkalisz</a>, <a href=\"https://profiles.wordpress.org/bastho/\">Bastien Ho</a>, <a href=\"https://profiles.wordpress.org/bmartinent/\">Bastien Martinent</a>, <a href=\"https://profiles.wordpress.org/bcworkz/\">bcworkz</a>, <a href=\"https://profiles.wordpress.org/bdbch/\">bdbch</a>, <a href=\"https://profiles.wordpress.org/bdcstr/\">bdcstr</a>, <a href=\"https://profiles.wordpress.org/empireoflight/\">Ben Dunkle</a>, <a href=\"https://profiles.wordpress.org/grapestain/\">Bence Szalai</a>, <a href=\"https://profiles.wordpress.org/bencroskery/\">bencroskery</a>, <a href=\"https://profiles.wordpress.org/benjamingosset/\">Benjamin Gosset</a>, <a href=\"https://profiles.wordpress.org/benoitchantre/\">Benoit Chantre</a>, <a href=\"https://profiles.wordpress.org/bernhard-reiter/\">Bernhard Reiter</a>, <a href=\"https://profiles.wordpress.org/bettyjj/\">BettyJJ</a>, <a href=\"https://profiles.wordpress.org/bgermann/\">bgermann</a>, <a href=\"https://profiles.wordpress.org/bigcloudmedia/\">bigcloudmedia</a>, <a href=\"https://profiles.wordpress.org/bigdawggi/\">bigdawggi</a>, <a href=\"https://profiles.wordpress.org/billerickson/\">Bill Erickson</a>, <a href=\"https://profiles.wordpress.org/birgire/\">Birgir Erlendsson (birgire)</a>, <a href=\"https://profiles.wordpress.org/bph/\">Birgit Pauli-Haack</a>, <a href=\"https://profiles.wordpress.org/bjornw/\">BjornW</a>, <a href=\"https://profiles.wordpress.org/bobbingwide/\">bobbingwide</a>, <a href=\"https://profiles.wordpress.org/gitlost/\">bonger</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/bbrdaric/\">Boris Brdarić</a>, <a href=\"https://profiles.wordpress.org/ibdz/\">Boy Witthaya</a>, <a href=\"https://profiles.wordpress.org/kraftbj/\">Brandon Kraft</a>, <a href=\"https://profiles.wordpress.org/bpayton/\">Brandon Payton</a>, <a href=\"https://profiles.wordpress.org/brentswisher/\">Brent Swisher</a>, <a href=\"https://profiles.wordpress.org/brianhogg/\">Brian Hogg</a>, <a href=\"https://profiles.wordpress.org/krogsgard/\">Brian Krogsgard</a>, <a href=\"https://profiles.wordpress.org/bruandet/\">bruandet</a>, <a href=\"https://profiles.wordpress.org/bhargavbhandari90/\">Bunty</a>, <a href=\"https://profiles.wordpress.org/burhandodhy/\">Burhan Nasir</a>, <a href=\"https://profiles.wordpress.org/caiocrcosta/\">caiocrcosta</a>, <a href=\"https://profiles.wordpress.org/cvoell/\">Cameron Voell</a>, <a href=\"https://profiles.wordpress.org/cameronamcintyre/\">cameronamcintyre</a>, <a href=\"https://profiles.wordpress.org/carike/\">Carike</a>, <a href=\"https://profiles.wordpress.org/stuffradio/\">Carl Wuensche</a>, <a href=\"https://profiles.wordpress.org/carloslfu/\">Carlos Galarza</a>, <a href=\"https://profiles.wordpress.org/poena/\">Carolina Nymark</a>, <a href=\"https://profiles.wordpress.org/sixhours/\">Caroline Moore</a>, <a href=\"https://profiles.wordpress.org/carriganvb/\">Carrigan</a>, <a href=\"https://profiles.wordpress.org/ceyhun/\">ceyhun</a>, <a href=\"https://profiles.wordpress.org/shireling/\">Chad</a>, <a href=\"https://profiles.wordpress.org/cbutlerjr/\">Chad Butler</a>, <a href=\"https://profiles.wordpress.org/mackensen/\">Charles Fulton</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/chintan1896/\">Chintan hingrajiya</a>, <a href=\"https://profiles.wordpress.org/chipsnyder/\">Chip Snyder</a>, <a href=\"https://profiles.wordpress.org/cbringmann/\">Chloé Bringmann</a>, <a href=\"https://profiles.wordpress.org/chouby/\">Chouby</a>, <a href=\"https://profiles.wordpress.org/chrisvanpatten/\">Chris Van Patten</a>, <a href=\"https://profiles.wordpress.org/chriscct7/\">chriscct7</a>, <a href=\"https://profiles.wordpress.org/christian1012/\">Christian Chung</a>, <a href=\"https://profiles.wordpress.org/cjbj/\">Christian Jongeneel</a>, <a href=\"https://profiles.wordpress.org/pixelverbieger/\">Christian Sabo</a>, <a href=\"https://profiles.wordpress.org/needle/\">Christian Wach</a>, <a href=\"https://profiles.wordpress.org/christophherr/\">Christoph Herr</a>, <a href=\"https://profiles.wordpress.org/vimes1984/\">Christopher Churchill</a>, <a href=\"https://profiles.wordpress.org/chunkysteveo/\">chunkysteveo</a>, <a href=\"https://profiles.wordpress.org/cklee/\">cklee</a>, <a href=\"https://profiles.wordpress.org/clayray/\">clayray</a>, <a href=\"https://profiles.wordpress.org/claytoncollie/\">Clayton Collie</a>, <a href=\"https://profiles.wordpress.org/cliffpaulick/\">Clifford Paulick</a>, <a href=\"https://profiles.wordpress.org/codeforest/\">codeforest</a>, <a href=\"https://profiles.wordpress.org/commeuneimage/\">Commeuneimage</a>, <a href=\"https://profiles.wordpress.org/copons/\">Copons</a>, <a href=\"https://profiles.wordpress.org/coreymckrill/\">Corey McKrill</a>, <a href=\"https://profiles.wordpress.org/cpasqualini/\">cpasqualini</a>, <a href=\"https://profiles.wordpress.org/cristovaov/\">Cristovao Verstraeten</a>, <a href=\"https://profiles.wordpress.org/littlebigthing/\">Csaba (LittleBigThings)</a>, <a href=\"https://profiles.wordpress.org/curtisbelt/\">Curtis Belt</a>, <a href=\"https://profiles.wordpress.org/clarinetlord/\">Cyrus Collier</a>, <a href=\"https://profiles.wordpress.org/dperonne/\">D.PERONNE</a>, <a href=\"https://profiles.wordpress.org/dsixinetu/\">d6</a>, <a href=\"https://profiles.wordpress.org/danielbachhuber/\">Daniel Bachhuber</a>, <a href=\"https://profiles.wordpress.org/danielhuesken/\">Daniel H&#252;sken</a>, <a href=\"https://profiles.wordpress.org/danieltj/\">Daniel James</a>, <a href=\"https://profiles.wordpress.org/diddledan/\">Daniel Llewellyn</a>, <a href=\"https://profiles.wordpress.org/talldanwp/\">Daniel Richards</a>, <a href=\"https://profiles.wordpress.org/confridin/\">Daniel Roch</a>, <a href=\"https://profiles.wordpress.org/mte90/\">Daniele Scasciafratte</a>, <a href=\"https://profiles.wordpress.org/dboy1988/\">Danny</a>, <a href=\"https://profiles.wordpress.org/darkog/\">Darko G.</a>, <a href=\"https://profiles.wordpress.org/nerrad/\">Darren Ethier (nerrad)</a>, <a href=\"https://profiles.wordpress.org/dmchale/\">Dave McHale</a>, <a href=\"https://profiles.wordpress.org/drw158/\">Dave Whitley</a>, <a href=\"https://profiles.wordpress.org/davidakennedy/\">David A. Kennedy</a>, <a href=\"https://profiles.wordpress.org/davilera/\">David Aguilera</a>, <a href=\"https://profiles.wordpress.org/davidanderson/\">David Anderson</a>, <a href=\"https://profiles.wordpress.org/dartiss/\">David Artiss</a>, <a href=\"https://profiles.wordpress.org/davidbaumwald/\">David Baumwald</a>, <a href=\"https://profiles.wordpress.org/dbrumbaugh10up/\">David Brumbaugh</a>, <a href=\"https://profiles.wordpress.org/desmith/\">David E. Smith</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/dryanpress/\">David Ryan</a>, <a href=\"https://profiles.wordpress.org/dshanske/\">David Shanske</a>, <a href=\"https://profiles.wordpress.org/get_dave/\">David Smith</a>, <a href=\"https://profiles.wordpress.org/davidbinda/\">david.binda</a>, <a href=\"https://profiles.wordpress.org/davidvee/\">davidvee</a>, <a href=\"https://profiles.wordpress.org/dchymko/\">dchymko</a>, <a href=\"https://profiles.wordpress.org/dkarfa/\">Debabrata Karfa</a>, <a href=\"https://profiles.wordpress.org/deepaklalwani/\">Deepak Lalwani</a>, <a href=\"https://profiles.wordpress.org/dekervit/\">dekervit</a>, <a href=\"https://profiles.wordpress.org/delowardev/\">Delowar Hossain</a>, <a href=\"https://profiles.wordpress.org/demetris/\">demetris</a>, <a href=\"https://profiles.wordpress.org/denisco/\">Denis Yanchevskiy</a>, <a href=\"https://profiles.wordpress.org/derekakelly/\">derekakelly</a>, <a href=\"https://profiles.wordpress.org/pcfreak30/\">Derrick Hammer</a>, <a href=\"https://profiles.wordpress.org/emrikol/\">Derrick Tennant</a>, <a href=\"https://profiles.wordpress.org/dianeco/\">Diane Co</a>, <a href=\"https://profiles.wordpress.org/dilipbheda/\">Dilip Bheda</a>, <a href=\"https://profiles.wordpress.org/dimitrism/\">Dimitris Mitsis</a>, <a href=\"https://profiles.wordpress.org/dingo_d/\">dingo-d</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/dency/\">Dixita Dusara</a>, <a href=\"https://profiles.wordpress.org/djennez/\">djennez</a>, <a href=\"https://profiles.wordpress.org/dmenard/\">dmenard</a>, <a href=\"https://profiles.wordpress.org/dmethvin/\">dmethvin</a>, <a href=\"https://profiles.wordpress.org/doc987/\">doc987</a>, <a href=\"https://profiles.wordpress.org/ocean90/\">Dominik Schilling</a>, <a href=\"https://profiles.wordpress.org/donmhico/\">donmhico</a>, <a href=\"https://profiles.wordpress.org/dono12/\">Dono12</a>, <a href=\"https://profiles.wordpress.org/doobeedoo/\">Doobeedoo</a>, <a href=\"https://profiles.wordpress.org/dossy/\">Dossy Shiobara</a>, <a href=\"https://profiles.wordpress.org/dpacks/\">dpacks</a>, <a href=\"https://profiles.wordpress.org/dratwas/\">dratwas</a>, <a href=\"https://profiles.wordpress.org/drewapicture/\">Drew Jaynes</a>, <a href=\"https://profiles.wordpress.org/drlightman/\">DrLightman</a>, <a href=\"https://profiles.wordpress.org/drprotocols/\">DrProtocols</a>, <a href=\"https://profiles.wordpress.org/dsifford/\">dsifford</a>, <a href=\"https://profiles.wordpress.org/dudo/\">dudo</a>, <a href=\"https://profiles.wordpress.org/dushakov/\">dushakov</a>, <a href=\"https://profiles.wordpress.org/dustinbolton/\">Dustin Bolton</a>, <a href=\"https://profiles.wordpress.org/dvershinin/\">dvershinin</a>, <a href=\"https://profiles.wordpress.org/cyberhobo/\">Dylan Kuhn</a>, <a href=\"https://profiles.wordpress.org/elrae/\">Earle Davies</a>, <a href=\"https://profiles.wordpress.org/seedsca/\">ecotechie</a>, <a href=\"https://profiles.wordpress.org/eddiemoya/\">Eddie Moya</a>, <a href=\"https://profiles.wordpress.org/eddystile/\">Eddy</a>, <a href=\"https://profiles.wordpress.org/ediamin/\">Edi Amin</a>, <a href=\"https://profiles.wordpress.org/ehtis/\">ehtis</a>, <a href=\"https://profiles.wordpress.org/itsjusteileen/\">Eileen Violini</a>, <a href=\"https://profiles.wordpress.org/ekatherine/\">Ekaterina</a>, <a href=\"https://profiles.wordpress.org/ellatrix/\">Ella van Durpe</a>, <a href=\"https://profiles.wordpress.org/elmastudio/\">elmastudio</a>, <a href=\"https://profiles.wordpress.org/emanuel_blagonic/\">Emanuel Blagonic</a>, <a href=\"https://profiles.wordpress.org/emlebrun/\">Emilie LEBRUN</a>, <a href=\"https://profiles.wordpress.org/manooweb/\">Emmanuel Hesry</a>, <a href=\"https://profiles.wordpress.org/enej/\">Enej Bajgoric</a>, <a href=\"https://profiles.wordpress.org/enricosorcinelli/\">Enrico Sorcinelli</a>, <a href=\"https://profiles.wordpress.org/epiqueras/\">Enrique Piqueras</a>, <a href=\"https://profiles.wordpress.org/nrqsnchz/\">Enrique Sánchez</a>, <a href=\"https://profiles.wordpress.org/shamai/\">Eric</a>, <a href=\"https://profiles.wordpress.org/ericlewis/\">Eric Andrew Lewis</a>, <a href=\"https://profiles.wordpress.org/ebinnion/\">Eric Binnion</a>, <a href=\"https://profiles.wordpress.org/kebbet/\">Erik Betshammar</a>, <a href=\"https://profiles.wordpress.org/folletto/\">Erin \'Folletto\' Casali</a>, <a href=\"https://profiles.wordpress.org/esemlabel/\">esemlabel</a>, <a href=\"https://profiles.wordpress.org/esoj/\">esoj</a>, <a href=\"https://profiles.wordpress.org/espiat/\">espiat</a>, <a href=\"https://profiles.wordpress.org/estelaris/\">Estela Rueda</a>, <a href=\"https://profiles.wordpress.org/etoledom/\">etoledom</a>, <a href=\"https://profiles.wordpress.org/etruel/\">etruel</a>, <a href=\"https://profiles.wordpress.org/ev3rywh3re/\">Ev3rywh3re</a>, <a href=\"https://profiles.wordpress.org/circlecube/\">Evan Mullins</a>, <a href=\"https://profiles.wordpress.org/fabiankaegy/\">Fabian K&#228;gy</a>, <a href=\"https://profiles.wordpress.org/gaambo/\">Fabian Todt</a>, <a href=\"https://profiles.wordpress.org/fftfaisal/\">Faisal Ahmed</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/felix-edelmann/\">Felix Edelmann</a>, <a href=\"https://profiles.wordpress.org/ferdiesletering/\">ferdiesletering</a>, <a href=\"https://profiles.wordpress.org/finomeno/\">finomeno</a>, <a href=\"https://profiles.wordpress.org/florianbrinkmann/\">Florian Brinkmann</a>, <a href=\"https://profiles.wordpress.org/mista-flo/\">Florian TIAR</a>, <a href=\"https://profiles.wordpress.org/truchot/\">Florian Truchot</a>, <a href=\"https://profiles.wordpress.org/florianatwhodunit/\">florianatwhodunit</a>, <a href=\"https://profiles.wordpress.org/foliovision/\">FolioVision</a>, <a href=\"https://profiles.wordpress.org/francina/\">Francesca Marano</a>, <a href=\"https://profiles.wordpress.org/francoist/\">Francois Thibaud</a>, <a href=\"https://profiles.wordpress.org/futtta/\">Frank Goossens</a>, <a href=\"https://profiles.wordpress.org/frank-klein/\">Frank Klein</a>, <a href=\"https://profiles.wordpress.org/frankprendergast/\">Frank.Prendergast</a>, <a href=\"https://profiles.wordpress.org/fjarrett/\">Frankie Jarrett</a>, <a href=\"https://profiles.wordpress.org/franzarmas/\">Franz Armas</a>, <a href=\"https://profiles.wordpress.org/fullofcaffeine/\">fullofcaffeine</a>, <a href=\"https://profiles.wordpress.org/mintindeed/\">Gabriel Koen</a>, <a href=\"https://profiles.wordpress.org/gma992/\">Gabriel Maldonado</a>, <a href=\"https://profiles.wordpress.org/gmays/\">Gabriel Mays</a>, <a href=\"https://profiles.wordpress.org/gadgetroid/\">gadgetroid</a>, <a href=\"https://profiles.wordpress.org/galbaras/\">Gal Baras</a>, <a href=\"https://profiles.wordpress.org/garavani/\">Garavani</a>, <a href=\"https://profiles.wordpress.org/garethgillman/\">garethgillman</a>, <a href=\"https://profiles.wordpress.org/garrett-eclipse/\">Garrett Hyder</a>, <a href=\"https://profiles.wordpress.org/garyc40/\">Gary Cao</a>, <a href=\"https://profiles.wordpress.org/garyj/\">Gary Jones</a>, <a href=\"https://profiles.wordpress.org/pento/\">Gary Pendergast</a>, <a href=\"https://profiles.wordpress.org/gchtr/\">gchtr</a>, <a href=\"https://profiles.wordpress.org/geertdd/\">Geert De Deckere</a>, <a href=\"https://profiles.wordpress.org/geminilabs/\">Gemini Labs</a>, <a href=\"https://profiles.wordpress.org/soulseekah/\">Gennady Kovshenin</a>, <a href=\"https://profiles.wordpress.org/geriux/\">geriux</a>, <a href=\"https://profiles.wordpress.org/giorgio25b/\">Giorgio25b</a>, <a href=\"https://profiles.wordpress.org/gisselfeldt/\">gisselfeldt</a>, <a href=\"https://profiles.wordpress.org/glendaviesnz/\">glendaviesnz</a>, <a href=\"https://profiles.wordpress.org/goldsounds/\">goldsounds</a>, <a href=\"https://profiles.wordpress.org/gh640/\">Goto Hayato</a>, <a href=\"https://profiles.wordpress.org/gkloveweb/\">Govind Kumar</a>, <a href=\"https://profiles.wordpress.org/greglone/\">Gr&#233;gory Viguier</a>, <a href=\"https://profiles.wordpress.org/gradina/\">gradina</a>, <a href=\"https://profiles.wordpress.org/gziolo/\">Greg Ziółkowski</a>, <a href=\"https://profiles.wordpress.org/gregmulhauser/\">gregmulhauser</a>, <a href=\"https://profiles.wordpress.org/grierson/\">grierson</a>, <a href=\"https://profiles.wordpress.org/grzegorzjanoszka/\">Grzegorz.Janoszka</a>, <a href=\"https://profiles.wordpress.org/gsmumbo/\">gsmumbo</a>, <a href=\"https://profiles.wordpress.org/wido/\">Guido Scialfa</a>, <a href=\"https://profiles.wordpress.org/guidobras/\">guidobras</a>, <a href=\"https://profiles.wordpress.org/netsurfer2705/\">Gunther Pilz</a>, <a href=\"https://profiles.wordpress.org/gwwar/\">gwwar</a>, <a href=\"https://profiles.wordpress.org/hvar/\">H-var</a>, <a href=\"https://profiles.wordpress.org/hakre/\">hakre</a>, <a href=\"https://profiles.wordpress.org/halgatewood/\">Halacious</a>, <a href=\"https://profiles.wordpress.org/hankthetank/\">hankthetank</a>, <a href=\"https://profiles.wordpress.org/psdtohtmlguru/\">Hapiuc Robert</a>, <a href=\"https://profiles.wordpress.org/hareesh-pillai/\">Hareesh</a>, <a href=\"https://profiles.wordpress.org/haukep/\">haukep</a>, <a href=\"https://profiles.wordpress.org/azhiyadev/\">Hauwa</a>, <a href=\"https://profiles.wordpress.org/hazdiego/\">Haz</a>, <a href=\"https://profiles.wordpress.org/h71/\">Hector Farahani</a>, <a href=\"https://profiles.wordpress.org/helen/\">Helen Hou-Sandi</a>, <a href=\"https://profiles.wordpress.org/henrywright/\">Henry Wright</a>, <a href=\"https://profiles.wordpress.org/herregroen/\">Herre Groen</a>, <a href=\"https://profiles.wordpress.org/hlanggo/\">hlanggo</a>, <a href=\"https://profiles.wordpress.org/hommealone/\">hommealone</a>, <a href=\"https://profiles.wordpress.org/ryanshoover/\">Hoover</a>, <a href=\"https://profiles.wordpress.org/howdy_mcgee/\">Howdy_McGee</a>, <a href=\"https://profiles.wordpress.org/hronak/\">Hronak Nahar</a>, <a href=\"https://profiles.wordpress.org/huntlyc/\">huntlyc</a>, <a href=\"https://profiles.wordpress.org/ianbelanger/\">Ian Belanger</a>, <a href=\"https://profiles.wordpress.org/iandunn/\">Ian Dunn</a>, <a href=\"https://profiles.wordpress.org/iandstewart/\">Ian Stewart</a>, <a href=\"https://profiles.wordpress.org/ianjvr/\">ianjvr</a>, <a href=\"https://profiles.wordpress.org/ifrins/\">ifrins</a>, <a href=\"https://profiles.wordpress.org/infinum/\">infinum</a>, <a href=\"https://profiles.wordpress.org/ipstenu/\">Ipstenu (Mika Epstein)</a>, <a href=\"https://profiles.wordpress.org/isabel_brison/\">Isabel Brison</a>, <a href=\"https://profiles.wordpress.org/ishitaka/\">ishitaka</a>, <a href=\"https://profiles.wordpress.org/jdgrimes/\">J.D. Grimes</a>, <a href=\"https://profiles.wordpress.org/jackfungi/\">jackfungi</a>, <a href=\"https://profiles.wordpress.org/jacklinkers/\">jacklinkers</a>, <a href=\"https://profiles.wordpress.org/jadonn/\">Jadon N</a>, <a href=\"https://profiles.wordpress.org/jadpm/\">jadpm</a>, <a href=\"https://profiles.wordpress.org/jagirbahesh/\">jagirbahesh</a>, <a href=\"https://profiles.wordpress.org/whyisjake/\">Jake Spurlock</a>, <a href=\"https://profiles.wordpress.org/twentyzerotwo/\">Jake Whiteley</a>, <a href=\"https://profiles.wordpress.org/jameskoster/\">James Koster</a>, <a href=\"https://profiles.wordpress.org/jnylen0/\">James Nylen</a>, <a href=\"https://profiles.wordpress.org/foack/\">Jan Koch</a>, <a href=\"https://profiles.wordpress.org/janr/\">Jan Reilink</a>, <a href=\"https://profiles.wordpress.org/janthiel/\">Jan Thiel</a>, <a href=\"https://profiles.wordpress.org/javidalkaruzi/\">Janvo Aldred</a>, <a href=\"https://profiles.wordpress.org/jarretc/\">Jarret</a>, <a href=\"https://profiles.wordpress.org/jason_the_adams/\">Jason Adams</a>, <a href=\"https://profiles.wordpress.org/strangerstudios/\">Jason Coleman</a>, <a href=\"https://profiles.wordpress.org/boogah/\">Jason Cosper</a>, <a href=\"https://profiles.wordpress.org/coolmann/\">Jason Crouse</a>, <a href=\"https://profiles.wordpress.org/madtownlems/\">Jason LeMahieu (MadtownLems)</a>, <a href=\"https://profiles.wordpress.org/jaz_on/\">Jason Rouet</a>, <a href=\"https://profiles.wordpress.org/jaswsinc/\">JasWSInc</a>, <a href=\"https://profiles.wordpress.org/javiercasares/\">Javier Casares</a>, <a href=\"https://profiles.wordpress.org/shiki/\">Jayson Basanes</a>, <a href=\"https://profiles.wordpress.org/jbinda/\">jbinda</a>, <a href=\"https://profiles.wordpress.org/jbouganim/\">jbouganim</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\">Jean-Baptiste Audras</a>, <a href=\"https://profiles.wordpress.org/jean-david/\">Jean-David Daviet</a>, <a href=\"https://profiles.wordpress.org/jeffr0/\">Jeff Chandler</a>, <a href=\"https://profiles.wordpress.org/jfarthing84/\">Jeff Farthing</a>, <a href=\"https://profiles.wordpress.org/jffng/\">Jeff Ong</a>, <a href=\"https://profiles.wordpress.org/jeffpaul/\">Jeff Paul</a>, <a href=\"https://profiles.wordpress.org/jenmylo/\">Jen</a>, <a href=\"https://profiles.wordpress.org/jenilk/\">Jenil Kanani</a>, <a href=\"https://profiles.wordpress.org/jeremyfelt/\">Jeremy Felt</a>, <a href=\"https://profiles.wordpress.org/jeherve/\">Jeremy Herve</a>, <a href=\"https://profiles.wordpress.org/jeremyyip/\">Jeremy Yip</a>, <a href=\"https://profiles.wordpress.org/jeroenrotty/\">Jeroen Rotty</a>, <a href=\"https://profiles.wordpress.org/jeryj/\">jeryj</a>, <a href=\"https://profiles.wordpress.org/jesin/\">Jesin A</a>, <a href=\"https://profiles.wordpress.org/jigneshnakrani/\">Jignesh Nakrani</a>, <a href=\"https://profiles.wordpress.org/jim_panse/\">Jim_Panse</a>, <a href=\"https://profiles.wordpress.org/jipmoors/\">Jip Moors</a>, <a href=\"https://profiles.wordpress.org/jivanpal/\">jivanpal</a>, <a href=\"https://profiles.wordpress.org/joedolson/\">Joe Dolson</a>, <a href=\"https://profiles.wordpress.org/joehoyle/\">Joe Hoyle</a>, <a href=\"https://profiles.wordpress.org/joemcgill/\">Joe McGill</a>, <a href=\"https://profiles.wordpress.org/joen/\">Joen Asmussen</a>, <a href=\"https://profiles.wordpress.org/johannadevos/\">Johanna de Vos</a>, <a href=\"https://profiles.wordpress.org/johnbillion/\">John Blackbourn</a>, <a href=\"https://profiles.wordpress.org/jdorner/\">John Dorner</a>, <a href=\"https://profiles.wordpress.org/johnjamesjacoby/\">John James Jacoby</a>, <a href=\"https://profiles.wordpress.org/johnpgreen/\">John P. Green</a>, <a href=\"https://profiles.wordpress.org/rastaban/\">John Richards II</a>, <a href=\"https://profiles.wordpress.org/johnwatkins0/\">John Watkins</a>, <a href=\"https://profiles.wordpress.org/johnnyb/\">johnnyb</a>, <a href=\"https://profiles.wordpress.org/itsjonq/\">Jon Quach</a>, <a href=\"https://profiles.wordpress.org/jonsurrell/\">Jon Surrell</a>, <a href=\"https://profiles.wordpress.org/psykro/\">Jonathan Bossenger</a>, <a href=\"https://profiles.wordpress.org/jrchamp/\">Jonathan Champ</a>, <a href=\"https://profiles.wordpress.org/jchristopher/\">Jonathan Christopher</a>, <a href=\"https://profiles.wordpress.org/desrosj/\">Jonathan Desrosiers</a>, <a href=\"https://profiles.wordpress.org/jonathanstegall/\">Jonathan Stegall</a>, <a href=\"https://profiles.wordpress.org/jonkolbert/\">jonkolbert</a>, <a href=\"https://profiles.wordpress.org/spacedmonkey/\">Jonny Harris</a>, <a href=\"https://profiles.wordpress.org/jonnybot/\">jonnybot</a>, <a href=\"https://profiles.wordpress.org/jonoaldersonwp/\">Jono Alderson</a>, <a href=\"https://profiles.wordpress.org/joostdevalk/\">Joost de Valk</a>, <a href=\"https://profiles.wordpress.org/koke/\">Jorge Bernal</a>, <a href=\"https://profiles.wordpress.org/jorgefilipecosta/\">Jorge Costa</a>, <a href=\"https://profiles.wordpress.org/josephdickson/\">Joseph Dickson</a>, <a href=\"https://profiles.wordpress.org/chanthaboune/\">Josepha Haden</a>, <a href=\"https://profiles.wordpress.org/procifer/\">Josh Smith</a>, <a href=\"https://profiles.wordpress.org/joshuawold/\">JoshuaWold</a>, <a href=\"https://profiles.wordpress.org/joyously/\">Joy</a>, <a href=\"https://profiles.wordpress.org/juanfra/\">Juanfra Aldasoro</a>, <a href=\"https://profiles.wordpress.org/juanlopez4691/\">juanlopez4691</a>, <a href=\"https://profiles.wordpress.org/jules-colle/\">Jules Colle</a>, <a href=\"https://profiles.wordpress.org/julianm/\">julianm</a>, <a href=\"https://profiles.wordpress.org/jrf/\">Juliette Reinders Folmer</a>, <a href=\"https://profiles.wordpress.org/juliobox/\">Julio Potier</a>, <a href=\"https://profiles.wordpress.org/jgrodel/\">Julka Grodel</a>, <a href=\"https://profiles.wordpress.org/justinahinon/\">Justin Ahinon</a>, <a href=\"https://profiles.wordpress.org/devesine/\">Justin de Vesine</a>, <a href=\"https://profiles.wordpress.org/greenshady/\">Justin Tadlock</a>, <a href=\"https://profiles.wordpress.org/justlevine/\">justlevine</a>, <a href=\"https://profiles.wordpress.org/justnorris/\">justnorris</a>, <a href=\"https://profiles.wordpress.org/kadamwhite/\">K. Adam White</a>, <a href=\"https://profiles.wordpress.org/kaggdesign/\">kaggdesign</a>, <a href=\"https://profiles.wordpress.org/trepmal/\">Kailey (trepmal)</a>, <a href=\"https://profiles.wordpress.org/kaira/\">Kaira</a>, <a href=\"https://profiles.wordpress.org/kaitlin414/\">Kaitlin Bolling</a>, <a href=\"https://profiles.wordpress.org/akabarikalpesh/\">Kalpesh Akabari</a>, <a href=\"https://profiles.wordpress.org/kamataryo/\">KamataRyo</a>, <a href=\"https://profiles.wordpress.org/leprincenoir/\">Kantari Samy</a>, <a href=\"https://profiles.wordpress.org/kasparsd/\">Kaspars</a>, <a href=\"https://profiles.wordpress.org/properlypurple/\">Kavya Gokul</a>, <a href=\"https://profiles.wordpress.org/keesiemeijer/\">keesiemeijer</a>, <a href=\"https://profiles.wordpress.org/ryelle/\">Kelly Dwan</a>, <a href=\"https://profiles.wordpress.org/kennethroberson5556/\">kennethroberson5556</a>, <a href=\"https://profiles.wordpress.org/khag7/\">Kevin Hagerty</a>, <a href=\"https://profiles.wordpress.org/kharisblank/\">Kharis Sulistiyono</a>, <a href=\"https://profiles.wordpress.org/itzmekhokan/\">Khokan Sardar</a>, <a href=\"https://profiles.wordpress.org/kinjaldalwadi/\">kinjaldalwadi</a>, <a href=\"https://profiles.wordpress.org/kirilzh/\">Kiril Zhelyazkov</a>, <a href=\"https://profiles.wordpress.org/kburgoine/\">Kirsty Burgoine</a>, <a href=\"https://profiles.wordpress.org/kishanjasani/\">Kishan Jasani</a>, <a href=\"https://profiles.wordpress.org/kitchin/\">kitchin</a>, <a href=\"https://profiles.wordpress.org/ixkaito/\">Kite</a>, <a href=\"https://profiles.wordpress.org/kjellr/\">Kjell Reigstad</a>, <a href=\"https://profiles.wordpress.org/knutsp/\">Knut Sparhell</a>, <a href=\"https://profiles.wordpress.org/obenland/\">Konstantin Obenland</a>, <a href=\"https://profiles.wordpress.org/xkon/\">Konstantinos Xenos</a>, <a href=\"https://profiles.wordpress.org/ksoares/\">ksoares</a>, <a href=\"https://profiles.wordpress.org/kthmd/\">KT Cheung</a>, <a href=\"https://profiles.wordpress.org/sainthkh/\">Kukhyeon Heo</a>, <a href=\"https://profiles.wordpress.org/kbjohnson90/\">Kyle B. Johnson</a>, <a href=\"https://profiles.wordpress.org/lalitpendhare/\">lalitpendhare</a>, <a href=\"https://profiles.wordpress.org/landau/\">landau</a>, <a href=\"https://profiles.wordpress.org/laternastudio/\">Laterna Studio</a>, <a href=\"https://profiles.wordpress.org/laurelfulford/\">laurelfulford</a>, <a href=\"https://profiles.wordpress.org/offereins/\">Laurens Offereins</a>, <a href=\"https://profiles.wordpress.org/laxman-prajapati/\">Laxman Prajapati</a>, <a href=\"https://profiles.wordpress.org/gamerz/\">Lester Chan</a>, <a href=\"https://profiles.wordpress.org/levdbas/\">Levdbas</a>, <a href=\"https://profiles.wordpress.org/layotte/\">Lew Ayotte</a>, <a href=\"https://profiles.wordpress.org/lex_robinson/\">Lex Robinson</a>, <a href=\"https://profiles.wordpress.org/linyows/\">linyows</a>, <a href=\"https://profiles.wordpress.org/lipathor/\">lipathor</a>, <a href=\"https://profiles.wordpress.org/lschuyler/\">Lisa Schuyler</a>, <a href=\"https://profiles.wordpress.org/liuhaibin/\">liuhaibin</a>, <a href=\"https://profiles.wordpress.org/ljharb/\">ljharb</a>, <a href=\"https://profiles.wordpress.org/logig/\">logig</a>, <a href=\"https://profiles.wordpress.org/lucasbustamante/\">lucasbustamante</a>, <a href=\"https://profiles.wordpress.org/lwill/\">luiswill</a>, <a href=\"https://profiles.wordpress.org/lukecavanagh/\">Luke Cavanagh</a>, <a href=\"https://profiles.wordpress.org/happiryu/\">Luke Walczak</a>, <a href=\"https://profiles.wordpress.org/lukestramasonder/\">lukestramasonder</a>, <a href=\"https://profiles.wordpress.org/asif2bd/\">M Asif Rahman</a>, <a href=\"https://profiles.wordpress.org/msafi/\">M.K. Safi</a>, <a href=\"https://profiles.wordpress.org/cloudstek/\">Maarten de Boer</a>, <a href=\"https://profiles.wordpress.org/aladin02dz/\">Mahfoudh Arous</a>, <a href=\"https://profiles.wordpress.org/mailnew2ster/\">mailnew2ster</a>, <a href=\"https://profiles.wordpress.org/manojlovic/\">manojlovic</a>, <a href=\"https://profiles.wordpress.org/targz-1/\">Manuel Schmalstieg</a>, <a href=\"https://profiles.wordpress.org/neodjandre/\">maraki</a>, <a href=\"https://profiles.wordpress.org/iworks/\">Marcin Pietrzak</a>, <a href=\"https://profiles.wordpress.org/marcio-zebedeu/\">Marcio Zebedeu</a>, <a href=\"https://profiles.wordpress.org/pereirinha/\">Marco Pereirinha</a>, <a href=\"https://profiles.wordpress.org/marcoz/\">MarcoZ</a>, <a href=\"https://profiles.wordpress.org/netweblogic/\">Marcus</a>, <a href=\"https://profiles.wordpress.org/mkaz/\">Marcus Kazmierczak</a>, <a href=\"https://profiles.wordpress.org/marekdedic/\">Marek Dědič</a>, <a href=\"https://profiles.wordpress.org/marekhrabe/\">Marek Hrabe</a>, <a href=\"https://profiles.wordpress.org/mariovalney/\">Mario Valney</a>, <a href=\"https://profiles.wordpress.org/clorith/\">Marius Jensen</a>, <a href=\"https://profiles.wordpress.org/machouinard/\">Mark Chouinard</a>, <a href=\"https://profiles.wordpress.org/markjaquith/\">Mark Jaquith</a>, <a href=\"https://profiles.wordpress.org/markparnell/\">Mark Parnell</a>, <a href=\"https://profiles.wordpress.org/mapk/\">Mark Uraine</a>, <a href=\"https://profiles.wordpress.org/markdubois/\">markdubois</a>, <a href=\"https://profiles.wordpress.org/markgoho/\">markgoho</a>, <a href=\"https://profiles.wordpress.org/vindl/\">Marko Andrijasevic</a>, <a href=\"https://profiles.wordpress.org/markoheijnen/\">Marko Heijnen</a>, <a href=\"https://profiles.wordpress.org/markrh/\">MarkRH</a>, <a href=\"https://profiles.wordpress.org/markshep/\">markshep</a>, <a href=\"https://profiles.wordpress.org/markusthiel/\">markusthiel</a>, <a href=\"https://profiles.wordpress.org/martijn-van-der-kooij/\">Martijn van der Kooij</a>, <a href=\"https://profiles.wordpress.org/martychc23/\">martychc23</a>, <a href=\"https://profiles.wordpress.org/marybaum/\">Mary Baum</a>, <a href=\"https://profiles.wordpress.org/matheusfd/\">Matheus Martins</a>, <a href=\"https://profiles.wordpress.org/imath/\">Mathieu Viet</a>, <a href=\"https://profiles.wordpress.org/matveb/\">Matias Ventura</a>, <a href=\"https://profiles.wordpress.org/matjack1/\">matjack1</a>, <a href=\"https://profiles.wordpress.org/webdevmattcrom/\">Matt Cromwell</a>, <a href=\"https://profiles.wordpress.org/gothickgothickorguk/\">Matt Gibson</a>, <a href=\"https://profiles.wordpress.org/matt/\">Matt Mullenweg</a>, <a href=\"https://profiles.wordpress.org/mattrad/\">Matt Radford</a>, <a href=\"https://profiles.wordpress.org/veraxus/\">Matt van Andel</a>, <a href=\"https://profiles.wordpress.org/mattchowning/\">mattchowning</a>, <a href=\"https://profiles.wordpress.org/mboynes/\">Matthew Boynes</a>, <a href=\"https://profiles.wordpress.org/mattheweppelsheimer/\">Matthew Eppelsheimer</a>, <a href=\"https://profiles.wordpress.org/beatpanda/\">Matthew Gerring</a>, <a href=\"https://profiles.wordpress.org/kittmedia/\">Matthias Kittsteiner</a>, <a href=\"https://profiles.wordpress.org/pfefferle/\">Matthias Pfefferle</a>, <a href=\"https://profiles.wordpress.org/matthieumota/\">Matthieu Mota</a>, <a href=\"https://profiles.wordpress.org/mattyrob/\">mattyrob</a>, <a href=\"https://profiles.wordpress.org/maximeculea/\">Maxime Culea</a>, <a href=\"https://profiles.wordpress.org/maxpertici/\">Maxime Pertici</a>, <a href=\"https://profiles.wordpress.org/maxme/\">maxme</a>, <a href=\"https://profiles.wordpress.org/mayankmajeji/\">Mayank Majeji</a>, <a href=\"https://profiles.wordpress.org/mcshane/\">mcshane</a>, <a href=\"https://profiles.wordpress.org/melchoyce/\">Mel Choyce-Dwan</a>, <a href=\"https://profiles.wordpress.org/menakas/\">Menaka S.</a>, <a href=\"https://profiles.wordpress.org/mensmaximus/\">mensmaximus</a>, <a href=\"https://profiles.wordpress.org/metalandcoffee/\">metalandcoffee</a>, <a href=\"https://profiles.wordpress.org/lilmike/\">Michael</a>, <a href=\"https://profiles.wordpress.org/michaelarestad/\">Michael Arestad</a>, <a href=\"https://profiles.wordpress.org/michael-arestad/\">Michael Arestad</a>, <a href=\"https://profiles.wordpress.org/tw2113/\">Michael Beckwith</a>, <a href=\"https://profiles.wordpress.org/mfields/\">Michael Fields</a>, <a href=\"https://profiles.wordpress.org/mnelson4/\">Michael Nelson</a>, <a href=\"https://profiles.wordpress.org/m_butcher/\">Michele Butcher-Jones</a>, <a href=\"https://profiles.wordpress.org/marktimemedia/\">Michelle</a>, <a href=\"https://profiles.wordpress.org/mcsf/\">Miguel Fonseca</a>, <a href=\"https://profiles.wordpress.org/mihdan/\">mihdan</a>, <a href=\"https://profiles.wordpress.org/miinasikk/\">Miina Sikk</a>, <a href=\"https://profiles.wordpress.org/simison/\">Mikael Korpela</a>, <a href=\"https://profiles.wordpress.org/mikaumoto/\">mikaumoto</a>, <a href=\"https://profiles.wordpress.org/mihai2u/\">Mike Crantea</a>, <a href=\"https://profiles.wordpress.org/mdgl/\">Mike Glendinning</a>, <a href=\"https://profiles.wordpress.org/mike-haydon-swo/\">Mike Haydon</a>, <a href=\"https://profiles.wordpress.org/mikeschinkel/\">Mike Schinkel [WPLib Box project lead]</a>, <a href=\"https://profiles.wordpress.org/mikeschroder/\">Mike Schroder</a>, <a href=\"https://profiles.wordpress.org/mikeyarce/\">Mikey Arce</a>, <a href=\"https://profiles.wordpress.org/milana_cap/\">Milana Cap</a>, <a href=\"https://profiles.wordpress.org/milindmore22/\">Milind More</a>, <a href=\"https://profiles.wordpress.org/mimitips/\">mimi</a>, <a href=\"https://profiles.wordpress.org/mislavjuric/\">mislavjuric</a>, <a href=\"https://profiles.wordpress.org/batmoo/\">Mohammad Jangda</a>, <a href=\"https://profiles.wordpress.org/opurockey/\">Mohammad Rockeybul Alam</a>, <a href=\"https://profiles.wordpress.org/mohsinrasool/\">Mohsin Rasool</a>, <a href=\"https://profiles.wordpress.org/monikarao/\">Monika Rao</a>, <a href=\"https://profiles.wordpress.org/gwendydd/\">Morgan Kay</a>, <a href=\"https://profiles.wordpress.org/mor10/\">Morten Rand-Hendriksen</a>, <a href=\"https://profiles.wordpress.org/man4toman/\">Morteza Geransayeh</a>, <a href=\"https://profiles.wordpress.org/mt8biz/\">moto hachi ( mt8.biz )</a>, <a href=\"https://profiles.wordpress.org/mrgrt/\">mrgrt</a>, <a href=\"https://profiles.wordpress.org/mrmist/\">mrmist</a>, <a href=\"https://profiles.wordpress.org/mrtall/\">mrTall</a>, <a href=\"https://profiles.wordpress.org/msaggiorato/\">msaggiorato</a>, <a href=\"https://profiles.wordpress.org/musamamasood/\">Muhammad Usama Masood</a>, <a href=\"https://profiles.wordpress.org/mukesh27/\">Mukesh Panchal</a>, <a href=\"https://profiles.wordpress.org/munyagu/\">munyagu</a>, <a href=\"https://profiles.wordpress.org/nabilmoqbel/\">Nabil Moqbel</a>, <a href=\"https://profiles.wordpress.org/assassinateur/\">Nadir Seghir</a>, <a href=\"https://profiles.wordpress.org/nfmohit/\">Nahid Ferdous Mohit</a>, <a href=\"https://profiles.wordpress.org/nalininonstopnewsuk/\">Nalini Thakor</a>, <a href=\"https://profiles.wordpress.org/nao/\">Naoko Takano</a>, <a href=\"https://profiles.wordpress.org/narwen/\">narwen</a>, <a href=\"https://profiles.wordpress.org/nateinaction/\">Nate Gay</a>, <a href=\"https://profiles.wordpress.org/nathanrice/\">Nathan Rice</a>, <a href=\"https://profiles.wordpress.org/navidos/\">Navid</a>, <a href=\"https://profiles.wordpress.org/neonkowy/\">neonkowy</a>, <a href=\"https://profiles.wordpress.org/krstarica/\">net</a>, <a href=\"https://profiles.wordpress.org/netpassprodsr/\">netpassprodsr</a>, <a href=\"https://profiles.wordpress.org/nextendweb/\">Nextendweb</a>, <a href=\"https://profiles.wordpress.org/calvin_ngan/\">Ngan Tengyuen</a>, <a href=\"https://profiles.wordpress.org/nickdaugherty/\">Nick Daugherty</a>, <a href=\"https://profiles.wordpress.org/nickylimjj/\">Nicky Lim</a>, <a href=\"https://profiles.wordpress.org/vadimnicolai/\">nicolad</a>, <a href=\"https://profiles.wordpress.org/rahe/\">Nicolas Juen</a>, <a href=\"https://profiles.wordpress.org/nicolaskulka/\">NicolasKulka</a>, <a href=\"https://profiles.wordpress.org/jainnidhi/\">Nidhi Jain</a>, <a href=\"https://profiles.wordpress.org/nielsdeblaauw/\">Niels de Blaauw</a>, <a href=\"https://profiles.wordpress.org/nielslange/\">Niels Lange</a>, <a href=\"https://profiles.wordpress.org/nigrosimone/\">nigro.simone</a>, <a href=\"https://profiles.wordpress.org/ntsekouras/\">Nik Tsekouras</a>, <a href=\"https://profiles.wordpress.org/nikhilbhansi/\">Nikhil Bhansi</a>, <a href=\"https://profiles.wordpress.org/nbachiyski/\">Nikolay Bachiyski</a>, <a href=\"https://profiles.wordpress.org/nilovelez/\">Nilo Velez</a>, <a href=\"https://profiles.wordpress.org/niresh12495/\">Niresh</a>, <a href=\"https://profiles.wordpress.org/nmenescardi/\">nmenescardi</a>, <a href=\"https://profiles.wordpress.org/noahtallen/\">Noah Allen</a>, <a href=\"https://profiles.wordpress.org/numidwasnotavailable/\">NumidWasNotAvailable</a>, <a href=\"https://profiles.wordpress.org/oakesjosh/\">oakesjosh</a>, <a href=\"https://profiles.wordpress.org/obliviousharmony/\">obliviousharmony</a>, <a href=\"https://profiles.wordpress.org/ockham/\">ockham</a>, <a href=\"https://profiles.wordpress.org/oglekler/\">Olga Gleckler</a>, <a href=\"https://profiles.wordpress.org/alshakero/\">Omar Alshaker</a>, <a href=\"https://profiles.wordpress.org/omarreiss/\">Omar Reiss</a>, <a href=\"https://profiles.wordpress.org/onokazu/\">onokazu</a>, <a href=\"https://profiles.wordpress.org/optimizingmatters/\">Optimizing Matters</a>, <a href=\"https://profiles.wordpress.org/ov3rfly/\">Ov3rfly</a>, <a href=\"https://profiles.wordpress.org/ovann86/\">ovann86</a>, <a href=\"https://profiles.wordpress.org/overclokk/\">overclokk</a>, <a href=\"https://profiles.wordpress.org/p_enrique/\">p_enrique</a>, <a href=\"https://profiles.wordpress.org/paaljoachim/\">Paal Joachim Romdahl</a>, <a href=\"https://profiles.wordpress.org/pablohoneyhoney/\">Pablo Honey</a>, <a href=\"https://profiles.wordpress.org/paddy/\">Paddy</a>, <a href=\"https://profiles.wordpress.org/palmiak/\">palmiak</a>, <a href=\"https://profiles.wordpress.org/paresh07/\">Paresh Shinde</a>, <a href=\"https://profiles.wordpress.org/parvand/\">Parvand</a>, <a href=\"https://profiles.wordpress.org/swissspidy/\">Pascal Birchler</a>, <a href=\"https://profiles.wordpress.org/casiepa/\">Pascal Casier</a>, <a href=\"https://profiles.wordpress.org/pbearne/\">Paul Bearne</a>, <a href=\"https://profiles.wordpress.org/pbiron/\">Paul Biron</a>, <a href=\"https://profiles.wordpress.org/pdfernhout/\">Paul Fernhout</a>, <a href=\"https://profiles.wordpress.org/djpaul/\">Paul Gibbs</a>, <a href=\"https://profiles.wordpress.org/figureone/\">Paul Ryan</a>, <a href=\"https://profiles.wordpress.org/paulschreiber/\">Paul Schreiber</a>, <a href=\"https://profiles.wordpress.org/paulstonier/\">Paul Stonier</a>, <a href=\"https://profiles.wordpress.org/pschrottky/\">Paul Von Schrottky</a>, <a href=\"https://profiles.wordpress.org/pavelevap/\">pavelevap</a>, <a href=\"https://profiles.wordpress.org/pedromendonca/\">Pedro Mendon&#231;a</a>, <a href=\"https://profiles.wordpress.org/pentatonicfunk/\">pentatonicfunk</a>, <a href=\"https://profiles.wordpress.org/pputzer/\">pepe</a>, <a href=\"https://profiles.wordpress.org/pessoft/\">Peter \"Pessoft\" Kol&#237;nek</a>, <a href=\"https://profiles.wordpress.org/westi/\">Peter Westwood</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/pderksen/\">Phil Derksen</a>, <a href=\"https://profiles.wordpress.org/johnstonphilip/\">Phil Johnston</a>, <a href=\"https://profiles.wordpress.org/philipmjackson/\">Philip Jackson</a>, <a href=\"https://profiles.wordpress.org/pierlo/\">Pierre Gordon</a>, <a href=\"https://profiles.wordpress.org/pigdog234/\">pigdog234</a>, <a href=\"https://profiles.wordpress.org/pikamander2/\">pikamander2</a>, <a href=\"https://profiles.wordpress.org/pingram3541/\">pingram</a>, <a href=\"https://profiles.wordpress.org/pionect/\">Pionect</a>, <a href=\"https://profiles.wordpress.org/piyushmca/\">Piyush Patel</a>, <a href=\"https://profiles.wordpress.org/pkarjala/\">pkarjala</a>, <a href=\"https://profiles.wordpress.org/pkvillanueva/\">pkvillanueva</a>, <a href=\"https://profiles.wordpress.org/pmbaldha/\">Prashant Baldha</a>, <a href=\"https://profiles.wordpress.org/pratik028/\">pratik028</a>, <a href=\"https://profiles.wordpress.org/pravinparmar2404/\">Pravin Parmar</a>, <a href=\"https://profiles.wordpress.org/presskopp/\">Presskopp</a>, <a href=\"https://profiles.wordpress.org/presslabs/\">Presslabs</a>, <a href=\"https://profiles.wordpress.org/priyankkpatel/\">Priyank Patel</a>, <a href=\"https://profiles.wordpress.org/priyomukul/\">Priyo Mukul</a>, <a href=\"https://profiles.wordpress.org/prografika/\">ProGrafika</a>, <a href=\"https://profiles.wordpress.org/programmin/\">programmin</a>, <a href=\"https://profiles.wordpress.org/puneetsahalot/\">Puneet Sahalot</a>, <a href=\"https://profiles.wordpress.org/pvogel2/\">pvogel2</a>, <a href=\"https://profiles.wordpress.org/r-a-y/\">r-a-y</a>, <a href=\"https://profiles.wordpress.org/raajtram/\">Raaj Trambadia</a>, <a href=\"https://profiles.wordpress.org/larrach/\">Rachel Peter</a>, <a href=\"https://profiles.wordpress.org/raineorshine/\">raine</a>, <a href=\"https://profiles.wordpress.org/rajeshsingh520/\">rajeshsingh520</a>, <a href=\"https://profiles.wordpress.org/superpoincare/\">Ramanan</a>, <a href=\"https://profiles.wordpress.org/ramiy/\">Rami Yushuvaev</a>, <a href=\"https://profiles.wordpress.org/ravanh/\">RavanH</a>, <a href=\"https://profiles.wordpress.org/ravatparmar/\">Ravat Parmar</a>, <a href=\"https://profiles.wordpress.org/ravenswd/\">ravenswd</a>, <a href=\"https://profiles.wordpress.org/rawrly/\">rawrly</a>, <a href=\"https://profiles.wordpress.org/rebasaurus/\">rebasaurus</a>, <a href=\"https://profiles.wordpress.org/redsand/\">Red Sand Media Group</a>, <a href=\"https://profiles.wordpress.org/tabrisrp/\">Remy Perona</a>, <a href=\"https://profiles.wordpress.org/remzicavdar/\">Remzi Cavdar</a>, <a href=\"https://profiles.wordpress.org/renathoc/\">Renatho</a>, <a href=\"https://profiles.wordpress.org/renggo888/\">renggo888</a>, <a href=\"https://profiles.wordpress.org/retlehs/\">retlehs</a>, <a href=\"https://profiles.wordpress.org/retrofox/\">retrofox</a>, <a href=\"https://profiles.wordpress.org/riaanlom/\">riaanlom</a>, <a href=\"https://profiles.wordpress.org/youknowriad/\">Riad Benguella</a>, <a href=\"https://profiles.wordpress.org/rianrietveld/\">Rian Rietveld</a>, <a href=\"https://profiles.wordpress.org/riasat/\">riasat</a>, <a href=\"https://profiles.wordpress.org/richtabor/\">Rich Tabor</a>, <a href=\"https://profiles.wordpress.org/ringisha/\">Ringisha</a>, <a href=\"https://profiles.wordpress.org/ritterml/\">ritterml</a>, <a href=\"https://profiles.wordpress.org/rnaby/\">Rnaby</a>, <a href=\"https://profiles.wordpress.org/rcutmore/\">Rob Cutmore</a>, <a href=\"https://profiles.wordpress.org/dhrrob/\">Rob Migchels</a>, <a href=\"https://profiles.wordpress.org/rob006/\">rob006</a>, <a href=\"https://profiles.wordpress.org/noisysocks/\">Robert Anderson</a>, <a href=\"https://profiles.wordpress.org/miqrogroove/\">Robert Chapin</a>, <a href=\"https://profiles.wordpress.org/robertpeake/\">Robert Peake</a>, <a href=\"https://profiles.wordpress.org/nullbyte/\">Robert Windisch</a>, <a href=\"https://profiles.wordpress.org/kreppar/\">Rodrigo Arias</a>, <a href=\"https://profiles.wordpress.org/ronalfy/\">Ronald Huereca</a>, <a href=\"https://profiles.wordpress.org/costasovo/\">Rostislav Woln&#253;</a>, <a href=\"https://profiles.wordpress.org/roytanck/\">Roy Tanck</a>, <a href=\"https://profiles.wordpress.org/rtagliento/\">rtagliento</a>, <a href=\"https://profiles.wordpress.org/ruxandra/\">ruxandra</a>, <a href=\"https://profiles.wordpress.org/ryan/\">Ryan Boren</a>, <a href=\"https://profiles.wordpress.org/bookdude13/\">Ryan Fredlund</a>, <a href=\"https://profiles.wordpress.org/ryankienstra/\">Ryan Kienstra</a>, <a href=\"https://profiles.wordpress.org/rmccue/\">Ryan McCue</a>, <a href=\"https://profiles.wordpress.org/welcher/\">Ryan Welcher</a>, <a href=\"https://profiles.wordpress.org/ryotasakamoto/\">Ryota Sakamoto</a>, <a href=\"https://profiles.wordpress.org/ryotsun/\">ryotsun</a>, <a href=\"https://profiles.wordpress.org/soean/\">S&#246;ren Wrede</a>, <a href=\"https://profiles.wordpress.org/sorenbronsted/\">S&#248;ren Br&#248;nsted</a>, <a href=\"https://profiles.wordpress.org/sachittandukar/\">Sachit Tandukar</a>, <a href=\"https://profiles.wordpress.org/sagarjadhav/\">Sagar Jadhav</a>, <a href=\"https://profiles.wordpress.org/sajjad67/\">Sajjad Hossain Sagor</a>, <a href=\"https://profiles.wordpress.org/salcode/\">Sal Ferrarello</a>, <a href=\"https://profiles.wordpress.org/salvatoreformisano/\">Salvatore Formisano</a>, <a href=\"https://profiles.wordpress.org/salvoaranzulla/\">salvoaranzulla</a>, <a href=\"https://profiles.wordpress.org/samful/\">Sam Fullalove</a>, <a href=\"https://profiles.wordpress.org/sswebster/\">Sam Webster</a>, <a href=\"https://profiles.wordpress.org/solarissmoke/\">Samir Shah</a>, <a href=\"https://profiles.wordpress.org/otto42/\">Samuel Wood (Otto)</a>, <a href=\"https://profiles.wordpress.org/samueljseay/\">samueljseay</a>, <a href=\"https://profiles.wordpress.org/pacifika/\">Sander van Dragt</a>, <a href=\"https://profiles.wordpress.org/sanzeeb3/\">Sanjeev Aryal</a>, <a href=\"https://profiles.wordpress.org/progremzion/\">Sanket Mehta</a>, <a href=\"https://profiles.wordpress.org/sarahricker/\">sarahricker</a>, <a href=\"https://profiles.wordpress.org/sathyapulse/\">Sathiyamoorthy V</a>, <a href=\"https://profiles.wordpress.org/sayedwp/\">Sayed Taqui</a>, <a href=\"https://profiles.wordpress.org/scarolan/\">scarolan</a>, <a href=\"https://profiles.wordpress.org/scholdstrom/\">scholdstrom</a>, <a href=\"https://profiles.wordpress.org/sc0ttkclark/\">Scott Kingsley Clark</a>, <a href=\"https://profiles.wordpress.org/coffee2code/\">Scott Reilly</a>, <a href=\"https://profiles.wordpress.org/scottsmith/\">Scott Smith</a>, <a href=\"https://profiles.wordpress.org/wonderboymusic/\">Scott Taylor</a>, <a href=\"https://profiles.wordpress.org/scribu/\">scribu</a>, <a href=\"https://profiles.wordpress.org/scruffian/\">scruffian</a>, <a href=\"https://profiles.wordpress.org/seanchayes/\">Sean Hayes</a>, <a href=\"https://profiles.wordpress.org/seanpaulrasmussen/\">seanpaulrasmussen</a>, <a href=\"https://profiles.wordpress.org/seayou/\">seayou</a>, <a href=\"https://profiles.wordpress.org/senatorman/\">senatorman</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/vjik/\">Sergey Predvoditelev</a>, <a href=\"https://profiles.wordpress.org/sgr33n/\">Sergio de Falco</a>, <a href=\"https://profiles.wordpress.org/sergiomdgomes/\">sergiomdgomes</a>, <a href=\"https://profiles.wordpress.org/functionalrhyme/\">Shannon Smith</a>, <a href=\"https://profiles.wordpress.org/wpshades/\">Shantanu Desai</a>, <a href=\"https://profiles.wordpress.org/shaunandrews/\">shaunandrews</a>, <a href=\"https://profiles.wordpress.org/shooper/\">Shawn Hooper</a>, <a href=\"https://profiles.wordpress.org/shawnz/\">shawnz</a>, <a href=\"https://profiles.wordpress.org/shital-patel/\">Shital Marakana</a>, <a href=\"https://profiles.wordpress.org/shulard/\">shulard</a>, <a href=\"https://profiles.wordpress.org/siliconforks/\">siliconforks</a>, <a href=\"https://profiles.wordpress.org/simonwheatley/\">Simon Wheatley</a>, <a href=\"https://profiles.wordpress.org/simonjanin/\">simonjanin</a>, <a href=\"https://profiles.wordpress.org/sinatrateam/\">sinatrateam</a>, <a href=\"https://profiles.wordpress.org/sjmur/\">sjmur</a>, <a href=\"https://profiles.wordpress.org/skarabeq/\">skarabeq</a>, <a href=\"https://profiles.wordpress.org/skorasaurus/\">skorasaurus</a>, <a href=\"https://profiles.wordpress.org/skoskie/\">skoskie</a>, <a href=\"https://profiles.wordpress.org/slushman/\">slushman</a>, <a href=\"https://profiles.wordpress.org/snapfractalpop/\">snapfractalpop</a>, <a href=\"https://profiles.wordpress.org/seth17/\">SpearsMarketing</a>, <a href=\"https://profiles.wordpress.org/sphakka/\">sphakka</a>, <a href=\"https://profiles.wordpress.org/squarecandy/\">squarecandy</a>, <a href=\"https://profiles.wordpress.org/sreedoap/\">sreedoap</a>, <a href=\"https://profiles.wordpress.org/sstoqnov/\">Stanimir Stoyanov</a>, <a href=\"https://profiles.wordpress.org/ryokuhi/\">Stefano Minoia</a>, <a href=\"https://profiles.wordpress.org/hypest/\">Stefanos Togoulidis</a>, <a href=\"https://profiles.wordpress.org/sswells/\">Steph Wells</a>, <a href=\"https://profiles.wordpress.org/sabernhardt/\">Stephen Bernhardt</a>, <a href=\"https://profiles.wordpress.org/stephencronin/\">Stephen Cronin</a>, <a href=\"https://profiles.wordpress.org/netweb/\">Stephen Edgar</a>, <a href=\"https://profiles.wordpress.org/dufresnesteven/\">Steve Dufresne</a>, <a href=\"https://profiles.wordpress.org/stevegibson12/\">stevegibson12</a>, <a href=\"https://profiles.wordpress.org/sterndata/\">Steven Stern (sterndata)</a>, <a href=\"https://profiles.wordpress.org/stevenkword/\">Steven Word</a>, <a href=\"https://profiles.wordpress.org/stevenkussmaul/\">stevenkussmaul</a>, <a href=\"https://profiles.wordpress.org/stevenlinx/\">stevenlinx</a>, <a href=\"https://profiles.wordpress.org/stiofansisland/\">Stiofan</a>, <a href=\"https://profiles.wordpress.org/subrataemfluence/\">Subrata Sarkar</a>, <a href=\"https://profiles.wordpress.org/sum1/\">SUM1</a>, <a href=\"https://profiles.wordpress.org/quadthemes/\">Sunny</a>, <a href=\"https://profiles.wordpress.org/sunnyratilal/\">Sunny Ratilal</a>, <a href=\"https://profiles.wordpress.org/sushyant/\">Sushyant Zavarzadeh</a>, <a href=\"https://profiles.wordpress.org/suzylah/\">suzylah</a>, <a href=\"https://profiles.wordpress.org/cybr/\">Sybre Waaijer</a>, <a href=\"https://profiles.wordpress.org/synchro/\">Synchro</a>, <a href=\"https://profiles.wordpress.org/sergioestevao/\">Sérgio Estêvão</a>, <a href=\"https://profiles.wordpress.org/miyauchi/\">Takayuki Miyauchi</a>, <a href=\"https://profiles.wordpress.org/karmatosed/\">Tammie Lister</a>, <a href=\"https://profiles.wordpress.org/tangrufus/\">Tang Rufus</a>, <a href=\"https://profiles.wordpress.org/utz119/\">TeBenachi</a>, <a href=\"https://profiles.wordpress.org/tessawatkinsllc/\">Tessa Watkins LLC</a>, <a href=\"https://profiles.wordpress.org/wildworks/\">Tetsuaki Hamano</a>, <a href=\"https://profiles.wordpress.org/themiked/\">theMikeD</a>, <a href=\"https://profiles.wordpress.org/theolg/\">theolg</a>, <a href=\"https://profiles.wordpress.org/tweetythierry/\">Thierry Muller</a>, <a href=\"https://profiles.wordpress.org/thimalw/\">Thimal Wickremage</a>, <a href=\"https://profiles.wordpress.org/webzunft/\">Thomas M</a>, <a href=\"https://profiles.wordpress.org/tfrommen/\">Thorsten Frommen</a>, <a href=\"https://profiles.wordpress.org/thrijith/\">Thrijith Thankachan</a>, <a href=\"https://profiles.wordpress.org/tiagohillebrandt/\">Tiago Hillebrandt</a>, <a href=\"https://profiles.wordpress.org/tillkruess/\">Till Kr&#252;ss</a>, <a href=\"https://profiles.wordpress.org/timothyblynjacobs/\">Timothy Jacobs</a>, <a href=\"https://profiles.wordpress.org/tkama/\">Tkama</a>, <a href=\"https://profiles.wordpress.org/tmdesigned/\">tmdesigned</a>, <a href=\"https://profiles.wordpress.org/tmoore41/\">tmoore41</a>, <a href=\"https://profiles.wordpress.org/tobiasbg/\">TobiasBg</a>, <a href=\"https://profiles.wordpress.org/tobifjellner/\">tobifjellner (Tor-Bjorn Fjellner)</a>, <a href=\"https://profiles.wordpress.org/tofandel/\">Tofandel</a>, <a href=\"https://profiles.wordpress.org/tomdude/\">tomdude</a>, <a href=\"https://profiles.wordpress.org/tferry/\">Tommy Ferry</a>, <a href=\"https://profiles.wordpress.org/starbuck/\">Tony G</a>, <a href=\"https://profiles.wordpress.org/toro_unit/\">Toro_Unit (Hiroshi Urabe)</a>, <a href=\"https://profiles.wordpress.org/torres126/\">torres126</a>, <a href=\"https://profiles.wordpress.org/zodiac1978/\">Torsten Landsiedel</a>, <a href=\"https://profiles.wordpress.org/toru/\">Toru Miki</a>, <a href=\"https://profiles.wordpress.org/travisnorthcutt/\">Travis Northcutt</a>, <a href=\"https://profiles.wordpress.org/treecutter/\">treecutter</a>, <a href=\"https://profiles.wordpress.org/truongwp/\">truongwp</a>, <a href=\"https://profiles.wordpress.org/tsimmons/\">tsimmons</a>, <a href=\"https://profiles.wordpress.org/dinhtungdu/\">Tung Du</a>, <a href=\"https://profiles.wordpress.org/desaiuditd/\">Udit Desai</a>, <a href=\"https://profiles.wordpress.org/grapplerulrich/\">Ulrich</a>, <a href=\"https://profiles.wordpress.org/vagios/\">Vagios Vlachos</a>, <a href=\"https://profiles.wordpress.org/valchovski/\">valchovski</a>, <a href=\"https://profiles.wordpress.org/valentinbora/\">Valentin Bora</a>, <a href=\"https://profiles.wordpress.org/vayu/\">Vayu Robins</a>, <a href=\"https://profiles.wordpress.org/veromary/\">veromary</a>, <a href=\"https://profiles.wordpress.org/szepeviktor/\">Viktor Sz&#233;pe</a>, <a href=\"https://profiles.wordpress.org/vinkla/\">vinkla</a>, <a href=\"https://profiles.wordpress.org/virginienacci/\">virginienacci</a>, <a href=\"https://profiles.wordpress.org/planvova/\">Vladimir</a>, <a href=\"https://profiles.wordpress.org/vabrashev/\">Vladislav Abrashev</a>, <a href=\"https://profiles.wordpress.org/vortfu/\">vortfu</a>, <a href=\"https://profiles.wordpress.org/voyager131/\">voyager131</a>, <a href=\"https://profiles.wordpress.org/vtieu/\">vtieu</a>, <a href=\"https://profiles.wordpress.org/webaware/\">webaware</a>, <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>, <a href=\"https://profiles.wordpress.org/earnjam/\">William Earnhardt</a>, <a href=\"https://profiles.wordpress.org/williampatton/\">williampatton</a>, <a href=\"https://profiles.wordpress.org/planningwrite/\">Winstina</a>, <a href=\"https://profiles.wordpress.org/wittich/\">wittich</a>, <a href=\"https://profiles.wordpress.org/wpdesk/\">wpdesk</a>, <a href=\"https://profiles.wordpress.org/wpdo5ea/\">WPDO</a>, <a href=\"https://profiles.wordpress.org/alexandreb3/\">WPMarmite</a>, <a href=\"https://profiles.wordpress.org/wppinar/\">wppinar</a>, <a href=\"https://profiles.wordpress.org/yahil/\">Yahil Madakiya</a>, <a href=\"https://profiles.wordpress.org/yashrs/\">yashrs</a>, <a href=\"https://profiles.wordpress.org/yoancutillas/\">yoancutillas</a>, <a href=\"https://profiles.wordpress.org/yoavf/\">Yoav Farhi</a>, <a href=\"https://profiles.wordpress.org/yohannp/\">yohannp</a>, <a href=\"https://profiles.wordpress.org/yuhin/\">yuhin</a>, <a href=\"https://profiles.wordpress.org/fierevere/\">Yui</a>, <a href=\"https://profiles.wordpress.org/ysalame/\">Yuri Salame</a>, <a href=\"https://profiles.wordpress.org/yvettesonneveld/\">Yvette Sonneveld</a>, <a href=\"https://profiles.wordpress.org/tollmanz/\">Zack Tollman</a>, <a href=\"https://profiles.wordpress.org/zaheerahmad/\">zaheerahmad</a>, <a href=\"https://profiles.wordpress.org/zakkath/\">zakkath</a>, <a href=\"https://profiles.wordpress.org/zebulan/\">Zebulan Stanphill</a>, <a href=\"https://profiles.wordpress.org/zieladam/\">zieladam</a>, and <a href=\"https://profiles.wordpress.org/chesio/\">Česlav Przywara</a>.\n\n\n\n<p>&nbsp;</p>\n\n\n\n<p>Many thanks to all of the community volunteers who contribute in the&nbsp;<a href=\"https://wordpress.org/support/\">support forums</a>. They answer questions from people across the world, whether they are using WordPress for the first time or since the first release. These releases are more successful for their efforts!</p>\n\n\n\n<p>Finally, thanks to all the community translators who worked on WordPress 5.5. Their efforts bring WordPress fully translated to&nbsp;46 languages at release time, with more on the way.</p>\n\n\n\n<p>If you want to learn more about volunteering with WordPress, check out&nbsp;<a href=\"https://make.wordpress.org/\">Make WordPress</a>&nbsp;or the&nbsp;<a href=\"https://make.wordpress.org/core/\">core development blog</a>.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:2%\"></div>\n</div>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8799\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:63:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"WordPress 5.5 Release Candidate 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"https://wordpress.org/news/2020/08/wordpress-5-5-release-candidate-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 04 Aug 2020 19:12:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8764\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:420:\"The second release candidate for WordPress 5.5 is here! WordPress 5.5 is slated for release&#160;on&#160;August 11, 2020, but we need&#160;your&#160;help to get there—if you haven’t tried 5.5 yet,&#160;now is the time! You can test the WordPress 5.5 release candidate in two ways: Try the&#160;WordPress Beta Tester&#160;plugin (choose the “bleeding edge nightlies” option) Or&#160;download the release [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jake Spurlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2503:\"\n<p>The second release candidate for WordPress 5.5 is here!</p>\n\n\n\n<p>WordPress 5.5 is slated for release&nbsp;on&nbsp;<strong>August 11, 2020</strong>, but we need&nbsp;<em>your</em>&nbsp;help to get there—if you haven’t tried 5.5 yet,&nbsp;now is the time!</p>\n\n\n\n<p>You can test the WordPress 5.5 release candidate in two ways:</p>\n\n\n\n<ul><li>Try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (choose the “bleeding edge nightlies” option)</li><li>Or&nbsp;<a href=\"https://wordpress.org/wordpress-5.5-RC2.zip\">download the release candidate here (zip)</a>.</li></ul>\n\n\n\n<p>Thank you to all of the contributors who tested the&nbsp;Beta releases and gave feedback. Testing for bugs is a critical part of polishing every release and a great way to contribute to WordPress.</p>\n\n\n\n<h2>Plugin and Theme Developers</h2>\n\n\n\n<p>Please test your plugins and themes against WordPress 5.5 and update the&nbsp;<em>Tested up to</em>&nbsp;version in the readme file to 5.5. If you find compatibility problems, please be sure to post to the&nbsp;<a href=\"https://wordpress.org/support/forum/alphabeta/\">support forums</a>,&nbsp;so those can be figured out before the final release.</p>\n\n\n\n<p>For a more detailed breakdown of the changes included in WordPress 5.5, check out the <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-1/\">WordPress 5.5 beta 1 post</a>. The&nbsp;<a href=\"https://make.wordpress.org/core/2020/07/30/wordpress-5-5-field-guide/\">WordPress 5.5 Field Guide</a>&nbsp;is also out! It’s your source for details on all the major changes.</p>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a>&nbsp;This release also marks the&nbsp;<a href=\"https://make.wordpress.org/polyglots/handbook/glossary/#hard-freeze\">hard string freeze</a>&nbsp;point of the 5.5 release schedule.</p>\n\n\n\n<p><em><strong>If you think you’ve found a bug</strong>, you can post to the&nbsp;<a href=\"https://wordpress.org/support/forum/alphabeta\">Alpha/Beta area</a>&nbsp;in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;<a href=\"https://make.wordpress.org/core/reports/\">fill one on WordPress Trac</a>, where you can also find&nbsp;<a href=\"https://core.trac.wordpress.org/tickets/major\">a list of known bugs</a>.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8764\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:57:\"\n		\n		\n		\n		\n		\n				\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"The Month in WordPress: July 2020\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:68:\"https://wordpress.org/news/2020/08/the-month-in-wordpress-july-2020/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 03 Aug 2020 13:54:23 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Month in WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8755\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:340:\"July was an action-packed month for the WordPress project. The month saw a lot of updates on one of the most anticipated releases &#8211; WordPress 5.5! WordCamp US 2020 was canceled and the WordPress community team started experimenting with different formats for engaging online events, in July. Read on to catch up with all the [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Hari Shanker R\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:11539:\"\n<p>July was an action-packed month for the WordPress project. The month saw a lot of updates on one of the most anticipated releases &#8211; WordPress 5.5! WordCamp US 2020 was canceled and the WordPress community team started experimenting with different formats for engaging online events, in July. Read on to catch up with all the updates from the WordPress world.</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>WordPress 5.5 Updates</h2>\n\n\n\n<p>July was full of WordPress 5.5 updates! The WordPress 5.5 <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-1\">Beta 1</a> came out on July 7, followed by <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-2/\">Beta 2</a> on July 14, <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-3/\">Beta 3</a> on July 21, and <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-4/\">Beta 4</a> on July 27. Subsequently, the team also published the first <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-release-candidate/\">release candidate</a> of WordPress 5.5 on July 28.&nbsp;</p>\n\n\n\n<p>WordPress 5.5, which is slated for release on <a href=\"https://make.wordpress.org/core/5-5/\">August 11, 2020</a>, is a major update with features like <a href=\"https://make.wordpress.org/core/tag/feature-autoupdates/\">automatic updates for plugins and themes</a>, a <a href=\"https://make.wordpress.org/plugins/2020/07/22/proposed-block-directory-guidelines/\">block directory</a>, <a href=\"https://make.wordpress.org/core/2020/06/10/merge-announcement-extensible-core-sitemaps/\">XML sitemaps</a>, <a href=\"https://make.wordpress.org/core/2020/07/16/block-patterns-in-wordpress-5-5/\">block patterns</a>, and <a href=\"https://make.wordpress.org/core/2020/07/14/lazy-loading-images-in-5-5/\">lazy-loading images</a>, among others. To learn more about the release, check out its <a href=\"https://make.wordpress.org/core/2020/07/30/wordpress-5-5-field-guide/\">field guide post</a>.</p>\n\n\n\n<p>Want to get involved in building WordPress Core? Follow<a href=\"https://make.wordpress.org/core/\"> the Core team blog</a>, and join the #core channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Gutenberg 8.5 and 8.6</h2>\n\n\n\n<p>The core team launched Gutenberg <a href=\"https://make.wordpress.org/core/2020/07/08/whats-new-in-gutenberg-8-july/\">8.5</a> and <a href=\"https://make.wordpress.org/core/2020/07/22/whats-new-in-gutenberg-july-22/\">8.6</a>. Version 8.5 &#8211; the last plugin release will be included entirely (without experimental features) in WordPress 5.5, introduced improvements to block drag-and-drop and accessibility, easier updates for external images, and support for the block directory. Version 8.6 comes with features like Cover block video position controls and block pattern updates. For full details on the latest versions on these Gutenberg releases, visit these posts about <a href=\"https://make.wordpress.org/core/2020/07/08/whats-new-in-gutenberg-8-july/\">8.5</a> and <a href=\"https://make.wordpress.org/core/2020/07/22/whats-new-in-gutenberg-july-22/\">8.6</a>.</p>\n\n\n\n<p>Want to get involved in building Gutenberg? Follow <a href=\"https://make.wordpress.org/core/\">the Core team blog</a>, contribute to <a href=\"https://github.com/WordPress/gutenberg/\">Gutenberg on GitHub</a>, and join the #core-editor channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Reimagining Online WordPress Events</h2>\n\n\n\n<p>The Community team made the difficult decision <a href=\"https://make.wordpress.org/community/2020/07/27/in-person-events-in-rest-of-year-2020/\">to suspend in-person WordPress events for the rest of 2020</a> in light of the COVID-19 pandemic. The team has also started working on <a href=\"https://make.wordpress.org/community/2020/07/13/reimagining-online-events/\">reimagining online events</a>. Based on <a href=\"https://make.wordpress.org/community/2020/07/13/reimagining-online-events/#comment-28505\">feedback from the community members</a>, the team decided to <a href=\"https://make.wordpress.org/community/2020/07/23/moving-forward-with-online-events/\">make changes to the current online WordCamp format</a>. Key changes include wrapping up financial support for A/V vendors, ending event swag support for newer online WordCamps, and suspending the Global Community Sponsorship program for 2020. The team encourages upcoming online WordCamps to experiment with their events to facilitate an effective learning experience for attendees while avoiding online event fatigue. The team is currently working on a proposal to organize community-supported <a href=\"https://make.wordpress.org/community/2020/07/23/building-community-beyond-events/\">recorded workshops and synchronous discussion groups</a> to help community members learn WordPress.<br><br>Want to get involved with the Community team? <a href=\"https://make.wordpress.org/community/\">Follow the Community blog here</a>, or join them in the #community-events channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>. To organize a Meetup or WordCamp, <a href=\"https://make.wordpress.org/community/handbook/virtual-events/welcome/applying-for-a-virtual-event/\">visit the handbook page</a>.&nbsp;</p>\n\n\n\n<h2>WordCamp US 2020 is canceled</h2>\n\n\n\n<p>The organizers of WordCamp US 2020 have <a href=\"https://2020.us.wordcamp.org/2020/07/30/wcus-2020-an-update/\">canceled the event</a> in light of the continued pandemic and online event fatigue. The flagship event, which was originally scheduled for October 27-29 as an in-person event, had already planned to transition to an online event. Several WCUS Organizers will be working with the WordPress Community team to focus on other formats and ideas for online events, including a 24-hour contributor day, and contributing to the workshops initiative <a href=\"https://make.wordpress.org/community/2020/07/23/building-community-beyond-events/\">currently being discussed</a>. Matt Mullenweg’s State of the Word (which typically accompanies WordCamp US) is likely to take place in a different format later in 2020.</p>\n\n\n\n<h2>Plugin and theme updates are now available over zip files</h2>\n\n\n\n<p>After eleven years, WordPress now allows users to update plugins and themes by <a href=\"https://core.trac.wordpress.org/changeset/48390\">uploading a ZIP file, in WordPress 5.5</a>.&nbsp; The feature, which was merged on July 7, has been one of the most requested features in WordPress. Now, when a user tries to upload a plugin or theme zip file from the WordPress dashboard by clicking the “Install Now” button, WordPress will direct users to a new screen that compares the currently-installed extension with the uploaded versions. Users can then choose between continuing with the installation or canceling. WordPress 5.5 will also offer <a href=\"https://make.wordpress.org/core/tag/feature-autoupdates/\">automatic plugin and theme updates</a>.&nbsp;</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Reading:</h2>\n\n\n\n<ul><li>The <a href=\"https://make.wordpress.org/plugins/2020/07/22/proposed-block-directory-guidelines/\">Block directory</a> is coming to WordPress with the 5.5 release. Plugin authors can now <a href=\"https://make.wordpress.org/plugins/2020/07/11/you-can-now-add-your-own-plugins-to-the-block-directory/\">submit their Block plugins to the directory</a>.</li><li>The Core team has opened up the <a href=\"https://make.wordpress.org/core/2020/07/31/wordpress-5-6-whats-on-your-wishlist/\">call for features</a> in the WordPress 5.6 release. You can <a href=\"https://make.wordpress.org/core/2020/07/31/wordpress-5-6-whats-on-your-wishlist/\">comment on the post</a> with features that you’d like to be included, current UX pain points, or maintenance tickets that need to be addressed. August 20 is the deadline for feature requests. </li><li>Editor features such as the new Navigation block, the navigation screen, and the widget screen that were originally <a href=\"https://make.wordpress.org/updates/2020/03/06/update-progress-on-goals/\">planned to be merged with WordPress 5.5</a> have been <a href=\"https://make.wordpress.org/core/2020/07/02/editor-features-for-wordpress-5-5-update/\">pushed for the next release</a>. </li><li>The Theme team is inviting proposals on whether to allow themes to <a href=\"https://make.wordpress.org/themes/2020/07/13/proposal-allow-themes-to-add-a-top-level-admin-menu/\">place an additional top-level menu link</a> in the admin.</li><li><a href=\"https://buddypress.org/2020/07/buddypress-6-2-0-beta/\">BuddyPress 6.2 beta </a>is out in the wild, and the team will soon release the stable version. The update includes changes that will make BuddyPress fully compatible with WordPress 5.5.</li><li>WordCamp EU 2021, which was being planned as an in-person event in Porto, Portugal, <a href=\"https://europe.wordcamp.org/2021/wordcamp-europe-2021-will-be-online/\">is moving online</a>. The team is considering an in-person WordCamp EU in 2022. </li><li>The Polyglots team has prepared and finalized a <a href=\"https://make.wordpress.org/polyglots/2020/07/09/translation-editor-locale-manager-vetting-criteria-page-draft/\">Translation Editor &amp; Locale Manager Vetting Criteria</a> to provide more clarity on how global mentors assign PTE/GTE/Locale Managers and to help locale teams set their own guidelines. The document, which was finalized <a href=\"https://make.wordpress.org/polyglots/2020/07/09/translation-editor-locale-manager-vetting-criteria-page-draft/\">after a lot of discussion</a>, is now available in the <a href=\"https://make.wordpress.org/polyglots/handbook/translating/expectations/translation-editor-locale-manager-vetting-criteria/\">Polyglots handbook</a>.</li><li>Members of the Community team <a href=\"https://make.wordpress.org/community/2020/07/03/proposal-recognition-for-event-volunteers-and-attendees-in-wordpress-org-profile/\">are discussing</a> whether WordCamp volunteers, WordCamp attendees, or Meetup attendees should be awarded a WordPress.org profile badge. The ongoing discussion will be open for comments until August 13.</li><li>The <a href=\"https://make.wordpress.org/core/tag/feature-notifications/\">WP Notify project</a>, which aims to create a better way to manage and deliver notifications to the relevant audience, is on to its next steps. The team has finalized the initial requirements, and is <a href=\"https://make.wordpress.org/core/2020/07/09/wp-notify-next-steps/\">kicking off the project build</a>.</li><li>The WordPress documentation team is <a rel=\"noreferrer noopener\" href=\"https://make.wordpress.org/docs/tag/external-linking-policy/\" target=\"_blank\">considering a ban on links to commercial websites</a> in a revision to its external linking policy. The policy change does not remove external links to commercial sites from WordPress.org and only applies to documentation sites. The idea is to protect documentation from being abused, and to prevent the WordPress project from being biased. Discussion on this post is still ongoing, and a decision has not yet been made. Feel free to<a href=\"https://make.wordpress.org/docs/tag/external-linking-policy/\"> comment on the discussion posts</a>, if you would like to share your thoughts on the topic. </li></ul>\n\n\n\n<p><em>Have a story that we should include in the next “Month in WordPress” post? Please </em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><em>submit it here</em></a><em>.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8755\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:63:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"WordPress 5.5 Release Candidate\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"https://wordpress.org/news/2020/07/wordpress-5-5-release-candidate/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 28 Jul 2020 19:08:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8732\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:370:\"The first release candidate for WordPress 5.5 is now available! This is an important milestone in the community&#8217;s progress toward the final release of WordPress 5.5. “Release Candidate” means that the new version is ready for release, but with millions of users and thousands of plugins and themes, it’s possible something was missed. WordPress 5.5 [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"Jb Audras\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2970:\"\n<p>The first release candidate for WordPress 5.5 is now available!</p>\n\n\n\n<p>This is an important milestone in the community&#8217;s progress toward the final release of WordPress 5.5. </p>\n\n\n\n<p>“Release Candidate” means that the new version is ready for release, but with millions of users and thousands of plugins and themes, it’s possible something was missed. WordPress 5.5 is slated for release&nbsp;on&nbsp;<strong>August 11, 2020</strong>, but we need&nbsp;<em>your</em>&nbsp;help to get there—if you haven’t tried 5.5 yet,&nbsp;<strong>now is the time</strong>!</p>\n\n\n\n<p>You can test the WordPress 5.5 release candidate in two ways:</p>\n\n\n\n<ul><li>Try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (choose the “bleeding edge nightlies” option)</li><li>Or&nbsp;<a href=\"https://wordpress.org/wordpress-5.5-RC1.zip\">download the release candidate here (zip)</a>.</li></ul>\n\n\n\n<p>Thank you to all of the contributors who tested the&nbsp;Beta releases and gave feedback. Testing for bugs is a critical part of polishing every release and a great way to contribute to WordPress.</p>\n\n\n\n<h2>What’s in WordPress 5.5?</h2>\n\n\n\n<p>WordPress 5.5 has lots of refinements to polish the developer experience. To keep up, subscribe to the&nbsp;<a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a>&nbsp;and pay special attention to the&nbsp;<a href=\"https://make.wordpress.org/core/tag/5-5+dev-notes/\">developer notes</a>&nbsp;tag for updates on those and other changes that could affect your products.</p>\n\n\n\n<h2>Plugin and Theme Developers</h2>\n\n\n\n<p>Please test your plugins and themes against WordPress 5.5 and update the&nbsp;<em>Tested up to</em>&nbsp;version in the readme file to 5.5. If you find compatibility problems, please be sure to post to the&nbsp;<a href=\"https://wordpress.org/support/forum/alphabeta/\">support forums</a>,&nbsp;so those can be figured out before the final release.</p>\n\n\n\n<p>The&nbsp;WordPress 5.5 Field Guide, due very shortly, will give you a more detailed dive into the major changes.</p>\n\n\n\n<h2>How to Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev\">Help us translate WordPress into more than 100 languages!</a>&nbsp;This release also marks the <a href=\"https://make.wordpress.org/polyglots/handbook/glossary/#hard-freeze\">hard string freeze</a>&nbsp;point of the 5.5 release schedule.</p>\n\n\n\n<p><em><strong>If you think you’ve found a bug</strong>, you can post to the <a href=\"https://wordpress.org/support/forum/alphabeta\">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href=\"https://make.wordpress.org/core/reports/\">fill one on WordPress Trac</a>, where you can also find <a href=\"https://core.trac.wordpress.org/tickets/major\">a list of known bugs</a>.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8732\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:63:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 5.5 Beta 4\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-4/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 27 Jul 2020 20:56:46 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8719\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:313:\"WordPress 5.5 Beta 4 is now available! This software is still in development, so it’s not recommended to run this version on a production site. Consider setting up a test site to play with the new version. You can test WordPress 5.5 Beta 4 in two ways: Try the WordPress Beta Tester plugin (choose the [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"David Baumwald\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3812:\"\n<p>WordPress 5.5 Beta 4 is now available!</p>\n\n\n\n<p id=\"block-81bd56b9-ea44-43ad-ab36-a5ae78b54375\"><strong>This software is still in development,</strong> so it’s not recommended to run this version on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p id=\"block-7cc1bbc6-17f9-44c5-8f67-da4e3059ad69\">You can test WordPress 5.5 Beta 4 in two ways:</p>\n\n\n\n<ul id=\"block-4840af57-f44b-4d9f-aa64-c6a452392e42\"><li>Try the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> plugin (choose the “bleeding edge nightlies” option)</li><li>Or <a href=\"https://wordpress.org/wordpress-5.5-beta4.zip\">download the beta here</a> (zip).</li></ul>\n\n\n\n<p id=\"block-a40528cb-eb3b-4c8a-8f5e-aa700f1ba086\">WordPress 5.5 is slated for release on <a href=\"https://make.wordpress.org/core/5-5/\">August 11th, 2020</a>, and <strong>we need your help to get there</strong>!</p>\n\n\n\n<p>Thank you to all of the contributors who tested the <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-3/\">beta 3</a> development release and gave feedback. Testing for bugs is a critical part of polishing every release and a great way to contribute to WordPress. </p>\n\n\n\n<h2 id=\"block-15d6d57f-905d-4a47-9f66-839468a5375a\">Some highlights</h2>\n\n\n\n<p id=\"block-85da84ec-c841-42f9-8d3b-1a4537a61d10\">Since <a href=\"https://wordpress.org/news/2020/02/wordpress-5-4-beta-3/\">beta 3</a>, <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=07%2F22%2F2020..07%2F28%2F2020&amp;milestone=5.5&amp;group=component&amp;col=id&amp;col=summary&amp;col=owner&amp;col=type&amp;col=priority&amp;col=component&amp;col=version&amp;order=priority\">43 bugs</a> have been fixed. Here are a few changes in beta 4:</p>\n\n\n\n<ul><li>Add <code>\"loading\"</code> as an allowed kses image attribute (see <a href=\"https://core.trac.wordpress.org/ticket/50731\">#50731</a>).</li><li>Add filter for the plugin/theme auto-update message in the Info tab of Site health (see <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://core.trac.wordpress.org/ticket/50663\">#50663</a>).</li><li><code>$_SERVER[\'SERVER_NAME\']</code> not a reliable when generating email host names (see <a href=\"https://core.trac.wordpress.org/ticket/25239\">#25239</a>)</li><li>Several backported fixes from Gutenberg are included in WordPress 5.5 Beta 4 (<a href=\"https://github.com/WordPress/gutenberg/pull/24218\">See PR #24218</a>)</li></ul>\n\n\n\n<h2 id=\"block-76156b2b-0a52-4502-b585-6cbe9481f55b\">Developer notes</h2>\n\n\n\n<p id=\"block-3fe5e264-0a95-4f12-9a18-0cb9dc5955d1\">WordPress 5.5 has lots of refinements to polish the developer experience. To keep up, subscribe to the <a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a> and pay special attention to the <a href=\"https://make.wordpress.org/core/tag/5-5+dev-notes/\">developers’ notes</a> for updates on those and other changes that could affect your products.</p>\n\n\n\n<h2 id=\"block-bc89fd56-47b0-439f-8e2c-4a642c80a616\">How to Help</h2>\n\n\n\n<p id=\"block-3ff83a77-8b54-4061-ae2d-45fc984cbd76\">Do you speak a language other than English? <a href=\"https://translate.wordpress.org/projects/wp/dev/\">Help translate WordPress into more than 100 languages</a>!</p>\n\n\n\n<p id=\"block-9d871099-ec49-446c-8322-9e49b7498c10\">If you think you’ve found a bug, you can post to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta area</a> in the support forums. We’d love to hear from you!</p>\n\n\n\n<p id=\"block-bd71c1d3-39d9-4b2a-8193-3486497b45fd\">If you’re comfortable writing a reproducible bug report, <a href=\"https://core.trac.wordpress.org/newticket\">file one on WordPress Trac</a>, where you can also find a list of <a href=\"https://core.trac.wordpress.org/tickets/major\">known bugs</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8719\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:63:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 5.5 Beta 3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-3/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 21 Jul 2020 17:51:31 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8706\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:324:\"WordPress 5.5 Beta 3 is now available! This software is still in development,so it’s not recommended to run this version on a production site. Consider setting up a test site to play with the new version. You can test WordPress 5.5 Beta 3 in two ways: Try the WordPress Beta Tester plugin (choose the “bleeding [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jake Spurlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3876:\"\n<p>WordPress 5.5 Beta 3 is now available!</p>\n\n\n\n<p id=\"block-81bd56b9-ea44-43ad-ab36-a5ae78b54375\"><strong>This software is still in development,</strong>so it’s not recommended to run this version on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p id=\"block-7cc1bbc6-17f9-44c5-8f67-da4e3059ad69\">You can test WordPress 5.5 Beta 3 in two ways:</p>\n\n\n\n<ul id=\"block-4840af57-f44b-4d9f-aa64-c6a452392e42\"><li>Try the <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> plugin (choose the “bleeding edge nightlies” option)</li><li>Or <a href=\"https://wordpress.org/wordpress-5.5-beta3.zip\">download the beta here</a> (zip).</li></ul>\n\n\n\n<p id=\"block-a40528cb-eb3b-4c8a-8f5e-aa700f1ba086\">WordPress 5.5 is slated for release on <a href=\"https://make.wordpress.org/core/5-5/\">August 11th, 2020</a>, and <strong>we need your help to get there</strong>!</p>\n\n\n\n<p>Thank you to all of the contributors who tested the <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-2/\">beta 2</a> development release and gave feedback. Testing for bugs is a critical part of polishing every release and a great way to contribute to WordPress. </p>\n\n\n\n<h2 id=\"block-15d6d57f-905d-4a47-9f66-839468a5375a\">Some highlights</h2>\n\n\n\n<p id=\"block-85da84ec-c841-42f9-8d3b-1a4537a61d10\">Since <a href=\"https://wordpress.org/news/2020/02/wordpress-5-4-beta-2/\">beta 2</a>, <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=07%2F15%2F2020..07%2F21%2F2020&amp;milestone=5.5&amp;group=component&amp;col=id&amp;col=summary&amp;col=owner&amp;col=type&amp;col=priority&amp;col=component&amp;col=version&amp;order=priority\">43 bugs</a> have been fixed. Here are a few changes in beta 3:</p>\n\n\n\n<ul><li>Plugin and theme versions are now shared in the emails when automatically updated (see <a href=\"https://core.trac.wordpress.org/ticket/50350\">#50350</a>).</li><li>REST API routes without a <code>permission_callback</code> now trigger a <code>_doing_it_wrong()</code> warning (see <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://core.trac.wordpress.org/ticket/50075\">#50075</a>).</li><li>Over 23 Gutenberg changes and updates (see <a href=\"https://github.com/WordPress/gutenberg/pull/24068\">#24068</a> and <a href=\"https://core.trac.wordpress.org/ticket/50712\">#50712</a>).</li><li>A bug with the new import and export database Dashicons has been fixed (see <a href=\"https://core.trac.wordpress.org/ticket/49913\">#49913</a>).</li></ul>\n\n\n\n<h2 id=\"block-76156b2b-0a52-4502-b585-6cbe9481f55b\">Developer notes</h2>\n\n\n\n<p id=\"block-3fe5e264-0a95-4f12-9a18-0cb9dc5955d1\">WordPress 5.5 has lots of refinements to polish the developer experience. To keep up, subscribe to the <a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a> and pay special attention to the <a href=\"https://make.wordpress.org/core/tag/5-5+dev-notes/\">developers’ notes</a> for updates on those and other changes that could affect your products.</p>\n\n\n\n<h2 id=\"block-bc89fd56-47b0-439f-8e2c-4a642c80a616\">How to Help</h2>\n\n\n\n<p id=\"block-3ff83a77-8b54-4061-ae2d-45fc984cbd76\">Do you speak a language other than English? <a href=\"https://translate.wordpress.org/projects/wp/dev/\">Help translate WordPress into more than 100 languages</a>!</p>\n\n\n\n<p id=\"block-9d871099-ec49-446c-8322-9e49b7498c10\">If you think you’ve found a bug, you can post to the <a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta area</a> in the support forums. We’d love to hear from you!</p>\n\n\n\n<p id=\"block-bd71c1d3-39d9-4b2a-8193-3486497b45fd\">If you’re comfortable writing a reproducible bug report, <a href=\"https://core.trac.wordpress.org/newticket\">file one on WordPress Trac</a>, where you can also find a list of <a href=\"https://core.trac.wordpress.org/tickets/major\">known bugs</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8706\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:63:\"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 5.5 Beta 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 14 Jul 2020 17:24:13 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:3:{i:0;a:5:{s:4:\"data\";s:11:\"Development\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Releases\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:3:\"5.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=8681\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:358:\"WordPress 5.5 Beta 2 is now available! This software is still in development,&#160;so it’s not recommended to run this version on a production site. Consider setting up a test site to play with the new version. You can test WordPress 5.5 beta 2 in two ways: Try the&#160;WordPress Beta Tester&#160;plugin (choose the “bleeding edge nightlies” [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Jake Spurlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4552:\"\n<p id=\"block-000046ff-d8e6-40a8-9869-2dd39e50f270\"><br>WordPress 5.5 Beta 2 is now available!</p>\n\n\n\n<p id=\"block-81bd56b9-ea44-43ad-ab36-a5ae78b54375\"><strong><strong>This software is still in development,</strong>&nbsp;</strong>so it’s not recommended to run this version on a production site. Consider setting up a test site to play with the new version.</p>\n\n\n\n<p id=\"block-7cc1bbc6-17f9-44c5-8f67-da4e3059ad69\">You can test WordPress 5.5 beta 2 in two ways:</p>\n\n\n\n<ul id=\"block-4840af57-f44b-4d9f-aa64-c6a452392e42\"><li>Try the&nbsp;<a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a>&nbsp;plugin (choose the “bleeding edge nightlies” option)</li><li>Or&nbsp;<a href=\"https://wordpress.org/wordpress-5.5-beta2.zip\">download the beta here</a>&nbsp;(zip).</li></ul>\n\n\n\n<p id=\"block-a40528cb-eb3b-4c8a-8f5e-aa700f1ba086\">WordPress 5.5 is slated for release on&nbsp;<a href=\"https://make.wordpress.org/core/5-5/\">August 11th, 2020</a>, and <strong>we need your help to get there</strong>!</p>\n\n\n\n<p>Thank you to all of the contributors that tested the <a href=\"https://wordpress.org/news/2020/07/wordpress-5-5-beta-1/\">beta 1</a> development release and provided feedback. Testing for bugs is an important part of polishing each release and a great way to contribute to WordPress. Here are some of the changes since beta 1 to pay close attention to while testing.</p>\n\n\n\n<h2 id=\"block-15d6d57f-905d-4a47-9f66-839468a5375a\">Some highlights</h2>\n\n\n\n<p id=\"block-85da84ec-c841-42f9-8d3b-1a4537a61d10\">Since <a href=\"https://wordpress.org/news/2020/02/wordpress-5-4-beta-1/\">beta 1</a>, <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=07%2F08%2F2020..07%2F14%2F2020&amp;milestone=5.5&amp;group=component&amp;col=id&amp;col=summary&amp;col=owner&amp;col=type&amp;col=priority&amp;col=component&amp;col=version&amp;order=priority\">48 bugs</a> have been fixed. Here is a summary of a few changes included in beta 2:</p>\n\n\n\n<ul><li>19 additional bugs have been fixed in the block editor (see <a href=\"https://github.com/WordPress/gutenberg/pull/23903\">#23903</a> and <a href=\"https://github.com/WordPress/gutenberg/pull/23905\">#23905</a>).</li><li>The Dashicons icon font has been updated (see <a href=\"https://core.trac.wordpress.org/ticket/49913\">#49913</a>).</li><li>Broken widgets stemming from changes in Beta 1 have been fixed (see <a href=\"https://core.trac.wordpress.org/ticket/50609\">#50609</a>).</li><li>Query handling when counting revisions has been improved (see <a href=\"https://core.trac.wordpress.org/ticket/34560\">#34560</a>).</li><li>An alternate, expanded view was added for <code>wp_list_table</code> (see <a href=\"https://core.trac.wordpress.org/ticket/49715\">#49715</a>).</li><li>Some adjustments were made to the handling of default terms for custom taxonomies (see <a href=\"https://core.trac.wordpress.org/ticket/43517\">#43517</a>)</li></ul>\n\n\n\n<p>Several updates have been made to the block editor. For details, see <a href=\"https://github.com/WordPress/gutenberg/pull/23903\">#23903</a> and <a href=\"https://github.com/WordPress/gutenberg/pull/23905\">#23905</a>.</p>\n\n\n\n<h2 id=\"block-76156b2b-0a52-4502-b585-6cbe9481f55b\">Developer notes</h2>\n\n\n\n<p id=\"block-3fe5e264-0a95-4f12-9a18-0cb9dc5955d1\">WordPress 5.5 has lots of refinements to polish the developer experience. To keep up, subscribe to the&nbsp;<a href=\"https://make.wordpress.org/core/\">Make WordPress Core blog</a>&nbsp;and pay special attention to the&nbsp;<a href=\"https://make.wordpress.org/core/tag/5-5+dev-notes/\">developers’ notes</a>&nbsp;for updates on those and other changes that could affect your products.</p>\n\n\n\n<h2 id=\"block-bc89fd56-47b0-439f-8e2c-4a642c80a616\">How to Help</h2>\n\n\n\n<p id=\"block-3ff83a77-8b54-4061-ae2d-45fc984cbd76\">Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp/dev/\">Help us translate WordPress into more than 100 languages</a>!</p>\n\n\n\n<p id=\"block-9d871099-ec49-446c-8322-9e49b7498c10\">If you think you’ve found a bug, you can post to the&nbsp;<a href=\"https://wordpress.org/support/forum/alphabeta/\">Alpha/Beta area</a>&nbsp;in the support forums. We’d love to hear from you!</p>\n\n\n\n<p id=\"block-bd71c1d3-39d9-4b2a-8193-3486497b45fd\">If you’re comfortable writing a reproducible bug report,&nbsp;<a href=\"https://core.trac.wordpress.org/newticket\">file one on WordPress Trac</a>,&nbsp;where you can also find a list of&nbsp;<a href=\"https://core.trac.wordpress.org/tickets/major\">known bugs</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"8681\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:32:\"https://wordpress.org/news/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:4:\"site\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"14607090\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:9:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Mon, 19 Oct 2020 06:12:13 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:25:\"strict-transport-security\";s:11:\"max-age=360\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Fri, 02 Oct 2020 09:34:04 GMT\";s:4:\"link\";s:63:\"<https://wordpress.org/news/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 1\";}}s:5:\"build\";s:14:\"20200501142607\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(365, '_transient_timeout_feed_mod_9bbd59226dc36b9b26cd43f15694c5c3', '1603131136', 'no'),
(366, '_transient_feed_mod_9bbd59226dc36b9b26cd43f15694c5c3', '1603087936', 'no'),
(367, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1603131139', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(368, '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:61:\"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"WordPress Planet\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:28:\"http://planet.wordpress.org/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"en\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:47:\"WordPress Planet - http://planet.wordpress.org/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:50:{i:0;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"BuddyPress: BuddyPress 7.0.0-beta1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://buddypress.org/?p=315150\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"https://buddypress.org/2020/10/buddypress-7-0-0-beta1/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4332:\"<p><a href=\"https://downloads.wordpress.org/plugin/buddypress.7.0.0-beta1.zip\">BuddyPress 7.0.0-beta1</a> is now available for testing!</p>\n\n\n\n<p>Please note the plugin is&nbsp;<strong>still in development</strong>, so we recommend running this beta release on a&nbsp;<strong>testing site</strong>.</p>\n\n\n\n<p>You can test BuddyPress 7.0.0-beta1 in 4 ways :</p>\n\n\n\n<ul><li>Try the <a href=\"https://wordpress.org/plugins/bp-beta-tester/\">BP Beta Tester</a> plugin.</li><li><a href=\"https://downloads.wordpress.org/plugin/buddypress.7.0.0-beta1.zip\">Download the beta here (zip file)</a>.</li><li>Check out our SVN repository: <code>svn co https://buddypress.svn.wordpress.org/trunk/</code></li><li>Clone our read-only Git repository: <code>git clone git://buddypress.git.wordpress.org/</code></li></ul>\n\n\n\n<p><strong>The 7.0.0 stable release is slated to the beginning of December, and we’d love you to give us a hand to get there!</strong></p>\n\n\n\n<p>Please note BuddyPress 7.0.0 <a href=\"https://bpdevel.wordpress.com/2020/07/05/wordpress-required-version-update-2/\"><strong>will require at least WordPress 4.9</strong>.</a></p>\n\n\n\n<p>Testing for bugs is an important part of polishing the release during the beta stage and a great way to contribute. Here are some of the big changes and features to pay close attention to while testing (Check out&nbsp;<a href=\"https://buddypress.trac.wordpress.org/query?status=closed&group=resolution&milestone=7.0.0\">this report</a>&nbsp;on Trac for the full list).</p>\n\n\n\n<div class=\"wp-block-spacer\"></div>\n\n\n\n<h2><span class=\"dashicons dashicons-dashboard\"></span> New Administration screens to manage BuddyPress types</h2>\n\n\n\n<p>In BuddyPress 7.0.0 site administrators will be able to add, edit or delete <strong>Member &amp; Group types</strong> using their WordPress Administration Screens just like they would do for Post tags.</p>\n\n\n\n<p><a href=\"https://bpdevel.wordpress.com/2020/09/21/bp-types-admin-ui/\">Read this development note</a>&nbsp;to learn&nbsp;more about it.</p>\n\n\n\n<div class=\"wp-block-spacer\"></div>\n\n\n\n<h2><span class=\"dashicons dashicons-block-default\"></span> Let&#8217;s welcome 3 new BP Blocks into our Block Editor</h2>\n\n\n\n<ul><li>The <strong>Activity Embed block</strong> let authors embed an activity into their post or page.</li><li>Use the <strong>BP Member<span class=\"has-inline-color\">s</span> block</strong> to select community users you want to feature into a post or a page.</li><li>Enjoy the <strong>BP Group<span class=\"has-inline-color\">s</span> block</strong> to pick the groups you want to highlight into a post or a page.</li></ul>\n\n\n\n<p>Get to know these new blocks <a href=\"https://bpdevel.wordpress.com/2020/10/14/three-new-blocks-to-expect-in-buddypress-7-0-0/\">reading this development note</a>.</p>\n\n\n\n<div class=\"wp-block-spacer\"></div>\n\n\n\n<h2><span class=\"dashicons dashicons-admin-generic\"></span> Improved support for WP CLI</h2>\n\n\n\n<p><a href=\"https://wp-cli.org/\">WP-CLI</a>&nbsp;is the command-line interface for WordPress. You can update plugins, configure multisite installs, and much more, without using a web browser. In 7.0.0, you will be able to Enjoy new BuddyPress CLI commands to manage BuddyPress Group Meta, BuddyPress Activity Meta, activate or deactivate the BuddyPress signup feature and create BuddyPress specific testing code for plugins.</p>\n\n\n\n<p>Discover more about it from this <a href=\"https://bpdevel.wordpress.com/2020/10/09/wp-cli-buddypress-2-0/\">development note</a>.</p>\n\n\n\n<div class=\"wp-block-spacer\"></div>\n\n\n\n<p><em>And so much more such as improvements to the BP REST API, our Template pack, images and iframes lazy loading support&#8230;</em></p>\n\n\n\n<div class=\"wp-block-spacer\"></div>\n\n\n\n<h2><span class=\"dashicons dashicons-buddicons-buddypress-logo\"></span> How You Can Help</h2>\n\n\n\n<p>Do you speak a language other than English?&nbsp;<a href=\"https://translate.wordpress.org/projects/wp-plugins/buddypress/dev/\">Help us translate BuddyPress into more than 100 languages</a>!</p>\n\n\n\n<p>If you think you’ve found a bug, you can post in&nbsp;<a href=\"https://buddypress.org/support\">the support forums</a>. We’d love to hear from you! If you’re comfortable writing a reproducible bug report,&nbsp;<a href=\"https://buddypress.trac.wordpress.org/newticket\">file one on BuddyPress Trac</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Oct 2020 22:30:06 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Mathieu Viet\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"WPTavern: Using the Web Stories for WordPress Plugin? You Better Play By Google’s Rules\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105848\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:215:\"https://wptavern.com/using-the-web-stories-for-wordpress-plugin-you-better-play-by-googles-rules?utm_source=rss&utm_medium=rss&utm_campaign=using-the-web-stories-for-wordpress-plugin-you-better-play-by-googles-rules\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4080:\"<img />Web Stories dashboard screen in WordPress.\n\n\n\n<p class=\"has-drop-cap\">What comes as a surprise to few, Google has updated its <a href=\"https://developers.google.com/search/docs/guides/web-stories-content-policy\">content guidelines</a> for its Web Stories format. For users of its recently-released <a href=\"https://wordpress.org/plugins/web-stories/\">Web Stories for WordPress</a> plugin, they will want to follow the extended rules for their Stories to appear in the &ldquo;richer experiences&rdquo; across Google&rsquo;s services. This includes the grid view on Search, Google Images, and Google Discover&rsquo;s carousel.</p>\n\n\n\n<p>Google <a href=\"https://wptavern.com/google-officially-releases-its-web-stories-for-wordpress-plugin\">released its Web Stories plugin</a> in late September to the WordPress community. It is a drag-and-drop editor that allows end-users to create custom Stories from a custom screen in their WordPress admin.</p>\n\n\n\n<div class=\"wp-block-image\"><img />Visual Stories on Search.</div>\n\n\n\n<p>The plugin does not directly link to Google&rsquo;s content guidelines anywhere. For users who do not do a little digging, they may be caught unaware if their stories are not surfaced in various Google services.</p>\n\n\n\n<p>On top of the Discover and Webmaster guidelines, Web Stories have six additional restrictions related to the following:</p>\n\n\n\n<ul><li>Copyrighted content</li><li>Text-heavy Web Stories</li><li>Low-quality assets</li><li>Lack of narrative</li><li>Incomplete stories</li><li>Overly commercial</li></ul>\n\n\n\n<p>While not using copyrighted content is one of those reasonably-obvious guidelines, the others could trip up some users. Because Stories are meant to represent bite-sized bits of information on each page, they may become ineligible if most pages have more than 180 words of text. Videos should also be limited to fewer than 60 seconds on each page.</p>\n\n\n\n<p>Low-quality media could be a flag for Stories too. Google&rsquo;s guidelines point toward &ldquo;stretched out or pixelated&rdquo; media that negatively impacts the reader&rsquo;s experience. They do not offer any specific resolution guidelines, but this should mostly be a non-issue today. The opposite issue is far more likely &mdash; users uploading media that is too large and not optimized for viewing on the web.</p>\n\n\n\n<p>The &ldquo;lack of narrative&rdquo; guideline is perhaps the vaguest, and it is unclear how Google will monitor or police <em>narrative</em>. However, the Stories format is about storytelling.</p>\n\n\n\n<p>&ldquo;Stories are the key here imo,&rdquo; wrote Jamie Marsland, founder of Pootlepress, in a <a href=\"https://twitter.com/pootlepress/status/1309020235102597122\">Twitter thread</a>. &ldquo;Now we have an open format to tell Stories, and we have an open platform (WordPress) where those Stories can be told easily.&rdquo;</p>\n\n\n\n<p>Google specifically states that Stories need a &ldquo;binding theme or narrative structure&rdquo; from one page to the next. Essentially, the company is telling users to use the format for the purpose it was created for. They also do not want users to create incomplete stories where readers must click a link to finish the Story or get information.</p>\n\n\n\n<img /><a href=\"https://www.cnn.com/ampstories/entertainment/john-lennon-remembering-the-great-musician\">CNN&rsquo;s Web Story on Remembering John Lennon.</a>\n\n\n\n<p>Overly commercial Stories are frowned upon too. While Google will allow affiliate marketing links, they should be restricted to a minor part of the experience.</p>\n\n\n\n<p>Closing his Twitter thread, Marsland seemed to hit the point. &ldquo;I&rsquo;ve seen some initial Google Web Stories where the platform is being used as a replacement for a brochure or website,&rdquo; he wrote. &ldquo;In my view that&rsquo;s a huge missed opportunity. If I was advising brands I would say &lsquo;Tell Stories&rsquo; this is a platform for Story Telling.&rdquo;</p>\n\n\n\n<p>If users of the plugin follow this advice, their Stories should surface on Google&rsquo;s rich search experiences.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 16 Oct 2020 20:51:21 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:45:\"WPTavern: Stripe Acquires Paystack for $200M+\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=106269\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:131:\"https://wptavern.com/stripe-acquires-paystack-for-200m?utm_source=rss&utm_medium=rss&utm_campaign=stripe-acquires-paystack-for-200m\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3196:\"<p>The big news in the world of e-commerce today is Stripe&rsquo;s acquisition of <a href=\"https://paystack.com/\">Paystack</a>, a Nigeria-based payments system that is widely used throughout African markets. The company, which became informally known as &ldquo;<a href=\"https://techcrunch.com/2018/08/28/paystack-with-ambitions-to-become-the-stripe-of-africa-raises-8m-from-visa-tencent-and-stripe-itself/\">the Stripe of Africa</a>&rdquo; picked up $8 million in Series A funding in 2018, led by Stripe, Y Combinator, and Tencent. Paystack has grown to power more than 60,000 businesses, including FedEx, UPS, MTN, the Lagos Internal Revenue Service, and AXA Mansar.</p>\n\n\n\n<p>Stripe&rsquo;s acquisition of the company is rumored to be more than $200M, a small price to pay for a foothold in emerging African markets. In the company&rsquo;s <a href=\"https://stripe.com/newsroom/news/paystack-joining-stripe\">announcement</a>, Stripe noted that African online commerce is growing 21% year-over-year, 75% faster than the global average. Paystack dominates among payment systems, accounting for more than half of all online transactions in Nigeria.  </p>\n\n\n\n<p>&ldquo;In just five years, Paystack has done what many companies could not achieve in decades,&rdquo; Stripe EMEA business lead Matt Henderson said. &ldquo;Their tech-first approach, values, and ambition greatly align with our own. This acquisition will give Paystack resources to develop new products, support more businesses and consolidate the hyper-fragmented African payments market.&rdquo;</p>\n\n\n\n<p>Long term, Stripe plans to embed Paystack&rsquo;s capabilities in its Global Payments and Treasury Network (GPTN), the company&rsquo;s programmable infrastructure for global money movement.</p>\n\n\n\n<p>&ldquo;Paystack merchants and partners can look forward to more payment channels, more tools, accelerated geographic expansion, and deeper integrations with global platforms,&rdquo; Paystack CEO and co-founder Shola Akinlade said. He also assured customers that there&rsquo;s no need to make any changes to their technical integrations, as Paystack will continue expanding and operating independently in Africa.</p>\n\n\n\n<p>Paystack is used as a payment gateway for thousands of WordPress-powered stores through plugins for WooCommerce, Easy Digital Downloads, Paid Membership Pro, Give, Contact Form 7, and an assortment of booking plugins. The company has an official WordPress plugin, <a href=\"https://wordpress.org/plugins/payment-forms-for-paystack/\">Payment Forms for Paystack</a>, which is active on more than 6,000 sites, but most users come through the <a href=\"https://wordpress.org/plugins/woo-paystack/\">Paystack WooCommerce Payment Gateway</a> (20,000+ active installations). </p>\n\n\n\n<p>Stripe&rsquo;s acquisition was a bit of positive news during what is currently a turbulent time in Nigeria, as citizens are actively engaged in peaceful protests to end police brutality. Paystack&rsquo;s journey is an encouraging example of the flourishing Nigerian tech ecosystem and the possibilities available for smaller e-commerce companies that are solving problems and removing barriers for businesses in emerging markets. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 15 Oct 2020 22:26:04 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:50:\"WPTavern: Diving Into the Book Review Block Plugin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=106273\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:145:\"https://wptavern.com/diving-into-the-book-review-block-plugin?utm_source=rss&utm_medium=rss&utm_campaign=diving-into-the-book-review-block-plugin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6791:\"<p class=\"has-drop-cap\">Created by Donna Peplinskie, a Product Wrangler at Automattic, the <a href=\"https://wordpress.org/plugins/book-review-block\">Book Review Block</a> plugin is nearly three years old. However, it only came to my attention during a recent excursion to find interesting block plugins.</p>\n\n\n\n<p>The plugin does pretty much what it says on the cover. It is designed to review books. It generally has all the fields users might need to add to their reviews, such as a title, author, image, rating, and more. The interesting thing is that it can automatically fill in those details with a simple ISBN value. Plus, it supports Schema markup, which may help with SEO.</p>\n\n\n\n<p>Rain or shine, sick or well, I read every day. I am currently a month and a half shy of a two-year reading streak. When the mood strikes, I even venture to write a book review. As much as I want to share interesting WordPress projects with the community, I sometimes have personal motives for testing and writing about plugins like Book Review Block. Anything that might help me or other avid readers share our thoughts on the world of literature with others is of interest.</p>\n\n\n\n<p>Admittedly, I was excited as I plugged in the ISBN for <em>Rhthym of War</em>, the upcoming fourth book of my favorite fantasy series of all time, <em>The Stormlight Archive</em>. I merely needed to click the &ldquo;Get Book Details&rdquo; button.</p>\n\n\n\n<p>Success! The plugin worked its magic and pulled in the necessary information. It had my favorite author&rsquo;s name, the publisher, the upcoming release date, and the page count. It even had a long description, which I could trim down in the editor.</p>\n\n\n\n<img />Default output of the Book Review block.\n\n\n\n<p>There was a little work to make this happen before the success. To automatically pull in the book details, end-users must have an <a href=\"https://console.developers.google.com/flows/enableapi?apiid=books.googleapis.com&keyType=CLIENT_SIDE&reusekey=true\">API Key</a> from Google. It took me around a minute to set that up and enter it into the field available in the block options sidebar. The great thing about the plugin is that it saves this key so that users do not have to enter each time they want to review a book.</p>\n\n\n\n<p>Book Review Block a good starting point. It is straightforward and simple to use. It is not yet at a point where I would call it a <em>great</em> plugin. However, it could be.</p>\n\n\n\n<h2>Falling Short</h2>\n\n\n\n<p class=\"has-drop-cap\">The plugin&rsquo;s Book Review block should be taking its cues from the core Media &amp; Text block. When you get right down to it, the two are essentially doing the same thing visually. Both are blocks with an image and some content sitting next to each other.</p>\n\n\n\n<p>The following is a list of items where it should be following core&rsquo;s lead:</p>\n\n\n\n<ul><li>No way to edit alt text (book title is automatically used).</li><li>The image is always aligned left and the content to the right with no way to flip them.</li><li>The media and content are not stackable on mobile views.</li><li>Cannot adjust the size of the image or content columns.</li><li>While inline rich-text controls are supported, users cannot add Heading, List, or Paragraph blocks to the content area and use their associated block options.</li></ul>\n\n\n\n<p>That is the shortlist that could offer some quick improvements to the user experience. Ultimately, the problems with the plugin essentially come down to not offering a way to customize the output.</p>\n\n\n\n<p>One of the other consistent problems is that the book image the plugin loads is always a bit small. This seems to be more of an issue from the Google Books API than the plugin. Each time I tested a book, I opted to add a larger image &mdash; the plugin does allow you to replace the default.</p>\n\n\n\n<p>The color settings are limited. The block only offers a background color option with no way to adjust the text color. A better option for plugin users is to wrap it in a Group block and adjust the background and text colors there.</p>\n\n\n\n<img />Book Review block wrapped inside a Group block.\n\n\n\n<p>It would also be nice to have wide and full-alignment options, which is an often-overlooked featured from many block plugin authors.</p>\n\n\n\n<h2>Using the Media &amp; Text Block to Recreate the Book Review Block</h2>\n\n\n\n<p class=\"has-drop-cap\">The Book Review Block plugin has a lot of potential, and I want to see it evolve by providing more flexibility to end-users. Because the Media &amp; Text block is the closest core block to what the plugin offers, I decided to recreate a more visually-appealing design with it.</p>\n\n\n\n<img />Book review section created with the Media &amp; Text block.\n\n\n\n<p>I made some adjustments on the content side of things. I used the Heading block for the book title, a List block for the book metadata, and a Paragraph block for the description.</p>\n\n\n\n<p>The Media &amp; Text block also provided me the freedom to adjust the alignment, stack the image and content on mobile views, and tinker with the size of the image. Plus, it has that all-important field for customizing the image alt attribute.</p>\n\n\n\n<p>The Media &amp; Text block gave me much more design mileage.</p>\n\n\n\n<p>However, there are limitations to the core block. It does not fully capture some of the features available via the Book Review block. The most obvious are the automatic book details via an ISBN and the Schema markup. Less obvious, there is no easy way to recreate the star rating &mdash; I used emoji stars &mdash; and long description text does not wrap under the image. To recreate that, you would have to opt to use a left-aligned image followed by content.</p>\n\n\n\n<p>Overall, the Media &amp; Text block gives me the ability to better style the output, which is what I am more interested in as a user. I want to put my unique spin on things. That is where the Book Review Plugin misfires. It is also the sort of thing that the plugin author can iterate on, offering more flexibility in the future.</p>\n\n\n\n<p>This is where many block plugins go wrong, particularly when there is more than one or two bits of data users should enter. Blocks represent freedom in many ways. However, when plugin developers stick to a rigid structure, users can sometimes lose that sense of freedom that they would otherwise have with building their pages.</p>\n\n\n\n<p>One of the best blocks, hands down, that preserves that freedom is from the <a href=\"https://wptavern.com/start-a-recipe-blog-with-the-recipe-block-wordpress-plugin\">Recipe Block plugin</a>. It has structured inputs and fields. However, it allows freeform content for end-users to make it their own.</p>\n\n\n\n<p>When block authors push beyond this rigidness, users win.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 15 Oct 2020 20:44:04 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"WPTavern: WooCommerce 4.6 Makes New Home Screen the Default for New and Existing Stores\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=106242\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:219:\"https://wptavern.com/woocommerce-4-6-makes-new-home-screen-the-default-for-new-and-existing-stores?utm_source=rss&utm_medium=rss&utm_campaign=woocommerce-4-6-makes-new-home-screen-the-default-for-new-and-existing-stores\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3018:\"<p><a href=\"https://developer.woocommerce.com/2020/10/14/woocommerce-4-6-is-now-available/\">WooCommerce 4.6</a> was released today. The minor release dropped during <a href=\"https://woosesh.com/\">WooSesh</a>, a global, virtual conference dedicated to WooCommerce and e-commerce topics. It features the new home screen as the default for all stores. Previously, the screen was only the default on new stores. Existing store owners had to turn the feature on in the settings.</p>\n\n\n\n<div class=\"wp-block-image\"><img /></div>\n\n\n\n<p>The updated home screen, originally introduced in version 4.3, helps store admins see activity across the site at a glance and includes an inbox, quick access to store management links, and an overview of stats on sales, orders, and visitors. This redesigned virtual command center arrives not a moment too soon, as anything that makes order management more efficient is a welcome improvement, due to the sheer volume of sales increases that store owners have seen over the past eight months.</p>\n\n\n\n<p>In stark contrast to industries like hospitality and entertainment that have proven to be more vulnerable during the pandemic, e-commerce has seen explosive growth. During the State of the Woo address at WooSesh 2020, the WooCommerce team shared that e-commerce is currently estimated to be a $4 trillion market that will grow to $4.5 trillion by 2021. WooCommerce accounts for a sizable chunk of that market with an estimated total payment volume for 2020 projected to reach $20.6 billion, a 74% increase compared to 2019.</p>\n\n\n\n<p>The WooCommerce community is on the forefront of that growth and is deeply invested in the products that are driving stores&rsquo; success. The WooCommerce team shared that 75% of people who build extensions also build and maintain stores for merchants, and 70% of those who build stores for merchants also build and maintain extensions or plugins. In 2021, they plan to invest heavily in unlocking more features in more countries and will make WooCommerce Payments the native payment method for the global platform.</p>\n\n\n\n<p>A new report from eMarketer shows that <a href=\"https://www.emarketer.com/content/us-ecommerce-growth-jumps-more-than-30-accelerating-online-shopping-shift-by-nearly-2-years\">US e-commerce growth has jumped 32.4%</a>, accelerating the online shopping shift by nearly two years. Experts also predict the top 10 e-commerce players will swallow up more of US retail spending to account for 63.2% of all online sales this year, up from 57.9% in 2019. </p>\n\n\n\n<p>The increase in e-commerce spending may not be entirely tied to the pandemic, as some experts believe this historic time will mark permanent changes in consumer spending habits. This is where independent stores, powered by WooCommerce and other technologies, have the opportunity to establish a strong reputation for themselves by providing quality products and reliable service, as well as by being more nimble in the face of pandemic-driven increases in volume.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 15 Oct 2020 03:48:32 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"WPTavern: The Future of Starter Content: WordPress Themes Need a Modern Onboarding and Importing Tool\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=106177\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:245:\"https://wptavern.com/the-future-of-starter-content-wordpress-themes-need-a-modern-onboarding-and-importing-tool?utm_source=rss&utm_medium=rss&utm_campaign=the-future-of-starter-content-wordpress-themes-need-a-modern-onboarding-and-importing-tool\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:7385:\"<img />Image credit: <a href=\"https://www.pexels.com/photo/notebook-beside-the-iphone-on-table-196644/\">picjumbo.com on Pexels</a>.\n\n\n\n<p class=\"has-drop-cap\">Starter content. It was a grand idea, one of those big dreams of WordPress. It was the <a href=\"https://make.wordpress.org/core/2016/11/30/starter-content-for-themes-in-4-7/\">new kid on the block in late 2016</a>. Like the introduction of post formats in 2011, the developer community was <em>all in</em> for at least that particular release version. Then, it was on to the next new thing, with the feature dropping off the radar for all but the most ardent evangelists. </p>\n\n\n\n<p>Some of us were burned over the years, living and dying by the progress of features that we wanted most.</p>\n\n\n\n<p>Released in WordPress 4.7, starter content has since seemed to be going the way of post formats. After four years, only <a href=\"https://wpdirectory.net/search/01EMM14PBRE6K8P1Z08KXQQ76D\">141 themes</a> in the WordPress theme directory support the feature. There has been no movement to push it beyond its initial implementation. And, it never <em>really</em> covered the things that theme authors wanted in the first place. It was a start. But, themers were ultimately left to their own devices, rolling custom solutions for something that never panned out &mdash; fully-featured demo and imported content. Four years is an eternity in the web development world, and there is no sense in waiting around to see if WordPress would push forward.</p>\n\n\n\n<p>Until Helen Hou-Sand&iacute; published <a href=\"https://make.wordpress.org/core/2020/10/06/revisiting-starter-content-on-org-and-beyond/\">Revisiting Starter Content</a> last week, most would have likely assumed the feature would be relegated to legacy code used by old-school fans of the feature and those theme authors who consider themselves completionists.</p>\n\n\n\n<p>&ldquo;Starter content in 4.7 was always meant to be a step one, not the end goal or even the resting point it&rsquo;s become,&rdquo; wrote Hou-Sand&iacute;. &ldquo;There are still two major things that need to be done: themes should have a unified way of showing users how best to put that theme to use in both the individual site and broader preview contexts, and sites with existing content should also be able to take advantage of these sort of &lsquo;ideal content&rsquo; definitions.&rdquo;</p>\n\n\n\n<p>Step two should have been this <a href=\"https://core.trac.wordpress.org/ticket/38624\">four-year-old accompanying ticket</a> to allow users to import starter content into existing, non-<em>fresh</em> sites.</p>\n\n\n\n<p>Since the initial feature dropped, the theme landscape has changed. Let&rsquo;s face it. WordPress might simply not be able to compete with theme companies that are pushing the limits, creating experiences that users want at much swifter speeds.</p>\n\n\n\n<p>Look at where the Brainstorm Force&rsquo;s <a href=\"https://wordpress.org/plugins/astra-sites/\">Starter Templates</a> plugin for its <a href=\"https://wordpress.org/themes/astra/\">Astra</a> theme is now. Users can click a button and import a full suite of content-filled pages or even individual templates. And, the Astra theme is not alone in this. It has become an increasingly-common standard to offer some sort of onboarding to users. GoDaddy&rsquo;s managed WordPress service <a href=\"https://wptavern.com/inside-look-at-godaddys-onboarding-process-for-managed-wordpress-hosting\">fills a similar need</a> on the hosting end.</p>\n\n\n\n<img />Astra&rsquo;s starter templates and content.\n\n\n\n<p>As WordPress use becomes more widespread, the more it needs a way to onboard users.</p>\n\n\n\n<p>This essentially boils down to the question: <em>how can I make it look like the demo?</em></p>\n\n\n\n<p>Ah, the age-old question that theme authors have been trying to solve. Whether it has been limitations in the software or, perhaps, antiquated theme review guidelines related to demo and imported content, this has been a hurdle that has been tough to jump. But, some have sailed over it and moved on. While WordPress has seemingly been twiddling its thumbs for years, Brainstorm Force and other theme companies have solved this and continued to innovate.</p>\n\n\n\n<p>This is not necessarily a bad thing. There are plenty of ideas to <s>steal</s> copy and pull into the core platform.</p>\n\n\n\n<p>One of the other problems facing the WordPress starter content feature is that it is tied to the customizer. With the direction of the block system, it is easy to ask what the future holds. The customizer &mdash; originally named the <em><strong>theme</strong></em> customizer &mdash; was essentially a project to allow users to make front-end adjustments and watch those customizations happen in real time. However, new features like global styles and full-site editing are happening on their own admin screens. Most theme options will ultimately be relegated to global styles, custom templates, block styles, and block patterns. There may not be much left for the customizer to do.</p>\n\n\n\n<p>Right now, there are too many places in WordPress to edit the front-end bits of a WordPress site. My hope is that all of these things are ultimately merged into one less-confusing interface. But, I digress&hellip;</p>\n\n\n\n<p>Starter content should be rethought. Whoever takes the reins on this needs a fresh take that adopts modern methods from leading theme companies.</p>\n\n\n\n<p>The ultimate goal should be to allow theme authors to create multiple sets of templates/content that end-users can preview and import. It should not be tied to whether it is a new site. Any site owner should be able to import content and have it <em>automagically</em> go live. It should also be extendable to allow themes to support page builders like Elementor, Beaver Builder, and many others.</p>\n\n\n\n<p>This seems to be in line with Hou-Sand&iacute;&rsquo;s thoughts. &ldquo;For a future release, we should start exploring what it might look like to opt into importing starter content into existing sites, whether wholesale or piecewise,&rdquo; she wrote. &ldquo;Many of us who work in the WordPress development/consulting space tend not to ever deal in switching between public themes on our sites, but let&rsquo;s not forget that&rsquo;s a significant portion of our user audience and we want to continue to enable them to not just publish but also publish in a way that matches their vision.&rdquo;</p>\n\n\n\n<p>Let&rsquo;s do it right this go-round, keep a broad vision, and provide an avenue for theme authors to adopt a standardized core WordPress method instead of having everyone build in-house solutions.</p>\n\n\n\n<p>I haven&rsquo;t even touched on the <a href=\"https://meta.trac.wordpress.org/ticket/30#comment:66\">recent call to use starter content</a> for WordPress.org theme previews. It will take more than ideas to excite many theme authors about the possibility. That ticket has sat for seven years with no progress, and most have had it on their wish list for much longer. It is an interesting proposal, one that has been tossed around in various team meetings for years.</p>\n\n\n\n<p>Like so many other things, theme authors have either given up hope or moved onto doing their own thing. They need to be brought into the fold, not only as third parties who are building with core WordPress tools but as developers who are contributing to those features.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 14 Oct 2020 20:07:31 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:116:\"WPTavern: Google Podcasts Manager Adds More Data from Search: Impressions, Top-Discovered Episodes, and Search Terms\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=106191\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:271:\"https://wptavern.com/google-podcasts-manager-adds-more-data-from-search-impressions-top-discovered-episodes-and-search-terms?utm_source=rss&utm_medium=rss&utm_campaign=google-podcasts-manager-adds-more-data-from-search-impressions-top-discovered-episodes-and-search-terms\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2568:\"<p>Google <a href=\"https://twitter.com/googlewmc/status/1316030688508825600\">announced</a> an expansion of listener engagement metrics today for those using its Podcast Manager. Previously, audience insights included data about the types of devices listeners are using, where listeners tune in and drop off during a given episode, total number of listens, and listening duration, but the service lacked analytics regarding how visitors were discovering the podcast.</p>\n\n\n\n<p>Google is remedying that today by expanding the dashboard to show impressions, clicks, top-discovered episodes, and search terms that brought listeners to the podcast. This information can help podcasters understand how their content is getting discovered so they can better tailor their episodes to attract more new listeners. </p>\n\n\n\n<p>The podcasting industry has seen remarkable growth over the past five years, which previously led experts to project that marketers will spend&nbsp;<a href=\"https://www.searchenginejournal.com/marketers-will-spend-1-billion-on-podcast-advertising-by-2021-report/316499/#close\">over $1 billion in advertising by 2021</a>. After the pandemic hit, podcast listening took a downturn in the U.S. but at the same time, podcast creators have found more time to <a href=\"https://wptavern.com/podcasting-during-the-pandemic-castos-sees-300-growth-in-new-podcasters\">create new shows and episodes</a>. Businesses are turning to the medium to supplement traditional marketing methods that no longer have the same impact now that consumer spending habits heavily favor online products.</p>\n\n\n\n<p>Along with the new metrics available inside Google Podcasts Manager, the company also published a <a href=\"https://support.google.com/podcast-publishers/thread/76595315\">guide to optimizing podcasts</a> for Google Search. It highlights four important items for making sure a podcast can be found:</p>\n\n\n\n<ul><li>Detailed show and episode metadata</li><li>Ensure the podcast&rsquo;s webpage and RSS data match</li><li>Include cover art</li><li>Ensure Googlebot can access your audio files </li></ul>\n\n\n\n<p>A detailed breakdown of your audience&rsquo;s listening habits isn&rsquo;t worth much if you&rsquo;re having trouble getting your podcast discovered. Any podcasting plugin for WordPress should handle these basic optimization recommendations, but if you are still having trouble being found via Google, you can dig deeper into the <a href=\"https://support.google.com/podcast-publishers/answer/9889864\">podcast setup guide</a> for more detailed recommendations. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 13 Oct 2020 22:57:22 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:65:\"WPTavern: Are Block-Based Widgets Ready To Land in WordPress 5.6?\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=106175\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:173:\"https://wptavern.com/are-block-based-widgets-ready-to-land-in-wordpress-5-6?utm_source=rss&utm_medium=rss&utm_campaign=are-block-based-widgets-ready-to-land-in-wordpress-5-6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:8214:\"<p class=\"has-drop-cap\">Two weeks ago, the Gutenberg team put out an <a href=\"https://make.wordpress.org/core/2020/09/30/call-for-testing-the-widgets-screen-in-gutenberg-9-1/\">open call for block-based widgets feedback</a>. I had already written a <a href=\"https://wptavern.com/gutenberg-8-9-brings-block-based-widgets-out-of-the-experimental-stage\">lengthy review</a> of the new system earlier in September but was asked by a member of the team to share my thoughts on the most recent iteration. With the upcoming freeze for WordPress 5.6 Beta 1 just a week away, I figured it would not hurt to do another deep dive.</p>\n\n\n\n<p>For reference, my latest testing is against version 9.2.0-alpha-172f589 of the Gutenberg plugin, which was a build from earlier today. Gutenberg development moves fast, but everything should be accurate to that point.</p>\n\n\n\n<p>Ultimately, many of the problems I pointed out over a month ago still exist. However, the team has cleaned most of the minor issues, such as pointing the open/close arrows for sidebars (block areas) in the correct direction and making it more consistent with the post-editing screen. The UI is much more polished.</p>\n\n\n\n<p>Before I dive into all the problems, I want to answer the question I am proposing. Yes, the block-based widget system <em>will be</em> ready for prime time when WordPress 5.6 lands. It is not there yet, but it is at a point where there is a clear finish line that is reachable in the next two months.</p>\n\n\n\n<p>I will ignore the failure of block-based widgets in the customizer, which landed in Gutenberg 8.9 and was <a href=\"https://wptavern.com/gutenberg-9-1-adds-patterns-category-dropdown-and-reverts-block-based-widgets-in-the-customizer\">removed in 9.1</a>. I will also look past the recent proposal to <a href=\"https://github.com/WordPress/gutenberg/issues/26012\">reconstruct the widgets screen</a> to use the Customize API, at least for now. There is a boatload of problems that block-based widgets present for the customizer, and those problems are insurmountable for WordPress 5.6. Long term, WordPress needs to have a single place for editing widget/block areas. Users will likely have to live with some inconsistencies for a while.</p>\n\n\n\n<p>Assuming the team does not try to throw a last-minute Hail Mary and implement full editing of blocks in the customizer this round, it is safe to say that block-based widgets are well on their way toward a successful WordPress 5.6 debut.</p>\n\n\n\n<h2>The User Experience</h2>\n\n\n\n<img />Block-based widgets screen.\n\n\n\n<p class=\"has-drop-cap\">As a user, I genuinely enjoy using the new Widgets admin screen. The open-ended, free-form block areas create untold possibilities for designing my WordPress sites. Traditional widgets were limited in scope. Users were buckled down to a handful of core widgets, possibly some plugin widgets, and whatever their theme author offered up. However, with blocks, the pool of choices expands to at least triple the out-of-the-box options (I am not counting embed-type blocks individually). Plus, blocks provide a far more extensive set of design options than a traditional widget.</p>\n\n\n\n<p>In comparison, traditional widgets are outdated. Blocks are superior in almost every way. However, there are still problems with this new system.</p>\n\n\n\n<p>The biggest issue right now is that end-users can exit the Widgets screen without saving their changes. There is no warning to let them know that all their work is about to be lost in the ether. This is one of those <em>OMGBBQ</em>-level items that need to happen before WordPress 5.6 drops.</p>\n\n\n\n<p>One nice-to-have-but-not-necessary feature would be the ability to drag blocks from one block area to another. In the old widgets system, users could move widgets from sidebar to sidebar. The current alternative is to copy a widget, paste it in a new block area, and remove the original.</p>\n\n\n\n<p>I am also not a fan of not having an option for the top toolbar, which is available on the post-editing screen. One of the reasons for using this toolbar is because I dislike the default popup toolbar on individual blocks. It is distracting and often gets in the way of my work.</p>\n\n\n\n<p>Legacy widgets seem to still be a work in progress. The Legacy Widget block did not work at all for me at times. Then, it magically began to work. However, Gutenberg does now automatically add registered third-party widgets to the block inserter just as if they were blocks.</p>\n\n\n\n<img />Getting a plugin&rsquo;s widget to work.\n\n\n\n<p>This presented its own problems. The only way I managed to make third-party plugin widgets work was to insert the widget, save, and refresh the widgets screen. At that point, the widgets appeared and became editable.</p>\n\n\n\n<h2>The Theme Author Experience</h2>\n\n\n\n<p class=\"has-drop-cap\">One of my biggest concerns for theme authors right now is that there does not seem to be any documentation in the <a href=\"https://developer.wordpress.org/block-editor/developers/themes/\">block editor handbook</a>. There is plenty of time to make that happen, but there are things theme authors need to be aware of. Having a centralized location, even while the feature is under development, would help them gear up for the 5.6 release.</p>\n\n\n\n<p>Some of these questions, which may be answered in various Make blog posts, should exist on a dedicated documentation page:</p>\n\n\n\n<ul><li>How can a theme opt out of block-based widgets?</li><li>What are the hooks to add custom styles for the Widgets screen?</li><li>Can themes target specific sidebar styles on the Widgets screen?</li><li>Is it possible to consistently style sections like traditional widgets on the front end?</li><li>Can themes opt into wide and full-alignment within block areas, which could essentially be used similarly to the post content area?</li></ul>\n\n\n\n<p>These are some of the questions I would want to be answered as a former theme author. I am no longer in the thick of the theme design game and presume that those who are would have a larger list of questions.</p>\n\n\n\n<p>One less-obvious piece of documentation should center on how to handle fallbacks or default <em>widgets</em>. Traditionally, themes that needed to show a default set of widgets would check if the sidebar has widgets and fall back to using <code>the_widget()</code> to output one or more defaults. While theme authors can still do that, we should start to transition them across the board to the block system.</p>\n\n\n\n<p>Should theme authors copy/paste block HTML as a fallback? Would the starter content system be better for this, and can starter widget content handle blocks? What is the recommended method for widget fallbacks in WordPress 5.6?</p>\n\n\n\n<p>There is still the <a href=\"https://github.com/WordPress/gutenberg/issues/25174\">ongoing issue</a> of how theme authors should handle the traditional widget and widget title wrapper HTML in the new block paradigm. One patch added since the Gutenberg 9.1 release <a href=\"https://github.com/WordPress/gutenberg/pull/25693\">wraps every top-level block</a> with the widget wrapper. If this lands in the 9.2 release, it will likely make the issue worse.</p>\n\n\n\n<p>In the traditional system, both the widget title and content are wrapped within a container together. However, if a user adds a Heading block (widget title) and another block (widget content), each block is wrapped separately with the theme&rsquo;s widget wrappers. The only way to rectify the situation as it stands is for end-users to add a Group block for each &ldquo;widget&rdquo; they want, which would require an extensive amount of re-education for WordPress users. It is not an ideal scenario.</p>\n\n\n\n<img />Each block is wrapped as an individual section.\n\n\n\n<p>Instead of attempting to directly &ldquo;fix&rdquo; this issue, WordPress should instead do nothing to the output. Blocks and traditional widgets are fundamentally different.</p>\n\n\n\n<p>Let theme authors take the reins on this one and explore possibilities. However, give them the tools to do so, such as <a href=\"https://wptavern.com/addressing-the-theme-design-problem-with-gutenbergs-new-block-based-widgets-system\">supporting block patterns</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 13 Oct 2020 21:35:39 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:91:\"WPTavern: WordCamp Austin 2020 Finds Success with VR Experience for Sessions and Networking\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=106119\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:227:\"https://wptavern.com/wordcamp-austin-2020-finds-success-with-vr-experience-for-sessions-and-networking?utm_source=rss&utm_medium=rss&utm_campaign=wordcamp-austin-2020-finds-success-with-vr-experience-for-sessions-and-networking\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:7246:\"<p><a href=\"https://austin.wordcamp.org/2020/\">WordCamp Austin 2020</a> attendees are raving about their experiences attending the virtual event last Friday. It was no secret that the camp&rsquo;s organizers planned to use&nbsp;<a href=\"https://hubs.mozilla.com/\">Hubs Virtual Rooms</a>&nbsp;by Mozilla to create a unique environment, but few could imagine how much more interactive and personalized the experience would be than a purely Zoom-based WordCamp.</p>\n\n\n\n<p>After selecting a custom avatar, attendees entered the venue using a VR headset or the browser to check out sessions or network in the hallway track.</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">Here&rsquo;s a small taste of the experience at <a href=\"https://twitter.com/WordCampATX?ref_src=twsrc%5Etfw\">@WordCampATX</a> today. <a href=\"https://twitter.com/hashtag/WordPress?src=hash&ref_src=twsrc%5Etfw\">#WordPress</a> logos and no sponsor banners on any elevator doors. <a href=\"https://twitter.com/hashtag/WCATX?src=hash&ref_src=twsrc%5Etfw\">#WCATX</a> <a href=\"https://t.co/Nv2p2VchXf\">pic.twitter.com/Nv2p2VchXf</a></p>&mdash; David Bisset (@dimensionmedia) <a href=\"https://twitter.com/dimensionmedia/status/1314643915904086018?ref_src=twsrc%5Etfw\">October 9, 2020</a></blockquote>\n</div>\n\n\n\n<p>Speaker and Q&amp;A sessions were broadcast through Zoom but organizers can also embed YouTube videos and streams within the standalone VR environment.</p>\n\n\n\n<p>&ldquo;The VR experience was the most life-like WordCamp experience I&rsquo;ve had since the start of global lockdowns,&rdquo; attendee and speaker David Vogelpohl said. &ldquo;You could attend sessions in one of two virtual presentation halls depending on what track you wanted to see at that time. The speaker presented on a virtual stage and you could see the other attendees watching the presentation.&rdquo;</p>\n\n\n\n<p>Vogelpohl said he enjoyed his experience getting to know others in the Slack and VR venue. Organizers preserved the general vibe of the &ldquo;hallway track&rdquo; to recreate what is arguably one of the most valuable aspects of in-person WordCamps.</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">So cool &ndash; checking out the Virtual Space of WordCamp Austin &ndash; love the background noise of people talking, ran into <a href=\"https://twitter.com/ChrisWiegman?ref_src=twsrc%5Etfw\">@ChrisWiegman</a> and <a href=\"https://twitter.com/Josh412?ref_src=twsrc%5Etfw\">@Josh412</a> <a href=\"https://twitter.com/hashtag/WCATX?src=hash&ref_src=twsrc%5Etfw\">#WCATX</a> <a href=\"https://t.co/68EdgDN2Om\">pic.twitter.com/68EdgDN2Om</a></p>&mdash; Birgit Pauli-Haack (@bph) <a href=\"https://twitter.com/bph/status/1314570573792632832?ref_src=twsrc%5Etfw\">October 9, 2020</a></blockquote>\n</div>\n\n\n\n<p>&ldquo;In the hallway track between the virtual presentation halls was a large foyer where you could meet new people, spot a friend speaking with someone else, and virtually step aside from a group conversation to have a private conversation,&rdquo; Vogelpohl said.</p>\n\n\n\n<p>&ldquo;It was great to see folks like Josepha circling around speaking with attendees, Josh Pollock nerding out in a corner with a group of advanced WP developers, and having random friends drop into a conversation I was having with a group of others. While VR WordCamp doesn&rsquo;t wholly&nbsp;replace the value of attending a WordCamp live, a lot of the best parts of meeting and collaborating with others was captured in the VR context.&rdquo;</p>\n\n\n\n<p>The live music interludes, which showcased talents from around the community, also provided a way for virtual attendees to stay connected while waiting for the next session. </p>\n\n\n\n<h2>Behind the Scenes with Anthony Burchell: Creative Director for WordCamp Austin&rsquo;s Virtual World</h2>\n\n\n\n<p>WordPress core contributor Anthony Burchell, who started a <a href=\"https://broken.place/\">company</a> dedicated to creating interactive XR sound and art experiences, was the creative director behind the WordCamp Austin&rsquo;s VR backdrop.</p>\n\n\n\n<p>&ldquo;For WordCamp Austin we wanted to give folks something to be excited about outside of the typical webcam and chat networking,&rdquo; Burchell said. &ldquo;I feel that virtual events are not utilizing the networking layer nearly enough to make folks feel like they are really at an event. I&rsquo;ve seen many compelling formats for virtual events utilizing webcams and chat rooms, but in the end, it feels like there&rsquo;s been a missing element of presence; something video games and virtual reality excel at.&rdquo;</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">Virtual mission control for <a href=\"https://twitter.com/hashtag/WCATX?src=hash&ref_src=twsrc%5Etfw\">#WCATX</a> <a href=\"https://t.co/WyrFkIsW2Q\">pic.twitter.com/WyrFkIsW2Q</a></p>&mdash; Anthony Burchell (@antpb) <a href=\"https://twitter.com/antpb/status/1314592863569707008?ref_src=twsrc%5Etfw\">October 9, 2020</a></blockquote>\n</div>\n\n\n\n<p>Setting up the virtual world involves spinning up a self-hosted instance of Hubs Cloud, which Burchell said is very similar to the complexity of making a WordPress site.</p>\n\n\n\n<p>&ldquo;The most time consuming part of creating a 3D world for an event is making the 3D assets for the space,&rdquo; Burchell said. &ldquo;In total I streamed 11 hours of video leading up to the event to give a glimpse into the process.&rdquo;</p>\n\n\n\n<p>Burchell&rsquo;s YouTube <a href=\"https://www.youtube.com/playlist?list=PLi1xKbv0cklpzJCgXyKi-pp3KANYJLqGk\">playlist</a> documents the incredible amount of work that went into creating the WordCamp&rsquo;s virtual venue for attendees to enjoy. </p>\n\n\n\n<p>&ldquo;While it took quite a bit of time to prepare, the code and assets are completely reusable for another event,&rdquo; Burchell said. &ldquo;A lot of the time was spent trying to make the space purpose built for the goals of the camp. Much like a real WordCamp, I found the majority of folks packing into the theater rooms for presentations and dipping out a little early to network with friends in the hallway area. That was very much by design!&rdquo;</p>\n\n\n\n<p>Burchell and the other organizers were careful to ensure that the Hubs space was not the primary viewing experience of the camp but rather an extension of the networking activities that attendees could drop in on. The event had nearly identical numbers of attendees joining the virtual space as it did for those joining the video channels. At the end of the afterparty, Burchell turned on flying for all attendees to conclude the successful event:</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n\n</div>\n\n\n\n<p>&ldquo;With Hubs we were able to give attendees the ability to express themselves within a venue vs within a camera and chat box,&rdquo; Burchell said. &ldquo;It was incredible to see characteristics of folks in the community shine through a virtual avatar! Just the simple act of seeing your WordCamp friends in the hallway joking and chatting just as they would at a real life event was enough to make me feel like I was transported to a real WordCamp.&rdquo;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 12 Oct 2020 22:31:02 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"WPTavern: Privacy-Conscious WordPress Plugin Caches and Serves Gravatar Images Locally\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105825\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:217:\"https://wptavern.com/privacy-conscious-wordpress-plugin-caches-and-serves-gravatar-images-locally?utm_source=rss&utm_medium=rss&utm_campaign=privacy-conscious-wordpress-plugin-caches-and-serves-gravatar-images-locally\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5285:\"<p class=\"has-drop-cap\">Ari Stathopoulos released his new <a href=\"https://wordpress.org/plugins/local-gravatars/\">Local Gravatars</a> plugin last week. The goal of the plugin is to allow site owners to take advantage of the benefits of a global avatar system while mitigating privacy concerns by hosting the images locally.</p>\n\n\n\n<p>In essence, it is a caching system that stores the images on the site owner&rsquo;s server. It is an idea that Peter Shaw <a href=\"https://wptavern.com/local-avatars-in-wordpress-yes-please#comment-338262\">proposed in the comments</a> on an earlier Tavern article covering <a href=\"https://wptavern.com/local-avatars-in-wordpress-yes-please\">local avatar upload</a>. It is a middle ground that may satisfy some users&rsquo; issues with how avatars currently work in WordPress.</p>\n\n\n\n<p>&ldquo;I am one of the people that blocks analytics, uses private sessions when visiting social sites, I use DuckDuckGo instead of Google, and I don&rsquo;t like the &lsquo;implied&rsquo; consents,&rdquo; said Stathopoulos. &ldquo;I built the plugin for my own use because I don&rsquo;t know what Gravatar does, I don&rsquo;t understand the privacy policies, and I am too lazy to spend two hours analyzing them. It&rsquo;s faster for me to build something that is safe and doesn&rsquo;t leave any room for misunderstandings.&rdquo;</p>\n\n\n\n<p>He is referring to Automattic&rsquo;s extensive <a href=\"https://automattic.com/privacy/\">Privacy Policy</a>. He said it looks benign. However, he does not like the idea of any company being able to track what sites he visits without explicit consent.</p>\n\n\n\n<p>&ldquo;And when I visit a site that uses Gravatar, some information is exposed to the site that serves them &mdash; including my IP,&rdquo; said Stathopoulos. &ldquo;Even if it&rsquo;s just for analytics purposes, I don&rsquo;t think the company should know that page A on site B got 1,000 visitors today with these IPs from these countries. There is absolutely no reason why any company not related to the page I&rsquo;m actually visiting should have any kind of information about my visit.&rdquo;</p>\n\n\n\n<p>The Local Gravatars plugin must still connect to the Gravatar service. However, the connection is made on the server rather than the client. Stathopoulos explained that the only information exposed in this case is the server&rsquo;s IP and nothing from the client, which eliminates any potential privacy concerns.</p>\n\n\n\n<h2>The Latest Plugin Update</h2>\n\n\n\n<p class=\"has-drop-cap\">Stathopoulos updated the plugin earlier today to address some performance concerns for pages that have hundreds or more Gravatar images. In the version 1.0.1 update, he added a maximum processing time of five seconds and changed the cache cleanup process from daily to weekly. Both of these are filterable via code.</p>\n\n\n\n<p>&ldquo;Now, if there are Gravatars missing in a page request, it will get as many as it can, and, after five seconds, it will stop,&rdquo; said Stathopoulos. &ldquo;So if there are 100 Gravatars missing and it gets the first 20, the rest will be blank (can be filtered to use a fallback URL, or even fall back to the remote URL, though that would defeat the privacy improvement). The next page request will get the next 20, and so on. At some point, all will be there, and there will be no more delays.&rdquo;</p>\n\n\n\n<p>He did point out that performance could temporarily suffer when installing it on a site that has individual posts with 1,000s of comments and a lot of traffic. However, nothing would crash on the site, and the plugin should eventually lead to a performance boost in this scenario. For such large sites, owners could use the existing filter hooks to tweak the settings.</p>\n\n\n\n<p>Right now, the plugin is primarily an itch he wanted to scratch for his own purposes. However, if given enough usage and feedback, he may include a settings screen to allow users to control some of the currently-filterable defaults, such as the cleanup timeframe and the maximum process time allowed.</p>\n\n\n\n<h2>The Growing List of Alternatives</h2>\n\n\n\n<p class=\"has-drop-cap\">With growing concerns around privacy in the modern world, Local Gravatars is another tool that end-users can employ if they have any concerns around the Gravatar service. For those who are OK with an auto-generated avatar, <a href=\"https://wptavern.com/privacy-first-gravatar-replacement-pixel-avatars-module-released-for-the-toolbelt-wordpress-plugin\">Pixel Avatars</a> may be a solution.</p>\n\n\n\n<p>&ldquo;I&rsquo;ve seen some of them, and they are wonderful!&rdquo; Stathopoulos said of alternatives for serving avatars. &ldquo;However, this plugin is slightly different in that the avatars the user already has on Gravatar.com are actually used. They can see the image they have uploaded. The user doesn&rsquo;t need to upload a separate avatar, and an automatic one is not used by default.&rdquo;</p>\n\n\n\n<p>He would not mind using an auto-generated avatar when commenting on blogs or news sites at times. However, Stathopoulos prefers Gravatar for community-oriented sites.</p>\n\n\n\n<p>&ldquo;My Gravatar is part of my online identity, and when I see, for example, a comment from someone on WordPress.org, I know who they are by their Gravatar,&rdquo; he said.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 12 Oct 2020 21:06:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:10;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"WPTavern: WordPress 5.6 to Introduce Application Passwords for REST API Authentication\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105997\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:217:\"https://wptavern.com/wordpress-5-6-to-introduce-application-passwords-for-rest-api-authentication?utm_source=rss&utm_medium=rss&utm_campaign=wordpress-5-6-to-introduce-application-passwords-for-rest-api-authentication\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2604:\"<p>In 2015, WordPress 4.4 introduced a REST API, but one thing that has severely limited its broader use is the lack of  authentication capabilities for third-party applications. After considering the benefits and drawbacks of many different types of authentication systems, George Stephanis published a <a href=\"https://make.wordpress.org/core/2020/09/23/proposal-rest-api-authentication-application-passwords/\">proposal</a> for integrating <a href=\"https://github.com/WP-API/authentication/issues/13\">Application Passwords</a>, into core. </p>\n\n\n\n<p>Stephanis highlighted a few of the major benefit that were important factors in the decision to use Application Passwords: the ease of making API requests, ease of revoking credentials, and the ease of requesting API credentials. The project is available as a standalone <a href=\"https://wordpress.org/plugins/application-passwords/\">feature plugin</a>, but Stephanis and his collaborators recommended WordPress merge a <a href=\"https://github.com/WordPress/wordpress-develop/pull/540\">pull request</a> that is based off the feature plugin&rsquo;s codebase.</p>\n\n\n\n<p>After WordPress 5.6 core tech lead Helen Hou-Sandi gave the green light for Application Passwords to be merged into core, the developer community responded enthusiastically to the news.</p>\n\n\n\n<p>&ldquo;I am/we are 100% in favor of this,&rdquo; Joost deValk commented on the proposal. &ldquo;Opening this up is like opening the dawn of a new era of WordPress based web applications. Suddenly authentication is not something you need to fix when working with the&nbsp;API&nbsp;and you can just build awesome stuff.&rdquo;</p>\n\n\n\n<p>Stephanis&rsquo; proposal also mentioned how beneficial a REST API authentication system would be for the <a href=\"https://make.wordpress.org/mobile/\">Mobile teams</a>&lsquo; contributors who are relying on awkward workarounds while integrating Gutenberg support.</p>\n\n\n\n<p>&ldquo;This would be a first step to replace the use of XMLRPC in the mobile apps and it would allow us to add more features for self hosted users,&rdquo; Automattic mobile engineer Maxime Biais said.</p>\n\n\n\n<p>After the REST API was added to WordPress five years ago, many had the expectation that WordPress-based web applications would start popping up everywhere. Without a reliable authentication system, it wasn&rsquo;t easy for developers to just get inspired and build something quickly. Application Passwords in WordPress 5.6 will open up a lot of possibilities for those who were previously deterred by the lack of core methods for authenticating third-party access.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Oct 2020 23:01:31 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:11;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"WPTavern: WP Agency Summit Begins Its Second Annual Virtual Event October 12\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105160\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:197:\"https://wptavern.com/wp-agency-summit-begins-its-second-annual-virtual-event-october-12?utm_source=rss&utm_medium=rss&utm_campaign=wp-agency-summit-begins-its-second-annual-virtual-event-october-12\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6357:\"<p class=\"has-drop-cap\">Jan Koch, the founder and host of WP Agency Summit, is kicking off his <a href=\"https://wpagencysummit.com/\">second annual event on October 12</a>. The five-day event will feature 37 speakers from a wide range of backgrounds across the WordPress industry. It is a free virtual event that anyone can attend.</p>\n\n\n\n<p>&ldquo;The focus for the 2020 WP Agency Summit is showing attendees how to bring back the fun into scaling their agencies,&rdquo; said Koch. &ldquo;It is all about reducing the daily hustle by teaching how to successfully build and manage teams, how to work with enterprises (allowing for fewer customers but bigger projects), how to build sustainable recurring revenue, and how to position your agency to dominate your niche.&rdquo;</p>\n\n\n\n<p>This year&rsquo;s event includes three major changes to make the content more accessible to a larger group of people. Each session will be available between October 12 &ndash; 16 instead of the previous 48-hour window that attendees had to find time for in 2019.</p>\n\n\n\n<p>After the event has concluded, access to the content will be behind a paywall. Koch reduced the price to $77 for lifetime access for those who purchase pre-launch, which will increase to $127 during the event. Last year&rsquo;s prices ballooned to $497, which meant that it was simply not affordable for many who found it too late.</p>\n\n\n\n<p>Some of the proceeds this year are going toward transcribing all the videos so that hearing-impaired users can enjoy the content.</p>\n\n\n\n<p>This year&rsquo;s event will also focus on a virtual networking lounge for attendees. &ldquo;I&rsquo;ve seen how well it worked at the WP FeedBack Summit &mdash; we even had BobWP record a podcast episode on the fly in that lounge!&rdquo; said Koch. &ldquo;I&rsquo;ve seen many new friendships develop, people connecting with new suppliers or getting themselves booked on podcasts, and sharing experiences about their businesses.&rdquo;</p>\n\n\n\n<p>The lounge will be open during the entirety of the summit, which will allow attendees to jump into the conversation on their own time.</p>\n\n\n\n<h2>A More Diverse Speaker Lineup</h2>\n\n\n\n<p class=\"has-drop-cap\">Koch received some backlash for the lack of gender diversity last year. <a href=\"https://wptavern.com/wp-agency-summit-kicks-off-december-6\">The 2019 event</a> had over 20 speakers from a diverse male lineup. However, only four women from our industry led sessions.</p>\n\n\n\n<p>When asked about this issue in 2019, Koch responded, &ldquo;I recognize this as a problem with my event. The reason I have so much more male than female speakers is quite simple, the current speaker line-up is purely based on connections I had when I started planning for the event. It was a relatively short amount of time for me, so I wasn&rsquo;t able to build relationships with more female WP experts beforehand.&rdquo;</p>\n\n\n\n<p>The host said he paid attention to the feedback he received. While not hitting the 50/50 split goal he had for 2020&rsquo;s event, 16 of the 37 speakers are women.</p>\n\n\n\n<p>Koch said he strived to get speakers from a wider range of backgrounds. He wanted to bring in both freelancers and multi-million dollar agency owners. He also focused on getting people from multiple countries to represent WordPress agencies.</p>\n\n\n\n<p>&ldquo;I did reach out to around 130 people four months before the event to make new connections,&rdquo; he said. &ldquo;The community around the Big Orange Heart (a non-profit for mental well-being) also helped a lot with introducing me to new members of the WP community.&rdquo;</p>\n\n\n\n<p>Koch said he learned two valuable lessons when branching out beyond his existing connections for this year&rsquo;s event:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>Firstly, don&rsquo;t hesitate to reach out to people you think will never talk to you because they&rsquo;re running such big companies. For example, I immediately got confirmations from Mario Peshev from Devrix, Brad Touesnard from Delicious Brains, or Marieke van de Rakt from Yoast. When first messaging them, I had little hope they&rsquo;d set aside time to jump on an interview with me &ndash; but they were super supportive and accommodating! The WordPress community really is a welcoming environment if you approach people in a humble way.</p><p>Secondly, build connections with sincerity. Do not just focus on what you can get from that connection but how you can help the other person. I know this sounds cheesy and you&rsquo;ve heard this quite often &mdash; but it is true. Once I got the first response from new contacts and explained my goal of connecting fellow WordPress community members virtually, most immediately agreed because they also benefit from new connections and being positioned as a thought-leader in this event.</p></blockquote>\n\n\n\n<h2>WP Agency Summit? WP FeedBack Summit?</h2>\n\n\n\n<p class=\"has-drop-cap\">For readers who recall the Tavern&rsquo;s coverage of the <a href=\"https://wptavern.com/wp-feedback-kicks-off-free-virtual-summit-for-wordpress-professionals-on-april-27\">WP FeedBack Summit</a> earlier this year, the article specifically stated that the WP FeedBack Summit was a continuation of 2019&rsquo;s WP Agency Summit. The official word at the time from WP FeedBack&rsquo;s public relations team was the following:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>Last year&rsquo;s event, the WP Agency Summit has been rebranded under the umbrella of WP FeedBack&rsquo;s brand when Jan Koch the host of last&rsquo;s year WP Agency Summit joined WP FeedBack as CTO.</p></blockquote>\n\n\n\n<p>Koch said that it was a standalone event and not directly connected to WP Agency Summit but had the same target audience. However, the WP FeedBack Summit did use the previous WP Agency Summit&rsquo;s stats and data to promote the event.</p>\n\n\n\n<p>&ldquo;The WP FeedBack Summit was hosted under the WP FeedBack brand because I joined their team as CTO in March this year,&rdquo; he said. &ldquo;Vito [Peleg] and I had the idea to host a virtual conference around WordPress because of WordCamp Asia being canceled &mdash; we wanted to help connect the community online through our summit.</p>\n\n\n\n<p>Koch left WP FeedBack soon after the summit ended and is currently back on his own and has a goal of making WP Agency Summit a yearly event.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Oct 2020 17:01:24 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:12;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:102:\"WPTavern: Navigation Screen Sidelined for WordPress 5.6, Full-Site Editing Edges Closer to Public Beta\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105839\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:247:\"https://wptavern.com/navigation-screen-sidelined-for-wordpress-5-6-full-site-editing-edges-closer-to-public-beta?utm_source=rss&utm_medium=rss&utm_campaign=navigation-screen-sidelined-for-wordpress-5-6-full-site-editing-edges-closer-to-public-beta\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4676:\"<p>The new block-based navigation screen is once again delayed after it was originally <a href=\"https://wptavern.com/new-block-based-navigation-and-widgets-screens-sidelined-for-wordpress-5-5\">slated for WordPress 5.5</a> and then put <a href=\"https://wptavern.com/wordpress-5-6-development-kicks-off-with-all-women-release-squad\">on deck for 5.6</a>. Contributors have confirmed that it will not be landing in WordPress core until 2021 at the earliest.</p>\n\n\n\n<p>&ldquo;The Navigation screen is still in experimental state in the&nbsp;Gutenberg&nbsp;plugin, so it hasn&rsquo;t had any significant real-world use and testing yet,&rdquo; Editor Tech Lead&nbsp;Isabel Brison said. She made the call to remove it from the 5.6 lineup after the feature missed the deadline for&nbsp;<a href=\"https://github.com/WordPress/gutenberg/issues/24683\">bringing it out of the experimental state</a>. It still requires a substantial amount of development work and accessibility feedback before moving forward.  </p>\n\n\n\n<p>Contributors will focus instead on making sure the Widgets screen gets out the door for 5.6 and plan to pick up again on Navigation towards the end of November. </p>\n\n\n\n<p>WordPress 5.6 lead Josepha Haden gave an <a href=\"https://make.wordpress.org/core/2020/10/06/update-wordpress-5-6-release-progress/\">update</a> this week on the progress of all the anticipated features, including the planned public beta for full-site editing (FSE).</p>\n\n\n\n<p>&ldquo;I don&rsquo;t expect FSE to be feature complete by the time WP5.6 is released,&rdquo; Haden said. &ldquo;What I expect is that FSE will be functional for simple, routine user flows, which we can start testing and iterating on. That feedback will also help us more confidently design and build our complex user flows.&rdquo;</p>\n\n\n\n<p>Frank Klein, an engineer at Human Made, asked in the <a href=\"https://make.wordpress.org/themes/2020/10/07/block-based-themes-and-wordpress-5-6/#comment-44126\">comments</a> of another update why full-site editing is being tied to 5.6 progress in the first place, since it will still only be available in the plugin at the time of release. </p>\n\n\n\n<p>&ldquo;The main value is that it provides a good checkpoint along the path of&nbsp;FSE&rsquo;s development,&rdquo; <a href=\"https://profiles.wordpress.org/kjellr/\">Kjell Reigstad</a> said.&nbsp;&ldquo;Full-site editing is very much in progress. It is still experimental, but the general approach is coming into view, and becoming clearer with every plugin release.&rdquo;</p>\n\n\n\n<p>Reigstad posted an update on what developers can expect regarding <a href=\"https://make.wordpress.org/themes/2020/10/07/block-based-themes-and-wordpress-5-6/\">block-based theming and the upcoming release,</a> since the topic is closely tied to full-site editing. He emphasized that the infrastructure is already in place and that, despite it still being experimental, future block-based themes should work in a similar way to how they are working now.</p>\n\n\n\n<p>&ldquo;The focus is now shifting towards polishing the user experience: using the site editor to create templates, using the query block, iterating on the post and site blocks, and implementing the Global Styles&nbsp;UI,&rdquo; Reigstad said.</p>\n\n\n\n<p>&ldquo;The main takeaway is that when 5.6 is released, the full-site editing feature set will look similar to where it is today, with added polish to the UI, and additional features in the Query block.&rdquo;</p>\n\n\n\n<p>Theme authors are entering a new time of uncertainty and transition, but Reigstad reassured the community that themes as we know them today are not on track to be phased out in the immediate future.</p>\n\n\n\n<p>&ldquo;There is currently no plan to deprecate the way themes are built today,&rdquo; Reigstad said. &ldquo;Your existing themes will continue to work as they always have for the foreseeable future.&rdquo; He also encouraged contributors to get involved in an initiative to&nbsp;<a href=\"https://github.com/WordPress/gutenberg/issues/24803\">help theme authors transition to block-based themes</a>. (This project is not targeted for the 5.6 release.)</p>\n\n\n\n<p>Developers can follow important <a href=\"https://github.com/WordPress/gutenberg/issues/24551\">FSE project milestones</a> on GitHub, and subscribe to the weekly&nbsp;<a href=\"https://make.wordpress.org/themes/tags/gutenberg-themes-roundup/\">Gutenberg + Themes updates</a> to track progress on block-based theming. A block-based version of the&nbsp;<a href=\"https://make.wordpress.org/core/2020/09/23/introducing-twenty-twenty-one/\">Twenty Twenty-One theme</a> is in the works and should pick up steam after 5.6 beta 1, expected on October 20.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 08 Oct 2020 22:57:37 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:13;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:68:\"WPTavern: EditorPlus 1.9 Adds Animation Builder for the Block Editor\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105678\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:181:\"https://wptavern.com/editorplus-1-9-adds-animation-builder-for-the-block-editor?utm_source=rss&utm_medium=rss&utm_campaign=editorplus-1-9-adds-animation-builder-for-the-block-editor\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4535:\"<p class=\"has-drop-cap\">Munir Kamal shows no signs of slowing down. He continues to push forward with new features for his <a href=\"https://wordpress.org/plugins/editorplus/\">EditorPlus plugin</a>, which allows end-users to customize the look of the blocks in their posts and pages. He calls it the &ldquo;no-code style editor for WordPress.&rdquo; </p>\n\n\n\n<p><em>The latest addition to his plugin?</em> Animation styles for every core block.</p>\n\n\n\n<p>My first thought was that this would bloat the plugin with large amounts of unnecessary CSS and JavaScript for what is essentially a few bells and whistles. However, Kamal pulled it off with minimal custom CSS.</p>\n\n\n\n<p>Inspired by features from various website builders, he wanted to bring more and more of those things to the core block editor. The animations feature is just another ticked box on a seemingly never-ending checklist of features. And, so far, it&rsquo;s all still free.</p>\n\n\n\n<p>Since we last <a href=\"https://wptavern.com/control-block-design-via-the-editorplus-wordpress-plugin\">covered EditorPlus in June</a>, Kamal has added the ability to insert icons via any rich-text area (e.g., paragraphs, lists, etc.). He has also added shape divider, typography, style copying, and responsive editing options for the core WordPress blocks.</p>\n\n\n\n<h2>How Do Animations Work?</h2>\n\n\n\n<p class=\"has-drop-cap\">In the version 1.9 release of EditorPlus, Kamal added &ldquo;entrance&rdquo; animations. These types of animations happen when a visitor sees the block for the first time on the screen. For example, users could set the Image block to fade into visibility as a reader views the block.</p>\n\n\n\n<p>Currently, the plugin adds seven animations:</p>\n\n\n\n<ul><li>Fade</li><li>Slide</li><li>Bounce</li><li>Zoom</li><li>Flip</li><li>Fold</li><li>Roll</li></ul>\n\n\n\n<img />Adding a Slide animation for the Cover block text.\n\n\n\n<p>Each animation has its own subset of options to control how it behaves on the page. The bounce animation, for example, allows users to select the bounce direction. Other options include duration, delay, speed curve, delay, and repeat. There are enough choices to spend an inordinate amount of time tinkering with the output.</p>\n\n\n\n<p>One of the best features of this new feature is that Kamal has included an Animation Player under the block options. By clicking the play button, users can view the animation in action without previewing the post.</p>\n\n\n\n<p>Watch a quick video of the Animations feature:</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n\n</div>\n\n\n\n<p>After testing and using each animation, everything seemed to work well. The one downside &mdash; and this is not limited to animations &mdash; is that applying styles on the block level sometimes does not make sense. In many cases, it would help users to have options to style or animate the items within the block, such as the images in the Gallery block. When I broached the subject with Kamal, he was open to the idea of finding a solution to this in the future.</p>\n\n\n\n<h2>What Is Next for EditorPlus?</h2>\n\n\n\n<p class=\"has-drop-cap\">At a certain point, too many block options can almost feel like overkill and become unwieldy. EditorPlus does allow users to disable specific features from its settings screen, which can help get rid of some unwanted options. Kamal said he would like to continue making it more modular so that users can use only the features they need.</p>\n\n\n\n<p>&ldquo;What I plan is to have micro-level feature control for this extension so that a user can switch off individual styling panels like, Typography, Background, etc.,&rdquo; he said. &ldquo;Even further, I plan to bring these controls based on the user role as well. So an admin can disable these features for the editor, author, etc.&rdquo;</p>\n\n\n\n<p>That may be a bit down the road though. For now, he wants to focus on adding new features that he already has planned.</p>\n\n\n\n<p>&ldquo;I do plan to add more animation features,&rdquo; said Kamal. &ldquo;I got too many ideas, such as scroll-controlled animation, hover animation, text animation, Lottie animation, background animation, animated shape dividers, and more. But, having said that, I will be careful adding only those features that don&rsquo;t affect page performance much.&rdquo;</p>\n\n\n\n<p>Outside of extra styles and animations for existing blocks, he plans to jump on the block-building train in future releases. EditorPlus users could see accordion, toggle, slider, star rating, and other blocks in an upcoming release.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 08 Oct 2020 20:53:40 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:14;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:50:\"Donncha: Hide featured image if it’s in the post\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:28:\"https://odd.blog/?p=89503242\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"https://odd.blog/2020/10/08/hide-featured-image-if-its-in-the-post/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3885:\"<p>I&#8217;ve been running a photoblog at <a href=\"https://inphotos.org/\">inphotos.org</a> since 2005 on WordPress. (And thanks to writing this I noticed it&#8217;s <a href=\"https://inphotos.org/2005/10/08/yellow-flower/\">15 years old today</a>!)</p>\n\n\n\n<div class=\"wp-block-image\"><img /></div>\n\n\n\n<p>In that time WordPress has changed dramatically. At first I used Flickr to host my images, but after a short time I hosted the images myself. (Good thing too since Flickr limited free user accounts to 1000 images, so I wrote <a href=\"https://github.com/donnchawp/bye-bye-flickr\">a script to download</a> the Flickr images I used in posts.)</p>\n\n\n\n<div class=\"wp-block-image\"><img /></div>\n\n\n\n<p>For quite a long time I used the featured image instead of inserting the image into the post content, but then about two years ago I went back to inserting the photo into the post. Unfortunately that meant the photo was shown twice, once as a featured image, and once in the post content.</p>\n\n\n\n<p>The last theme I used supported custom post types, one of which was a photo type that displayed the featured image but hid the post content. It was an ok compromise, but not perfect.</p>\n\n\n\n<div class=\"wp-block-image\"><img /></div>\n\n\n\n<p>Recently I started using Twenty Twenty, but after 15 years I had a mixture of posts with:</p>\n\n\n\n<ul><li>Featured image with no image in the post.</li><li>Featured image with the same image in the post.</li></ul>\n\n\n\n<p>I knew I needed something more flexible. I wanted to hide the featured image if it also appeared in the post content. I procrastinated and never got around to it until this evening when I discovered it was actually quite easy. </p>\n\n\n\n<img />\n\n\n\n<p>Copy the following code into the function.php of your child theme and you&#8217;ll be all set! It relies on you having unique filenames for your images. If you don&#8217;t then remove the call to <code>basename()</code>, and that may help.</p>\n\n\n<pre class=\"brush: php; auto-links: false; gutter: false; title: ; notranslate\">\nfunction maybe_remove_featured_image( $html ) {\n        if ( $html == \'\' ) {\n                return \'\';\n        }\n        $post = get_post();\n        $post_thumbnail_id = get_post_thumbnail_id( $post );\n        if ( ! $post_thumbnail_id ) {\n                return $html;\n        }\n\n        $image_url = wp_get_attachment_image_src( $post_thumbnail_id );\n        if ( ! $image_url ) {\n                return $html;\n        }\n\n        $image_filename = basename( parse_url( $image_url[0], PHP_URL_PATH ) );\n        if ( strpos( $post-&gt;post_content, $image_filename ) ) {\n                return \'\';\n        } else {\n                return $html;\n        }\n}\nadd_filter( \'post_thumbnail_html\', \'maybe_remove_featured_image\' );\n</pre>\n\n\n<p>The <code>post_thumbnail_html</code> filter acts on the html generated to display the featured image. My code above gets the filename of the featured image, checks if it&#8217;s in the current post and if it is returns a blank string. Feedback welcome if you have a better way of doing this!</p>\n\n\n\n<div class=\"wp-block-image\"><img /></div>\n\n\n\n<p></p>\n\n<p><strong>Related Posts</strong><ul><li> <a href=\"https://odd.blog/2007/07/09/around-ireland-in-80-links-on-july-9th-2007/\" rel=\"bookmark\" title=\"Permanent Link: Around Ireland in 80 links on July 9th 2007\">Around Ireland in 80 links on July 9th 2007</a></li><li> <a href=\"https://odd.blog/2003/12/22/webalizer-hide-the-groups/\" rel=\"bookmark\" title=\"Permanent Link: Webalizer &#8211; hide the groups!\">Webalizer &#8211; hide the groups!</a></li><li> <a href=\"https://odd.blog/2002/11/16/dvdrip-a-full-fe/\" rel=\"bookmark\" title=\"Permanent Link: dvd::rip &#8211; A full featured DVD &#8230;\">dvd::rip &#8211; A full featured DVD &#8230;</a></li></ul></p>\n<p><a href=\"https://odd.blog/2020/10/08/hide-featured-image-if-its-in-the-post/\" rel=\"nofollow\">Source</a></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 08 Oct 2020 20:43:35 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Donncha\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:15;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"WPTavern: Cloudflare Launches Automatic Platform Optimization for WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105641\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:195:\"https://wptavern.com/cloudflare-launches-automatic-platform-optimization-for-wordpress?utm_source=rss&utm_medium=rss&utm_campaign=cloudflare-launches-automatic-platform-optimization-for-wordpress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6128:\"<p>Just a day after launching its new <a href=\"https://wptavern.com/cloudflare-launches-new-web-analytics-product-focusing-on-privacy\">privacy-first web analytics product</a> last week, Cloudflare announced Automatic Platform Optimization (APO) for WordPress. The new service boasts staggering performance improvements for sites that might otherwise be slowed down by shared hosting, slow database lookups, or sluggish plugins:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>Our testing&hellip; showed a 72% reduction in Time to First Byte (TTFB), 23% reduction to&nbsp;<a rel=\"noreferrer noopener\" href=\"https://web.dev/fcp/\" target=\"_blank\">First Contentful Paint</a>, and 13% reduction in&nbsp;<a rel=\"noreferrer noopener\" href=\"https://web.dev/speed-index/\" target=\"_blank\">Speed Index</a>&nbsp;for desktop users at the 90th percentile, by serving nearly all of your website&rsquo;s content from Cloudflare&rsquo;s network.&nbsp;</p></blockquote>\n\n\n\n<p>APO uses Cloudflare Workers to cache dynamic content and serve the website from its <a href=\"https://www.cloudflare.com/learning/cdn/glossary/edge-server/\">edge network</a>. In most cases this eliminates origin requests and origin processing time. That means visitors requesting your website will get near instant load times. Cloudflare reports that its testing shows APO delivers consistent load times of under 400ms for HTML Time to First Byte (TTFB).</p>\n\n\n\n<p>The effects of using APO are similar to hosting static files on a CDN, but without the need to manage a complicated tech stack. Content creators retain their ability to create dynamic websites without any changes to their workflow for the sake of performance. </p>\n\n\n\n<p>Version 3.8 of <a href=\"https://wordpress.org/plugins/cloudflare/\">Cloudflare&rsquo;s official WordPress plugin</a> was recently updated to include support for APO. It detects when users make changes to their content and purges the content stored on Cloudflare&rsquo;s edge.</p>\n\n\n\n<p>The new service is available to Cloudflare users with a single click of a button. APO is included at no cost for existing Cloudflare customers on the Professional, Business, and Enterprise plans. Users on the Free plan can add it to their sites for $5/month. The service is a flat fee and is not metered. </p>\n\n\n\n<p>Cloudflare&rsquo;s announcement has so far been well-received by WordPress professionals and hosting companies and many have already begun testing it. </p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">So the week after <a href=\"https://twitter.com/Cloudflare?ref_src=twsrc%5Etfw\">@Cloudflare</a> Birthday Week I try and play with as many of the new products as possible. Today was the WordPress APO on my simple demo site. You can see TTFB dropped from ~350ms to ~75ms!  <a href=\"https://t.co/zg976EjrZI\">https://t.co/zg976EjrZI</a> <a href=\"https://t.co/KuaHqtHLom\">pic.twitter.com/KuaHqtHLom</a></p>&mdash; Matt Bullock (@mibullock) <a href=\"https://twitter.com/mibullock/status/1313478984534052865?ref_src=twsrc%5Etfw\">October 6, 2020</a></blockquote>\n</div>\n\n\n\n<p>WordPress lead developer Mark Jaquith <a href=\"https://twitter.com/markjaquith/status/1312178973372157953\">called</a> APO &ldquo;incredible news for the WordPress world.&rdquo;</p>\n\n\n\n<p>&ldquo;On sites I manage this is going to lower hosting complexity and easily save hundreds of dollars a month in hosting costs,&rdquo; Jaquith said.</p>\n\n\n\n<p>After running several speed tests from six different locations around the world, early testers at Kinsta got remarkable results using APO:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>&ldquo;By caching&nbsp;static HTML&nbsp;on Cloudflare&rsquo;s edge network, we saw a 70-300% performance increase. As expected, the testing locations furthest away from Tokyo saw the biggest reduction in&nbsp;load time.</p><p>&ldquo;If your WordPress site uses a traditional&nbsp;CDN&nbsp;that only caches CSS, JS, and images, upgrading to Cloudflare&rsquo;s WordPress APO is a no-brainer and will help you stay competitive with modern Jamstack and static sites that live on the edge by default.&rdquo;</p></blockquote>\n\n\n\n<p>George Liu, a &ldquo;self-confessed page speed addict&rdquo; and Cloudflare Community MVP, performed a series of <a href=\"https://community.centminmod.com/threads/cloudflare-wordpress-plugin-automatic-platform-optimization.20486/\">detailed tests</a> on the new APO product with his blog. After many comparisons, he found that Cloudoflare&rsquo;s WordPress plugin with APO turned on delivers results similar to his heavily optimized WordPress blog that uses a custom Cloudflare Worker caching configuration.</p>\n\n\n\n<p>&ldquo;You&rsquo;ll find that Cloudflare WordPress plugin&rsquo;s one click Automatic Platform Optimization button does wonders for page speed for the average WordPress user not well versed in page speed optimizations,&rdquo; Liu said.</p>\n\n\n\n<p>&ldquo;Cloudflare&rsquo;s WordPress plugin Automatic Platform Optimization will in theory beat all other WordPress caching solutions other than you rolling out your own Cloudflare Worker based caching like I did. So you get a good bang for your buck at US$5/month for Cloudflare&rsquo;s WordPress plugin APO.&rdquo;</p>\n\n\n\n<p>Liu also warned of some speed bumps with the initial rollout, as Cloudflare&rsquo;s APO supports a limited set of WordPress cookies for bypassing the Cloudflare CDN cache, leaving certain use cases unsupported. APO does not seem to work on subdomains and users are also reporting that it&rsquo;s not compatible with other caching plugins. It also disables real visitor IP address detection. </p>\n\n\n\n<p>Cloudflare is aware of many of these issues, which have been raised in the comments of the <a href=\"https://blog.cloudflare.com/automatic-platform-optimizations-starting-with-wordpress/\">announcement</a>, and is in the process of adding more cookies to the list to bypass caching. Due to some plugin conflicts, APO may not be as plug-and-play as it sounds for some users right now, but the product is very promising and should improve over time with more feedback.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 08 Oct 2020 04:18:28 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:16;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"WPTavern: Kick off Block-Based WordPress Theme Development With the Theme.json Creator\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105832\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:217:\"https://wptavern.com/kick-off-block-based-wordpress-theme-development-with-the-theme-json-creator?utm_source=rss&utm_medium=rss&utm_campaign=kick-off-block-based-wordpress-theme-development-with-the-theme-json-creator\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4674:\"<p class=\"has-drop-cap\">Gutenberg 9.1 made a backward-incompatible change to its <code>theme.json</code> file (<code>experimental-theme.json</code> while full-site editing is under the experimental flag). This is the configuration file that theme developers will need to create as part of their block-based themes. Staying up to date with such changes can be a challenge for theme authors, but Ari Stathopoulos, a Themes Team representative, wrote a <a href=\"https://make.wordpress.org/themes/2020/10/01/gutenberg-9-1-new-json-structure-for-fse-theme-json-files/\">full guide for developers</a>.</p>\n\n\n\n<p>Jon Quach, a Principal Designer at Automattic, has also been busy creating a tool to help theme authors transition to block-based themes. He recently built a UI-based project called <a href=\"https://gutenberg-theme.xyz/\">Theme.json Creator</a> that builds out the JSON code for theme authors. Plus, it is up to date with the most recent changes in the Gutenberg plugin.</p>\n\n\n\n<p>Tools like these will be what the development community needs as it gets over the inevitable hump of moving away from the traditional theme development paradigm and into a new era where themes are made almost entirely of blocks and a config file.</p>\n\n\n\n<p>While plugin development is becoming more complex with the addition of JavaScript, theme development is taking a sharp turn toward its roots of HTML and CSS. We are barreling toward a future in which far more people will be able to create WordPress themes. Even the possibility of sharing pieces of themes (e.g., template parts and patterns) is on the table. This could not only empower theme designers by lowering the barrier to entry, it could also empower some end-users to make the jump into theme building.</p>\n\n\n\n<p>However, the <code>theme.json</code> file is one aspect of future theme authorship that is extremely developer-oriented. JSON is a universal format shared between various programming languages. It is meant to be read by machines and is not quite as human-friendly as other formats. As the <code>theme.json</code> file grows to accommodate more configuration options over time, the less friendly it will become to simply typing keys and values in.</p>\n\n\n\n<p>It makes sense to build tools to simplify this part of the theme building process.</p>\n\n\n\n<p>That is where the Theme.json Creator tool comes in. Theme authors pick and choose the options they want to support and input custom values. Then, the tool spits out everything in properly-formatted JSON.</p>\n\n\n\n<img />Using the Theme.json Creator tool.\n\n\n\n<p>One big thing the tool does not yet cover is custom CSS variables. This feature is a recent addition to the <code>theme.json</code> specification. It allows theme authors to create any custom property that WordPress will automatically output as CSS. In his announcement post, Stathopoulos covered how to create a typographic scale with custom properties and use those variables for editor features, such as line-height and font-size values.</p>\n\n\n\n<p>Currently, Theme.json Creator&rsquo;s primary focus is on global styles. However, Gutenberg allows theme authors to configure default styles on the block level. For example, theme designers can set the color or typography options for the core Heading block to be different from the default global styles. This provides theme authors with fine-tuned control over every block.</p>\n\n\n\n<p>Theme.json Creator does not yet support configuration at this level. However, it would be interesting to see if Quach adds it in the future.</p>\n\n\n\n<p>The focus on setting up global styles is a good start for now. This is still an experimental feature. The great thing about it is that it can help theme authors begin to see how one piece of the block-based themes puzzle fits in. It is a starting point for an entirely new method of adding theme support for features when most are accustomed to adding multiple <code>add_theme_support()</code> PHP function calls.</p>\n\n\n\n<p>With the direction that theme development seems to be heading, it is easy to imagine that it could evolve into a completely UI-based affair at some point down the line. If templates are made up of blocks and patterns, which anyone can already build with the block editor, and if styles will essentially boil down to a config file, there will be little-to-no programming required to build a basic WordPress theme.</p>\n\n\n\n<p>If someone is not already at least jotting down notes for a plugin that allows users to create and package a block-based theme, I would be surprised. For now, Theme.json Creator is removing the need to write code for at least one part of the theme design process.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 07 Oct 2020 20:53:06 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:17;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"WPTavern: Jetpack 9.0 Introduces Loom Block, Twitter Threads Feature, and Facebook and Instagram oEmbeds\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105743\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:249:\"https://wptavern.com/jetpack-9-0-introduces-loom-block-twitter-threads-feature-and-facebook-and-instagram-oembeds?utm_source=rss&utm_medium=rss&utm_campaign=jetpack-9-0-introduces-loom-block-twitter-threads-feature-and-facebook-and-instagram-oembeds\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4033:\"<div class=\"wp-block-image\"><img /></div>\n\n\n\n<p>Jetpack&rsquo;s highly anticipated <a href=\"https://jetpack.com/2020/10/06/jetpack-9-0-continue-sharing-facebook-and-instagram-posts-on-your-site/\">9.0 release</a> has landed, introducing some of the new features the team has previewed over the past week. Users can now <a href=\"https://wptavern.com/jetpack-9-0-to-introduce-new-feature-for-publishing-wordpress-posts-to-twitter-as-threads\">publish WordPress posts to Twitter as threads</a>. This new feature is available as part of the Publicize module when you have connected a Twitter account. </p>\n\n\n\n<p>Posting Twitter threads is a feature that only works with the block editor, as it takes advantage of how content is naturally split into chunks (blocks). </p>\n\n\n\n<p>In the comments on his <a href=\"https://pento.net/2020/09/29/more-than-280-characters/\">demo post</a>, Automattic engineer Gary Pendergast gave a more detailed breakdown of the logic Jetpack uses to ensure full sentences aren&rsquo;t broken up in the tweets. </p>\n\n\n\n<p>&ldquo;With the mental model now being focused on mapping blocks to tweets, it&rsquo;s much easier to make logical decisions about how to handle each block,&rdquo; Pendergast said. &ldquo;So, a paragraph block is the text of a tweet, if the paragraph is too long for a single tweet, it tries to split the paragraph up by sentences. If a sentence is too long, then it resorts to splitting by words. Then, if there&rsquo;s an embed/image/video/gallery block following that paragraph, we can attach it to the tweet containing that paragraph. There are additional rules for other blocks, but that&rsquo;s the basic process. It then just iterates over all of the supported blocks in the post.&rdquo;</p>\n\n\n\n<p>Pendergast <a href=\"https://twitter.com/GaryPendergast/status/1310769596794908674\">published his post as thread</a> to demonstrate the new feature in action. The advantage of posting a thread from your WordPress site is that it doesn&rsquo;t end up getting lost in Twitter&rsquo;s fast-moving timeline. Most important Twitter threads evaporate from public consciousness almost as soon as they are published. Publishing threads from your website ensures they are better indexed and easier to reference in the future.</p>\n\n\n\n<h2>Jetpack Adds Loom Block for Embedding Screen Recordings </h2>\n\n\n\n<p><a href=\"https://www.loom.com/\">Loom</a> was <a href=\"https://github.com/Automattic/jetpack/pull/17137\">added to Jetpack</a> as a new oEmbed provider three weeks ago. The video recording service allows for recording camera, microphone, and desktop simultaneously. The service is especially popular in educational settings. Jetpack 9.0 introduces a new Loom block for embedding recordings. </p>\n\n\n\n<img />\n\n\n\n<p>&ldquo;Loom is growing in popularity as it is being recommended more and more to assist in distance learning efforts,&rdquo; Jetpack Director of Innovation Jesse Friedman said. &ldquo;Now more than ever we want to be able to help those working, learning, and teaching from home. The Loom block was a natural addition to join the other Jetpack video blocks which now include YouTube, TikTok, DailyMotion, and Vimeo.&rdquo;</p>\n\n\n\n<p>Loom&rsquo;s free tier allows users to record up to 25 videos, but the Pro plan is free for educators. Friedman confirmed that Jetpack does not have any kind of partnership with Loom. The team decided to support the product to assist professionals, educators, and students. Having it available as a block also makes it more convenient for those using <a href=\"https://wordpress.com/p2/\">P2</a> for communication.</p>\n\n\n\n<p>As anticipated, Jetpack 9.0 also provides a seamless transition necessary to ensure Instagram and Facebook embeds will continue working after Facebook drops <a href=\"https://developers.facebook.com/docs/plugins/oembed-legacy\">unauthenticated oEmbed support</a> on October 24. The Jetpack team reports that it &ldquo;partnered with Facebook&rdquo; to make sure these embeds continue to work with the WordPress.com REST API.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Oct 2020 23:28:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:18;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"Post Status: Joost de Valk on WordPress marketshare\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"https://poststatus.com/?p=79914\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:62:\"https://poststatus.com/joost-de-valk-on-wordpress-marketshare/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1193:\"<p>David Bisset makes his podcast debut for Post Status, as he interviews Joost de Valk, Founder and Chief Product Officer of Yoast, and discusses all things WordPress marketshare related.</p>\n\n\n\n\n\n\n\n<h3 id=\"h-links\">Links</h3>\n\n\n\n<ul><li>His blog, <a href=\"https://joost.blog/\">joost.blog</a></li><li><a href=\"https://yoast.com\">Yoast</a></li><li>On Twitter <a href=\"https://twitter.com/jdevalk\">@jdevalk</a></li><li>June 2020 <a href=\"https://joost.blog/cms-market-share-june-2020-analysis/\">CMS marketshare report</a></li></ul>\n\n\n\n<h3>Partner:&nbsp;<a href=\"https://jilt.com/?utm_source=Post+Status&utm_medium=banner&utm_campaign=Post+Status+Sponsorship\">Jilt</a></h3>\n\n\n\n<p><a href=\"https://jilt.com/?utm_source=Post+Status&utm_medium=banner&utm_campaign=Post+Status+Sponsorship\">Jilt</a> offers powerful email marketing built for eCommerce. From newsletters to highly segmented automations, Jilt is your one-stop show for eCommerce email. Join thousands of stores that have already earned tens of millions of dollars in extra sales using Jilt. <a href=\"https://jilt.com/?utm_source=Post+Status&utm_medium=banner&utm_campaign=Post+Status+Sponsorship\">Try Jilt for free</a></p>\n\n\n\n<p></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Oct 2020 22:28:00 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Brian Krogsgard\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:19;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:92:\"WPTavern: iThemes Buys WPComplete, Complementing Its Recent Restrict Content Pro Acquisition\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105631\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:227:\"https://wptavern.com/ithemes-buys-wpcomplete-complementing-its-recent-restrict-content-pro-acquisition?utm_source=rss&utm_medium=rss&utm_campaign=ithemes-buys-wpcomplete-complementing-its-recent-restrict-content-pro-acquisition\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4395:\"<p class=\"has-drop-cap\">Just one month after publicly announcing its <a href=\"https://wptavern.com/ithemes-enters-the-wordpress-membership-plugin-market-acquires-restrict-content-pro\">acquisition of Restrict Content Pro</a> (RCP), iThemes <a href=\"https://ithemes.com/wpcomplete-joining-ithemes-family/\">purchased WPComplete</a> for an undisclosed amount. The acquisition is for the product, website, and customers only.</p>\n\n\n\n<p>Paul Jarvis and Zack Gilbert created the <a href=\"https://wordpress.org/plugins/wpcomplete/\">WPComplete plugin</a> in 2016. However, it has outgrown what the duo could maintain and support alone. After the transition period in which the new owners take over, the two will step away from the project.</p>\n\n\n\n<p>In essence, <a href=\"https://wpcomplete.co/\">WPComplete</a> is a &ldquo;course completion&rdquo; plugin. Site owners can create online courses while allowing students/users to mark their work as completed. It also gives students a way to track their progress through courses, which can often boost the potential for them to finish.</p>\n\n\n\n<p>&ldquo;Paul and Jack believe a key to their success has been their ability to keep their team small and manageable,&rdquo; wrote Matt Danner, the COO at iThemes, in the announcement. &ldquo;The growth of WPComplete has presented a number of challenges for a team of two people, so the decision was made to start looking towards alternative ownership solutions that could continue to grow WPComplete and provide it with a stable team. iThemes is a perfect fit.&rdquo;</p>\n\n\n\n<p>iThemes customers who have a Plugin Suite or Toolkit membership will get automatic access to the pro version of the WPComplete plugin. For current WPComplete users, Danner said everything should be &ldquo;business as usual.&rdquo; However, iThemes has assigned a few of its team members to work on the product and site, so customers should see some new faces.</p>\n\n\n\n<p>RCP and WPComplete are obviously complementary products. RCP is a membership plugin that allows site owners to restrict content based on that membership. WPComplete allows site members to mark lessons or coursework as completed. &ldquo;We&rsquo;ll be rolling out a new bundle later this month that combines both RCP and WPComplete for course and membership creators to take advantage of these two plugins,&rdquo; said AJ Morris, the Product Innovation and Marketing Manager at iThemes.</p>\n\n\n\n<p>WPComplete is still a young product. The free version of the plugin currently has 2,000+ active installs and a solid 4.7 rating on WordPress.org. If marketed as an extension of the RCP plugin, it automatically puts it in front of the eyes of 1,000s of more potential customers. It should be much easier to grow the plugin as part of a membership bundle.</p>\n\n\n\n<p>iThemes is making some bold moves in the membership space. It will be interesting to see if the company makes any other acquisitions that could strengthen its product line and help it become more dominant. There is still a ton of room for growth in the membership segment of the market. There is also the potential for integrations with other major plugins.</p>\n\n\n\n<p>&ldquo;Adding WPComplete to the iThemes product lineup also allows us to move more quickly on some plans we have for Restrict Content Pro,&rdquo; said Danner in the initial announcement. He also vaguely mentioned a couple of ideas the team had in the works but did not go into detail.</p>\n\n\n\n<p>With a little prodding, Morris provided some insight into what they are planning for the immediate future. The biggest first step is tackling integration with the block editor. Currently, WPComplete uses shortcodes. The team&rsquo;s next step is likely to begin with creating block equivalents for those shortcodes.</p>\n\n\n\n<p>&ldquo;After that, we&rsquo;ve touched on a few deeper integrations with Restrict Content Pro, like the possibility to restrict courses to memberships,&rdquo; said Morris.</p>\n\n\n\n<p>The iThemes team does not plan to stop with WPComplete as part of its product lineup. One of the goals is to use the plugin for the iThemes website itself.  </p>\n\n\n\n<p>&ldquo;We always try to eat our own dogfood when we can,&rdquo; said Morris. &ldquo;You&rsquo;ll see that with RCP and WPComplete early next year as we look to integrate them into our <a href=\"https://training.ithemes.com\">iThemes Training</a> membership.&rdquo;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Oct 2020 20:59:25 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:20;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"WPTavern: Exploring Full-Site Editing With the Q WordPress Theme\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105676\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:173:\"https://wptavern.com/exploring-full-site-editing-with-the-q-wordpress-theme?utm_source=rss&utm_medium=rss&utm_campaign=exploring-full-site-editing-with-the-q-wordpress-theme\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:7492:\"<p class=\"has-drop-cap\">I have been eagerly awaiting the moment when I could install a theme and truly test Gutenberg&rsquo;s full-site editing feature. By and large, each time I have tested it over the past few months, the experience has felt utterly broken. This is why I have remained skeptical of seeing the feature land in WordPress 5.6 this December.</p>\n\n\n\n<p>The <a href=\"https://github.com/aristath/q\">Q theme</a> by Ari Stathopoulos is the first theme that seems to be a decent working example. Whether that is a stroke of luck with timing or that this particular theme is simply built correctly is hard to tell &mdash; Stathopoulos is a team rep for the Themes Team. <a href=\"https://wptavern.com/gutenberg-9-1-adds-patterns-category-dropdown-and-reverts-block-based-widgets-in-the-customizer\">Gutenberg 9.1</a> dropped last week with continued work toward site editing.</p>\n\n\n\n<p>Q is as experimental as it gets. The <a href=\"https://make.wordpress.org/themes/2020/03/01/call-for-experimental-themes/\">Themes Team put out an open call</a> for experimental, block-based themes as far back as March this year. However, not many have taken the team up on this offer. If approved, Q stands to be the first block-based theme to go live in the official WordPress directory. It still has to work its way through the standard <a href=\"https://themes.trac.wordpress.org/ticket/90263\">review process</a>, awaiting its turn in the coming weeks.</p>\n\n\n\n<p>On the whole, full-site editing remains a frustrating and confusing experience. I still remain skeptical about its readiness, even in beta form, to show off to the world in WordPress 5.6.</p>\n\n\n\n<p>However, Q is an interesting theme to explore at this point for both end-users and theme developers. Users can install it and start tinkering with the site editing screen via the Gutenberg plugin. Developers can learn how global styles, templates, and template parts fit together from a working theme.</p>\n\n\n\n<h2>Using the Site Editor</h2>\n\n\n\n<img />Editing a single post in the site editor.\n\n\n\n<p class=\"has-drop-cap\">The Q theme requires the Gutenberg plugin and its full-site editing mode to be enabled. Generally, requiring a plugin is not allowed for themes in the directory. However, experimental Gutenberg themes are allowed to bypass this guideline.</p>\n\n\n\n<p>Stathopoulos pointed out that the theme is highly experimental and should not be used on a production site. However, he is hopeful that it will get more eyes focused on full-site editing.</p>\n\n\n\n<p>He mentioned that several items are broken, such as category archives not showing the correct posts. This is a current limitation of the Query block in Gutenberg. However, one of the best ways to find and recognize these types of issues is to have a theme that stays up with the pace of development.</p>\n\n\n\n<p>Currently, the site editor feels like it is biting off more than it can chew. Not only can users edit the layout and design of the page, but they can also directly edit existing post content &mdash; don&rsquo;t try this at home unless you are willing for your post titles to get switched to the hyphenated slug. Should the site editor be handling the double-duty of design and content editing? If so, should design and content editing be handled in separate locations in the long term or be merged into one feature?</p>\n\n\n\n<p>It feels raw. It is not geared toward users at this point.</p>\n\n\n\n<p>The bright spot with the site editor is the current progress on template parts in the editor. Template parts are essentially &ldquo;modules&rdquo; that handle one part of the page. For example, the typical theme will have a header and footer template part. Currently, end-users can insert custom template parts or switch one template part for another. This opens a world of possibilities, such as users choosing between multiple header designs (template parts) for their sites.</p>\n\n\n\n<img />Switching the header template part.\n\n\n\n<p>The downside to the entire template system is that it seems so divorced from the site editor that it is hard to believe the average user would understand what is going on. Templates and template parts reside under the Appearance menu in the admin. The Site Editor is a separate, top-level menu item. Without any preexisting knowledge of how these pieces work together, it can be confusing.</p>\n\n\n\n<p>Template parts worked for me in the site editor from the outset. However, they did not work on the front end at first. I continually received the &ldquo;template part not found&rdquo; message for hours. Then, at some point &mdash; whether through magic or a random save that pulled everything together &mdash; the feature began to output the previously-<em>missing</em> header and footer template parts.</p>\n\n\n\n<h2>Glimpse Into the Future of Theme Development</h2>\n\n\n\n<p class=\"has-drop-cap is-style-default\">The Q theme has a scant few style rules, which it loads directly in the <code>&lt;head&gt;</code> section of the site in lieu of adding an extra stylesheet. It relies on the stock Gutenberg block styles on the front end with a few minor overrides. Most other custom styles are handled via the global styles system, which pulls from the theme&rsquo;s <code>experimental-theme.json</code> config file (will be <code>theme.json</code> in the future).</p>\n\n\n\n<p>It begs the question of whether themes will necessarily need much in the way of CSS when full-site editing lands.</p>\n\n\n\n<p>If WordPress allows users to configure most styles via block options and global styles overrides, themes may not need much more than their config files. After that, it would come down to registering custom block styles and patterns.</p>\n\n\n\n<p>If this is the future that we are headed toward, anyone could essentially create a WordPress theme. And, those pieces, such as template parts and patterns, could all be shared between any site. In that future, themes may simply not matter anymore.</p>\n\n\n\n<p>Last year, Mike Schinkel proposed <a href=\"https://mikeschinkel.me/2019/wordpress-should-deprecate-themes/\">deprecating the theme system</a> altogether and replacing it with web components.</p>\n\n\n\n<p>&ldquo;Rather than look for a theme that has all the features one needs &mdash; which I have found always limits the choices to zero &mdash; a site owner could look for the components and modules they need and then assemble their site from those modules,&rdquo; he said. &ldquo;They could pick a header, a footer, a home-page hero, a set of article cards, a pricing module, and so on.&rdquo;</p>\n\n\n\n<p>The more I tinker with full-site editing, the more it feels like that is the lane that it will ultimately merge into. Imagine a future where end-users could pick and choose the pieces they wanted and simply have it look right on the front end.</p>\n\n\n\n<p>It is exciting to think about that possibility. Both Schinkel and I have more of a background in programming than we do in design. It makes sense from that sort of analytical mindset to put everything into neat, reusable <em>boxes</em> because reuse is a cornerstone of smart programming.</p>\n\n\n\n<p>However, I worry about the state of design in such a system with so many replaceable parts. Will designers be able to take holistic approaches to theme development, creating truly intricate pieces of art? Will that system essentially create a web of cookie-cutter sites? Or, will designers simply find ways to think outside the box  while within the constraints of the block system?</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 05 Oct 2020 21:21:13 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:21;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:105:\"WPTavern: Virtual Jamstack Conf to Feature Fireside Chat with Matt Mullenweg and Matt Biilmann, October 6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105680\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:253:\"https://wptavern.com/virtual-jamstack-conf-to-feature-fireside-chat-with-matt-mullenweg-and-matt-biilmann-october-6?utm_source=rss&utm_medium=rss&utm_campaign=virtual-jamstack-conf-to-feature-fireside-chat-with-matt-mullenweg-and-matt-biilmann-october-6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2618:\"<div class=\"wp-block-image\"><img />image credit: <a href=\"https://jamstackconf.com/\">Jamstack Conf</a></div>\n\n\n\n<p>The greater Jamstack community is coming together on October 6-7, 2020, for a <a href=\"https://jamstackconf.com/virtual/\">virtual conference</a>. Organizers expect more than 15,000 attendees from around the globe over a two-day span that includes keynotes, sessions, interactive topic tables, workshops, speaker Q&amp;As, and networking opportunities. </p>\n\n\n\n<p>Matt Mullenweg will be joining Netlify CEO Matt Biilmann on <a href=\"https://jamstackconfvirtual2020.sched.com/event/eqVI\">day 1 at 12PM PDT</a> for a fireside chat moderated by<a href=\"https://css-tricks.com/\"> CSS-Tricks</a> Creator Chris Coyier. The chat will go deeper on recent topics of contention, including developer sentiment, complexity, security, and performance. Coyier also plans to discuss how the Jamstack and WordPress communities intersect through headless implementations of the CMS.</p>\n\n\n\n<p>A provocative post from <a href=\"https://thenewstack.io/wordpress-co-founder-matt-mullenweg-is-not-a-fan-of-jamstack/\">TheNewStack</a> at the end of August quoted Mullenweg as saying that &ldquo;JAMstack is a regression for the vast majority of the people adopting it.&rdquo; This sparked multiple heated exchanges across blogs and social media. Biilimann, who originally coined the term &ldquo;Jamstack,&rdquo; wrote a <a href=\"https://www.netlify.com/blog/2020/09/15/on-mullenweg-and-the-jamstack-regression-or-future/\">response</a> to Mullenweg&rsquo;s remarks, hailing &ldquo;the end of the WordPress era.&rdquo; </p>\n\n\n\n<p>Live conversations tend to be more cordial than shots fired across the blogosphere. It will be interesting to see if Biilimann cares to join <a href=\"https://www.stackbit.com/\">Stackbit</a> CEO Ohad Eder-Pressman in his wager that Jamstack will become the <a href=\"https://wptavern.com/matt-mullenweg-and-jamstack-community-square-off-making-long-term-bets-on-the-predominant-architecture-for-the-web\">predominant architecture for the web by 2025</a>. The fireside chat should be recorded, in case you cannot catch the live session. Recordings of talks from the previous virtual Jamstack event held in May are <a href=\"https://www.youtube.com/playlist?list=PL58Wk5g77lF8jzqp_1cViDf-WilJsAvqT\">available on YouTube</a>.</p>\n\n\n\n<p>Today is the last call for registration. Many of the workshops have already sold out, but tickets to the regular sessions on October 6 are still available. <a href=\"https://ti.to/netlify/jamstack_virtual_oct\">Sign up</a> on the event website to get your free ticket. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 05 Oct 2020 20:12:50 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:22;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:105:\"WPTavern: Gutenberg 9.1 Adds Patterns Category Dropdown and Reverts Block-Based Widgets in the Customizer\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105629\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:255:\"https://wptavern.com/gutenberg-9-1-adds-patterns-category-dropdown-and-reverts-block-based-widgets-in-the-customizer?utm_source=rss&utm_medium=rss&utm_campaign=gutenberg-9-1-adds-patterns-category-dropdown-and-reverts-block-based-widgets-in-the-customizer\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5615:\"<p class=\"has-drop-cap\">Gutenberg 9.1 was released to the public on Wednesday. The team announced over 200 commits from 77 contributors in its <a href=\"https://make.wordpress.org/core/2020/10/01/whats-new-in-gutenberg-30-september/\">release post</a> yesterday. One of the biggest changes to the interface was the addition of a new dropdown selector for block pattern categories. The team also reverted the block-based widgets section in the customizer and added an image size control to the Media &amp; Text block.</p>\n\n\n\n<p>One of the main focuses of this release was improving the block-based widgets editor. The feature was taken out of the experimental stage in Gutenberg 8.9 and continues to improve. The widgets screen now uses the <a href=\"https://github.com/WordPress/gutenberg/pull/25681\">same inserter UI</a> as the post-editing screen. However, users can currently only insert regular blocks. Patterns and reusable blocks are still not included.</p>\n\n\n\n<p>Theme authors can now <a href=\"https://github.com/WordPress/gutenberg/issues/20588\">control aspects of the block editor</a> via a custom <code>theme.json</code> file. This is part of the ongoing Global Styles project, which will allow theme authors to configure features for their users.</p>\n\n\n\n<p>The development team has also added an <a href=\"https://github.com/WordPress/gutenberg/pull/25115\">explicit box-sizing style rule</a> to the Cover and Group blocks. This is to avoid any potential issues with the new padding/spacing options. Theme authors who rely on the block editor styles should test their themes to make sure this change does not break anything.</p>\n\n\n\n<h2>Better Pattern Organization</h2>\n\n\n\n<img />New block patterns UI in the inserter.\n\n\n\n<p class=\"has-drop-cap\">I have been calling for the return of the tabbed pattern categories since <a href=\"https://wptavern.com/gutenberg-8-0-merges-block-and-pattern-inserter-adds-inline-formats-and-updates-code-editor\">Gutenberg 8.0</a>, which was a regression from previous versions. For 11 versions, users have had to scroll and scroll and scroll through every block pattern just to find the one they wanted. The development team has sought to address this issue by using a <a href=\"https://github.com/WordPress/gutenberg/pull/24954\">category dropdown selector</a>. When selecting a specific category, its patterns will appear.</p>\n\n\n\n<p>At first, I was unsure about this method over the old tabbed method. However, after some use, it feels like the right direction.</p>\n\n\n\n<p>As more and more theme and plugin authors add block pattern categories to users&rsquo; sites, the dropdown is a more sensible route. Even tabs could become unwieldy over time. The dropdown better organizes the list of categories and makes the UI cleaner. More than anything, I am enjoying the experience and look forward to this eventually landing in WordPress 5.6 later this year.</p>\n\n\n\n<h2>Customizer Widgets Reverted</h2>\n\n\n\n<img />Reverted widgets panel in the customizer.\n\n\n\n<p class=\"has-drop-cap\">On the subject of WordPress 5.6, one of its flagship features has been hitting some roadblocks. Block-based widgets are expected to land in core with the December release, but the team just reverted part of the feature. They had to remove the widgets block editor from the customizer they added just two major releases ago.</p>\n\n\n\n<p>It was for the best. The customizer&rsquo;s block-based widgets editor was <a href=\"https://wptavern.com/gutenberg-8-9-brings-block-based-widgets-out-of-the-experimental-stage\">fundamentally broken</a>. It was not ready for primetime and should have remained in the experimental stage until it was somewhat usable.</p>\n\n\n\n<p>&ldquo;I will approve this since the current state of the customizer in the Gutenberg plugin is broken, and there is no clear path forward about how to fix that,&rdquo; wrote Andrei Draganescu in the <a href=\"https://github.com/WordPress/gutenberg/pull/25626\">reversion ticket</a>. &ldquo;With this patch, the normal widgets can still be edited in the customizer and the block ones don&rsquo;t break it anymore. This is NOT to mean that we won&rsquo;t proceed with fixing the block editor in the customizer, that is still an ongoing discussion.&rdquo;</p>\n\n\n\n<p>The current state of editing widgets via the customizer is at least workable with this change. If end-users add a block via the admin-side widgets editor, it will merely appear as an uneditable, <em>faux</em> widget named &ldquo;Block&rdquo; in the customizer. They will need to edit blocks via the normal widgets screen.</p>\n\n\n\n<p>There is no way that WordPress can ship the current solution when 5.6 rolls out. However, we are still two months out. This leaves plenty of time for a fix, but Draganescu&rsquo;s note that &ldquo;there is no clear path forward&rdquo; may make some people a bit uneasy at this stage of development.</p>\n\n\n\n<h2>Control Image Size for Media &amp; Text</h2>\n\n\n\n<img />Image size dropdown selector for the Media &amp; Text block.\n\n\n\n<p class=\"has-drop-cap\">One of the bright spots in this update is the addition of an <a href=\"https://github.com/WordPress/gutenberg/pull/24795\">image size control</a> to the Media &amp; Text block. Like the normal Image block, end-users can choose from any registered image size created for their uploaded image.</p>\n\n\n\n<p>This is a feature I have been looking forward to in particular. Previously, using the full-sized image often made the page weight a bit heftier than necessary. It is also nice to go along with themes that register sizes for both landscape and portrait orientations, giving users more options.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Oct 2020 20:56:14 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:23;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"WordPress.org blog: The Month in WordPress: September 2020\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://wordpress.org/news/?p=9026\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"https://wordpress.org/news/2020/10/the-month-in-wordpress-september-2020/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:8711:\"<p>This month was characterized by some exciting announcements from the WordPress core team! Read on to catch up with all the WordPress news and updates from September.&nbsp;</p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>WordPress 5.5.1 Launch</h2>\n\n\n\n<p>On September 1, the&nbsp; Core team released <a href=\"https://wordpress.org/news/2020/09/wordpress-5-5-1-maintenance-release/\">WordPress 5.5.1</a>. This maintenance release included several bug fixes for both core and the editor, and many other enhancements. You can update to the latest version directly from your WordPress dashboard or <a href=\"https://wordpress.org/download/\">download</a> it directly from WordPress.org. The next major release will be <a href=\"https://make.wordpress.org/core/5-6/\">version 5.6</a>.</p>\n\n\n\n<p>Want to be involved in the next release?&nbsp; You can help to build WordPress Core by following<a href=\"https://make.wordpress.org/core/\"> the Core team blog</a>, and joining the #core channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Gutenberg 9.1, 9.0, and 8.9 are out</h2>\n\n\n\n<p>The core team launched <a href=\"https://make.wordpress.org/core/2020/09/16/whats-new-in-gutenberg-16-september/\">version 9.0</a> of the Gutenberg plugin on September 16, and <a href=\"https://make.wordpress.org/core/2020/10/01/whats-new-in-gutenberg-30-september/\">version 9.1</a> on September 30. <a href=\"https://make.wordpress.org/core/2020/09/16/whats-new-in-gutenberg-16-september/\">Version 9.0</a> features some useful enhancements — like a new look for the navigation screen (with drag and drop support in the list view) and modifications to the query block (including search, filtering by author, and support for tags). <a href=\"https://make.wordpress.org/core/2020/10/01/whats-new-in-gutenberg-30-september/\">Version 9.1</a> adds improvements to global styles, along with improvements for the UI and several blocks. <a href=\"https://make.wordpress.org/core/2020/09/03/whats-new-in-gutenberg-2-september/\">Version 8.9</a> of Gutenberg, which came out earlier in September, enables the block-based widgets feature (also known as block areas, and was previously available in the experiments section) by default — replacing the default WordPress widgets to the plugin. You can find out more about the Gutenberg roadmap in the <a href=\"https://make.wordpress.org/core/2020/09/03/whats-next-in-gutenberg-september/\">What’s next in Gutenberg blog post</a>.</p>\n\n\n\n<p>Want to get involved in building Gutenberg? Follow <a href=\"https://make.wordpress.org/core/\">the Core team blog</a>, contribute to <a href=\"https://github.com/WordPress/gutenberg/\">Gutenberg on GitHub</a>, and join the #core-editor channel in <a href=\"https://make.wordpress.org/chat/\">the Making WordPress Slack group</a>.</p>\n\n\n\n<h2>Twenty Twenty One is the WordPress 5.6 default theme</h2>\n\n\n\n<p><a href=\"https://make.wordpress.org/core/2020/09/23/introducing-twenty-twenty-one/\">Twenty Twenty One</a>, the brand new default theme for <a href=\"https://make.wordpress.org/core/5-6/\">WordPress 5.6</a>, has been announced! Twenty Twenty One is designed to be a blank canvas for the block editor, and will adopt a straightforward, yet refined, design. The theme has a limited color palette: a pastel green background color, two shades of dark grey for text, and a native set of system fonts. Twenty Twenty One will use a modified version of the <a href=\"https://wordpress.org/themes/seedlet/\">Seedlet theme</a> as its base. It will have a comprehensive system of nested CSS variables to make child theming easier, a native support for global styles, and full site editing.&nbsp;</p>\n\n\n\n<p>Follow the <a href=\"https://make.wordpress.org/core/\">Make/Core</a> blog if you wish to contribute to Twenty Twenty One. There will be weekly meetings every Monday at 15:00 UTC and triage sessions every Friday at 15:00 UTC in the #core-themes Slack channel. Theme development will happen <a href=\"https://github.com/wordpress/twentytwentyone.\">on GitHub</a>. </p>\n\n\n\n<hr class=\"wp-block-separator\" />\n\n\n\n<h2>Further Reading:</h2>\n\n\n\n<ul><li>WordPress plugin authors can now <a href=\"https://meta.trac.wordpress.org/changeset/10255\">opt into confirming plugin updates via email</a>. This feature will allow plugin authors to approve any plugin updates over email before release.</li><li>September was the busiest month for online WordCamps so far, with seven events taking place: <a href=\"https://ogijima.wordcamp.org/2020/\">WordCamp Ogijima Online</a>, <a href=\"https://colombia.wordcamp.org/2020/\">WordCamp Colombia Online</a>, <a href=\"https://2020.asheville.wordcamp.org/2020/\">WordCamp Asheville, NC USA</a>, <a href=\"https://saopaulo.wordcamp.org/2020/\">WordCamp São Paulo, Brazil</a>, <a href=\"https://2020.virginiabeach.wordcamp.org/\">WordCamp Virginia Beach</a>, <a href=\"https://2020.lima.wordcamp.org/\">WordCamp Lima Peru</a>, and <a href=\"https://philadelphia.wordcamp.org/2020/\">WordCamp Philadelphia, PA, USA</a>. You can find live stream recaps of these events on their websites. The camps are also in the process of uploading their videos to <a href=\"https://wordpress.tv/\">WordPress.tv</a>. Check out the <a href=\"https://central.wordcamp.org/schedule/\">WordCamp Schedule</a> to follow upcoming online WordCamps!</li><li>The Themes team has added a <a href=\"https://meta.trac.wordpress.org/changeset/10240\">delist feature</a> to the themes directory. The feature will allow a theme to be temporarily hidden from search, while still making it available. The team may delist themes if they violate the <a href=\"https://make.wordpress.org/themes/handbook/review/required/\">Theme Directory guidelines</a>. </li><li>The Themes Team has also released its <a href=\"https://make.wordpress.org/themes/2020/09/25/new-package-to-allow-locally-hosting-webfonts/\">new web fonts Loader project</a>. The webfonts loader will allow theme developers to load web fonts from the user’s site, rather than through a third-party CDN. The project lives in the team’s <a href=\"https://github.com/WPTT/webfont-loader\">GitHub repository</a>.</li><li>The Support team is discussing<a href=\"https://make.wordpress.org/support/2020/09/talking-point-allowing-self-archival-of-topics/\"> the level of control users should have</a> over their support forum topics. The team is thinking of allowing users to archive their topics and lengthen time-to-edit to remove any semi-sensitive data. In a separate, but related, post, Support team members have started discussing <a href=\"https://make.wordpress.org/support/2020/09/talking-point-handling-support-for-commercial-users-on-the-wordpress-forums/\">how to curb support requests for commercial products</a>.</li><li>The Mobile team <a href=\"https://make.wordpress.org/core/2020/09/21/proposal-dual-licensing-gutenberg-under-gpl-v2-0-and-mpl-v2-0/\">came up with a proposal for dual licensing Gutenberg</a> under GPL 2.0 and MPL (Mozilla Public License) 2.0, so that non-WordPress software developers can potentially use it for their projects.  </li><li>Since Facebook and Instagram are deprecating oEmbeds, the Core Team <a href=\"https://make.wordpress.org/core/2020/09/22/facebook-and-instagram-embeds-to-be-deprecated-october-24th/\">will be removing Facebook and Instagram’s oEmbed endpoints</a> from WordPress core code. </li><li>Following extensive discussion, the Documentation team <a href=\"https://make.wordpress.org/docs/2020/09/14/external-linking-policy-meeting-notes-august-25th/\">has tentatively decided to allow external and commercial links in the WordPress documentation</a>. The team aims to publish a formal proposal that will be left open for feedback before finalizing it.</li><li>Members of the Polyglots and Marketing teams are celebrating the <a href=\"https://make.wordpress.org/polyglots/2020/09/09/lets-celebrate-international-translation-day-together/\">International Translation Day</a> for WordPress over the week of September 28 &#8211; October 4! Community members can join or organize translation events, or contribute to WordPress core, theme, or plugin translations during this period. </li><li><a href=\"https://wpaccessibilityday.org/\">WP Accessibility day</a> — a 24-hour global online event dedicated to addressing website accessibility in WordPress, is being held on October 2. The event is open for all and has <a href=\"https://wpaccessibilityday.org/#talk-time\">experts from all over the world as speakers</a>.</li></ul>\n\n\n\n<p><em>Have a story that we should include in the next “Month in WordPress” post? Please </em><a href=\"https://make.wordpress.org/community/month-in-wordpress-submissions/\"><em>submit it here</em></a><em>.</em></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Oct 2020 09:34:04 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Hari Shanker R\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:24;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"WPTavern: Cloudflare Launches New Web Analytics Product Focusing on Privacy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105446\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:195:\"https://wptavern.com/cloudflare-launches-new-web-analytics-product-focusing-on-privacy?utm_source=rss&utm_medium=rss&utm_campaign=cloudflare-launches-new-web-analytics-product-focusing-on-privacy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2448:\"<p>In pursuit of &ldquo;<a href=\"https://www.cloudflare.com/web-analytics/\">democratizing web analytics</a>,&rdquo; Cloudflare announced it is launching privacy-first analytics as a new standalone product. The company is entering a market that has been <a href=\"https://www.datanyze.com/market-share/web-analytics--1/Alexa%20top%201M\">dominated by Google Analytics</a> for years but with a major differentiating feature &ndash; it will not track individual users by a cookie or IP address to show unique visits.</p>\n\n\n\n<p>Cloudflare Web Analytics defines a visit as &ldquo;a successful page view that has an&nbsp;<a rel=\"noreferrer noopener\" href=\"https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referer\" target=\"_blank\">HTTP referer</a>&nbsp;that doesn&rsquo;t match the hostname of the request.&rdquo; It&rsquo;s not the same as Google&rsquo;s &ldquo;unique&rdquo; metric, and Cloudflare says it may differ from other reporting tools. Weeding out bots from the total traffic numbers is a nascent feature that Cloudflare is improving as part of its&nbsp;<a rel=\"noreferrer noopener\" href=\"https://www.cloudflare.com/products/bot-management/\" target=\"_blank\">Bot Management product</a>.</p>\n\n\n\n<div class=\"wp-block-image\"><img /></div>\n\n\n\n<p>Cloudflare Web Analytics is launching with features that are largely similar to Google Analytics but with some unique ways of zooming into different traffic segments and time ranges to see where traffic is originating from. </p>\n\n\n\n<p>&ldquo;The most popular analytics services available were built to help ad-supported sites sell more ads,&rdquo; Cloudflare product manager Jon Levine said. &ldquo;But, a lot of websites don&rsquo;t have ads. So if you use those services, you&rsquo;re giving up the privacy of your users in order to understand how what you&rsquo;ve put online is performing.</p>\n\n\n\n<p>&ldquo;Cloudflare&rsquo;s business has never been built around tracking users or selling advertising. We don&rsquo;t want to know what you do on the Internet &mdash; it&rsquo;s not our business.&rdquo;</p>\n\n\n\n<p>Paying customers on the Pro, Biz, and Enterprise plans can access their analytics from their dashboards immediately. Cloudflare is also offering the product for free as JavaScript-based analytics for users who are not currently customers. Those who want access to the free plan can sign up for the <a href=\"https://www.cloudflare.com/web-analytics/\">waitlist</a>. </p>\n\n\n\n<p> </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 02 Oct 2020 04:03:01 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:25;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WPTavern: Virtual WordPress Page Builder Summit Kicks Off October 5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105570\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:179:\"https://wptavern.com/virtual-wordpress-page-builder-summit-kicks-off-october-5?utm_source=rss&utm_medium=rss&utm_campaign=virtual-wordpress-page-builder-summit-kicks-off-october-5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6348:\"<p class=\"has-drop-cap\">From October 5 through October 9, the first <a href=\"https://summit.camp/\">Page Builder Summit</a> will open its virtual doors to all attendees for free. Nathan Wrigley, the podcaster behind WP Builds, and Anchen le Roux, the founder and lead developer of Simply Digital Design, are hosting the five-day online event that focuses on the vast ecosystem of page builders for WordPress.</p>\n\n\n\n<p>The summit will include 35 sessions spread out over the <a href=\"https://summit.camp/schedule/\">event schedule</a>. Each session will last around 30 minutes, so it will be easy to pop in and watch one in your downtime. Sessions will cover a range of builders, including the default WordPress block editor, Elementor, Beaver Builder, Oxygen, Brizy, and Divi.</p>\n\n\n\n<p>&ldquo;It&rsquo;s an event specifically for users of WordPress page builders, or those curious about what they can do,&rdquo; said Wrigley. &ldquo;I feel like a page builder style interface for creating websites is the future for our industry. WordPress itself is moving in this direction with the block editor (a.k.a. Gutenberg). With that in mind, it seemed like a good idea to create a dedicated event to share knowledge about this side of WordPress. We&rsquo;ve tried to include presentations from as many page builders as we could.&rdquo;</p>\n\n\n\n<p>Wrigley made sure to point out that it is not all geared toward developers, discussing the inner-workings of builders. Some of the sessions focus on marketing, optimization, and conversion, which provides a wider range of topics for potential attendees.</p>\n\n\n\n<p>The summit hosts created an <a href=\"https://summit.camp/page-builder-quiz/\">online quiz</a> for those who are unsure about which sessions to watch.</p>\n\n\n\n<p>There is a small catch. The sessions will be freely available only from the time they begin and the following 24 hours. After that, accessing the videos will come at a premium. Attendees can gain lifetime access to the PowerPack for $47 if they purchase within 15 minutes of signing up. Then, prices will rise to $97 until the event kicks off on October 5. Beyond, the price jumps to $147. The lifetime access includes access to the presentations, transcripts, a workbook, and other bonuses from the speakers.</p>\n\n\n\n<p>For those unsure about forking over the cash, they can still watch the sessions during the 24-hour window.</p>\n\n\n\n<p>The proceeds from the event will go out to paying affiliate commissions to speakers and partners. Some of it will go into planning and investing in a second summit down the road.</p>\n\n\n\n<p>&ldquo;Both myself and Nathan have specific charities that we want to donate to after the event,&rdquo; said le Roux. &ldquo;It was part of our goals to be able to do this, but we didn&rsquo;t want to make this an <em>official contribution</em>.&rdquo;</p>\n\n\n\n<h2>Why a Page Builder Summit?</h2>\n\n\n\n<p class=\"has-drop-cap\">Both Wrigley and le Roux have their preferred builders. But, the goal of the summit is to offer a wide look at the tools available and help freelancers and agencies better streamline their businesses and create happier clients.</p>\n\n\n\n<p>&ldquo;I&rsquo;ve been a user of page builders for many years, but only at the point where they truly showed in the editing interface something that almost perfectly reflected what the end-user would see did I get really immersed,&rdquo; said Wrigley. &ldquo;Having come from a background in which I built entire websites from a collection of text files (HTML, CSS, PHP, etc.), I was fascinated that we&rsquo;d reached a point where the learning curve for building a good website was significantly reduced.&rdquo;</p>\n\n\n\n<p>He pointed out that it is not always so simple though. While the same level of coding skills may not be necessary, people must figure out how to navigate their preferred page builder, which can come with its own learning curve.</p>\n\n\n\n<p>&ldquo;You need to learn their way of doing things and how to achieve your design choices,&rdquo; he said. &ldquo;It&rsquo;s always going to work out better if you know the code, but the WordPress mission of democratizing publishing certainly seems to align quite nicely with the adoption of tools, like page builders, which mean that once-difficult tasks are now easier.&rdquo;</p>\n\n\n\n<p>For le Roux, her interest in hosting the Page Builder Summit falls back to her design studio.</p>\n\n\n\n<p>&ldquo;As a developer, my main reason for switching to page builders was around streamlining and creating more efficient but quality websites in the shortest amount of time,&rdquo; she said. &ldquo;Especially now that we focus on day rates, creating the best possible website that clients would love fast would not have been possible without page builders.&rdquo;</p>\n\n\n\n<h2>The Hosts&rsquo; Go-To Builders</h2>\n\n\n\n<p>&ldquo;We prefer using Beaver Builder with Themer at Simply Digital Design,&rdquo; said le Roux. &ldquo;We use Gutenberg for blog posts or where possible with custom post types or LMS software. However, we&rsquo;ve also taken on a few Elementor projects where that&rsquo;s the client&rsquo;s preferred option.&rdquo;</p>\n\n\n\n<p>Wrigley uses some of the same tools. His main work is on the WP Builds website where he hosts podcasts.</p>\n\n\n\n<p>&ldquo;I have used Beaver Builder&rsquo;s Themer to create templates for specific layouts, but for content creation within those layouts I&rsquo;m using the block editor,&rdquo; said Wrigley. &ldquo;My content is mainly text and the WordPress editor is utterly remarkable in this situation. I kept the classic editor installed for a few months after WordPress 5.0 came about, but I soon realized that this was folly and that the editing interface of Gutenberg is superior. The ability to insert and move text, buttons, etc. is such a joy to work with, and the iterations that have been made in the last two years make it, in my opinion, the best text editing experience on the web.&rdquo;</p>\n\n\n\n<p>Wrigley sees a future in which the WordPress block editor takes over much of the work that page builders are currently handling. However, that future is &ldquo;still over the horizon.&rdquo;</p>\n\n\n\n<p>&ldquo;I&rsquo;m excited about this future though, and we&rsquo;ve got a few crystal ball-gazing presentations; trying to work out what that future might look like,&rdquo; he said.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 01 Oct 2020 20:31:07 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:26;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:99:\"WPTavern: Jetpack 9.0 to Introduce New Feature for Publishing WordPress Posts to Twitter as Threads\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105448\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:243:\"https://wptavern.com/jetpack-9-0-to-introduce-new-feature-for-publishing-wordpress-posts-to-twitter-as-threads?utm_source=rss&utm_medium=rss&utm_campaign=jetpack-9-0-to-introduce-new-feature-for-publishing-wordpress-posts-to-twitter-as-threads\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:3318:\"<p>Jetpack 9.0, coming on October 6, will debut a new feature that allows users to <a href=\"https://github.com/Automattic/jetpack/pull/16699\">share blog posts as Twitter threads</a> in multiples tweets. A recent version of Jetpack introduced the ability to import and <a href=\"https://wptavern.com/jetpack-8-7-adds-new-tweetstorm-unroll-feature-improves-search-customization\">unroll tweetstorms for publishing inside a post</a>. The 9.0 release will run it back the other way so the content originates in WordPress, yet still reaps all the same benefits of circulation on Twitter as a thread. </p>\n\n\n\n<p>The new Twitter threads feature is being added as part of Jetpack&rsquo;s Publicize module under the Twitter settings.  After linking up a Twitter account, the Jetpack sidebar options for Publicize allow users to publish to Twitter as a link to the blog or a set of threaded tweets. It&rsquo;s not just limited to text content &ndash; the threads feature will also upload and attach any images and videos included in the post. </p>\n\n\n\n<img />\n\n\n\n<p>When first introduced to the idea of publishing a Twitter thread from WordPress, I wondered if threads might lose their trademark pithy punch, since users aren&rsquo;t forced to keep each segment to the standard length of a tweet. Would each tweet be separated in an odd, unreadable way? The Jetpack team anticipated this, so the thread option adds more information to the block editor to show where the paragraphs will be split into multiple tweets.</p>\n\n\n\n<p>&ldquo;Threads are wildly underused on Twitter,&rdquo; Gary Pendergast said in a <a href=\"https://pento.net/2020/09/29/more-than-280-characters/\">post</a> introducing the feature. &ldquo;I think a big part of that is the UI for writing threads: while it&rsquo;s suited to writing a thread as a series of related tweet-sized chunks, it doesn&rsquo;t lend itself to writing, revising, and editing anything more complex.&rdquo; The tool Pendergast has been working on for Jetpack gives users the best of both worlds.</p>\n\n\n\n<p>In response to a comment requesting Automattic &ldquo;concentrate on tools to get people off social media,&rdquo; Pendergast said, &ldquo;If we&rsquo;re also able to improve the quality of conversations on social media, I think it&rsquo;d be remiss of us to not do so.&rdquo; He also credits IndieWeb discussions on&nbsp;<a href=\"https://indieweb.org/tweetstorm\">Tweetstorms</a>&nbsp;and&nbsp;<a href=\"https://indieweb.org/POSSE\">POSSE</a> (Publish (on your) Own Site,&nbsp;Syndicate&nbsp;Elsewhere) as inspirations for the feature.</p>\n\n\n\n<p>For years, blogging advocates have tried to convince those who post lengthy tweetstorms to switch to a publishing medium that is more suitable to the length of their thoughts. The problem is that Twitter users lose so much of the immediate feedback and momentum that their thoughts would have generated when composed as a tweetstorm.</p>\n\n\n\n<p>Instead of lecturing people about how they should really be blogging instead of tweetstorming, Jetpack is taking a fresh approach by enabling full content ownership with effortless social syndication. You can test out the experience for yourself by adding the <a href=\"https://jetpack.com/download-jetpack-beta/\">Jetpack Beta Testers</a> plugin and running the 9.0 RC version on your site.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 01 Oct 2020 02:56:46 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:27;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:63:\"WPTavern: Ask the Bartender: How To WordPress in a Block World?\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105491\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:167:\"https://wptavern.com/ask-the-bartender-how-to-wordpress-in-a-block-world?utm_source=rss&utm_medium=rss&utm_campaign=ask-the-bartender-how-to-wordpress-in-a-block-world\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:9755:\"<blockquote class=\"wp-block-quote\"><p>I love your articles. And now, in the middle of the WordPress revolution, I realized I&rsquo;m constantly searching for an answer regarding WP these days.</p><p>So many things are being said, so many previsions of the future, problems, etc., but, right now, I think I, as a designer, just want to understand one thing that seemed answered already but it&rsquo;s never clear:</p><p>Is WordPress a good choice to build a client&rsquo;s template where he just has to insert the info that will show in the frontend where I want to? And he doesn&rsquo;t have to worry about formatting blocks? I love blocks, don&rsquo;t get me wrong, but will normal templating end?</p><p>I just think that having a super CMS, HTML, CSS, and being able to play with a database with ACF is so powerful, that I&rsquo;m wondering if it&rsquo;s lost. After so much reading, I still don&rsquo;t understand if this paradigm is going to disappear.</p><p>Right now, I don&rsquo;t know if it&rsquo;s best to stop making websites as I used to and adopt block patterns instead.</p><cite>Ricardo</cite></blockquote>\n\n\n\n<p class=\"has-drop-cap\">WordPress is definitely changing. Over the past two years, we have seen much of it reshaped into something different from the previous decade and more. However, this is not new. WordPress has always been a constantly-changing platform. It just feels far too different this time around, almost foreign to many. The platform had to make a leap. Otherwise, it would have started falling behind.</p>\n\n\n\n<p>And, it is a big <em>ask</em> of the existing community to come along with it, to take that leap together.</p>\n\n\n\n<p>It can be scary as a developer whose livelihood has depended on things working a certain way or who has built tools and systems around pre-block WordPress. Many freelancers and agencies had their world turned upside down with the launch of the block editor. It is perfectly OK to feel a bit lost.</p>\n\n\n\n<p>Now, it is time for a little tough love. It has been two years. As a professional, you need to have a plan in place already. Whether that is an educational plan for yourself or a transitional plan for your clients, you should already be tackling projects that leverage the block editor. If you are at a point where you have not been building with blocks, you are now behind. However, you can still catch up and continue advancing in your WordPress career.</p>\n\n\n\n<p>There are so many changes coming down the pipeline that anyone who plans to develop for WordPress will be in continual education mode for years to come.</p>\n\n\n\n<p>When building for clients, the biggest thing to remember is that it is not about you. It is about getting something into the hands of your clients that addresses their specific needs. Freelancers and agencies need to often be the Jacks and Jills of all trades. Sometimes, this even means having a backup CMS or two that you can use that are not named WordPress. It helps to be well-rounded enough to jump around when needed, especially if you are not at a point in your career where you can demand specific work and pass on jobs that would put food on the table.</p>\n\n\n\n<p>It is also easy to look at every job as a nail and WordPress as the hammer. Or, even specific plugins as the tool that will always get the job done. I have seen developers in the past rely on tools like ACF, CMB2, or Meta Box but could not code a custom metadata solution when necessary to save their life.  Sometimes a bigger toolbox is necessary.</p>\n\n\n\n<p>Every WordPress developer needs a solid, foundational understanding of the languages that WordPress uses. Gone are the days of skating by on HTML, CSS, and PHP knowledge. You need to learn JavaScript deeply. Matt Mullenweg, the co-founder of WordPress, was not joking around when he <a href=\"https://wptavern.com/state-of-the-word-2015-javascript-and-api-driven-interfaces-are-the-future-of-wordpress\">said this back in 2015</a>. It holds true more and more each day. In another five years, it will tough to be a developer in the WordPress world without knowing JavaScript, at least for backend work.</p>\n\n\n\n<p>It also depends on what types of sites you are building. If you are primarily handling front-end design, you will likely be able to get by with a lower skill level. You will just need to know the &ldquo;WordPress way&rdquo; of building themes.</p>\n\n\n\n<p>Within the next year, you should be able to build just about any theme design with decent CSS and HTML knowledge along with an understanding of how the block system works. Full-site editing and block-based themes will change how we build the front end of the web. It is going to be a challenging transition at first, especially for those of us who are steeped in traditional theme development, but client sites will often be far easier to build.  I highly recommend the twice-monthly <a href=\"https://make.wordpress.org/themes/\">block-based themes meetings</a> if your focus is on the front end.</p>\n\n\n\n<h2>Block Templates</h2>\n\n\n\n<p class=\"has-drop-cap\">Based on your question, I am going to make some assumptions. You have a history of essentially building out meta boxes via ACF where the client just pops in their data. Then, you format that data on the front end. You are likely mixing this with custom post types (CPTs). This is a fairly common scenario.</p>\n\n\n\n<p>One of the great things about the block system is that you can lock the post editor for individual CPTs. WordPress already has you covered with its <a href=\"https://developer.wordpress.org/block-editor/developers/block-api/block-templates/\">block templates feature</a>, which allows you to define just what a post should look like. You can set up which blocks you want to appear and have the client drop their content in. At the moment, this feature is limited to the post type level. However, it should grow more robust over time, particularly when it works alongside the traditional &ldquo;page templates&rdquo; system.</p>\n\n\n\n<p>Block templates are a powerful tool in the ol&rsquo; toolbox that will come in handy when building client sites.</p>\n\n\n\n<h2>Block Patterns</h2>\n\n\n\n<p class=\"has-drop-cap\">You do not have to stop making websites as you are accustomed to at the moment. However, you should start leveraging new block features as they become available and make sense for a specific project. I am a fanatic when it comes to <a href=\"https://wptavern.com/block-patterns-will-change-everything\">block patterns</a>, so my bias will definitely show.</p>\n\n\n\n<p>The biggest thing with block patterns and clients is education. For the uninitiated, you will need to spend some time teaching them how to insert a pattern and how it can be used to their advantage. That is the hurdle you must jump.</p>\n\n\n\n<p>For many of the users that I have seen introduced to well-designed patterns, they have fallen in love with the feature. Even many who were reluctant to switch to the block editor became far more comfortable working with it after learning how patterns worked. This is not the case for every user or client, but it has been a good introduction point to the block editor for many.</p>\n\n\n\n<p>To answer your question regarding patterns: yes, you should absolutely begin to adopt them.</p>\n\n\n\n<h2>ACF Is Evolving</h2>\n\n\n\n<p class=\"has-drop-cap\">Because you are accustomed to ACF, you should be aware that the framework is evolving to keep up with the block editor. <a href=\"https://wptavern.com/advanced-custom-fields-5-8-0-introduces-acf-blocks-a-php-framework-for-creating-gutenberg-blocks\">Version 5.8.0</a> introduced a PHP framework for creating custom blocks over a year ago. And, it has been improving ever since. There are even projects like <a href=\"https://wptavern.com/acf-blocks-provides-assortment-of-blocks-built-from-advanced-custom-fields-pro\">ACF Blocks</a>, which will provide even more tools for your arsenal.</p>\n\n\n\n<p>It is important to learn from what some of the larger agencies are doing. Read up on how <a href=\"https://webdevstudios.com/2020/09/08/gutenberg-first/\">WebDevStudios is tackling block development</a>. The company also has an open-source <a href=\"https://github.com/WebDevStudios/wds-acf-blocks\">block library</a> for ACF.</p>\n\n\n\n<h2>Solving Problems</h2>\n\n\n\n<p class=\"has-drop-cap\">Your job as a developer is to be a problem solver. Whatever system you are building with is merely a part of your toolset. You need to be able to solve issues regardless of what tool you are using. At the end of the day, it is just code. If you can learn HTML, you can learn CSS. If you can learn those, you can learn PHP. And, if you can manage PHP, you can certainly pick up JavaScript.</p>\n\n\n\n<p>A decade or two from now, you will need to learn something else to stay relevant in your career. Web technology changes. You must change with it. Always consider yourself a student and continue your education. Surround yourself and learn from those who are more advanced than you. Emulate, borrow, and steal good ideas. Use what you have learned to make them great.</p>\n\n\n\n<p>There is no answer I can give that will be perfect for every scenario. Each client is unique, and you will need to decide the best direction for each.</p>\n\n\n\n<p>However, yes, you should already be on the path to building with a block-first mindset if you plan to continue working with WordPress for the long haul. Immerse yourself in the system. Read, study, and build something any chance you get.</p>\n\n\n\n<p class=\"has-white-color has-blue-700-background-color has-text-color has-background text-white bg-blue-700\">This is the first post in the Ask the Bartender series.  Have a question of your own? <a href=\"https://wptavern.com/contact-me/ask-the-bartender\">Shoot it over</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 30 Sep 2020 20:35:25 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:28;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:91:\"WPTavern: Supercharge the Default WordPress Theme With Twentig, a Toolbox for Twenty Twenty\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105344\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:225:\"https://wptavern.com/supercharge-the-default-wordpress-theme-with-twentig-a-toolbox-for-twenty-twenty?utm_source=rss&utm_medium=rss&utm_campaign=supercharge-the-default-wordpress-theme-with-twentig-a-toolbox-for-twenty-twenty\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6455:\"<img />Custom page pattern from the Twentig plugin.\n\n\n\n<p class=\"has-drop-cap\">I am often on the hunt for those hidden gems when it comes to block-related plugins. I like to see the interesting places that plugin authors venture. That is why it came as a surprise when <a href=\"https://twitter.com/Gtarafdarr/status/1310240580140556290\">someone recommended</a> I check out the <a href=\"https://wordpress.org/plugins/twentig/\">Twentig plugin</a> a few days ago. Somehow, it has flown under my radar for months. And, it has managed to do this while being one of the more interesting plugins for WordPress I have seen in the past year.</p>\n\n\n\n<p>Twentig is a plugin that essentially gives superpowers to the default Twenty Twenty theme.  Diane and Yann Collet are the sibling co-founders and brains behind the plugin.</p>\n\n\n\n<p>While I have been generally a fan of Twenty Twenty since it was <a href=\"https://wptavern.com/twenty-twenty-bundled-in-core-beta-features-overview\">first bundled in core</a>, it was almost a bit of a letdown in some ways. It was supposed to be the theme that truly showcased what the block editor could do &mdash; and it does a fine job of styling the default blocks &mdash; but there was a lot of potential left on the table. The Twentig plugin turns Twenty Twenty into something worthier of a showcase for the block editor. It is that missing piece, that extra mile in which WordPress should be marching its default themes.</p>\n\n\n\n<p>While the new <a href=\"https://wptavern.com/first-look-at-twenty-twenty-one-wordpresss-upcoming-default-theme\">Twenty Twenty-One</a> default theme is just around the corner, Twentig is breathing new life into the past year&rsquo;s theme. The developers behind the plugin are still fixing bugs and bringing new features users.</p>\n\n\n\n<p>Of its 34 reviews on WordPress.org, Twentig has earned a solid five-star rating. That is a nice score for a plugin with only 4,000 active installations. As I said, it has flown under the radar a bit, but the users who have found it have obviously discovered something that adds those extra touches to their sites they need.</p>\n\n\n\n<h2>What Does Twentig Do?</h2>\n\n\n\n<p class=\"has-drop-cap\">It is a toolbox for Twenty Twenty. The headline feature is its block editor features, such as custom patterns and page layouts. It also offers a slew of customizer options that allow end-users to put their own design spin on the default theme. However, my interest is primarily in how it extends the block editor. </p>\n\n\n\n<p>Let&rsquo;s get this out of the way up front. Twentig&rsquo;s one downside is that it adds a significant amount of additional CSS on top of the already-heavy Twenty Twenty and block editor styles. I will blame the current lack of a full design system from WordPress on most of this. Styling for the block editor can easily bloat a stylesheet. Adding an extra 100+ kb per page load might be a blocker for some who would like to try the plugin. Users will need to weigh the trade-offs between the additional features and the added page size.</p>\n\n\n\n<p>The thing that makes Twentig special is its extensive patterns and pages library, which offers one-click access to hundreds of layouts specifically catered to the Twenty Twenty theme.</p>\n\n\n\n<img />Inserting one of the hero patterns.\n\n\n\n<p>It took me a few minutes to figure out how to access the patterns &mdash; mainly because I did not read the manual. I expected to find them mixed in with the core patterns inserter. However, the plugin adds a new sidebar panel to the editor, which users can access by clicking the &ldquo;tw&rdquo; icon. After seeing the list of options, I can understand why they probably would not fit into WordPress&rsquo;s limited block and patterns inserter UI.</p>\n\n\n\n<p>It would be easier to list what the plugin does not have than to go through each of the custom patterns and pages.</p>\n\n\n\n<p>The one thing that truly sets this plugin apart from the dozens of other block-library types of plugins is that there are no hiccups with the design. Almost every similar plugin or tool I have tested has had CSS conflicts with themes because they are trying to be a tool for every user. Twentig specifically targets the Twenty Twenty theme, which means it does not have to worry about whether it looks good with the other thousands of themes out there. It has one job, which is to extend its preferred theme, and it does it with well-designed block output.</p>\n\n\n\n<p>The other aspect of this is that it does not introduce new blocks. Every pattern and page layout option uses the core WordPress blocks, which includes everything from hero sections to testimonials to pricing tables to event listings.  And more.</p>\n\n\n\n<p>Twentig does not stop adding features to the block editor with custom patterns. The useful and sometimes fun bits are on the individual block level, and I have yet to explore everything. I continue to discover new settings each time I open my editor.</p>\n\n\n\n<p>Whether it is custom pullquote styles, a photo image frame, or an inner border tweak to the Cover block (shown below), the plugin adds little extras that push what users can do with their content.</p>\n\n\n\n<img />Inner border style for the Cover block.\n\n\n\n<p>Each block also gets some basic top and bottom margin options, which comes in handy when laying out a page. At this point, I am simply looking forward to discovering features I have yet to find.</p>\n\n\n\n<h2>Areas Themes Should Explore</h2>\n\n\n\n<p class=\"has-drop-cap\">One of the things I dislike about many of these features being within the Twentig plugin is that I would like to see them within the Twenty Twenty theme instead. Obviously not every feature belongs in the theme &mdash; some features firmly land in plugin territory. The default WordPress themes should also leave some room for plugin authors to explore. But, shipping some of the more prominent patterns and styles with Twenty Twenty would make a more robust experience for the average end-user looking to get the most out of blocks.</p>\n\n\n\n<p>Block patterns were not a core WordPress feature when Twenty Twenty landed. However, for the upcoming Twenty Twenty-One theme, which is expected to bundle some unique patterns, the design team should explore what the Twentig plugin has brought to the current default. That is the direction that theme development should be heading, and theme developers can learn a lot by <s>stealing</s> borrowing from this plugin.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 29 Sep 2020 22:00:42 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:29;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:105:\"WPTavern: Coming in Jetpack 9.0: Shortcode Embeds Module Updated to Handle Facebook and Instagram oEmbeds\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105381\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:253:\"https://wptavern.com/coming-in-jetpack-9-0-shortcode-embeds-module-updated-to-handle-facebook-and-instagram-oembeds?utm_source=rss&utm_medium=rss&utm_campaign=coming-in-jetpack-9-0-shortcode-embeds-module-updated-to-handle-facebook-and-instagram-oembeds\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2938:\"<p>Facebook and Instagram are&nbsp;<a href=\"https://wptavern.com/upcoming-api-change-will-break-facebook-and-instagram-oembed-links-across-the-web-beginning-october-24\">dropping unauthenticated oEmbed support</a>&nbsp;on October&nbsp;24. WordPress will be removing both Facebook and Instagram as oEmbed providers in an upcoming release. After evaluating third-party solutions, WordPress VIP is <a href=\"https://lobby.vip.wordpress.com/2020/09/28/updates-and-recommendations-facebook-and-instagram-changing-oembed-to-require-authentication/\">recommending</a> its partners enable Jetpack&rsquo;s <a href=\"https://jetpack.com/support/shortcode-embeds/\">Shortcode Embeds</a> module. Jetpack will be shipping the update in its <a href=\"https://github.com/Automattic/jetpack/milestone/166\">9.0 release</a>, which is anticipated to land prior to the October 24th deadline.</p>\n\n\n\n<p>The module is being <a href=\"https://github.com/Automattic/jetpack/pull/16814\">updated</a> to provide a seamless transition for users who might otherwise be negatively impacted by Facebook&rsquo;s upcoming API change. WordPress contributors have run some simulations but are not yet sure what will happen to the display for previously embedded content.</p>\n\n\n\n<p>&ldquo;It is possible that they change the contents of the JS file to manipulate cached embeds, perhaps to display a warning that the site is using an old method to embed content or that the request is not properly authenticated,&rdquo; Jonathan Desrosiers commented on the trac <a href=\"https://core.trac.wordpress.org/ticket/50861#comment:35\">ticket</a> for removing the oEmbed providers.</p>\n\n\n\n<p>WordPress.com VIP roughly outlined what users can expect if they do not enable a solution to begin authenticating oEmbeds:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>By default, WordPress caches oEmbed contents in post metadata. These embeds will continue to display in previously-published content.&nbsp;If you edit older posts in the Block Editor, regardless of whether you update the post by saving changes, the embeds in the post will no longer be cached and will stop displaying.&nbsp;If you view these older posts using the Classic Editor, so long as the post is not re-saved, the embeds will continue to function and display properly. If you update the post content, the embed will cease functioning unless you have a mitigation installed.</p></blockquote>\n\n\n\n<p>Although WordPress VIP recommends using the Jetpack module as the best solution, self-hosted WordPress users may want to investigate other options if they are not already using Jetpack. <a href=\"https://wordpress.org/plugins/oembed-plus/\">oEmbed Plus</a> is a free plugin created specifically for solving the problem of WordPress dropping Facebook and Instagram as oEmbed providers but it is more work to set up and configure. It requires users to register as a Facebook developer and create an app to get API credentials.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 29 Sep 2020 21:18:52 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:30;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"WPTavern: W3C Selects Craft CMS for Redesign Project\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105265\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:149:\"https://wptavern.com/w3c-selects-craft-cms-for-redesign-project?utm_source=rss&utm_medium=rss&utm_campaign=w3c-selects-craft-cms-for-redesign-project\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:9407:\"<p>W3C has <a href=\"https://w3c.studio24.net/docs/cms-selection-report/\">selected Craft CMS</a> over Statamic for its redesign project, after <a href=\"https://wptavern.com/w3c-drops-wordpress-from-consideration-for-redesign-narrows-cms-shortlist-to-statamic-and-craft\">dropping WordPress from consideration</a> in an earlier round of elimination: </p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>In the end, our decision mostly came down to available resources. Craft had already committed to reach AA compliance in Craft 4 (it is currently on version 3.5, the release of version 4 is planned for April 2021). They had also arranged for an external agency to provide them with accessibility issues to tackle weekly. In the end, they decided instead to hire an in-house accessibility specialist to perform assessments and assist the development team in adopting accessibility patterns in the long run.</p><cite><a href=\"https://w3c.studio24.net/docs/cms-selection-report/\">W3C CMS Selection Report</a></cite></blockquote>\n\n\n\n<p>Last week we published a <a href=\"https://wptavern.com/w3c-drops-wordpress-from-consideration-for-redesign-narrows-cms-shortlist-to-statamic-and-craft\">post</a> urging W3C to revisit Gutenberg for a fair shake against the proprietary CMS&rsquo;s or consider adopting another open source option. During the selection process, Studio 24, the agency contracted for the redesign, cited its extensive experience with WordPress as the reason for not performing any accessibility testing on more recent versions of Gutenberg. </p>\n\n\n\n<p>When asked if the  team contacted anyone from WordPress&rsquo; Accessibility Team during the process or put Gutenberg through the same tests as the proprietary CMS&rsquo;s, Studio 24 founder Simon Jones <a href=\"https://twitter.com/simonrjones/status/1309817109636157440\">confirmed</a> they had not. </p>\n\n\n\n<p>&ldquo;No, we only reached out to the two shortlisted CMS&rsquo;s&rdquo; Jones said. &ldquo;I&rsquo;m afraid we didn&rsquo;t have time to do more. We did test GB a few months ago based on editing content &ndash; though it wasn&rsquo;t the only factor in our choice. As an agency we do plan to keep reviewing GB in the future.&rdquo; </p>\n\n\n\n<p>In response to our concerns regarding licensing, Jones penned an update titled &ldquo;<a href=\"https://w3c.studio24.net/updates/on-not-choosing-wordpress/\">On not choosing WordPress,</a>&rdquo; which further elaborated on the reasons why the agency was not inclined towards using or evaluating the new editor:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>From a business perspective I also believe Gutenberg creates a complexity issue that makes it challenging for use by many agencies who create custom websites for clients; where we have a need to create lots of bespoke blocks and page elements for individual client projects.</p><p>The use of React complicates front-end build. We have very talented front-end developers, however, they are not React experts &ndash; nor should they need to be. I believe front-end should be built as standards-compliant HTML/CSS with JavaScript used to enrich functionality where necessary and appropriate.</p><p>As of yet, we have not found a satisfactory (and profitable) way to build custom Gutenberg blocks for commercial projects.&nbsp;</p></blockquote>\n\n\n\n<p>The CMS selection report also stated that W3C needs the CMS to be &ldquo;usable by non-sighted users&rdquo; by the launch date, since some members of the staff who contribute to the website are non-sighted. </p>\n\n\n\n<p>Since the most recent version of WordPress was not tested in comparison with the proprietary CMS&rsquo;s, it&rsquo;s unclear how much better they handle accessibility. Ultimately, W3C and Studio 24 were more comfortable moving forward with a proprietary vendor that was able to make certain assurances about the future accessibility of its authoring tool, despite having a smaller pool of contributors.</p>\n\n\n\n<p>&ldquo;[I&rsquo;m] also deeply curious since the cursory notes on accessibility for both of the reviewed CMSes seem to highlight a ton of issues like &lsquo;Buttons and Checkboxes are built using div elements&rsquo; or most inputs lacking clear focus styles,&rdquo; Gutenberg technical lead Mat&iacute;as Ventura said. &ldquo;An element like the&nbsp;<em>Calendar</em>&nbsp;for choosing a post date seems entirely inoperable with keyboard on Craft, for example, while WordPress&rsquo; has had significant effort and rounds of feedback poured into that element alone to make it fully operable.&rdquo;</p>\n\n\n\n<p>WordPress developer Anthony Burchell commented on how using a relatively new proprietary CMS seemed counter to W3C&rsquo;s stated goal to select an option on the basis of longevity. Craft CMS&rsquo;s continued success is contingent upon its business model and the company&rsquo;s ability to remain profitable. </p>\n\n\n\n<p>&ldquo;FOSS have the same opportunity of direct access to developers,&rdquo; Burchell <a href=\"https://twitter.com/antpb/status/1309883204728430593?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1309883204728430593%7Ctwgr%5Eshare_3&ref_url=https%3A%2F%2Fwptavern.com%2Fwp-admin%2Fpost.php%3Fpost%3D105265action%3Dedit\">said</a>. &ldquo;I recognize there are many accessibility shortcomings in popular software, but I think it&rsquo;s more constructive to rally behind and contribute, not use a proprietary CMS that boasts beer budget in their guidelines.&rdquo; </p>\n\n\n\n<p>On the other side of the issue, accessibility advocates took the W3C&rsquo;s decision as a referendum on Gutenberg&rsquo;s continued struggles to meet WCAG AA standards. WordPress accessibility specialist Amanda Rush <a href=\"https://www.customerservant.com/w3c-is-prioritizing-accessibility-over-its-open-source-licensing-preferences-why-is-that-a-bad-thing-again/\">said</a> it was &ldquo;nice to see the W3C flip tables over this.&rdquo;</p>\n\n\n\n<p>&ldquo;Gutenberg is not mature software,&rdquo; accessibility consultant and WordPress contributor Joe Dolson said in a <a href=\"https://www.joedolson.com/2020/09/the-w3c-drops-wordpress-from-consideration/\">post</a> elaborating on his comments at WPCampus 2020 Online. He emphasized the lack of stability in the project that Studio 24 alluded to when documenting the reasons against using WordPress.</p>\n\n\n\n<p>&ldquo;It is still undergoing rapid changes, and has grand goals to add a full-site editing experience for WordPress that almost guarantees that it will continue to undergo rapid changes for the next few years,&rdquo; Dolson said. &ldquo;Why would any organization that is investing a large amount into a site that they presumably hope will last another 10 years want to invest in something this uncertain?&rdquo;</p>\n\n\n\n<p>Dolson also said the accessibility improvements he referenced regarding the audit were only a small part of the whole picture.  </p>\n\n\n\n<p>&ldquo;They only encompass issues that existed in the spring of 2019,&rdquo; he said. &ldquo;Since then, many features have been added and changed, and those features both resolve issues and have created new ones. The accessibility team is constantly playing catch up to try and provide enough support to improve Gutenberg. And even now, while it is more or less accessible, there are critical features that are not yet implemented. There are entirely new interface patterns introduced on a regular basis that break prior accessibility expectations.&rdquo;</p>\n\n\n\n<p>WordPress is also being used by millions of people who are constantly reporting issues to fuel the software&rsquo;s continued refinement, which increases the <a href=\"https://github.com/WordPress/gutenberg/labels/Accessibility%20%28a11y%29\">backlog of issues</a>. Unfortunately, Studio 24 did not properly evaluate Gutenberg against the proprietary CMS&rsquo;s in order to determine if these software projects are in any better shape. </p>\n\n\n\n<p>Instead, they decided that Craft CMS&rsquo;s community was more receptive to collaborating on issues without reaching out to WordPress. Given the W3C&rsquo;s stated preference for open source software, WordPress, as the only CMS under consideration with an <a href=\"https://opensource.org/licenses\">OSD-compliant license</a>, should have received the same accessibility evaluation.</p>\n\n\n\n<p>&ldquo;I can&rsquo;t make any statements that would be meaningful about the other content management systems under consideration; but if WordPress wants to be taken seriously in environments where accessibility is a legal, ethical, and mission imperative, there&rsquo;s still a lot of work to be done,&rdquo; Dolson said.</p>\n\n\n\n<p>Studio 24&rsquo;s evaluation may not have been equitable to the only open source CMS under consideration, but the situation serves to highlight a unique quandary: when using open source software becomes the impractical choice for organizations requiring a high level of accessibility in their authoring tools.</p>\n\n\n\n<p>&ldquo;Studio 24 ultimately determined that working with a CMS to make it better was more possible with a smaller, proprietary vendor than with a large open-source project,&rdquo; accessibility advocate Brian DeConinck said. &ldquo;Project leadership would be more receptive, and the smaller community means changes can be made more quickly. That should prompt a lot of soul-searching for&hellip;well, everyone. What does that say about the future of open source?&rdquo;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 29 Sep 2020 04:56:21 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:31;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Gary: More than 280 characters\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"https://pento.net/?p=5405\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"https://pento.net/2020/09/29/more-than-280-characters/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5187:\"<p>It&#8217;s hard to be nuanced in 280 characters.</p>\n\n\n\n<p>The Twitter character limit is a major factor of what can make it so much fun to use: you can read, publish, and interact, in extremely short, digestible chunks. But, it doesn&#8217;t fit every topic, ever time. Sometimes you want to talk about complex topics, having honest, thoughtful discussions. In an environment that encourages hot takes, however, it&#8217;s often easier to just avoid having those discussions. I can&#8217;t blame people for doing that, either: I find myself taking extended breaks from Twitter, as it can easily become overwhelming.</p>\n\n\n\n<p>For me, the exception is Twitter threads.</p>\n\n\n\n<h2>Twitter threads encourage nuance and creativity.</h2>\n\n\n\n<p>Creative masterpieces like this Choose Your Own Adventure are not just possible, they rely on Twitter threads being the way they are.</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">Being Beyoncé’s assistant for the day: DONT GET FIRED THREAD <a href=\"https://t.co/26ix05Hkhp\">pic.twitter.com/26ix05Hkhp</a></p>&mdash; green chyna (@CORNYASSBITCH) <a href=\"https://twitter.com/CORNYASSBITCH/status/1142591156884127744?ref_src=twsrc%5Etfw\">June 23, 2019</a></blockquote>\n</div>\n\n\n\n<p>Publishing a short essay about your experiences in your job can bring attention to inequality.</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">DOWNTOWN BROOKLYN: I\'m working arraignments tonight, representing poor New Yorkers who were arrested yesterday on Thanksgiving. <br /><br />It was the coldest Thanksgiving in more than a century. Tonight\'s also bitterly cold, even in the courtroom. I\'m wearing my scarf &amp; coat.</p>&mdash; Rebecca Kavanagh (@DrRJKavanagh) <a href=\"https://twitter.com/DrRJKavanagh/status/1066144860619636736?ref_src=twsrc%5Etfw\">November 24, 2018</a></blockquote>\n</div>\n\n\n\n<p>And Tumblr screenshot threads are always fun to read, even when they take a turn for the epic (over 4000 tweets in this thread, and it isn&#8217;t slowing down!)</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">Tumblr textposts thread, probably?</p>&mdash; we are a family forged in bureaucracy (@ex_aItiora) <a href=\"https://twitter.com/ex_aItiora/status/1165987806621184002?ref_src=twsrc%5Etfw\">August 26, 2019</a></blockquote>\n</div>\n\n\n\n<p>Everyone can think of threads that they&#8217;ve loved reading.</p>\n\n\n\n<p>My point is, threads are wildly underused on Twitter. I think I big part of that is the UI for writing threads: while it&#8217;s suited to writing a thread as a series of related tweet-sized chunks, it doesn&#8217;t lend itself to writing, revising, and editing anything more complex.</p>\n\n\n\n<p>To help make this easier, I&#8217;ve been working on a tool that will help you publish an entire post to Twitter from your WordPress site, as a thread. It takes care of transforming your post into Twitter-friendly content, you can just&#8230; write. <img src=\"https://s.w.org/images/core/emoji/13.0.0/72x72/1f642.png\" alt=\"🙂\" class=\"wp-smiley\" /></p>\n\n\n\n<p>It doesn&#8217;t just handle the tweet embeds from earlier in the thread: it handles handle uploading and attaching any images and videos you&#8217;ve included in your post.</p>\n\n\n\n<ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><img width=\"3264\" height=\"2448\" src=\"https://pento.net/wp-content/uploads/2018/12/mvimg_20181231_0910291833340677198697139.jpg\" alt=\"A selfie of me feeding a giraffe.\" class=\"wp-image-3608\" /></li><li class=\"blocks-gallery-item\"><img width=\"4000\" height=\"3000\" src=\"https://pento.net/wp-content/uploads/2018/12/GOPR0365.jpg\" alt=\"A selfie of me on an iceberg south of the Antarctic circle.\" class=\"wp-image-3591\" /></li><li class=\"blocks-gallery-item\"><img width=\"3264\" height=\"2448\" src=\"https://pento.net/wp-content/uploads/2018/12/00006IMG_00006_BURST20181002212033_COVER.jpg\" alt=\"A selfie of me with a fire breathing dragon at the Harry Potter themed amusement park in Orlando, Florida.\" class=\"wp-image-3604\" /></li><li class=\"blocks-gallery-item\"><img width=\"1793\" height=\"469\" src=\"https://pento.net/wp-content/uploads/2018/12/48944769_986954175890_2085904447019417600_o.jpg\" alt=\"A panoramic view of sunset over Nairobi National Park.\" class=\"wp-image-3554\" /></li></ul>\n\n\n\n<p>All sorts of embeds work, too. <img src=\"https://s.w.org/images/core/emoji/13.0.0/72x72/1f609.png\" alt=\"😉\" class=\"wp-smiley\" /></p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<div class=\"jetpack-video-wrapper\"></div>\n</div>\n\n\n\n<p>It&#8217;ll be coming in Jetpack 9.0 (due out October 6), but you can try it now in <a href=\"https://jetpack.com/download-jetpack-beta/\">the latest Jetpack Beta</a>! Check it out and tell me what you think. <img src=\"https://s.w.org/images/core/emoji/13.0.0/72x72/1f642.png\" alt=\"🙂\" class=\"wp-smiley\" /></p>\n\n\n\n<p>This might not fix all of Twitter&#8217;s problems, but I hope it&#8217;ll help you enjoy reading and writing on Twitter a little more. <img src=\"https://s.w.org/images/core/emoji/13.0.0/72x72/1f496.png\" alt=\"💖\" class=\"wp-smiley\" /></p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 29 Sep 2020 02:33:14 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"Gary\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:32;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:100:\"WPTavern: Themes Team Releases a Web Fonts Loader, Likely To Prohibit Hotlinking Any Off-Site Assets\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105363\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:243:\"https://wptavern.com/themes-team-releases-a-web-fonts-loader-likely-to-prohibit-hotlinking-any-off-site-assets?utm_source=rss&utm_medium=rss&utm_campaign=themes-team-releases-a-web-fonts-loader-likely-to-prohibit-hotlinking-any-off-site-assets\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5815:\"<p class=\"has-drop-cap\">Last Friday, the WordPress Themes Team <a href=\"https://make.wordpress.org/themes/2020/09/25/new-package-to-allow-locally-hosting-webfonts/\">announced the release</a> of its new <a href=\"https://github.com/WPTT/webfont-loader\">Webfonts Loader project</a>. It is a drop-in script that allows theme authors to load web fonts from the user&rsquo;s site instead of a third-party CDN. The secondary message included in the team&rsquo;s announcement is that it no longer plans to allow themes to hotlink Google Fonts in the future.</p>\n\n\n\n<p>Throughout most of the team&rsquo;s history, it has not allowed themes to hotlink or use CDNs for hosting theme assets, such as CSS, JavaScript, and fonts. The one <a href=\"https://make.wordpress.org/themes/handbook/review/required/#stylesheets-and-scripts\">exception to this rule</a> was the use of Google Fonts. This allowed themes to have richer typography options at their disposal from what the team has generally declared a reliable source.</p>\n\n\n\n<p>&ldquo;The exception was made because there was no practical way to not have the exception at the time,&rdquo; said Aria Stathopoulos, a Themes Team representative and developer behind the Webfonts Loader project. &ldquo;The exception for Google Fonts was made out of necessity. Now that there is another way, the exception will not be necessary.&rdquo;</p>\n\n\n\n<p>In effect, disallowing the Google Fonts CDN would not be a new ban. It would be a removal of an exception to the existing ban.</p>\n\n\n\n<p>Google Fonts has become so embedded into the theme developer toolset over the years, there was no way the team could simply pull the plug and prohibit the use of the CDN overnight. If the Themes Team members wanted to focus more on privacy, they would need to build a tool that made it dead simple for theme authors to use.</p>\n\n\n\n<p>There is no hard deadline for when the team will remove the exception for Google Fonts, and it is not set in stone at this point. Stathopoulos said removing it has been the goal from the beginning, disallowing all CDNs. However, it took a while to find an efficient way to handle this. With a viable alternative in place, they can discuss moving forward.</p>\n\n\n\n<h2>Webfonts Loader for Themes</h2>\n\n\n\n<p class=\"has-drop-cap\">The Webfonts Loader project keeps it simple for theme authors. It introduces a new <code>wptt_get_webfont_styles()</code> function that developers can plug in a stylesheet URL. Once a page is loaded with that function call, it will download the fonts locally to a <code>/fonts</code> folder in the user&rsquo;s <code>/wp-content</code> directory. This way, fonts will always be served from the user&rsquo;s site.</p>\n\n\n\n<p>The system is not limited to Google Fonts either. Any URL that serves CSS with an <code>@font-face {}</code> rule will work. It does not currently include authentication for CDNs that require API keys, such as Adobe Fonts. However, that is something the team might add in the future.</p>\n\n\n\n<p>&ldquo;For end-users, moving away from CDNs and locally hosting web fonts will improve performance (fewer handshake roundtrips for SSL), and is the privacy-conscious choice,&rdquo; said Stathopoulos. &ldquo;The only &lsquo;valid privacy concern&rsquo; is that the web fonts&rsquo; CDN does not disclose information that is fundamental to the GDPR: what information gets logged, for how long these logs remain, how they are processed, if there is any cross-referencing with all the other wealth of information the company has from users, etc. The concern is a lack of disclosure and information. If a site owner doesn&rsquo;t know what kind of information a third-party logs for its visitors, then they should ethically not enforce that on their visitors. With this package, the CDN is removed from the equation and the font still gets served fast &mdash; if not faster.&rdquo;</p>\n\n\n\n<h2>A Path to Core WordPress</h2>\n\n\n\n<p class=\"has-drop-cap\">Today, there is now a broader focus on privacy concerns related to third-party resources, particularly with tech giants like Google. Such concerns extend to whether third parties are tracking users or collecting data. Additional concerns are around whether sites are disclosing the use of third-party resources, which may be required in some jurisdictions. Site owners who are often unable to work through the web of potential issues are stuck in the middle.</p>\n\n\n\n<p>Jono Alderson opened a ticket to <a href=\"https://core.trac.wordpress.org/ticket/46370\">create an API</a> for loading web fonts locally in core WordPress in February 2019. It is a lengthy and detailed proposal, but it has yet to see much buy-in outside of a handful of developers.</p>\n\n\n\n<p>&ldquo;If such a script is standardized and included in WordPress core, one of the main benefits would be more respect for the end-user&rsquo;s privacy,&rdquo; said Stathopoulos. &ldquo;In the end, that&rsquo;s all privacy is about: respecting users.&rdquo;</p>\n\n\n\n<p>A standard API like Alderson proposes could solve some issues. Namely, it would virtually eliminate any privacy concerns. However, loading fonts locally could allow WordPress to optimize font loading and would create a shared system where plugins and themes do not load duplicate assets because of the current limitations of the enqueuing system. A standard API would also put the responsibility of efficiently loading fonts on WordPress&rsquo;s shoulders instead of theme and plugin developers.</p>\n\n\n\n<p>The Themes Team&rsquo;s new project is a solid start and strengthens the current proposal.</p>\n\n\n\n<p>&ldquo;If we&rsquo;re serious about WordPress becoming a fast, privacy-friendly platform, we can&rsquo;t rely on theme developers to add and manage fonts without providing a framework to support them,&rdquo; wrote Alderson in the ticket.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 28 Sep 2020 20:58:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:33;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"WPTavern: Fuxia Scholz First to Pass 100K Reputation Points on WordPress Stack Exchange\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105282\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:219:\"https://wptavern.com/fuxia-scholz-first-to-pass-100k-reputation-points-on-wordpress-stack-exchange?utm_source=rss&utm_medium=rss&utm_campaign=fuxia-scholz-first-to-pass-100k-reputation-points-on-wordpress-stack-exchange\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5096:\"<p><a href=\"https://stackexchange.com/users/113787/fuxia\">Fuxia Scholz</a>, a prolific <a href=\"https://wordpress.stackexchange.com/\">WordPress Stack Exchange</a> (WPSE) contributor, is the first member to reach 100,000 reputation points. The popular Q&amp;A community site rewards expert advice by floating the highest quality answers to the top, allowing users to earn reputation points. The gamified help community has proven to be more motivating for developers than many traditional forums, since the upvotes communicate how useful their answers are to others.</p>\n\n\n\n<div class=\"wp-block-image\"><img /></div>\n\n\n\n<p>Scholz started on Stack Overflow a few months before WordPress had its own site. She wrote around 50 answers and made connections with other WordPress developers ahead of the site&rsquo;s <a href=\"https://area51.stackexchange.com/proposals/1500/wordpress-development\">beta phase in June 2010</a>. Once the site graduated and got its own logo and design, Scholz started writing more.</p>\n\n\n\n<p>&ldquo;One core idea for all Stack Exchange sites is gamification: You earn reputation, and you get access to <a href=\"https://wordpress.stackexchange.com/help/privileges\">certain privileges</a>,&rdquo; Scholz said.</p>\n\n\n\n<p>&ldquo;You can say I got a bit addicted. My favorite questions were about problems for which I didn&rsquo;t know the answer, and couldn&rsquo;t find one with a search engine, because no one else had solved that before. I used my answers to teach myself, and I learned a lot this way! In May 2011 <a href=\"https://stackexchange.com/users/113787/fuxia?tab=reputation\">my reputation on WPSE was already higher than on Stack Overflow</a>, and for the next years it went up in a steep curve.&rdquo; Ten years after WPSE launched, Scholz has become the first to reach 100,000 reputation points.</p>\n\n\n\n<p>&ldquo;What reputation and karma do is send a message that this is a community with norms, it&rsquo;s not just a place to type words onto the internet. (That would be 4chan.)&rdquo; Stack Overflow co-creator Joel Spolsky <a href=\"https://www.joelonsoftware.com/2018/04/13/gamification/\">said</a>. &ldquo;We don&rsquo;t really exist for the purpose of letting you exercise your freedom of speech. You can get your freedom of speech somewhere else. Our goal is to get the best answers to questions. All the voting makes it clear that we have standards, that some posts are better than others, and that the community itself has some norms about what&rsquo;s good and bad that they express through the vote.&rdquo;</p>\n\n\n\n<p>The reputation points were originally inspired by Reddit Karma. Spolsky admits that the points not a perfect system but they do tend to &ldquo;drive a tremendous amount of good behavior.&rdquo; Gamification can shape and encourage certain behaviors but Spolsky said it&rsquo;s a weak force that cannot motivate people to do things they are not already interested in doing. For Scholz, it was the community aspect and an earned sense of ownership and responsibility that kept her hooked.</p>\n\n\n\n<p>&ldquo;In 2012, the community elected me as a moderator, and that changed a lot,&rdquo; she said. &ldquo;Now it wasn&rsquo;t just a game anymore, it was a duty. I felt responsible for the site. I still do. I also found some friends on there. We met at WordCamps and in private, and worked together on different projects.&rdquo;</p>\n\n\n\n<p>Scholz no longer works in development and said she doesn&rsquo;t care about WordPress anymore, but she is still a regular contributor on the WPSE.</p>\n\n\n\n<p>&ldquo;I switched careers and work as a writer, translator, and community manager for <a rel=\"noreferrer noopener\" href=\"https://t.co/mIhjlVjPv4?amp=1\" target=\"_blank\">Chess24.com</a> now,&rdquo; she said. &ldquo;But I still care about the site WordPress Stack Exchange! I keep an eye on new tags, handle flagged posts and comments, try to make every new user feel welcome, and I search for people who are abusing the system &mdash; vote fraud and spam. And, very rarely, I even write an answer, because I still know all this stuff. </p>\n\n\n\n<p>&ldquo;Checking the site has become a part of my daily routine, like feeding the cat.&rdquo; </p>\n\n\n\n<p>This daily habit has snowballed into Scholz racking up more than 2,000 answers. She is getting upvotes on many of her old answers nearly every day, which is what pushed her over the 100k milestone.</p>\n\n\n\n<p>&ldquo;There is a lot to say about the way our site developed over the years,&rdquo; Scholz said. &ldquo;I&rsquo;m not happy about some things. The enthusiasm of the early days is gone. We don&rsquo;t have enough regulars, there is no discussion about the site on <a href=\"https://t.co/tlRekl6sOt?amp=1\">WordPress Development Meta Stack Exchange</a>, and our chat, once very active, funny, and friendly, is now almost dead. </p>\n\n\n\n<p>&ldquo;Maybe that&rsquo;s normal, I don&rsquo;t know. But it&rsquo;s still &lsquo;my&rsquo; site. Reputation and badges don&rsquo;t really mean anything for a long time now, but keeping the site working, useful and friendly is more important.&rdquo;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 26 Sep 2020 15:27:03 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:34;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"WPTavern: PhotoPress Plugin Seeks to Revolutionize Photography for WordPress Users\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=104770\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:209:\"https://wptavern.com/photopress-plugin-seeks-to-revolutionize-photography-for-wordpress-users?utm_source=rss&utm_medium=rss&utm_campaign=photopress-plugin-seeks-to-revolutionize-photography-for-wordpress-users\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5638:\"<p class=\"has-drop-cap\">Peter Adams, the owner of the <a href=\"https://wordpress.org/plugins/photopress/\">PhotoPress plugin</a>, announced a couple of weeks ago that <a href=\"https://www.photopressdev.com/its-time-for-photopress/\">now is the time for his project</a> to take center stage. &ldquo;It&rsquo;s Time for PhotoPress,&rdquo; read the title of his post in which he laid out a four-phase plan for the future of his project.</p>\n\n\n\n<p>Adams is no stranger to manipulating WordPress to suit the needs of photographers. He described photography as his first love and second career. He initially found the art of taking photos in high school and set off to college to become a professional photographer in the early &rsquo;90s.</p>\n\n\n\n<p>As his university graduation loomed, he was recruited to run web development for an internet ad agency that built websites for Netscape, Bill Clinton&rsquo;s White House, and dozens of Fortune 500 companies. He spent the next 15 years starting or running tech companies before returning to his roots as a photographer.</p>\n\n\n\n<p>Today, he photographs for various magazines and companies. And, that&rsquo;s where his PhotoPress project comes in.</p>\n\n\n\n<p>&ldquo;As far as WordPress has come, it is at risk of losing an entire generation of photographers to photo website services such as Photoshelter, SmugMug, Squarespace, and PhotoFolio,&rdquo; he said. Adams wants to change that, making WordPress the go-to platform for photographers around the world.</p>\n\n\n\n<h2>The Jetpack of Photography Plugins</h2>\n\n\n\n<p class=\"has-drop-cap\">If you dig into the history of the PhotoPress plugin on WordPress.org, it seems to have a 15-year history. However, this is not the same plugin that was published a decade and a half ago by a different developer. The original plugin is now defunct, and Adams took over when the name was freed up on the directory.</p>\n\n\n\n<p>Adams wrote in his announcement post that WordPress has done a great job of delivering several media features over the years. &ldquo;Yet despite that, there are still many rough edges and missing features that keep WordPress from being the first choice for a photographer that needs to publish a beautiful portfolio of their work, put their image catalog/archive online, or showcase a photo editorial/project.&rdquo;</p>\n\n\n\n<p>He outlined a list of 10 specific problem areas that he wants to address in a &ldquo;Jetpack-like&rdquo; plugin for photographers. This is the bread and butter of the first of the planned four phases, which he said is about 80% finished. He had originally planned to develop PhotoPress as a series of separate plugins, each addressing a specific problem. Now, it is a single plugin with modules than can be enabled or disabled.</p>\n\n\n\n<p>When asked why the &ldquo;right time&rdquo; is now, Adams explained it is because the Gutenberg (block editor) project is a giant leap forward in usability in terms of creating photography blogs.</p>\n\n\n\n<img />PhotoPress Gallery block in the editor.\n\n\n\n<p>&ldquo;Photogs are a rare breed of non-technical users with high design sense,&rdquo; he said. &ldquo;Things that I used to have to teach photographers to do using shortcode syntax and custom CSS can now be simple controls with live feedback inside a Gutenberg block. It&rsquo;s really a game-changer for getting people comfortable with customizing things like gallery styling &mdash; which is the number one thing photographers need to do.&rdquo;</p>\n\n\n\n<p>The primary piece of the PhotoPress plugin is its custom PhotoPress Gallery block. It allows users to choose between a range of gallery styles, such as columns, masonry, justified, and mosaic. Each style has its own options. Images can also be launched into a slideshow when one is clicked.</p>\n\n\n\n<p>Based on some quick tests, the block&rsquo;s front-end output will go farther with some themes than others. This is mainly because of conflicting CSS and issues which can be solved by testing against more themes.</p>\n\n\n\n<p>Aside from the block, the plugin can automatically extract image metadata and group that data through custom taxonomies, such as cameras, lenses, locations, keywords, and more. WordPress stores this information out of the box, but it is hidden away as post meta. The plugin uses the taxonomy system to make it manageable for end-users.</p>\n\n\n\n<p>Ultimately, Adams set out to create a photography plugin that fits in with the WordPress admin user interface and experience, which he has accomplished.</p>\n\n\n\n<h2>The Future of PhotoPress</h2>\n\n\n\n<p class=\"has-drop-cap\">The project is still a work in progress. Adams is still moving through Phase I of the four-phase plan. Once it is complete, he can move on to the next steps in the process.</p>\n\n\n\n<p>Phase II is to create themes that are designed specifically to work with the PhotoPress plugin. He has three planned thus far. One for handling portfolio sites. Another for creating a stock photo archive. And the last for photojournalism and exhibits. Each will be built on top of his <a href=\"https://github.com/photopress-dev/frame\">photography theme framework</a>.</p>\n\n\n\n<p>The themes in Phase II will likely be commercial products. Adams said he needs a way to fund the next phases of the project. He hopes to have this step underway by the end of the year.</p>\n\n\n\n<p>For 2021, he wants to begin tackling Phases III and IV. The former will be a website-as-a-service (WaaS) similar to WordPress.com but for photographers. It will begin as a paid project but could have some free options for emerging photographers and students. The final phase is to build an onboarding system.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 25 Sep 2020 19:08:15 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:35;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"WPTavern: Google Officially Releases Its Web Stories for WordPress Plugin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105227\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:191:\"https://wptavern.com/google-officially-releases-its-web-stories-for-wordpress-plugin?utm_source=rss&utm_medium=rss&utm_campaign=google-officially-releases-its-web-stories-for-wordpress-plugin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5593:\"<img />Web Stories for WordPress dashboard.\n\n\n\n<p class=\"has-drop-cap\">Two and a half months after the <a href=\"https://wptavern.com/google-launches-beta-of-amp-powered-web-stories-plugin-for-wordpress\">launch of its public beta</a>, Google <a href=\"https://blog.google/web-creators/create-compelling-web-stories-wordpress/\">released its Web Stories</a> for WordPress plugin. So far, the plugin has over 10,000 active installations and has garnered a solid five-star rating from four reviews.</p>\n\n\n\n<p>Google created the Web Stories format through its AMP Project to allow publishers to create visually-rich stories. It is primarily geared toward mobile site visitors, allowing them to quickly jump through story pages with small chunks of content.</p>\n\n\n\n<p>The <a href=\"https://wordpress.org/plugins/web-stories/\">Web Stories plugin</a> creates a visual interface within WordPress for creating Stories. It breaks away from the traditional WordPress interface and introduces users to an almost Photoshop-like experience for building out individual Stories. The Stories editor is completely drag-and-drop.</p>\n\n\n\n<p>The plugin also offers eight predesigned templates out of the box that cover a small range of niches. However, according to Google&rsquo;s announcement, the company plans to add more templates in future updates.</p>\n\n\n\n<h2>Web Stories Are for Storytelling</h2>\n\n\n\n<p>&ldquo;Firstly&hellip;the power of Stories,&rdquo; wrote Jamie Marsland, founder of Pootlepress, in a <a href=\"https://twitter.com/pootlepress/status/1309020235102597122\">Twitter thread</a>. &ldquo;Stories are how we (humans) see the world and share our experiences. Up to now the platforms that we have to tell stories have been limited to books/films/tv/websites/blogs/instagram stories etc.&rdquo;</p>\n\n\n\n<p>&ldquo;Websites are ok for telling stories but in many ways the format doesn&rsquo;t really fit the linear arc of storytelling. When Marshall McLuhan said &lsquo;the medium is the message&rsquo; in 1964 he was talking about how the medium itself has a social impact, and change the communication itself&hellip;and the possibilities for what is communicated and how it is perceived. But we should keep coming back to Stories. Stories are the key here imo. Now we have an open format to tell Stories, and we have an open platform (WordPress) where those Stories can be told easily.&rdquo;</p>\n\n\n\n<p>Marsland finished his thread by saying that using Stories as a replacement for a brochure or website is a missed opportunity. He said that it was a platform for storytelling and should be used as such.</p>\n\n\n\n<p>It is far too early to tell if Web Stories will simply be a fad or still in wide use years from now. The technology certainly lends itself well to telling stories, particularly in mobile format, but I doubt we have seen the best of what is possible on the web. The format feels too limited to be the end-all-be-all of storytelling. It is merely one medium that will live and die by its popularity with users.</p>\n\n\n\n<p>With the right design skills, some people will craft beautiful Web Stories. And, that is just what Marsland has done with the <a href=\"https://jamiemarsland.staging.wpengine.com/web-stories/wilson-and-pootle/\">first Story he shared</a>:</p>\n\n\n\n<img />Page from the Wilson and Pootle Web Story by Jamie Marsland.\n\n\n\n<p>I agree with his conclusion. Web Stories should be about storytelling. When you move outside of that zone, the technology feels out of place.</p>\n\n\n\n<p>Where I disagree is that websites are not ideal for storytelling. Ultimately, the WordPress block editor will allow artistic end-users to craft intricate stories, mixing content and design in ways that we have not seen. We are just now scratching the surface. I expect our community of developers to build more intricate tools than what the Web Stories plugin currently allows, and we can do so in a way that revolutionizes storytelling on the web.</p>\n\n\n\n<h2>New Features</h2>\n\n\n\n<img />Story editor with Unsplash photo integration.\n\n\n\n<p class=\"has-drop-cap\">The Web Stories plugin now adds support for Unsplash images and Coverr videos out of the box. The plugin adds a new tab with a &ldquo;media&rdquo; icon. For users of the first beta version of the plugin, this may be a bit confusing. The previous media icon was for a tab that displayed the user&rsquo;s media. Now, the user&rsquo;s media is under the tab with the &ldquo;upload&rdquo; icon.</p>\n\n\n\n<p>It is also not immediately clear that the Unsplash images and Coverr videos are not hosted on the site itself. There is a &ldquo;powered by&rdquo; notice at the bottom of the tab, but it can be easy to miss because it blends in with the media in the background.</p>\n\n\n\n<p>Media from Unsplash and Coverr is hosted off-site and not downloaded to the user&rsquo;s WordPress media library. I could find no mention of this in the plugin&rsquo;s documentation. Such hotlinking was a <a href=\"https://wptavern.com/unsplash-responds-to-image-licensing-concerns-clarifies-reasons-for-hotlinking-and-tracking\">cause for debate</a> over the recent official release of the Unsplash plugin.</p>\n\n\n\n<p>Google also announced it planned to add more &ldquo;stock media integrations&rdquo; in the near future. According to a <a href=\"https://docs.google.com/document/d/1q8rkYYMKZh3R2eqkpwgGkx6QX0oSXoLYtIO6ml1BFD0/edit#heading=h.xqcejitqohdk\">document</a> shared via a GitHub <a href=\"https://github.com/google/web-stories-wp/issues/3909#issuecomment-674053068\">ticket</a>, such future integrations may include Google Photos and GIF-sharing site Tenor.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 24 Sep 2020 21:13:42 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:36;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:106:\"WPTavern: W3C Drops WordPress from Consideration for Redesign, Narrows CMS Shortlist to Statamic and Craft\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105108\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:255:\"https://wptavern.com/w3c-drops-wordpress-from-consideration-for-redesign-narrows-cms-shortlist-to-statamic-and-craft?utm_source=rss&utm_medium=rss&utm_campaign=w3c-drops-wordpress-from-consideration-for-redesign-narrows-cms-shortlist-to-statamic-and-craft\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:11563:\"<p>The <a href=\"https://www.w3.org/\">World Wide Web Consortium</a> (<em>W3C</em>), the international standards organization for the web,&nbsp;is redesigning its website and will soon be selecting a new CMS. Although WordPress is&nbsp;already used to manage W3C&rsquo;s <a href=\"https://www.w3.org/blog/\">blog</a> and <a href=\"https://www.w3.org/blog/news/\">news</a> sections of the website, the organization is open to adopting a new CMS to meet its list of preferences and <a href=\"https://w3c.studio24.net/docs/cms-strategy-and-requirements/\">requirements</a>. </p>\n\n\n\n<p>Studio 24, the digital agency selected for the redesign project, narrowed their consideration to three CMS candidates:</p>\n\n\n\n<ol><li><a href=\"https://w3c.studio24.net/docs/w3c-cms-selection-process-update/#statamic\">Statamic</a></li><li><a href=\"https://w3c.studio24.net/docs/w3c-cms-selection-process-update/#craft-cms\">Craft CMS</a></li><li><a href=\"https://w3c.studio24.net/docs/w3c-cms-selection-process-update/#wordpress\">WordPress</a></li></ol>\n\n\n\n<p>Studio 24 was aiming to finalize their recommendations in July but found that none of them complied with the W3C&rsquo;s authoring tool <a href=\"https://www.w3.org/WAI/standards-guidelines/atag/\">accessibility guidelines</a>. The CMS&rsquo;s that were better at compliance with the guidelines were not as well suited to the other project requirements.</p>\n\n\n\n<p>In the most recent project <a href=\"https://w3c.studio24.net/updates/weeknotes-11-sept/\">update</a> posted to the site, Studio 24 reported they have&nbsp;shortlisted two CMS platforms. Coralie Mercier, Head of Marketing and Communications at W3C, confirmed that these include Statamic and Craft CMS.</p>\n\n\n\n<p>WordPress was not submitted to the same review process as the Studio 24 team claims to have extensive experience working with it. In the summary of their concerns, Studio 24 cited Gutenberg, accessibility issues, and the fact that the Classic Editor plugin will <a href=\"https://make.wordpress.org/core/2018/11/07/classic-editor-plugin-support-window/\">stop being officially maintained on December 31st, 2021</a>:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>First of all, we have concerns about the longevity of WordPress&nbsp;<strong>as we use it</strong>. WordPress released a new version of their editor in 2018: Gutenberg. We have already rejected the use of Gutenberg in the context of this project due to accessibility issues.</p><p>If we choose to do away with Gutenberg now, we cannot go back to it at a later date. This would amount to starting from scratch with the whole CMS setup and theming.</p><p>Gutenberg is the future of WordPress. The WordPress core development team keeps pushing it forward and wants to roll it out to all areas of the content management system (navigation, sidebar, options etc.) as opposed to limiting its use to the main content editor as is currently the case.</p><p>This means that if we want to use WordPress long term, we will need to circumvent Gutenberg and keep circumventing it for a long time and in more areas of the CMS as time goes by.&nbsp;</p></blockquote>\n\n\n\n<p>Another major factor in the decision to remove WordPress from consideration was that they found &ldquo;no elegant solution to content localization and translation.&rdquo;</p>\n\n\n\n<p>Studio 24 also expressed concerns that tools like ACF, Fewbricks, and other plugins might not being maintained for the Classic Editor experience &ldquo;in the context of a widespread adoption of Gutenberg by users and developers.&rdquo;</p>\n\n\n\n<p>&ldquo;More generally, we think this push to expand Gutenberg is an indication of WordPress focusing on the requirements of their non-technical user base as opposed to their audience of web developers building custom solutions for their clients.&rdquo;</p>\n\n\n\n<p>It seems that the digital agency W3C selected for the project is less optimistic about the future of Gutenberg and may not have reviewed recent improvements to the overall editing experience since 2018, including those related to accessibility. </p>\n\n\n\n<p>Accessibility consultant and WordPress contributor Joe Dolson recently gave an <a href=\"https://www.youtube.com/watch?v=EKZulmYKYJg\">update on Gutenberg accessibility audit</a> at WPCampus 2020 Online. He reported that while there are still challenges remaining, many issues raised in the audit have been addressed across the whole interface and 2/3 of them have been solved. &ldquo;Overall accessibility of Gutenberg is vastly improved today over what it was at release,&rdquo; Dolson said.</p>\n\n\n\n<p>Unfortunately, Studio 24 didn&rsquo;t put WordPress through the same content creation and accessibility tests that it used for Statamic and Craft CMS. This may be because they had already planned to use a Classic Editor implementation and didn&rsquo;t see the necessity of putting Gutenberg through the paces. </p>\n\n\n\n<p>These <a href=\"https://w3c.studio24.net/docs/w3c-cms-selection-process-update/#the-review-process\">tests</a> involved creating pages with &ldquo;flexible components&rdquo; which they referred to as &ldquo;blocks of layout,&rdquo; for things like titles, WYSIWYG text input, and videos. It also involved creating a template for news items where all the content input by the user would be displayed (without formatting). </p>\n\n\n\n<p>Gutenberg would lend itself well to these uses cases but was not formally tested with the other candidates, due to the team citing their &ldquo;extensive experience&rdquo; with WordPress. I would like to see the W3C team revisit Gutenberg for a fair shake against the proprietary CMS&rsquo;s. </p>\n\n\n\n<h2>W3C Is Prioritizing Accessibility Over Its Open Source Licensing Preferences</h2>\n\n\n\n<p>The document outlining the CMS requirements for the project states that &ldquo;W3C has a strong preference for an open-source license for the CMS platform&rdquo; as well as &ldquo;a CMS that is long-lived and easy to maintain.&rdquo; This preference may be due to the economic benefits of using a stable, widely adopted CMS, or it may be inspired by the undeniable symbiosis between open source and open standards.</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>&ldquo;The industry has learned by experience that the only software-related standards to fully achieve [their] goals are those which not only permit but encourage open source implementations. Open source implementations are a quality and honesty check for any open standard that might be implemented in software&hellip;&rdquo;</p><cite><a href=\"https://opensource.org/osr-rationale\">Open Source Initiative</a></cite></blockquote>\n\n\n\n<p>WordPress is the only one of the three original candidates to be distributed under an&nbsp;<a href=\"https://opensource.org/licenses\">OSD-compliant license</a>.&nbsp;(CMS code available on GitHub isn&rsquo;t the same.)</p>\n\n\n\n<p>Using proprietary software to publish the open standards that underpin the web isn&rsquo;t a good look. While proprietary software makers are certainly capable of implementing open standards, regardless of licensing, there are a myriad of benefits for open standards in the context of open source usage: </p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>&ldquo;The community of participants working with OSS may promote open debate resulting in an increased recognition of the benefits of various solutions and such debate may accelerate the adoption of solutions that are popular among the OSS participants. These characteristics of OSS support evolution of robust solutions are often a significant boost to the market adoption of open standards, in addition to the customer-driven incentives for interoperability and open standards.&rdquo;</p><cite><a href=\"http://airccse.org/journal/ijsea/papers/0111ijsea01.pdf\">International Journal of Software Engineering &amp; Applications</a></cite></blockquote>\n\n\n\n<p>Although both Craft CMS and Statamic have their code bases available on GitHub, they share similarly restrictive licensing models. The Craft CMS <a href=\"https://github.com/craftcms/cms/blob/develop/CONTRIBUTING.md\">contributing document</a> states:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p><strong>Craft isn&rsquo;t FOSS</strong><br />Let&rsquo;s get one thing out of the way: Craft CMS is <strong>proprietary software</strong>. Everything in this repo, including community-contributed code, is the property of Pixel &amp; Tonic.</p><p>That comes with some limitations on what you can do with the code:</p><p>&ndash; You can&rsquo;t change anything related to licensing, purchasing, edition/feature-targeting, or anything else that could mess with our alcohol budget.<br />&ndash; You can&rsquo;t publicly maintain a long-term fork of Craft. There is only One True Craft.</p></blockquote>\n\n\n\n<p>Statamic&rsquo;s contributing docs have similar restrictions:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>Statamic is not Free Open Source Software. It is <strong>proprietary</strong>. Everything in this and our other repos on Github &mdash; including community-contributed code &mdash; is the property of Wilderborn. For that reason there are a few limitations on how you can use the code:</p></blockquote>\n\n\n\n<p>Projects with this kind of restrictive licensing often fail to attract much contribution or adoption, because the freedoms are not clear. </p>\n\n\n\n<p>In a GitHub issue <a href=\"https://github.com/craftcms/cms/issues/842\">requesting Craft CMS go open source</a>, Craft founder and CEO Brandon Kelly said, &ldquo;Craft isn&rsquo;t closed&nbsp;<em>source</em>&nbsp;&ndash;&nbsp;all the source code is right here on GitHub,&rdquo; and claims the license is relatively unrestrictive as far as proprietary software goes, that contributing functions in a similar way to FOSS projects.  This rationale is not convincing enough for some developers commenting on the thread.</p>\n\n\n\n<p>&ldquo;I am a little hesitant to recommend Craft with a custom open source license,&rdquo; Frank Anderson said. &ldquo;Even if this was a MIT+ license that added the license and payment, much like React used to have. I am hesitant because the standard open source licenses have been tested.&rdquo;</p>\n\n\n\n<p>When asked about the licensing concerns of Studio 24 narrowing its candidates to two proprietary software options, Coralie Mercier told me, &ldquo;we are prioritizing accessibility.&rdquo; A recent project <a href=\"https://w3c.studio24.net/updates/weeknotes-11-sept/\">update</a> also reports that both CMS suppliers W3C is reviewing &ldquo;have engaged positively with authoring tool accessibility needs and have made progress in this area.&rdquo;</p>\n\n\n\n<p>Even if you have cooperative teams at proprietary CMS&rsquo;s that are working on accessibility improvements as the result of this high profile client, it cannot compare to the massive community of contributors that OSD-compliant licensing enables. </p>\n\n\n\n<p>It&rsquo;s unfortunate that the state of open source CMS accessibility has forced the organization to narrow its selections to proprietary software options for its first redesign in more than a decade. </p>\n\n\n\n<p>Open standards go hand in hand with open source. There is a mutually beneficial connection between the two that has caused the web to flourish. I don&rsquo;t see using a proprietary CMS as an extension of W3C values, and it&rsquo;s not clear how much more benefit to accessibility the proprietary options offer in comparison. W3C may be neutral on licensing debates, but in the spirit of openness, I think the organization should adopt an open source CMS, even if it is not WordPress.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 24 Sep 2020 20:13:24 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:37;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"WPTavern: First Look at Twenty Twenty-One, WordPress’s Upcoming Default Theme\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105166\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:195:\"https://wptavern.com/first-look-at-twenty-twenty-one-wordpresss-upcoming-default-theme?utm_source=rss&utm_medium=rss&utm_campaign=first-look-at-twenty-twenty-one-wordpresss-upcoming-default-theme\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6907:\"<blockquote class=\"wp-block-quote\"><p>Fashion is ephemeral. Art is eternal. Indeed what is a fashion really? A fashion is merely a form of ugliness so absolutely unbearable that we have to alter it every six months!</p></blockquote>\n\n\n\n<p>Thus wrote Oscar Wilde on Victorian-era fashion in an article titled &ldquo;The Philosophy of Dress&rdquo; for the <em>New-York Tribune</em> in 1885.</p>\n\n\n\n<p>In many ways, WordPress theming is the same as the ever-changing landscape of fashion. Rounded corners are in one day and out the next. Box shadows are in one year after being frowned up just months earlier. Perhaps web design is so intolerable that we must change it every six months. Or, at least freshen it up every year in the case of WordPress.</p>\n\n\n\n<p>If art is eternal, there are only two default, Twenty* themes that I can truly recall from past years: Twenty Ten and Twenty Fourteen &mdash; yes, Twenty Twenty is memorable, but it is also still the current default. Twenty Ten was a classic that paid homage to WordPress&rsquo;s past. Twenty Fourteen was such a leap away from tradition that it is hard to forget. Everything else has seemed to fade to varying degrees.</p>\n\n\n\n<p>With WordPress 5.6 and the end of the year looming, it is time to look forward to the latest trend. As Mel Choyce-Dwan noted in the <a href=\"https://make.wordpress.org/core/2020/09/23/introducing-twenty-twenty-one/\">announcement of Twenty Twenty-One</a>, the next default theme, &ldquo;<a href=\"https://www.garnishstudios.com/\">Pastels</a> and <a href=\"https://www.designbyparker.com/\">muted</a> <a href=\"https://westportcondos.ca/\">colors</a> are <a href=\"https://arisacoba.com/\">pretty</a> <a href=\"https://www.collaborativechange.global/\">in</a> <a href=\"https://paradigmacreation.com/\">right</a> <a href=\"https://taregrocery.com/\">now</a>.&rdquo;</p>\n\n\n\n<p>She is not wrong. The colors are a refreshing change of pace. Now that we are into the second day of autumn, I am getting <em>the good kind of vibes</em> from some of the more earthy-tones from a couple of the color palettes expected to ship with the theme.</p>\n\n\n\n<img />Potential color palette options for Twenty Twenty-One.\n\n\n\n<p>Whether Twenty Twenty-One will be a fashionable theme for the year or art that we can remember a decade from now, only history will be able to judge. For now, let&rsquo;s enjoy the creation and take a look at what we should expect from the next default WordPress theme.</p>\n\n\n\n<h2>The Current Twenty Twenty-One</h2>\n\n\n\n<p class=\"has-drop-cap\">The new default theme is a fork of <a href=\"https://wordpress.org/themes/seedlet/\">Automattic&rsquo;s Seedlet</a>, a project in which I lauded as the <a href=\"https://wptavern.com/exploring-seedlet-automattics-block-first-wordpress-theme\">next step in the evolution of theming</a>. It is a theme that is focused on WordPress&rsquo;s future of being completely comprised of blocks. It gives us an ideal insight into where theme development is heading. It makes sense as the foundation for the new default. Few other themes would make for a good starting point right now. With WordPress theme development in flux, Seedlet is simply ahead of the pack in terms of foundational elements.</p>\n\n\n\n<img />Seedlet WordPress theme screenshot.\n\n\n\n<p>&ldquo;This provides us with a thorough system of nested CSS variables to make child theming easier, and to help integrate with the global styles functionality that&rsquo;s under development for full-site editing,&rdquo; wrote Choyce-Dwan of using Seedlet as a starting point.</p>\n\n\n\n<p>There are no plans to spin up a Google Web Font for this theme. The design team is going native and sticking with the default system font stack. Choyce-Dwan listed several reasons for the choice, such as keeping a neutral font that allows broad use, speed, and customizability via a child theme.</p>\n\n\n\n<p>Despite the neutral font, the default pastel green is a fairly opinionated design decision. It will not be used broadly across industries. However, the team plans to create multiple color palettes that will give it more range. Presumably, these palettes can also be overwritten.</p>\n\n\n\n<img />Pastel green color scheme on single post view.\n\n\n\n<p>Other than the colors, the design is relatively simple. Choyce-Dwan said that the theme&rsquo;s block patterns support is where it will be truly unique.</p>\n\n\n\n<p>I was initially <a href=\"https://wptavern.com/decision-time-what-block-patterns-should-ship-with-wordpress-5-5\">unhappy with the patterns</a> that were going to ship with WordPress 5.5. However, an 11th-hour <a href=\"https://wptavern.com/gutenberg-8-7-adds-minor-changes-updates-block-pattern-designs-and-continues-full-site-editing-work\">update improved the situation</a> so that they did not feel entirely experimental. The foundational Seedlet theme for Twenty Twenty-One has some unique patterns that begin to scratch the surface of what&rsquo;s possible with this WordPress feature. My hope is that the new default theme steps it up a notch.</p>\n\n\n\n<p>Currently, the theme does not register any custom patterns. However, it has a placeholder file and a note that they are a work in progress. Choyce-Dwan shared some patterns the team has already designed in the announcement.</p>\n\n\n\n<img />Currently-designed block patterns.\n\n\n\n<p>&ldquo;We&rsquo;ll be relying on our talented community designers for more ideas,&rdquo; she wrote. The team has also created a GitHub template for anyone to <a href=\"https://github.com/WordPress/twentytwentyone/issues\">contribute pattern design ideas</a>.</p>\n\n\n\n<p>Currently, the theme does not support the upcoming full-site editing feature of WordPress. After the Beta 1 release of WordPress 5.6, the team plans to begin exploring the addition of this support. WordPress is expected to ship a public beta of full-site editing in its <a href=\"https://make.wordpress.org/core/2020/08/13/wordpress-5-6-release-planning/\">next major release</a>, but it is unclear whether it will be far enough along to be a headline feature for the Twenty Twenty-One theme.</p>\n\n\n\n<p>The team and volunteers have less than a month before the October 20th deadline for committing the new theme to trunk, the core WordPress development branch. At that stage, the theme should be nearly complete and ready for production. Of course, there will be several rounds of patches, bug fixes, and updates before WordPress 5.6 lands in December. Right now is the best time for anyone who wants to get involved with Twenty Twenty-One to do so.</p>\n\n\n\n<p>Useful links with more information:</p>\n\n\n\n<ul><li><a href=\"https://github.com/WordPress/twentytwentyone\">GitHub Repository</a></li><li><a href=\"https://www.figma.com/file/Fv7BODXobfo2prksqRDySy/Introducing-Twenty-Twenty-One?node-id=0%3A1\">Theme Mockups via Figma</a></li><li><a href=\"https://www.pinterest.com/melchoyce/tt1/\">Twenty Twenty-One Idea Pinterest Board</a></li></ul>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 23 Sep 2020 20:01:14 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:38;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:37:\"HeroPress: Hello World – Hevo Nyika\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://heropress.com/?post_type=heropress-essays&p=3308\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:176:\"https://heropress.com/essays/hello-world-discovering-the-world-through-wordpress/#utm_source=rss&utm_medium=rss&utm_campaign=hello-world-discovering-the-world-through-wordpress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:14438:\"<img width=\"960\" height=\"480\" src=\"https://s20094.pcdn.co/wp-content/uploads/2021/09/092220-min.jpg\" class=\"attachment-large size-large wp-post-image\" alt=\"Pull Quote: Find your purpose, pursue it relentlessly\" /><p><a href=\"https://heropress.com/feed/#shona\"><span class=\"css-901oao css-16my406 r-1qd0xha r-ad9z0x r-bcqeeo r-qvutc0\">Unokwanisa kuverenga rondedzero iyi muChiShona</span></a></p>\n<p>So I chose a career in Web Development!!</p>\n<p>To be honest it&#8217;s kind of funny when I think about it and quite surreal to be here talking about my story. It has been a journey and I would like to share my story with you.</p>\n<p>I have been lucky in the Dad department. My Dad encouraged me to work hard and dream big from a very young age. I remember occasionally having ‘when I grow up’ talks.</p>\n<p>For quite some time I wanted to be a Judge, however awesome this dream sounds it was not very inspired. After binge-watching Judge Judy for a whole weekend, I started calling myself Judge Thelma. Though I don&#8217;t remember much of this my sister says that I used to say I would arrest all the men in the World if I ever became a Judge. HAHAHA! (clearly I didn&#8217;t understand how the World works)</p>\n<p>I did not understand what being a Judge meant or what was required for me to start banging that gavel to my heart&#8217;s desire. Eventually, I learnt that I had to become a lawyer first then magistrate before I could be nominated to be a Judge and let us just say that is how I sentenced that dream to a lifetime down the drain.</p>\n<p>See what I did there? hahaha!</p>\n<a href=\"https://s20094.pcdn.co/wp-content/uploads/2021/09/tandd-min.jpg\"><img /></a>With Daddy Dearest\n<p>A few years later, I was in High School and that is when I decided to pursue a career in Computer Science. I did not know what I would be doing or how I would get there but I just knew that I was going to pursue a career in ICT. I wrote my first line of code when I was 16 years old.</p>\n<p>This was after I had joined the school&#8217;s computer class, initially, I thought I would be learning about Excel Sheets and Word Documents until I was assigned to write my first program in C (talk about a double-take!!). It was not easy but it was very exciting, l remember writing up simple code for a Video Club &#8211; a simple check-in/out for VHS tapes and CDs. Dear World, thus began my fascination with computers.</p>\n<p>Seven years later, I was now in university studying ICT as I had always wanted. I was doing a Bachelors in Business Management &amp; Information Technology. In my third year, I was interning at a local Webdesign and hosting company. This was never my plan, I only took on that job after I had failed to get a job with local banks or telecommunications companies. Before I was introduced to Website Design I envisioned myself suiting up and working in IT Audit or offering IT support. Even though things did not go as I had planned, I am glad they did not exactly go my way in that aspect. So in 2017, I was designing websites using HTML, CSS, PHP, JavaScripts and Joomla which was the prefered content management system at that company. I knew about WordPress but I was not using it for anything. People have this misconception that WordPress is not for real developers and it is not secure and at that time I was one of those people.</p>\n<h3>Finding my tribe</h3>\n<p>One day when I was working at the front desk <a href=\"https://heropress.com/essays/wordpress-opened-whole-new-world/\">Thabo Tswana</a> came to give a colleague of mine a purple WooCommerce pen. I did not know what WooCommerce was at that time but I was taken by the purple shirt and pen he was carrying. I asked him about it and he explained what WooCommerce was and that what he was carrying was called &#8216;swag&#8217;. So the love of freebies led me to the WordCamp Harare website, instead of buying a ticket I applied to volunteer. I learnt more about WordPress, I was a volunteer, without any knowledge on WordPress.org or WordPress.com. I only started using WordPress because of the awesome people that l had met at that Wordcamp.</p>\n<p>Everyone was so welcoming, a week later with help from Thabo I designed my first ever WP website.</p>\n<p>Soon after I was part of the community and a bit more involved in the meetups. We had our first-ever Women Who WordPress meetup in 2018. So many ladies came on board bloggers and developers alike. We were free to talk and discuss a lot of things. We had more time to discuss the difference between WordPress.com and WordPress.org we shared views on how to handle discrimination at work, how to promote your website and a whole lot of other things.</p>\n<p><a href=\"https://s20094.pcdn.co/wp-content/uploads/2021/09/20180324_105352-min.jpg\"><img /></a></p>\n<h3>Establishing roots</h3>\n<p>In 2018, Harare had its first-ever female Lead Organiser <a href=\"https://tapiwanashe.com/\">Tapiwanashe Manhobo</a> whoop whoop! I was also part of the organising team that year, I was assigned to handle Harare’s first Kids Camp. The planning process was stressful because the economic crisis in Zimbabwe was getting worse, luckily we had over 8 months to plan and with help from sponsors, we managed to pull through. In the end, everything turned out great. I wrote an article about the <a href=\"https://thelmachido.wordpress.com/2019/11/21/wordpress-juniours-first-edition/\">Kids Camp here</a>.</p>\n<p>After the first Kids Camp, we had several WordPressors that were enthusiasts about encouraging kids to embrace ICT. In 2019 we had not planned to have a Kids Camp because of financial constraints but to our surprise, we had some anonymous donations and we managed to have a WordPress Community outreach to a youth centre a week after our WordCamp. We had the outreach at the <a href=\"https://cttzim.org/\">Centre for Total Transformation</a> which is a non-formal school that caters for underprivileged and vulnerable children. We taught them about WordPress, Computer Hardware and Software.</p>\n<p>Here is a small video I took with Ellen when we were about to leave. Did l mention that I am terrible on camera? hahaha!</p>\n<div class=\"wp-video\"><a href=\"https://thelmachido.me/vid.mp4\">https://thelmachido.me/vid.mp4</a></div>\n<p><a href=\"https://thelmachido.wordpress.com/2020/09/18/kids-camp-2019-centre-for-total-transformation/\">Kids Camp 2019 &#8211; Centre for Total&nbsp;Transformation</a></p>\n<p>I have fallen deeply for WordPress because of the Community, I enjoy attending WordCamps, meeting new people and just learning new stuff. I have a huge list of WordCamps I need to attend before l kick the bucket, hopefully. Last year I managed to cross WordCamp</p>\n<p>Johannesburg off my bucket list. This year I was going to attend WordCamp Capetown but unfortunately, 2020 had other plans for the whole world. Anyway when everything is back to normal my plan to travel to WordCamps will proceed. (fingers crossed)</p>\n<h3>Reaping Fruits</h3>\n<p>Meanwhile, my plan to improve my developing skills has not been on hold. Even though I can still cook up code in C and Java, for now, I have also included WordPress PHP functions to the mix. It was not easy to get to this point, daring myself got me to this slightly better stage. My IQ is not way up there, however, I try to do my best where I can and I am happy to say it has paid off so far.</p>\n<p>Around November last year, I was designing as a freelancer while job hunting. Out of the blue l got a call for a job offer from <a href=\"https://zw.linkedin.com/in/trust-nhokovedzo\">Trust Nhokovenzo</a> who is big on <a href=\"https://afrodigital.org/\">Digital marketing</a> and also part of the WordPress Community. He had asked someone in the community about developers and my name happened to come up. So since February, I have been part of his team at <a href=\"https://calmlock.co.zw/\">Calmlock Digital Marketing Agency</a>.</p>\n<p>There is so much more in the world of WordPress that l am yet to tap into so even though I am ending my write up here, for now, my story is going to continue &#8230;</p>\n<p>Until next time&#8230;</p>\n<h1 id=\"shona\">Hevo Nyika</h1>\n<p>Saka ini ndakasarudza kugadzira mawebhusayiti.</p>\n<p>Ndakaita rombo rakanaka pana baba vandakapihwa naMwari. Baba vangu vaindikurudzira kuti ndishande nesimba. Ndinoyeuka pano neapo tichiita hurukuro dzedu dzekuti ‘kana ndakura ndoda kuveyi’.</p>\n<p>Kwenguva yakati rebei ndaida kuve Mutongi. Kunyangwe ini ndisingazvirangariri mukoma wangu anotaura kuti ndaiti ndaizosunga varume vese vari pasi rino kana ndikangoita mutongi HAHAHA zveshuwa handaiziva kuti mitemo yenyika inofambiswa seyi.<br />\nNdanga ndisinga nzwisisi kuti kuva mutongi kwairevei kana zvaidikanwa kwandiri kuti nditange kurova iro ghavheu kuchishuwo chemoyo wangu. Pakupedzisira, ndakadzidza kuti ndaifanirwa kuzoita gweta ipapo magistrate ndisati ndasarudzwa kuita Mutongi naizvozvo ndokupera kwakaita chiroto chekuva Mutongi.</p>\n<a href=\"https://s20094.pcdn.co/wp-content/uploads/2021/09/tandd-min-1.jpg\"><img /></a>Na Baba Vangu\n<p>Gare gare papfura makore mashoma pandakanga ndave kuHigh School ndakanga ndakuda kuita basa rema kombiyuta. Ndakanyora mutsara wekutanga wekodhi pandaive nemakore gumi nematanhatu. Izvi zvakaitika mushure mekunge ndapinda mukirasi yemakombiyuta, pakutanga ndaifunga kuti ndinenge ndichidzidza nezveExcel Sheets neWord zvisineyi ndakaona ndakunyora kodhi yangu yekutanga muC. Zvaisave nyore kunyora kodhi asi zvainakidza kwazvo, ndorangarira ndichinyora kodhi yeVhidhiyo Kirabhu.</p>\n<p>Makore manomwe apfura, ndakanga ndava kuyunivhesiti ndichidzidza ICT zvandakagara ndakaronga. Ndaiita Bachelors muBusiness Management &amp; Information Technology. Mugore rangu rechitatu ndainge ndave kushanda kune imwe kambani yaita zvekugadzira mawebhusaiti. Ndakawana basa iri mushure mekunge ndatadza kuwana basa kumabhanga. Kunyangwe hazvo zvinhu zvisina kuenda sezvandaive ndakaronga, ndinofara kuti hazvina kunyatso enda nenzira yangu. Saka muna 2017 ndaigadzira mawebhusaiti ndichishandisa HTML, CSS, PHP, JavaScript uye Joomla iyo yaive iyo inokurudzirwa kukambani kwandaive. Panguva iyi ndaiziva nezve WordPress asi ndakanga ndisingaishandisi.</p>\n<h3>Kuwanana neWordPress</h3>\n<p>Rimwe zuva pandakanga ndichishanda ndakaona <a href=\"https://heropress.com/essays/wordpress-opened-whole-new-world/\">Thabo Tswana</a> akauya kuzopa mumwe mukomana wandayishanda naye chinyoreso cheWooCommerce. Ndakanga ndisingazive kuti WooCommerce yaive chii asi ndakafarira chinyoreso nehembe ye WooCommerce yaanga akapfeka. Ndakamubvunza nezvazvo akatsanangura kuti WooCommerce yaive chii. Saka nekudawo zvakanaka, zvemahara ndakaenda pawebhusaiti yeWordCamp Harare ndikabata zvimbo zvegore iroro. Ndakazvipira kubatsirawo vamwe vekuWordPress kuWordCamp Harare. Nerubatsiro kubva kunaThabo ndakagadzira webhusaiti yangu yekutanga yeWordPress vhiki rakatevera .</p>\n<p>Mushure mekunge ndaitawo chipato cheavo vanoshandisa WordPress ndakanga ndakuenda kumisangano yeWordPress yaitwa muHarare. Takaita musangano wevakadzi chete muna 2018. Vakadzi vazhinji vakauya kumusangano uyu. Tainga takasununguka kukurukura zvinhu zvakawanda. Takakurukura pamusoro pemutsauko uripo pakati peWordPress.com neWordPress.org takagovana maonero ekugadzirisa rusarura kubasa nezvimwewo.</p>\n<p><a href=\"https://s20094.pcdn.co/wp-content/uploads/2021/09/20180324_105352-min.jpg\"><img /></a></p>\n<h3>Nguva yandakatanga kushandisa WordPress</h3>\n<p>Muna 2018, kurongwa kweWordCamp Harare kwakatungamirwa kekutanga nemusikana ainzi <a href=\"https://tapiwanashe.com/\">Tapiwanashe Manhobo</a> (waiva mufaro mukuru). Ndakanga ndiri mumwe wevairongawo naye. Hurongwa hwekuronga WordCamp Harare mugore iri hwainetsa pamusaka pekuoma kwehupfumi wemuZimbabwe, zvisineyi takaita rombo rakanaka nokuti takawana rubatsiro kubva kunevamwewo vanhu vakatiwedzera mari. Pakupedzisira, zvese zvakabudirira zvakanaka. Takarongawo WordCamp yevana varipasi pemakore gumi nechishanu, munokwanisa kuverenga pamusoro pezuva iri <a href=\"https://thelmachido.wordpress.com/2019/11/21/wordpress-juniours-first-edition/\">pawebhisaiti yangu apa</a>.</p>\n<p>Mushure mekuita WordCamp yevana, takave nevamwe vanhu veWordPress aifarira kukurudzira vana kuti vagamuchire ICT. Muna 2019 takanga tisina kuronga kuve neWordCamo yeVana nekuda kwezvimhingamupinyi zvemari asi chakatishamisa ndechekuti takawana mari kubvawo kune vamwe. Takaita Camp iyi pa<a href=\"https://cttzim.org/\">Centre for Total Transformation</a> chinova chikoro chisiri chepamutemo chinodzidzisa vana vanotambura. Tadzidzisa vana ava pamusoro peWordPress, Computer Hardware uye Software.</p>\n<div class=\"wp-video\"><a href=\"https://thelmachido.me/vid.mp4\">https://thelmachido.me/vid.mp4</a></div>\n<p>Ndofarira WordPress zvakanyanya nekuda kweavo varimu nharaunda yacho, ini ndinonakidzwa nekuenda kumaWordCampi, kusangana nevanhu vatsva uye kungo dzidza zvinhu zvitsva. Gore rakapera ndakakwanisa kuyambuka muganhu weZimbabwe ndichienda kuWordCamp Johannesburg, dai pasina kuti 2020 nyika dzepasi rino dzakawirwa nedenda reCOVID 19 zvimwe ndingadayi ndakaenda kuWordCamp Capetown. Zvisinei hazvo kana denda ranani zvimwe ndichakwanisa kufamba ndichienda kumaWordCamp edzimwe nyika.</p>\n<h3>Kukowa zvandakadyara</h3>\n<p>Zvichakadaro, chirongwa changu chekuvandudza hunyanzvi hwangu hachina kumira. Kunyangwe ini ndichiri kukwanisa kubika kodhi muC uye Java, ikozvino, ndasanganisirawo WordPress PHP. Zvaive zvisiri nyore kusvika apa, zvakatora kuzvishingisa nekushanda nesimba. Ndinofara mwari aiva neni pamufambo wangu uyu.</p>\n<p>Muna Mbudzi gore rakapera, ndaive ndichigadzira mawebhusayiti apo nditsvaga basa. Pasina nguva ndakataura na<a href=\"https://zw.linkedin.com/in/trust-nhokovedzo\">Trust Nhokovenzo</a> uyo akaandipa basa mukambani yake, kambani iyi inonzi <a href=\"https://calmlock.co.zw/\">Calmlock Digital Marketing Agency</a>.</p>\n<p>Pane zvimwe zvakawanda kuWordPress zvandisati ndapinda mazviri. Nhaizvozvo kunyangwe ndiri kupedzisa kunyora kwangu apa, nyaya yehupenyu wangu ichaenderera mberi&#8230;</p>\n<p>Kusvikira nguva inotevera &#8230;</p>\n<p><strong>&#8230;. tsvaga chinangwa chako, chiite mushe mushe ..</strong></p>\n<p>The post <a rel=\"nofollow\" href=\"https://heropress.com/essays/hello-world-discovering-the-world-through-wordpress/\">Hello World &#8211; Hevo Nyika</a> appeared first on <a rel=\"nofollow\" href=\"https://heropress.com\">HeroPress</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 23 Sep 2020 06:00:10 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Thelma Mutete\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:39;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:102:\"WPTavern: WordPress Contributors Debate Dashboard Notice for Upcoming Facebook oEmbed Provider Removal\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105132\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:249:\"https://wptavern.com/wordpress-contributors-debate-dashboard-notice-for-upcoming-facebook-oembed-provider-removal?utm_source=rss&utm_medium=rss&utm_campaign=wordpress-contributors-debate-dashboard-notice-for-upcoming-facebook-oembed-provider-removal\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5885:\"<p>WordPress contributors are discussing different strategies for responding to Facebook and Instagram <a href=\"https://wptavern.com/upcoming-api-change-will-break-facebook-and-instagram-oembed-links-across-the-web-beginning-october-24\">dropping unauthenticated oEmbed support</a>&nbsp;on October&nbsp;24. WordPress will be removing both Facebook and Instagram as oEmbed providers. When a user attempts to embed content by pasting a URL as they have in the past, they may not understand why it no longer works. They may assume that WordPress broke embeds, causing an increase in the support burden for this change.</p>\n\n\n\n<p>A few participants on the <a href=\"https://core.trac.wordpress.org/ticket/50861\">trac ticket</a> for this issue have suggested WordPress detect users who will be impacted and attempt to warn them with a notice.</p>\n\n\n\n<p>&ldquo;Since this may impact users unknowingly, it is possible to push a dashboard notice to users who have Facebook/Instagram embeds in their content, showing for site admins, as a one-off that can be dismissed,&rdquo; Marius Jensen said.</p>\n\n\n\n<p>&ldquo;We&rsquo;ve previously done post-update-processing to clean up comments, so the idea of looking over content for an embed isn&rsquo;t completely outlandish, and would help with those who don&rsquo;t follow WordPress&rsquo; usual channels to learn of this.&rdquo;</p>\n\n\n\n<p>Others don&rsquo;t see the necessity. &ldquo;Why should we make exception here?&rdquo; Milan Dini&#263; said. &ldquo;It&rsquo;s not the first time oEmbed support was discontinued for a provider, and I don&rsquo;t remember anything specific was done then.&rdquo;</p>\n\n\n\n<p>There is still some uncertainty about what will happen with existing oEmbeds after Facebook updates its API. During a recent core developer meeting, Helen Helen Hou-Sand&iacute; confirmed that WordPress does not clear&nbsp;oEmbed&nbsp;caches regularly. &ldquo;Technically&nbsp;oEmbed&nbsp;caches are cleared if you save and a valid response is returned, we do not do cron-based garbage collection,&rdquo; Hou-Sand&iacute; said.</p>\n\n\n\n<p>In a post today on the core development blog, Jake Spurlock assured users and developers that the existing embeds added before Facebook&rsquo;s API change should still work:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>Because oEmbed responses are cached in the database using the hidden&nbsp;<code>oembed_cache</code>&nbsp;post type, any embed added prior to the October 24th deadline will be preserved past the deprecation date. These posts are not purged by default in WordPress Core, so the contents of the embed will persist unless manually deleted.</p></blockquote>\n\n\n\n<p>Marius Jensen cautioned that there is still the possibility that existing embeds may not work going, depending on what Facebook does.</p>\n\n\n\n<p>&ldquo;We don&rsquo;t know how they plan on implementing the use of unauthorized embed attempts,&rdquo; Jensen said. &ldquo;It could not return an embed code and your link would remain a plain link, or maybe they decide to return some kind of embedded &lsquo;unauthorized&rsquo; content. I don&rsquo;t think anyone has heard any specifics on how Facebook plans on doing this, so we&rsquo;re all just kinda waiting to either hear more, or see what happens.&rdquo;</p>\n\n\n\n<p>Jensen said WordPress doesn&rsquo;t re-check the cached results except when something changes with the post, but there may be plugins that clean up temporary data that may create an unpredictable outcome.</p>\n\n\n\n<p>&ldquo;The reliability of the caches are hard to determine (and being caches, it&rsquo;s sort of in the term that it&rsquo;s not guaranteed to always be there, but rather fetched and saved for a while when needed),&rdquo; Jensen said.</p>\n\n\n\n<p>Ideally WordPress&rsquo; oEmbed caches will prevent millions of embeds from breaking, but it&rsquo;s still unknown how Facebook and third party plugins could change things.</p>\n\n\n\n<p>Coming off a rocky 5.5 core update that deprecated jQuery Migrate and flooded official support forums with&nbsp;<a href=\"https://wordpress.org/search/5.5?in=support_forums\">reports of broken sites</a>, some contributors are wary of having another situation where users are left in the dark.</p>\n\n\n\n<p>&ldquo;I think a dashboard notice is desirable,&rdquo; Jon Brown said. &ldquo;Otherwise we&rsquo;re not preemptively warning people in a way they can prepare and transition to another solution. We&rsquo;re letting them know the same instant it&rsquo;s going to break (when editing a specific post). I don&rsquo;t think we can safely assume cached data is going to persist forever either, plenty of routines out there purge transient data before its stated expiration date.</p>\n\n\n\n<p>&ldquo;I see this as potentially being similar to the problems seen in dropping JQM. It&rsquo;ll cause <em>avoidable and silent breakage</em> client side without even any error logging for a site developer to pick up on. In hindsight, what ideally would have happened with JQM would have been incorporating the detection code from Enable jQuery Migrate Helper into core temporarily, or simply installing that plugin automatically on behalf of users.&rdquo;</p>\n\n\n\n<p>Brown suggested WordPress detect calls to the cached embeds and warn users before the calls have the chance to fail so they can consider enabling a plugin to keep their embeds working more reliably.</p>\n\n\n\n<p>The discussion remains open in the make.wordpress.org/core <a href=\"https://make.wordpress.org/core/2020/09/22/facebook-and-instagram-embeds-to-be-deprecated-october-24th/\">post</a> and the corresponding <a href=\"https://core.trac.wordpress.org/ticket/50861\">trac ticket</a>. Spurlock said WordPress will likely remove Facebook and Instagram oEmbed providers in the upcoming 5.6 release (scheduled for December 8) but it could also be shipped in a 5.x minor release that happens after October 24. </p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 23 Sep 2020 04:28:56 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:40;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:65:\"WPTavern: Gutenberg Hub Launches Landing Page Templates Directory\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105009\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:175:\"https://wptavern.com/gutenberg-hub-launches-landing-page-templates-directory?utm_source=rss&utm_medium=rss&utm_campaign=gutenberg-hub-launches-landing-page-templates-directory\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:7657:\"<img />\n\n\n\n<p class=\"has-drop-cap\">Munir Kamal has created <a href=\"https://wptavern.com/copy-and-paste-editor-blocks-via-gutenberghubs-block-library\">copy-and-paste blocks</a>. He has built <a href=\"https://wptavern.com/gutenberg-hub-launches-collection-of-100-block-templates\">sections or &ldquo;patterns&rdquo;</a> from those blocks. He has created a plugin that allows users to completely customize the two features via block options. Yesterday, he <a href=\"https://gutenberghub.com/introducing-gutenberg-landing-page-templates/\">released an initial offering</a> of 22 landing page templates that build upon his earlier work.</p>\n\n\n\n<p>Gutenberg Hub can almost be called his <em>magnum opus</em>, at least at this stage of his career. It is a continually growing library of free tools for WordPress&rsquo;s block editor.</p>\n\n\n\n<p>Like previous projects, Gutenberg Hub&rsquo;s landing templates require the <a href=\"https://wptavern.com/control-block-design-via-the-editorplus-wordpress-plugin\">EditorPlus plugin</a>. This plugin is essentially a suite of design controls for the core WordPress blocks. The templates make use of these options by default. Given the limitations of the block editor&rsquo;s current design controls, the use of such a plugin is necessary. Otherwise, there would be few other ways to realistically create a template system like this.</p>\n\n\n\n<p>Currently, users must copy the block code &mdash; via a convenient &ldquo;copy&rdquo; button &mdash; from the Gutenberg Hub website and then paste it in the editor. It is not an ideal situation, and I have been asking Kamal whether he would consider building a template inserter for months now.</p>\n\n\n\n<p>This time around, he preemptively said, &ldquo;And, by the way, I am already working on adding a Template Inserter in my EditorPlus plugin. That will allow users to browse and insert these templates directly from Gutenberg without leaving the website.&rdquo;</p>\n\n\n\n<p>He knew the question was coming. No need for me to ask again. He was unable to share a current screenshot of what the inserter looks like, but he is asking for feedback on what people expect of the user experience and interface.</p>\n\n\n\n<p>&ldquo;Earlier, I created a template inserter similar to other blocks plugins, but later I changed my mind and thought that I should integrate with the Gutenberg Patterns API and load the templates into the &lsquo;patterns&rsquo; panel in the block inserter,&rdquo; he said. &ldquo;But, I am having a few issues and thinking about going back to the original idea to have a Templates button on the top toolbar that opens a popup window to browse and filter templates that users can insert on a click.&rdquo;</p>\n\n\n\n<p>For now, it is still early. However, at least it is on the long-term roadmap and being worked on.</p>\n\n\n\n<h2>The Landing Page Templates</h2>\n\n\n\n<img />Testing the photography template (with minor adjustments).\n\n\n\n<p class=\"has-drop-cap\">At the moment, Gutenberg Hub offers <a href=\"https://gutenberghub.com/template-category/pages/\">22 landing page templates</a>. The &ldquo;page&rdquo; terminology may not mean &ldquo;full page.&rdquo; It simply depends on the active theme. Some themes have an open-canvas type of template that allows users to create the entire page via the editor. However, that is not a common feature, so these page templates will be confined to the post content area in most cases.</p>\n\n\n\n<p>The templates also work better with themes that have at least a full-width or no-sidebar option. End-users will want a lot of breathing room to use the templates and tinker with their designs.</p>\n\n\n\n<p>Kamal has built templates that stretch across a variety of industries. From restaurants to gyms to education to fashion, there is a lot to choose from right now. He promises more are on the way and at least a 23rd template in the next few days.</p>\n\n\n\n<p>&ldquo;For the niches, I did some research from the top WordPress and HTML marketplaces and found the following most common or popular niches,&rdquo; he said. &ldquo;I think I will stick with these niches unless I get some more recommendations.&rdquo;</p>\n\n\n\n<p>In comparison, <a href=\"https://wptavern.com/redux-framework-relaunches-focuses-efforts-on-gutenberg-templates\">Redux Templates</a> offers access to over 1,000 sections and templates. Of course, there are trade-offs, such as some of those being commercial and the plugin typically requiring other third-party plugins. While quantity is not the only thing to look at, it proves there are miles of landscape that Gutenberg Hub&rsquo;s templates have not yet explored. But, it is merely the beginning.</p>\n\n\n\n<p>Gutenberg Hub&rsquo;s full-page templates are not quite as plug-and-play as its blocks and section templates. This is not so much a fault from the developer&rsquo;s end. It is an issue of the platform, which is constantly being updated, and the range of support from current themes. End-users will start seeing some of the current limitations of the system when a layout does not quite look right with one theme but does with another. Or, if their theme has not been updated to support a new feature, such as the Social Links block, the typical horizontal menu design will likely be a normal vertical list of links instead.</p>\n\n\n\n<p>These are not insurmountable issues. Gutenberg and themes need more time to mature before projects like Gutenberg Hub&rsquo;s landing templates are perfect or at least as close to perfect as can be expected.</p>\n\n\n\n<p>There are some things that Gutenberg Hub could improve with its templates. With several that I tested, I needed to switch specific blocks to be full width. This should be set up as the default with templates that are clearly meant to be full width in the example screenshots available on the site. It is a minor issue, but correcting this in the editor fixed several layout issues I was having when using the templates.</p>\n\n\n\n<h2>Monetization Plans</h2>\n\n\n\n<p class=\"has-drop-cap\">The second question that Kamal has not been prepared to answer fully over the past several months is how he will monetize Gutenberg Hub. Eventually, developers need some return on their investment when building tons of free tools. Many would do it all for free as long as their bills somehow got paid, but the reality is that there will come a tipping point where their projects need funding for long-haul maintenance.</p>\n\n\n\n<p>Kamal said he has laid the groundwork for funding but has not finalized anything yet. Currently, he is working on three ideas:</p>\n\n\n\n<ul><li>Creating a pro version of his EditorPlus plugin.</li><li>Offering premium templates and blocks but is looking for a talented designer to work with.</li><li>Using ads specific to Gutenberg users, but he is not a fan of going this route or ads in general.</li></ul>\n\n\n\n<p>He is open to feedback on how to best monetize the website and its projects. However, he said he is unwilling to compromise on giving away current and future free templates and tools.</p>\n\n\n\n<h2>Future Gutenberg Projects</h2>\n\n\n\n<p class=\"has-drop-cap\">Kamal said he does not have any new Gutenberg-related projects in the pipeline. The current plan is to work on what he has already created, which is a large ecosystem of Gutenberg tools that somehow work together.</p>\n\n\n\n<p>Outside of blocks, templates, and plugins, he is beginning to write more free tutorials on the Gutenberg Hub blog and focusing on <a href=\"https://www.youtube.com/GutenbergHub\">creating videos</a> around the project, including a new tutorial <a href=\"https://www.youtube.com/playlist?list=PLfVnkTCddAJ2HMmjw1o12XP7TAEoOV5oE\">series for beginners</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 22 Sep 2020 21:05:19 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:41;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:97:\"WPTavern: WordPress Mobile Engineers Propose Dual Licensing Gutenberg under GPL v2.0 and MPL v2.0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105025\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:239:\"https://wptavern.com/wordpress-mobile-engineers-propose-dual-licensing-gutenberg-under-gpl-v2-0-and-mpl-v2-0?utm_source=rss&utm_medium=rss&utm_campaign=wordpress-mobile-engineers-propose-dual-licensing-gutenberg-under-gpl-v2-0-and-mpl-v2-0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6556:\"<p>During a Q&amp;A session at WordCamp Europe 2020 online, Matt Mullenweg mentioned that Gutenberg contributors were considering dual licensing for embedding Gutenberg in mobile apps, along with the requirement that they would need to get an agreement from all contributors. WordPress mobile engineer <a href=\"https://bia.is/\">Maxime Biais</a> has just published a <a href=\"https://make.wordpress.org/core/2020/09/21/proposal-dual-licensing-gutenberg-under-gpl-v2-0-and-mpl-v2-0/\">proposal</a> for discussion, recommending dual licensing the editor under GPL v2.0 and MPL v2.0.</p>\n\n\n\n<p>&ldquo;The GPL v2.0 license is a blocker for distributing the Gutenberg library in proprietary mobile apps,&rdquo; Biais said in the corresponding <a href=\"https://github.com/WordPress/gutenberg/issues/23651\">GitHub issue</a>. &ldquo;Currently the only known users of Gutenberg on mobile are the WordPress mobile apps which are under GPL v2.0 (<a href=\"https://github.com/wordpress-mobile/WordPress-Android\">WordPress for Android</a>,&nbsp;<a href=\"https://github.com/wordpress-mobile/WordPress-iOS\">WordPress for iOS</a>). Mobile apps under the GPL v2.0 are not common and this limits Gutenberg usage in many apps.</p>\n\n\n\n<p>&ldquo;Rich text editor libraries in the mobile space are lacking. There is no well known open source rich text editor for Android or iOS. We believe that Gutenberg could be a key library for many mobile apps, but that will never happen with the GPL v2.&rdquo;</p>\n\n\n\n<p>Mobile app developers are limited by the GPL, because it requires the entire app to be distributed under the same license. The team is proposing dual licensing under MPL v2.0, a weaker copyleft license that is often considered to be more &ldquo;business-friendly.&rdquo; It allows users to combine the software with proprietary code. MPL v2.0 requires the source code for any changes to be available under the MPL, ensuring improvements are shared back to the community. The rest of the app can be distributed under any terms with the MPL v2.0 code included as part of a &ldquo;larger work.&rdquo;</p>\n\n\n\n<p>&ldquo;The idea here is to keep some of the WordPress-specific modules under the GPL v2.0 only; some of them are not needed and not relevant for using Gutenberg in another software. Ideally, there would be a different way of bundling the project for being used in WordPress or in a non-GPL software,&rdquo; Biais said.</p>\n\n\n\n<p>The GitHub ticket has several comments from developers who hope to be able to use the editor in their own projects. Radek Pietruszewski, tech lead for a collaborative todo app called&nbsp;<a href=\"https://nozbe.com/\">Nozbe Teams</a>, has been requesting a relicensing of Gutenberg since October 2019.</p>\n\n\n\n<p>&ldquo;Our tech stack is essentially React on web and React Native on iOS and Android,&rdquo; Pietruszewski said. &ldquo;We&rsquo;re a tiny company, and so we share &gt;80% of app&rsquo;s codebase between these 3 platforms.</p>\n\n\n\n<p>&ldquo;Our app sorely lacks a WYSIWYG editor. We had a working implementation on web, but we decided to scrap it, because there was no way to port it on iOS and Android. There are pretty much no viable rich text editors for iOS or Android, yet alone both. But even then, shipping three completely separate, but somehow compatible editors would be a vast amount of work.&rdquo;</p>\n\n\n\n<p>When Peitruszewski originally made his case to the mobile team, he identified Gutenberg/Aztec as a basic infrastructure that has the potential to enable many different apps:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>And that infrastructure is sorely lacking. There are very few rich text editor libraries on both iOS and Android &mdash;&nbsp;and most of them suck. And if you want an editor that has a shared API for both platforms&hellip;&nbsp;you&rsquo;re stuck. There are no options &ndash; Gutenberg is the only game in town (and it&rsquo;s really good).</p><p>And it&rsquo;s very hard to create this infrastructure. WYSIWYG editors are very hard, and it takes entire teams years to develop them (and they still usually suck). Almost no-one has the resources to develop it just for themselves, and if they do, they&rsquo;re unwilling to open-source it.</p></blockquote>\n\n\n\n<p>Automattic&rsquo;s mobile app engineers have <a href=\"https://twitter.com/danroundhill/status/1296941098393190401\">struggled to get regular contributions to the apps</a>, despite them being open source. Dual licensing Gutenberg could open up a new world of contributors with the editor being used more widely across the industry.</p>\n\n\n\n<p>&ldquo;While we might not be big enough to be able to tackle a challenge of developing a rich text editor from scratch, we&rsquo;re big enough to contribute features and bug fixes to open source projects,&rdquo; Pietruszewski said.</p>\n\n\n\n<p>Matt Mullenweg was the first comment on Biais&rsquo; post in favor of the change: </p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>I think&nbsp;Gutenberg&nbsp;has a chance to become a cross-CMS standard, giving users a familiar interface any place they currently have a rich text box. There are hundreds and hundreds of engineers at other companies solving similar problems in a proprietary way, it would be amazing to get them working together but a huge barrier now is supporting Gutenberg in mobile apps, which every modern web service or CMS has. (Hypothetically, think of Mailchimp as a possible consumer and collaborator here, but it could be any company, SaaS, or other&nbsp;open source&nbsp;CMS.)</p></blockquote>\n\n\n\n<p>Unless any major blockers come up in further discussion, this dual licensing change appears to be on track to move forward. Biais noted that a&nbsp;<a href=\"https://github.com/wordpress-mobile/AztecEditor-Android/pull/922\">similar&nbsp;license change has already happened on Aztec-Android</a>&nbsp;and&nbsp;<a href=\"https://github.com/wordpress-mobile/AztecEditor-iOS/issues/1299\">Aztec-iOS</a>. The last hurdle is gaining the approval of all the original code contributors or rewriting the code for those who decline to give approval. </p>\n\n\n\n<p>Once Gutenberg can be used under the MPL v2.0, the editor will gain a broader reach, with people already on deck wanting to use it. Other companies and projects that are normally outside WordPress&rsquo; open source orbit will also have the opportunity to enrich Gutenberg&rsquo;s ecosystem with contributions back to the project. At the same time, the MPL 2.0 protects Gutenberg from companies that would try to re-release the code as a closed-source project.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 21 Sep 2020 22:59:10 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:42;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:124:\"WPTavern: GitHub to Use ‘Main’ Instead of ‘Master’ as the Default Branch on All New Repositories Starting Next Month\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=105014\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:269:\"https://wptavern.com/github-to-use-main-instead-of-master-as-the-default-branch-on-all-new-repositories-starting-next-month?utm_source=rss&utm_medium=rss&utm_campaign=github-to-use-main-instead-of-master-as-the-default-branch-on-all-new-repositories-starting-next-month\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4844:\"<p class=\"has-drop-cap\">In August, GitHub <a href=\"https://github.blog/changelog/2020-08-26-set-the-default-branch-for-newly-created-repositories/\">announced that it would change</a> the &ldquo;master&rdquo; branch name for all new repositories created on the platform to &ldquo;main&rdquo; starting October 1. The date is less than two weeks away, and WordPress developers need to be prepared for the change if they use the service for version control or project management.</p>\n\n\n\n<p>The larger tech and web development community began conversations through various venues in June, a time in which the Black Lives Matter was gaining more traction in the U.S. and worldwide. The discussion centered on removing any terminology that could be discriminatory or oppressive to specific groups of people. This ongoing discussion has shown that there is a deep division over whether such changes are necessary or even helpful.</p>\n\n\n\n<p>The WordPress community is dealing with this division itself. Aaron Jorbin <a href=\"https://make.wordpress.org/core/2020/06/18/proposal-update-all-git-repositories-to-use-main-instead-of-master/\">proposed a change</a> at the same time to rename the default branch name on WordPress-owned repositories. Through discussion on his post and elsewhere, the community landed on &ldquo;trunk,&rdquo; which keeps WordPress projects in line with its SVN roots.</p>\n\n\n\n<p>&ldquo;To close the circle on this, a decision was made in June and earlier today (August 19),&rdquo; <a href=\"https://make.wordpress.org/core/2020/06/18/proposal-update-all-git-repositories-to-use-main-instead-of-master/#comment-39524\">wrote Helen Hou-Sand&iacute;</a>, a lead WordPress developer, in the comments of the original proposal. &ldquo;I updated the default branch name for new GitHub repositories under the WordPress organization to be trunk after GitHub enabled early access to that feature.&rdquo;</p>\n\n\n\n<p>As evidenced by the comments on the <a href=\"https://wptavern.com/proposal-to-rename-the-master-branch-from-wordpress-owned-git-repositories\">Tavern&rsquo;s coverage of the proposal</a> and those on the original post, the WordPress development community as a whole did not support this decision.</p>\n\n\n\n<p>Jorbin has updated several of WordPress&rsquo;s repositories and switched them to use <code>trunk</code> instead of <code>master</code>. However, there are still some lingering projects yet to be updated, including the primary <a href=\"https://github.com/WordPress/WordPress\">WordPress</a> and <a href=\"https://github.com/WordPress/wordpress-develop\">WordPress Develop</a> repositories. He left a <a href=\"https://make.wordpress.org/core/2020/06/18/proposal-update-all-git-repositories-to-use-main-instead-of-master/#comment-38817\">comment with an updated lis</a>t in June. There is no public word on whether the existing, leftover projects will be changed.</p>\n\n\n\n<h2>WordPress Developer Preparations</h2>\n\n\n\n<img />Customizing the default branch for a user&rsquo;s GitHub repositories.\n\n\n\n<p class=\"has-drop-cap\">GitHub is merely changing the default branch name for new repositories starting on October 1. This change does not affect existing repositories. Individual users, organization owners, and enterprise administrators can customize the default branch via their account settings now before the switch is made. Owners can also change the default branch name for individual repositories.</p>\n\n\n\n<p>The biggest thing that developers need to watch out for is their tooling or other integrations that might still require the master branch. There may be cases where an alternative default branch name will break workflows. If planning to use a different branch name, the best thing to do right now is to spin up the tools you use on a test repository. If something breaks, check to see whether the particular tool you are using will be getting an update. In most cases, this should not be a problem because customized default branch names will be an industry standard.</p>\n\n\n\n<p>The great thing about how GitHub is rolling out this feature is that it offers a choice. Those who believe that &ldquo;master&rdquo; is oppressive can change the branch name to something they feel is more inclusive. For those who believe otherwise, they can keep their master branch. But, everyone can use the branch name they prefer.</p>\n\n\n\n<p>For existing repositories, GitHub is asking that developers be patient for now. The company is investing in tools to make this a seamless experience <a href=\"https://github.com/github/renaming#later-this-year\">later this year</a>. There are a few technical hurdles to clear first.</p>\n\n\n\n<p>Developers should read the full GitHub guide on <a href=\"https://docs.github.com/en/github/administering-a-repository/setting-the-default-branch\">setting the default branch</a> for more information.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 21 Sep 2020 20:39:55 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:43;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:125:\"WPTavern: Matt Mullenweg and Jamstack Community Square Off, Making Long-Term Bets on the Predominant Architecture for the Web\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=104428\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:293:\"https://wptavern.com/matt-mullenweg-and-jamstack-community-square-off-making-long-term-bets-on-the-predominant-architecture-for-the-web?utm_source=rss&utm_medium=rss&utm_campaign=matt-mullenweg-and-jamstack-community-square-off-making-long-term-bets-on-the-predominant-architecture-for-the-web\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:19953:\"<p>Over the past two weeks, Matt Mullenweg and Jamstack community leaders have forged a new rivalry, after Mullenweg told <a href=\"https://thenewstack.io/wordpress-co-founder-matt-mullenweg-is-not-a-fan-of-jamstack/\">The New Stack</a> that he sees Jamstack as &ldquo;a regression for the vast majority of the people adopting it.&rdquo;  </p>\n\n\n\n<p>&ldquo;The usability and functionality is actually lower,&rdquo; Mullenweg said to Richard MacManus in an email. &ldquo;Even rebuilding sites in Jamstack harkens back to the Movable Type days, where the bigger your site gets the slower it is to rebuild or update templates.&rdquo; </p>\n\n\n\n<p>Mullenweg also described a &ldquo;fragile&rdquo; chain of services required to run Jamstack sites.</p>\n\n\n\n<p>&ldquo;You can patch together a dozen services, each with its own account and billing, for hundreds of dollars a month, to get a similar result you&rsquo;d have for a few dollars a month using WordPress on shared hosting,&rdquo; he said. &ldquo;And it would be more fragile, because the chain is only as strong as its weakest link. You are chaining together different toolsets, logins, billing, hosting&hellip; any part of it going down can break the entire flow.&rdquo;</p>\n\n\n\n<p>Mullenweg has since further <a href=\"https://wptavern.com/matt-mullenweg-clarifies-jamstack-remarks\">clarified his comments</a> while also doubling down on his original premise, saying that &ldquo;there isn&rsquo;t a vast number of people adopting Jamstack in the first place, and those who do are probably fully aware of the tradeoffs.&rdquo; He outlined how he sees WordPress providing a better experience for users in terms of performance, security, scaling, and developer experience.&nbsp;</p>\n\n\n\n<p>Mullenweg&rsquo;s provocative remarks set off a chain of open letters from the CEO&rsquo;s of Jamstack-related services. They are convinced that the LAMP stack is on its way out and that Jamstack is on the precipice of replacing its incumbent as the most dominant architecture of the web. </p>\n\n\n\n<p>Ohad Eder-Pressman, co-founder and CEO of <a href=\"https://www.stackbit.com/\">Stackbit</a>, was the first to fire back. He believes that Jamstack is a &ldquo;disruptive innovation&rdquo; that may appear to be inferior now because it is still relatively low level and new when compared to a 17-year old product like WordPress.</p>\n\n\n\n<p>&ldquo;We should be asking whether Jamstack is a better architecture than LAMP and what gaps currently exist with products and solutions built on top of the Jamstack,&rdquo; Eder-Pressman said. He agreed that Jamstack tools are still largely focused on developers but makes a bold prediction on the stack&rsquo;s future reach:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>The achievements of WordPress in terms of market share and how it democratized early web publishing are amazing. When it comes to architecture I think it was best in class for the early 2000s but it&rsquo;s time to move forward. We already see cohorts of websites where Jamstack adoption crosses 20% &ndash; it&rsquo;s no longer a question of if the Jamstack becomes the predominant architecture for the web but a question of when. The cliche is a cliche but it also rings true &ndash;&nbsp;<strong>First, they ignore you, then they laugh at you (we are here), then you win</strong>.</p></blockquote>\n\n\n\n<p>Eder-Pressman agreed with Mullenweg regarding Jamstack&rsquo;s lower usability and functionality but touted the architecture as &ldquo;infinitely more resilient&rdquo; due to being hosted on a CDN. He admitted that rebuilding larger sites can be slow but cited developments like build parallelization, build cache, partial rebuild, and incremental static regeneration as&nbsp;optimizations as efforts the Jamstack ecosystem&nbsp;is exploring to solve this known issue.</p>\n\n\n\n<p>Netlify&nbsp;CEO Mathias Biilmann, who originally coined the term &ldquo;Jamstack,&rdquo; goes so far as to hail &ldquo;the end of the WordPress era&rdquo; in his <a href=\"https://www.netlify.com/blog/2020/09/15/on-mullenweg-and-the-jamstack-regression-or-future/\">article</a> refuting Mullenweg&rsquo;s remarks. </p>\n\n\n\n<p>&ldquo;There&rsquo;s often a moment right around the time when an old technology is about to be displaced by the next thing, where the main leader in the field goes out and makes a strong argument that absolutely nothing is happening,&rdquo; Biilmann said. &ldquo;A moment that ends up looking like a turning point where the new was undeniably present enough to be worth being in denial about.&rdquo;</p>\n\n\n\n<h2>The Bet: By September 2025, what will be the predominant architecture for the web?</h2>\n\n\n\n<p>In a brief exchange on Twitter, Mullenweg and Eder-Pressman made a wager for five years into the future, to see if Eder-Pressman&rsquo;s prediction will hold up, as measured by the Alexa top 10k. In order for Jamstack to become the predominant architecture for the web, it will need to surpass WordPress&rsquo; numbers, which are currently hovering at <a href=\"https://trends.builtwith.com/cms/WordPress\">39.75%</a> (via BuiltWith) and <a href=\"https://w3techs.com/technologies/details/cm-wordpress\">38.4%</a>&nbsp;(via w3techs).</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">They currently have us ~37% of top 10k. I wonder if you\'re undercounting us with YC companies too? <a href=\"https://t.co/ki9Ng3DGqI\">https://t.co/ki9Ng3DGqI</a></p>&mdash; Matt Mullenweg (@photomatt) <a href=\"https://twitter.com/photomatt/status/1302048647882784769?ref_src=twsrc%5Etfw\">September 5, 2020</a></blockquote>\n</div>\n\n\n\n<p>&ldquo;I&rsquo;m happy to make a long bet: 1 year, 5 years, 10 years,&rdquo; Mullenweg said in another <a href=\"https://twitter.com/photomatt/status/1306368508792504321\">thread</a> in response to Netlify&rsquo;s CEO. &ldquo;We&rsquo;re building and rebuilding WordPress to be generational. We&rsquo;ve navigated and created bigger architectural shifts in the past, and will do so in the future.&rdquo;</p>\n\n\n\n<p>&ldquo;I&rsquo;m a developer, founder, and investor in the space of web technologies &ndash; if I&rsquo;m not willing to engage in a public discussion and share my predictions for where the web is heading then what merit does my work have?&rdquo; Eder-Pressman said when I asked him why he was willing to make this public wager.</p>\n\n\n\n<p>&ldquo;I felt compelled given Mullenweg&rsquo;s comments and what I believe is the lack of appreciation for how much adoption and momentum Jamstack technologies already have. If anything I would say that my bet is actually pretty cautious.&rdquo;</p>\n\n\n\n<p>Eder-Pressman and his team at Stackbit are working on a tool to track Jamstack adoption across the web, as BuiltWith does not yet have a Jamstack stat panel that correctly aggregates all the technologies associated with this relatively new category of websites.</p>\n\n\n\n<p>&ldquo;We&rsquo;ve built an internal tool that tracks adoption of Jamstack technologies across different cohorts of websites which we find informative,&rdquo; he said. &ldquo;This isn&rsquo;t unlike what say Builtwith provides except that we track a few technologies that they don&rsquo;t and we bundle this into a Jamstack adoption indicator. We&rsquo;ve used this internally up until now and are planning to release some public facing version of it later this year.&rdquo;</p>\n\n\n\n<p>As the CEO of Stackbit, a service that cranks out Jamstack sites in 60 seconds while bypassing any requirement to use the command line or download npm packages, Eder-Pressman is actively engaged in trying to bring this technology stack to the masses. The company aims to solve the very problems that Mullenweg identified in his critical comments, as is evident in the marketing copy on the Stackbit website. It acknowledges that piecing together a Jamstack website can be challenging even for developers:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>&ldquo;In a fragmented Jamstack environment, developers struggle to glue products together when trying out the latest tech. Stackbit connects the best tools on the market, and helps them play together.&rdquo;</p></blockquote>\n\n\n\n<p>A year ago, Stackbit caught my attention and I contacted them to find out when WordPress would land among their list of CMS import options. At that time they said they were considering WordPress as a headless CMS option but did not have it on the immediate roadmap. One year later, Stackbit is no closer to building import capabilities for the most popular CMS on the web.</p>\n\n\n\n<p>&ldquo;It&rsquo;s on the horizon but its not something we&rsquo;ve prioritized,&rdquo; Eder-Pressman said. &ldquo;WordPress is a full blown monolithic CMS. It has been used before as a headless CMS but there are better headless CMS choices out there. Even Mullenweg <a href=\"https://twitter.com/photomatt/status/1302028302530404353\">agrees</a> it&rsquo;s a complicated premise.&rdquo;</p>\n\n\n\n<p>When asked if his recent conversations have changed the company&rsquo;s plans to support WordPress imports, he said, &ldquo;No, it doesn&rsquo;t make us want to do this any more or less. I really enjoyed the conversation and am glad that Mullenweg recognizes the rise of the Jamstack so much so that he found it necessary to take aim at it. We as a company are driven by the market, user demand, growth opportunities and a healthy vision for the future of the web.&rdquo;</p>\n\n\n\n<p>Jamstack will need to make itself accessible to the wide world of non-technical website owners if its advocates hope to capture any meaningful segment of the Alexa top 10k marketshare. Stackbit, for one, is still grossly underestimating WordPress&rsquo; ability to sustain its <a href=\"https://joost.blog/cms-market-share-june-2020-analysis/\">phenomenal growth</a>, and doesn&rsquo;t see the necessity for creating a simple path to convert WordPress users. Eder-Pressman believes that making Jamstack accessible starts with developers.</p>\n\n\n\n<p>&ldquo;The Jamstack is an architecture which is winning the minds of developers around the world and across the web development stack,&rdquo; he said. &ldquo;Adoption for new architectures often begins with developers so I&rsquo;m excited to see a company like say Netlify boast over 1 million developers on its Jamstack platform.&rdquo; </p>\n\n\n\n<p>Eder-Pressman&rsquo;s tool for measuring Jamstack adoption will need to produce some compelling data on the stack&rsquo;s growth, if his bet is going to materialize. While nearly every offering in the Jamstack ecosystem still falls squarely within the realm of experienced developers, it doesn&rsquo;t seem likely that five years is enough time for it to overtake WordPress as the predominant architecture for the web. WordPress hasn&rsquo;t achieved its dominance by prioritizing developer happiness over usability.</p>\n\n\n\n<p>Looking at the numbers five years from now, will we see Jamstack overtake WordPress as the most popular way to build a website? Will Jamstack grow with developer usage and then plateau once it fails to reach regular people who don&rsquo;t have a git-based workflow at the top of their wishlists? Are we going to find Jamstack and WordPress neck and neck in the battle for the predominant architecture for the web? Those who work with a hybrid of both technologies see no need for this kind of rivalry.</p>\n\n\n\n<h2>Shifting the conversation towards collaboration: &ldquo;Jamstack can be an opportunity for our industry, rather than a threat.&rdquo;</h2>\n\n\n\n<p>&ldquo;Reading Mullenweg&rsquo;s comments and the responses from CEOs in the Jamstack community make me feel caught in the middle and a bit frustrated,&rdquo; <a href=\"https://www.getshifter.io/\">Shifter</a> COO Daniel Olson said. &ldquo;I see friction between two communities that have so much in common.&rdquo;</p>\n\n\n\n<p>Olson has been a proponent of using Jamstack with WordPress for the past four years since launching Shifter, a static site generator and hosting company that supports headless WordPress sites on the Jamstack. </p>\n\n\n\n<p>&ldquo;If you look for the most secure, cost-effective way to build and host a high-traffic website today, the cross-section you&rsquo;ll arrive at is the Jamstack. Looking at how it offers each of those benefits, you will find inspiration and ways WordPress could do the same,&rdquo; Olson said. &ldquo;Rather than write something off wholesale, see what you can learn and apply it.&rdquo;</p>\n\n\n\n<p>Olson said his mission is to bridge the gaps between WordPress and the benefits Jamstack offers, while working through its early days and messy parts, innovating on the tools that work.</p>\n\n\n\n<p>&ldquo;We should be working together to address specific challenges and worry less about how we get there,&rdquo; Olson said. &ldquo;Some technologies are indeed a better fit for solving each of those challenges but you don&rsquo;t need to leave one ecosystem for the other to do it. You can share knowledge and best practices and discover what&rsquo;s possible. There&rsquo;s a good chance you&rsquo;ll end up creating something new, which is part of that innovation we need in our communities.&rdquo;</p>\n\n\n\n<p>Jamstack hosting services for WordPress are eager to remind users that they don&rsquo;t have to go all in on the technology. You can have your JAM and spread it on top of WordPress, accommodating developers&rsquo; love for experimenting with new frontend technologies, while preserving the dynamic publishing power that has been refined over the past 17 years. These hybrid hosting companies aim to enable this without leaving users behind. </p>\n\n\n\n<p>&ldquo;Matt is absolutely right that the usability and functionality of the Jamstack is lower,&rdquo; <a href=\"https://www.strattic.com/\">Strattic</a> co-founder and CEO Miriam Schwab said. &ldquo;The Jamstack is a great example of technology that is incredibly appealing to developers, but the actual end users &ndash; writers, marketers, business owners &ndash; cannot use it. I&rsquo;ve heard many stories of major companies that have come to the decision to adopt Jamstack for all web development as a company-wide policy, only to find that their marketing team has gone rogue and is installing WordPress sites in order to get their job done.</p>\n\n\n\n<p>&ldquo;The reason for this is like Matt said: every Jamstack site is a compilation of layers of services, and each layer has dozens of options available: you need a static site generator, a CMS, static hosting, and a CDN &ndash; and you need to tie it all together with version control. This is all cool and shiny, and the output is truly fantastic because when you have a site that&rsquo;s a collection of pre-rendered static files served up through a CDN it&rsquo;s fast, secure, scalable and stable. But then along comes marketing and they want to set up a landing page and they are totally dependent on their dev team and can&rsquo;t move forward without them. That defeats the purpose of a CMS-driven website! With WP, you get all the layers in one platform&hellip;but you don&rsquo;t get the awesome output.&rdquo;</p>\n\n\n\n<p>Schwab said she sees WordPress having its age work both for it and against it, but ultimately she believes in enabling real world users to manage their own websites without having to rely on developers. </p>\n\n\n\n<p>&ldquo;I&rsquo;ve seen many companies abandon WP for the shiny new stack, and then come back to it,&rdquo; Schwab said. &ldquo;Github is a good example of this &ndash; yes Github, the modern repository of cutting-edge code moved their blog off of WordPress, and then came back because it truly is the best tool for just getting your content out there. There aren&rsquo;t a zillion steps and integrations &ndash; you write content, click Publish, and that&rsquo;s it. It gets the job done, and the fanciest tools will never beat something that just gets the job done.&rdquo;</p>\n\n\n\n<p>At the same time, WordPress needs to be open to enabling diverse frontend implementations, if it wants to remain relevant for the next decade. &ldquo;WP is running on legacy architecture,&rdquo; Schwab said. &ldquo;It&rsquo;s showing its age, and it&rsquo;s not appealing to new generations of developers. We need to keep WordPress appealing and interesting to developers in order to secure its future for years to come. If we don&rsquo;t make developers excited, we will inevitably see a decline.&rdquo;&nbsp;She encourages the WordPress community to embrace Jamstack as &ldquo;a breath of fresh air.&rdquo; </p>\n\n\n\n<p>&ldquo;Jamstack can be an opportunity for our industry, rather than a threat,&rdquo; Schwab said. &ldquo;There are ways for the two industries to collaborate, like in the case of headless WP deployments using Gatsby.&rdquo;</p>\n\n\n\n<p>Unlike many other Jamstack service companies, the team behind Gatsby has <a href=\"https://wptavern.com/gatsby-raises-15m-plans-to-invest-more-heavily-in-wordpress-and-cms-integrations\">more readily embraced WordPress</a> as a data source and a critical component of its continued success. The company <a href=\"https://wptavern.com/jason-bahl-joins-the-gatsby-team-to-work-on-wpgraphql-full-time\">hired Jason Bahl</a>, creator of the GraphQL for WordPress project, to work on WPGraphQL (and its immediate ecosystem) full-time, while providing a bridge to the WordPress world.</p>\n\n\n\n<p>&ldquo;Maybe I&rsquo;m getting caught up in semantics, but the JAM in JAMStack means JavaScript, APIs and Markup,&rdquo; Bahl said. &ldquo;It wasn&rsquo;t long ago when Matt prescribed the WordPress ecosystem to &lsquo;Learn JavaScript Deeply,&rsquo; and not long after that when a Jamstack application called Gutenberg was merged into WordPress core, along with React. Gutenberg is the JavaScript, the WP REST API is the API and the end result is markup. Jamstack isn&rsquo;t a regression, it&rsquo;s a future that Automattic is helping drive WordPress toward.&rdquo;</p>\n\n\n\n<p>When Mullenweg says he is ready to build and rebuild WordPress to be generational, it&rsquo;s a promise he has already delivered on by introducing the React-based Gutenberg editor two years ago, successfully pushing past an enormous amount of resistance from the developer community.</p>\n\n\n\n<p>Bahl said he sees this continued legacy of improvement happening over and over again in various ways, made possible by WordPress&rsquo; pluggable system:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>WordPress ships with a lot of APIs, but often they are replaced with something newer and better. For example, it&rsquo;s common for sites to offload images to a CDN instead of use the built-in file system for media. Or instead of using built-in WordPress MySQL search, users will reach for ElasticSearch, Algolia or Solr. In the case of WordPress and the JAMStack, reaching for Next, Gatsby or Gridsome to replace the built-in Theme API isn&rsquo;t a regression, it&rsquo;s using newer technology to handle things that built-in parts of WordPress might not do as well. The Theme API of WordPress is just one API and replacing it with technology that does the job better isn&rsquo;t a regression.</p></blockquote>\n\n\n\n<p>Gatsby&rsquo;s build step, which has received <a href=\"https://twitter.com/tesseralis/status/1293649015020457984\">negative attention in the news</a> recently, is one example of what Bahl thinks Mullenweg was referring to as a regression for users. Bahl is working with Gatsby to reduce the friction associated with decoupled architectures when using WordPress as the API in Jamstack.</p>\n\n\n\n<p>&ldquo;I don&rsquo;t see Jamstack competing against WordPress,&rdquo; Bahl said. &ldquo;In my mind, Jamstack with WordPress as the API is the future of the web. WordPress is the best CMS. Gatsby specifically is trying to embrace this. This isn&rsquo;t a zero sum game. If the Gatsby + WordPress experience can allow users to use the best CMS in the world while using modern dev tooling, it&rsquo;s a win all around.&rdquo;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 19 Sep 2020 18:54:01 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:44;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"WPTavern: Matt Mullenweg Clarifies Jamstack Remarks\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=104883\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:147:\"https://wptavern.com/matt-mullenweg-clarifies-jamstack-remarks?utm_source=rss&utm_medium=rss&utm_campaign=matt-mullenweg-clarifies-jamstack-remarks\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:6205:\"<p>Two weeks ago, Matt Mullenweg made some pointed remarks in an article from <a href=\"https://thenewstack.io/wordpress-co-founder-matt-mullenweg-is-not-a-fan-of-jamstack/\">The New Stack</a>, calling Jamstack &ldquo;a regression for the vast majority of the people adopting it.&rdquo; In preparation for an upcoming article that will include comments from leaders across both the WordPress and Jamstack communities, I asked Mullenweg if he stands by his remarks characterizing Jamstack as a regression. His response was lengthy and is printed here in its entirety to preserve cohesion.</p>\n\n\n\n<p><strong>Q: Do you stand by your remarks that Jamstack is a regression for the vast majority of the people adopting it?</strong></p>\n\n\n\n<p><strong>Answer:</strong></p>\n\n\n\n<p>&ldquo;Vast majority of people adopting it&rdquo; was probably too harsh, because there isn&rsquo;t a vast number of people adopting Jamstack in the first place, and those who do are probably fully aware of the tradeoffs. There are some good reasons, for certain situations, to decouple and add complexity to your architecture, and WordPress&rsquo; REST API works fantastically as a backend there. But I worry they are over-selling the promise of what&rsquo;s really an architectural decision. If&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://jamstack.org/\">you look at the benefits they purport</a>,&nbsp;it&rsquo;s better performance, security, scaling, and developer experience:</p>\n\n\n\n<img />\n\n\n\n<p><strong>Better Performance:</strong> You can achieve the same performance by putting a great CDN like Cloudflare on top of WordPress, and your life will be infinitely easier when you want to add dynamic features like a store or comments. You can also easily find a static WordPress host like&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://www.strattic.com/\">Strattic</a>&nbsp;or&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://www.getshifter.io/\">Shifter</a>.</p>\n\n\n\n<p><strong>Higher security:</strong> I don&rsquo;t believe that introducing a number of proprietary and sub-scale SaaS services like Netlify into your stack will make your site more secure. I believe the most secure thing you can do is run fully open source code, as widely vetted and used as possible, on servers you control, or from the fewest number of vendors possible. WordPress securely runs some of the most attacked websites on the internet, including major media, Facebook, and&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"http://whitehouse.gov/\">WhiteHouse.gov</a>. Having this many moving parts doesn&rsquo;t inspire confidence:</p>\n\n\n\n<img />\n\n\n\n<p><strong>Cheaper, easier scaling:</strong> CDNs are more expensive than normal hosting accounts, and you can get WordPress running on a decent host for less than $5/mo. And there are even more powerful offerings: The personal plan on&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"http://wp.com/\">WP.com</a>&nbsp;can serve tens of millions of visitors per day, to the website or the headless API, includes a global CDN, and a domain name for $4/mo, and we still have a profit margin.&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://graphcms.com/pricing\">GraphCMS starts at $29/mo and only gives you &ldquo;5,000 entities,&rdquo;</a> whatever that means.&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://www.contentstack.com/pricing\">Contentstack is $3,500/mo</a>. And that&rsquo;s just for the headless CMS part! You still need to sign up and pay for a bunch of the other stuff in that graphic before you have a website a human can visit in a browser.</p>\n\n\n\n<p><strong>Better developer experience:</strong> If your developer wants to copy and paste updates from marketing to the website, sure, but if they want people to be able to update the website without their help, they should go with something easier for users like WordPress. If you&rsquo;re curious about the developer experience, or an investor thinking about this space, I really suggest you watch this three hour and thirty minute tutorial to really understand what is being sold under the premise of &ldquo;better&rdquo;:</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n\n</div>\n\n\n\n<p>Have I ever built stuff like that? Totally! It can be a ton of fun, like building a rocket at home or fixing up an old car. I&rsquo;ve seen some awesome sites built on decoupled architectures or static publishing, using headless WordPress rather than the CMS&rsquo;s above, but still a similar idea. People are trying to paint me as being against Jamstack, but that is as foreign to me as being against duct tape &mdash; it&rsquo;s good for some things, bad for others, and it&rsquo;s not going away. I just wish they would be more intellectually rigorous and honest when marketing it. I expect a Jamstack-like approach to exist forever, just like the ideas behind Jamstack pre-date it getting jammed down our throats by Netlify&rsquo;s marketing team.</p>\n\n\n\n<p>Biilmann has got the Ballmer / iPhone story backwards &mdash;&nbsp;Microsoft&rsquo;s mistake there was they made something too complicated, and the iPhone simplified it. Jamstack introduces numerous vendors, build steps, network calls, interfaces, even billing relationships for something that&rsquo;s a single button press in WordPress.</p>\n\n\n\n<p>The reason services like&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"http://wordpress.com/\">WordPress.com</a>&nbsp;and Shopify are growing so much is they are taking things that were complicated and making them simpler and accessible to a much wider audience. My mission is to democratize publishing and commerce, to make it radically accessible to everyone regardless of technical or economic ability, and increase the freedom and openness on the internet.&nbsp;<a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://twitter.com/photomatt/status/1306368508792504321\">As I said on Twitter</a>, the first 15 years of WordPress were just the first few chapters. I&rsquo;m looking forward to building and rebuilding the platform the rest of my lifetime, and when that comes to an end I hope future generations will carry the torch.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 18 Sep 2020 22:49:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:45;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:65:\"WPTavern: Gutenberg’s Custom Spacing Should Be Theme Controlled\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=104867\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:169:\"https://wptavern.com/gutenbergs-custom-spacing-should-be-theme-controlled?utm_source=rss&utm_medium=rss&utm_campaign=gutenbergs-custom-spacing-should-be-theme-controlled\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5679:\"<img />Adjusting padding on a Group block.\n\n\n\n<p class=\"has-drop-cap\">When <a href=\"https://wptavern.com/gutenberg-9-0-brings-major-improvements-to-navigation-screen-and-query-block\">Gutenberg 9.0 landed</a> earlier this week, it came with an experimental <a href=\"https://github.com/WordPress/gutenberg/pull/24966\">padding control</a> for the Group block. Most users will not see it unless their theme has opted into supporting the feature using the <code>experimental-custom-spacing</code> flag.</p>\n\n\n\n<p>This was not the first that we have seen of the padding option on a block. <a href=\"https://wptavern.com/gutenberg-8-3-updates-block-categories-includes-parent-block-selector-and-adds-new-design-controls\">Gutenberg 8.3</a> introduced it for the Cover block. Since then, nothing has changed with the implementation.</p>\n\n\n\n<p>The problem with the custom spacing/padding option is that it creates an inline style that does not adjust based on the design of the theme. Fortunately, the feature is still experimental. This means that we have time to reevaluate how it works.</p>\n\n\n\n<p>Unless we&rsquo;re doing away with any remaining illusion that themes will play an important aspect of WordPress&rsquo;s future and front-end design becomes fully entrenched within core, theme authors need some level of control. And, even if themes are going the way of the dinosaur, custom padding numbers on the block level will create design consistency issues down the road. Using 100 pixels of padding might make sense within a site&rsquo;s current design, but 96 pixels might make sense within a future design. When a user adds dozens or hundreds of blocks with custom padding today, it will wreak havoc on tomorrow&rsquo;s spacing and rhythm.</p>\n\n\n\n<p>Besides that, the average user has little concept of design rules. Having a standardized system for spacing would give theme authors control over the output while giving end-users the ability to customize the look.</p>\n\n\n\n<p>I have argued that WordPress needs some sort of <a href=\"https://wptavern.com/themes-of-the-future-a-design-framework-and-a-master-theme\">design framework</a>. For example, Tailwind CSS has specific padding classes. So does Bootstrap and nearly every other CSS framework. The web development community has been down this road. It is a well-trodden path, and WordPress is not innovating by using inline styles.</p>\n\n\n\n<p>If the WordPress platform is going to put this sort of power into the hands of its users, it should do so in a way that allows designers to do their thing and not push users toward semi-permanent, inline-style soup in their content.</p>\n\n\n\n<p>Pre-Gutenberg, I would have been entirely against the idea of WordPress introducing any sort of CSS or design framework. However, the platform is consistently moving toward becoming a UI-based design tool rather than simply a way to manage content. Users will have design-related options on a global scale all the way down to individual blocks. Users should absolutely have the ability to adjust a block&rsquo;s padding in such a system. They should not need an understanding of CSS to do so. Instead, for most use cases, users should be able to adjust padding based on whether they want larger or smaller spacing, not specific CSS values.</p>\n\n\n\n<p>I propose a full set of standardized padding classes. The same would go for margins or other design-related options down the road. Gutenberg/WordPress should create a set of default values for these classes, which theme authors could override based on their design.</p>\n\n\n\n<p>This is not a new concept. Dave Smith, a developer for Automattic, introduced a <a href=\"https://github.com/WordPress/gutenberg/pull/16730\">patch in 2019</a> that used named selectors for spacing on the Group block. He gave the following reasoning for choosing this approach over absolute values:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p>Imagine you are a Theme designer. You craft your CSS with spacing that is perfect for the design. You want to ensure that is consistent throughout your Theme, even if the page layout is being created by the end-user in the Block Editor.</p><p>With the approach I&rsquo;ve taken here, when a size is selected only classes are added to the Block in the DOM. This affords the Theme creator the opportunity to provide custom sizes in CSS that are suitable for their Theme. If they opt not to do this then sensible defaults are provided.</p><p>With the pixels approach, we&rsquo;re locking users of the Block into absolute values and asking them to make a lot of decisions that they&rsquo;d probably prefer not to have to make. It could also lead to an inconsistent visual experience.</p></blockquote>\n\n\n\n<p>This ship has already sailed and sunk with custom colors and font sizes. Gutenberg had an opportunity to standardize class names for these options but left it to theme authors. As a result, there is no standard across the theme market, which means that choosing the &ldquo;large&rdquo; font size or the &ldquo;blue&rdquo; text color provided by the theme will likely not carry across to the user&rsquo;s next theme. Now, we are on the cusp of far more design-related options as WordPress moves toward full-site editing. It is time to consider some standards on design-related class names and provide a framework that all themes can use.</p>\n\n\n\n<p>Gutenberg could still provide a <em>custom</em> padding option just like it does for colors and font sizes. Users who choose to go this route would be making an explicit choice to work outside of the standard. But, let&rsquo;s not go down this road of allowing users to set absolute spacing values as the default option.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 18 Sep 2020 18:49:10 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:46;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"WPTavern: GoDaddy Acquires SkyVerge, Creator of Over 60 WooCommerce Add-Ons\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=104658\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:193:\"https://wptavern.com/godaddy-acquires-skyverge-creator-of-over-60-woocommerce-add-ons?utm_source=rss&utm_medium=rss&utm_campaign=godaddy-acquires-skyverge-creator-of-over-60-woocommerce-add-ons\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:4911:\"<p class=\"has-drop-cap\">On September 14, GoDaddy <a href=\"https://aboutus.godaddy.net/newsroom/news-releases/press-release-details/2020/GoDaddy-Acquires-SkyVerge-to-Help-Everyday-Entrepreneurs-Sell-Online-with-WordPress-and-WooCommerce/default.aspx\">announced it had acquired SkyVerge</a>, a major WooCommerce-focused development company, for an undisclosed amount. At the moment, GoDaddy is playing it close to the vest in terms of its future plans. It has not publicly announced anything beyond a continued commitment to current customers.</p>\n\n\n\n<p>The initial announcement makes note that SkyVerge&rsquo;s free plugins on WordPress.org have been downloaded more than 3.1 million times. However, the company&rsquo;s <a href=\"https://profiles.wordpress.org/skyverge/#content-plugins\">nine plugins in the directory</a> currently have over 155,000 active installs. Nevertheless, SkyVerge&rsquo;s real value is in its team and its impressive array of free and commercial add-on plugins available directly from its site.</p>\n\n\n\n<p>WooCommerce is a cash cow for companies with the right products and marketing at the moment. GoDaddy seems to be going all-in on the back of WordPress&rsquo;s most popular eCommerce solution. It launched a <a href=\"https://wptavern.com/godaddy-launches-ecommerce-hosting-plan-in-partnership-with-woocommerce\">managed WooCommerce hosting plan</a> in October 2019. The hosting company has now added over 60 WooCommerce extensions to its inventory in one swoop.</p>\n\n\n\n<p>&ldquo;As more small businesses and entrepreneurs go online, having a highly performant eCommerce experience is becoming more important than ever,&rdquo; said Rich Tabor, Senior Product Manager of WordPress Experience at GoDaddy. &ldquo;Late last year we launched a Managed WooCommerce offering, bundling many WooCommerce extensions in the Managed WordPress environment.&rdquo;</p>\n\n\n\n<p>SkyVerge has quietly become a massively successful WordPress and WooCommerce business. It was bringing in <a href=\"https://www.starterstory.com/develop-ecommerce-tools\">$350,000 per month</a> at the end of 2019. There was no response on how well the business has performed thus far in 2020.</p>\n\n\n\n<p>The entire SkyVerge team came along for the transition to GoDaddy. &ldquo;We&rsquo;re just beginning to deliver more capabilities and an even better setup and ongoing usage experience for our customers,&rdquo; said Tabor. &ldquo;The SkyVerge team will lead and accelerate those plans. They are an incredibly talented and innovative team that lives and breathes WooCommerce. Joining forces with them advances GoDaddy&rsquo;s WordPress strategy and enhances our ability to deliver intuitive eCommerce experiences that help everyday entrepreneurs sell online.&rdquo;</p>\n\n\n\n<p>With so many extensions in place, the big question for average users is whether those extensions will become a part of GoDaddy&rsquo;s eCommerce hosting bundle. Tabor either did not or could not let slip any plans in the works. &ldquo;We&rsquo;re just beginning to determine how to best deliver SkyVerge&rsquo;s wonderful products to GoDaddy customers. SkyVerge brings a lot of great software. It&rsquo;s reasonable to expect we&rsquo;ll be delivering that to our customers who are selling online.&rdquo;</p>\n\n\n\n<p>It is doubtful that GoDaddy went into this acquisition without at least some short-term plans or visions for how its managed hosting service would use these extensions. For now, we will have to wait and see.</p>\n\n\n\n<p>It seems that the immediate plan will be to maintain business as usual. Tabor said GoDaddy had no changes to announce related to SkyVerge&rsquo;s products and website. &ldquo;We are committed to continuing support of SkyVerge&rsquo;s customers and investing in the SkyVerge software,&rdquo; he said.</p>\n\n\n\n<p>SkyVerge also created <a href=\"https://jilt.com/\">Jilt</a>, which is an email marketing platform for eCommerce sites. The platform currently supports WooCommerce, Easy Digital Downloads, Shopify, and Shopify Plus. Tabor did not directly respond to what the future looked like for Jilt&rsquo;s non-WooCommerce customers nor did he give any indication of whether there were plans to expand Jilt to other eCommerce systems.</p>\n\n\n\n<p>He did say that GoDaddy would continue to invest in its priority eCommerce platforms, which are WooCommerce and GoDaddy Websites + Marketing.</p>\n\n\n\n<p>Max Rice, co-founder of SkyVerge, did leave some indication of Jilt&rsquo;s future in his <a href=\"https://www.skyverge.com/blog/skyverge-joins-godaddy/\">announcement post</a>. &ldquo;We made a commitment to be there for your business with software you can depend on, and we&rsquo;re sticking to it,&rdquo; he said. &ldquo;We&rsquo;ll continue to support our existing WooCommerce plugins and Jilt. While we&rsquo;ll be building something new at GoDaddy, everything we&rsquo;ve already built is a big part of that.&rdquo;</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 17 Sep 2020 20:59:02 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Justin Tadlock\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:47;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"WPTavern: Gutenberg 9.0 Brings Major Improvements to Navigation Screen and Query Block\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=104795\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:217:\"https://wptavern.com/gutenberg-9-0-brings-major-improvements-to-navigation-screen-and-query-block?utm_source=rss&utm_medium=rss&utm_campaign=gutenberg-9-0-brings-major-improvements-to-navigation-screen-and-query-block\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:2749:\"<p>If you haven&rsquo;t played around with Gutenberg&rsquo;s experiments lately, the Navigation block is getting some exciting updates. Version 9.0 was released today with drag-and-drop support added to the list view of navigation items.  </p>\n\n\n\n<img />\n\n\n\n<p>Contributors have been <a href=\"https://github.com/WordPress/gutenberg/issues/24875\">working through several different prototypes</a> aimed at unifying the controls and simplifying the menu building process. The Navigation screen included in version 9.0 has been redesigned to <a href=\"https://github.com/WordPress/gutenberg/issues/25014\">improve the &ldquo;Create Menu&rdquo; flow</a> and includes the following changes:</p>\n\n\n\n<ul><li>New&nbsp;<em>Header</em>&nbsp;and&nbsp;<em>Toolbar</em>&nbsp;components.</li><li><em>Manage Locations</em>&nbsp;has been rewritten and is now a popover.</li><li><em>Add New</em>&nbsp;form has been rewritten and now appears inline in the toolbar.</li><li><em>Automatically Add Pages</em>&nbsp;checkbox and&nbsp;<em>Delete menu</em>&nbsp;button has been rewritten and now appears in the block inspector.</li></ul>\n\n\n\n<p>The screen is starting to take shape but is still very much a work in progress. If you want to test it, you can enable it under Gutenberg &gt; Experiments.</p>\n\n\n\n<p>The Query block was another main focus fr the 9.0 release. It is taking a giant leap forward with new features like search, filtering by author, support for order/order by (date + title), and tags. This block should be tested locally and is still behind the&nbsp;<code>__experimentalEnableFullSiteEditing</code>&nbsp;flag since it requires full site editing blocks to display queried content.</p>\n\n\n\n<img />\n\n\n\n<p>Other notable UI enhancements include <a href=\"https://github.com/WordPress/gutenberg/pull/24852\">a new drag handle added to block toolbar</a> for drag-and-drop capability. (It is not visible on the top toolbar). Blocks can be dragged to other areas of a post as an alternative to using the up/down arrows.</p>\n\n\n\n<img />\n\n\n\n<p>This release also <a href=\"https://github.com/WordPress/gutenberg/pull/24472\">removes the Facebook and Instagram blocks</a> from the inserter, as Facebook will be&nbsp;<a href=\"https://wptavern.com/upcoming-api-change-will-break-facebook-and-instagram-oembed-links-across-the-web-beginning-october-24\">dropping unauthenticated oEmbed support</a>&nbsp;on October&nbsp;24. WordPress core is also set to remove Facebook and Instagram as an oEmbed provider in an upcoming release.</p>\n\n\n\n<p>For a full list of all the enhancements, bug fixes, experiments, and documentation updates, check out the <a href=\"https://make.wordpress.org/core/2020/09/16/whats-new-in-gutenberg-16-september/\">9.0 release post</a> on WordPress.org.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 17 Sep 2020 03:18:49 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:48;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"HeroPress: How To Become A Freelancer – A Few Things I Learned Before I Gave Up\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://heropress.com/?post_type=heropress-essays&p=3280\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:206:\"https://heropress.com/essays/how-to-become-a-freelancer-a-few-things-i-learned-before-i-gave-up/#utm_source=rss&utm_medium=rss&utm_campaign=how-to-become-a-freelancer-a-few-things-i-learned-before-i-gave-up\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:28154:\"<img width=\"960\" height=\"480\" src=\"https://s20094.pcdn.co/wp-content/uploads/2020/09/091620-min.jpg\" class=\"attachment-large size-large wp-post-image\" alt=\"Pull Quote: I realized that freelancing is not the only way to achieve my goals.\" /><p><a href=\"https://heropress.com/feed/#serbian\">Članak je takođe dostupan na sprskom jeziku.</a></p>\n<p>Everyone’s story is unique. Our life journeys differ in so many aspects and these experiences shape us into who we are now. Therefore, things that we, as individuals, learn along the way can’t always apply to someone else’s life goals, potentials, aspirations, and struggles.</p>\n<p>But, sometimes, knowing about other people’s mistakes and successes can help us navigate through our life challenges better. We can avoid making the same mistakes and, even better, we can get inspired to accomplish similar achievements.</p>\n<p>That is why I decided to share a few things that I have learned by trying to become a freelancer. Spoiler alert &#8211; I’m a corporate employee now.</p>\n<p>My career path was a bit unusual. I wasn’t quite tech-savvy until 5 years ago and my entire focus was around the fitness industry from 2006 until 2015. Being a fitness trainer was a dream job for me when I was 26 but, by the age of 35, it became somehow, well, boring.</p>\n<p>Then I had a huge epiphany &#8211; numerous opportunities come with WordPress and freelancing was one of them. So, if you are at the stage of your life when becoming a freelancer seems like a good idea, read on.</p>\n<p>I will try to break down 5 things that helped me in starting my freelance career. They are formulated as general tips for beginners but some of them can also be applied when changing the course of your career. So, let’s dive right in.</p>\n<h3>Question your motives</h3>\n<p>The first and the most important thing that you should ask yourself before you do anything in your life is why. “Why am I doing this?”</p>\n<p>So, why do you want to become a freelancer?</p>\n<p>Is it because you need an extra income? Or maybe because of flexible working hours. Or because you will be able to work from different locations? Or you see freelancing as just a phase before you get enough experience to open your agency and have others working for you.</p>\n<blockquote><p>Be honest with yourself. List all the reasons why you want to become a freelancer. This will help you later on in choosing the right jobs or maybe in considering some other alternatives to freelancing.</p></blockquote>\n<p>For example, these are my top 3 motives to become a freelancer:</p>\n<ul>\n<li>Opportunity to grow intellectually and learn new things</li>\n<li>Flexible working hours (by not being forced to work 9 am to 5 pm every day, I was able to avoid the boring routine)</li>\n<li>Peaceful and quiet working environment &#8211; quite opposite to the gym where everything is so loud</li>\n</ul>\n<p>So, after you question your goals and motives, and you are certain that you want to become a freelancer what’s next? My suggestion is &#8211; develop WordPress related skills.</p>\n<h3>Get the skills &#8211; choose WordPress</h3>\n<p>Why WordPress you might ask? Well, for a start, WordPress gives various opportunities and it is not a developer-only niche.</p>\n<p>Although, when someone thinks of freelancing and WordPress, web developer and web designer are first associations, there is a huge variety of WordPress related freelance jobs:</p>\n<ul>\n<li>Web developer (coding websites, themes, and plugins)</li>\n<li>Web implementor (creating websites from existing themes without coding)</li>\n<li>Web designer (designing website mockups, editing images or creating infographics for websites)</li>\n<li>Client support professional (helping people with their websites)</li>\n<li>Website maintenance professional (takes care of the website to make sure that WordPress, themes, and plugins are up to date and new backups are created regularly)</li>\n<li>WordPress teacher (teaching clients how to use WordPress or teaching other web professionals)</li>\n<li>Content writer</li>\n<li>Accessibility specialist (making sure that certain standards are met and suggesting solutions for accessibility barriers)</li>\n<li>SEO consultant</li>\n<li>Statistics consultant (especially for webshops)</li>\n<li>WordPress assistant (adding new content and editing existing posts)</li>\n<li>Website migration specialist (moving websites from one server to another)</li>\n<li>Web security specialist</li>\n</ul>\n<p>Another reason why WordPress is great for freelancers is a strong community that exists around this CMS. There are regular meetups, WordCamps, and other events (they are now switched to online), where you can get a ton of useful information, and also get to ask like-minded people literally anything. The community is so large and diverse, that you will definitely find the answer to any question. It’s much easier to start your freelance career when you have such a great community around you.</p>\n<h3>Plan in advance</h3>\n<p>Now that you know where the opportunity lies, you can start planning your career.</p>\n<p>Becoming a freelancer is a process. At the beginning of that process, you should acquire or improve relevant skills that will make you stand out in the freelance market. And, of course, as you learn and grow, you will be able to take more challenging and better-paid jobs.</p>\n<p>Which skill should you focus on? If you already have a basic skill set for at least one of the previously listed jobs, you can improve your knowledge in that direction and specialize in that area.</p>\n<p>However, if you don’t have any relevant skills, in my opinion, it would be the easiest to step into the freelancing world with a job that has a shorter learning curve and build your knowledge around that. Example &#8211; you can start with either content writing or as a web implementer since these jobs have a shorter learning curve than SEO related jobs or web development. Then, from content writing, you can expand your knowledge towards SEO and from a web implementer, you can become a developer. Just don’t stop learning.</p>\n<p>Also, if you have specific talents or hobbies like writing or design, you can base your career on that.</p>\n<blockquote><p>There is nothing better than doing what you love.</p></blockquote>\n<p>Additionally, it would be a good idea to analyze the market before you jump into the learning process.</p>\n<p>For example, now it would not be the best time to specialize in writing travel-related content, while it would be a great moment for any job related to webshops and online sales.</p>\n<p>If you want to learn web development, web design, web security, or SEO, you should always focus on new trends, so your skills can be useful in the future as well.</p>\n<p>For different jobs, working terms often vary so you should take this into consideration when choosing your career path. At some jobs, you can work flexible hours while at others you have to be available during predefined hours. This is what you should have in mind when specializing in a certain area or looking for a first job.</p>\n<h3>Hurray, it’s time to get a first freelancing job</h3>\n<p>If you currently have a job, it would be wise to either save some money before you quit your job to become a full-time freelancer or try freelancing for a few hours per week, in the beginning, to see if you like it or not. If you become successful and decide that freelancing is something that fits your needs, only then quit your job, not before.</p>\n<blockquote><p>Although some people do benefit when taking a risk, think twice before you take any irreversible actions.</p></blockquote>\n<p>And here are some tactics that worked for me when trying to get my first freelancing job:</p>\n<p><i>Use a freelancing platform</i> &#8211; although this is not mandatory, it is much easier to get the first job when you are using a freelancing platform. My choice was Upwork back in the day, but there are several platforms that you can use to get the first job faster.</p>\n<p><i>Triple-check your resume</i> &#8211; I guess that this is not something that I should mention but I will anyway, just in case. Don’t make spelling mistakes in your resume, it will give the impression that you are not thorough and that you will oversee mistakes in your other work as well.</p>\n<p><i>Present yourself in a professional manner</i> &#8211; Take the time to present your professional skills in the best possible light but still stay humble. Don’t write: “Best WordPress developer that never wrote a bad code”. This is not evidence-based, and it will make you seem arrogant. Instead, you can write: “Web developer with 3 years of experience and over 50 satisfied clients, specialized in WordPress.” This statement is based on facts and it shows your credibility.</p>\n<p><i>Fill up your portfolio</i> &#8211; If you have any previous work (that is presentable, of course) you should put it in your portfolio. Emphasis on presentable. If not, you can make a few websites, designs, or write some example texts if you are a content writer in order to showcase your skills. This is not applicable to all jobs, like SEO consultants or customer support but if you have the opportunity to create a portfolio, use the opportunity.</p>\n<p><i>Use video material</i> &#8211; Short introductory video will make you stand out since making promotional video material is not something that many freelancers do. It will help you create a more human professional approach. For your clients, you will not be just a list of skills and previous experiences, but a real person that has these skills and experiences and that provides a certain service for them.</p>\n<p><i>Have a detailed strategy when choosing your first employer &#8211;</i> Choose your first employer wisely, very wisely. I can’t emphasize enough how important this is so I will give you an example. When I had to apply for my first job, I considered the following:</p>\n<ul>\n<li>How this employer was rated by other freelancers which worked for him previously</li>\n<li>How the employer rated other freelancers</li>\n<li>How much money he had already spent on this platform and if he posts regular job offers</li>\n<li>The number of open positions for this job and the number of freelancers that have already applied. In my case, the job had about 10 open positions so that amplified my chances of getting hired, even if the competition is high.</li>\n</ul>\n<p><i>The first job is not all about the money &#8211;</i> Don’t get greedy on your first job. If you get good reviews, your second job can be paid 2-3 times more. And your third job can go up to 5 times more. That was my experience at least.</p>\n<h3>Be careful, you are an adult</h3>\n<p>Individual responsibility is key when it comes to freelancing. You have the freedom to choose who you are going to work for, what kind of job are you going to take, and how it is going to be delivered. And freedom often comes with responsibility. They are like two sides of the same coin.</p>\n<p>You should never miss a deadline. If you are not sure that you are going to be able to deliver, don’t take the job or as an alternative have someone very reliable as a backup, just in case. When you miss a deadline, your client loses money, and they have every right to be angry. This will very likely affect your reviews after the job is complete. And then, the opportunity to get your next job and so on. This can start a downward spiral for your career.</p>\n<p>However, we are all humans and unpredictable things can happen. If for some reason you are not able to complete your work in a timely manner, let your client know immediately so they can have enough time to hire someone else.</p>\n<p>Also, it is important to make everything clear in advance, before you accept the job. Let your clients know what your expectations are and make sure that you understand what they expect from you. For example, if you are a content writer, make sure that you know the length of the text in characters or words, ask if some keywords should be used and how frequently, what writing style your client prefers, and so on. And if you are a designer, specify how many revisions are included in the price.</p>\n<blockquote><p>The clearer the initial arrangement is, the more satisfied both you and your client will be at the end.</p></blockquote>\n<p>If you have flexible working hours, don’t let other people interrupt you. If your friends and family wouldn’t show up in your office every day if you were a bank clerk, they shouldn’t interrupt you when you work from home. It’s the same principle and it’s up to you to set the boundaries and let them know about your working schedule. It’s not up to them.</p>\n<p>So, these are some basic guidelines that helped me in starting my freelance career and I hope that they will be helpful for you as well.</p>\n<blockquote><p>There is no unique recipe and one size doesn’t fit all when it comes to the path you ought to take.</p></blockquote>\n<p>It’s just important to stay focused on your goals and to be open to new opportunities.</p>\n<p>If you were wondering why I’m not a freelancer anymore, this is where the answer lies. By constantly being interested in different opportunities, I realized that freelancing is not the only way to achieve my goals. There are companies that offer flexible working hours and peaceful work environment while stimulating professional growth and creative thinking.</p>\n<p>Plus I gained something very precious by joining a team &#8211; my colleagues became my support system both professionally and privately, and that is what I have been missing while being a freelancer.</p>\n<p>I wish you a lot of luck and success in the future, regardless of the path you choose to take.</p>\n<h1 id=\"serbian\">Kako postati frilenser &#8211; stvari koje sam naučila pre nego što sam odustala</h1>\n<p>Naše životne priče su različite. Svako od nas ima svoj jedinstveni životni put, a iskustva koja steknemo oblikuju nas u osobe koje smo danas. Zbog toga, stvari koje mi, kao pojedinci, naučimo na svom putu ne mogu uvek lako da se primene na situacije kroz koje prolazi neko drugi.</p>\n<p>Ipak, ponekad sagledavanje tuđih uspeha i grešaka može da nam pomogne da se bolje snađemo u sopstvenim životnim izazovima. Možemo da izbegnemo da napravimo istu grešku koju je napravio naš prijatelj ili, još bolje, možemo postati motivisani da postignemo jednak ako ne i veći uspeh kao neko iz našeg okruženja.</p>\n<p>Zbog toga sam odlučila da sa vama podelim ono što sam naučila pokušavajući da postanem frilenser. Spoiler alert &#8211; sada sam zaposlena u korporacji.</p>\n<p>Moja karijera je isla pomalo neuobičajenim putem. Nisam uopšte bila naklonjena informatici do pre pet godina. Tačnije nisam znala skoro ništa o toj oblasti. Bila sam potpuno fokusirana na fitnes industriju i radila sam isključivo kao fitnes trener od 2006. do 2015. To je za mene bio posao iz snova dok sam bila mlađa ali mi je oko moje 35. godine već pomalo dosadio.</p>\n<p>Tada sam otkrila WordPress i shvatila da se mnogobrojne prilike otvaraju bas sa poznavanjem ove platforme. A frilensing je jedna od njih. Tako da, ako ste trenutno u fazi kada vam se frilensovanje čini kao dobra ideja, nastavite da čitate.</p>\n<p>Pokušaću da detaljno opišem pet stvari koje sam naučila pokušavajući da postanem frilenser. Formulisala sam ih kao uopštene savete za početnike, ali neki od njih mogu da se primene i kada menjate kurs svoje frilens karijere.</p>\n<h3>Preispitajte svoje motive</h3>\n<p>Prva i najvažnija stvar koju treba da se zapitate pre nego što uradite išta u životu je zašto. “Zašto to radim?” Zbog čega želite da postanete frilenseri? Da li zbog toga što vam treba dodatni prihod? Ili zbog fleksibilnog radnog vremena? Ili da biste mogli da radite sa bilo koje lokacije na svetu? Ili frilensing vidite kao fazu pre nego što steknete dovoljno iskustva da možete da otvorite svoju agenciju.</p>\n<blockquote><p>Budite iskreni prema sebi. Popišite koji su to razlozi zbog kojih želite da budete frilenser. Ovo će vam kasnije pomoći pri izboru adekvatnog frilensing posla ili pri razmatranju neke druge alternative.</p></blockquote>\n<p>Na primer, ovo su bila moja tri glavna razloga:</p>\n<ul>\n<li>Prilika da naučim nesto novo i da se intelektualno razvijam u nekom novom pravcu</li>\n<li>Fleksibilno radno vreme &#8211; time što sam imala fleksibilno radno vreme bila sam u mogućnosti da izbednem dosadnu “od 9 do 5” rutinu</li>\n<li>Tiho i mirno radno okruženje, potpuno u suprotnosti sa teretanama u kojima je uvek bučno</li>\n</ul>\n<p>Nakon što ste preispitali svoje ciljeve i motive, i sigurni ste da želite da se bavite frilensingom, šta dalje? Moj predlog je naučite nešto što je vezano za WordPress.</p>\n<h3>Steknite znanja vezana za WordPress</h3>\n<p>Sada se možda pitate zašto baš WordPress. Za početak, zato što WordPress nudi mnoštvo raznovrsnih prilika, i to ne samo za developere.</p>\n<p>Iako, kad se pomene WordPress, prvo što će nekome pasti na pamet je ili developer ili web dizajner, postoji veliki broj različitih poslova vezanih za WordPress:</p>\n<ul>\n<li>Web developer (kodira sajtove, teme i dodatke)</li>\n<li>Web implementator (pravi sajtove od gotovih tema bez kodiranja)</li>\n<li>Web dizajner (dizajnira skice sajtova, edituje slike i kreira infografike za sajtove)</li>\n<li>Korisnička podrška (pomaže klijentima kada se nešto desi sa sajtom)</li>\n<li>Održavanje sajtova (redovno održava sajt, kreira bekape, ažurira teme, dodatke i sam WordPress)</li>\n<li>WordPress predavač (uči klijente kako da koriste WordPress ili uči druge web profesionalce koji se usavršavaju u nekoj oblasti)</li>\n<li>Pisac tekstova za sajtove</li>\n<li>Specijalista za aksesibilnost (vodi računa da određeni standardi budu ispunjeni i predlaže rešenja za barijere u aksesibilnosti)</li>\n<li>SEO konsultant</li>\n<li>Statističar (najčešće radi za velike onlajn prodavnice)</li>\n<li>WordPress asistent (unosi novi sadržaj i menja postojći)</li>\n<li>Specijalista za migracije (seli sajtove sa servera na server)</li>\n<li>Specjalista za web bezbednost</li>\n</ul>\n<p>Još jedan razlog zbog kojeg mislim da je dobro izabrati WordPress je jaka zajednica koja se okupila oko ovog CMS-a. Redovno se održavaju manja okupljanja (trenutno na daljinu) ali i ona veća koja su nazvana WordCamp (takođe na daljinu do daljnjeg) na kojima možete dobiti pregršt korisnih informacija i pitati druge profesionalce sve što vas interesuje. Zajednica je toliko velika i raznolika da ćete tu pronaći odgovor na skoro svako stručno pitanje. Mnogo je lakse započeti frilens karijeru kada su sjajni ljudi oko vas.</p>\n<h3>Planirajte unapred</h3>\n<p>Sada kada znate u kom ćete pravcu ići, vreme je da počnete da planirate svoju karijeru.</p>\n<p>Postati frilenser je proces. Na početku tog procesa potrebno je da steknete ili dodatno unapredite svoje veštine kojima ćete se istaći u odnosu na konkurenciju. I naravno kako učite i napredujete, moći ćete da prihvatate izazovnije i bolje plaćene poslove.</p>\n<p>Na koja se onda znanja fokusirati? Ukoliko već imate neko predznanje za neki od prethodno navedenih poslova, možete se dalje razvijati u tom pravcu i specijalizovati se za tu oblast.</p>\n<p>S druge strane, ukoliko nemate nikakvo relevantno predznanje, po mom mišljenju bi najlakše bilo započeti sa poslom koji ima kraći period učenja pa da kasnije nadograđujete znanje. Na primer, možete početi kao pisac tekstova za sajtove ili kao implementator jer se ti poslovi brže savladavaju nego poslovi vezani za SEO ili web development. Onda od pisanja sadržaja za sajtove možete proširiti znanje na SEO a od implementatora vremenom postati developer. Samo budite radoznali i ne prestajte da učite.</p>\n<p>Takođe, ukoliko imate specifične talente ili neki hobi kao npr. pisanje ili dizajn, možete da bazirate karijeru oko toga.</p>\n<blockquote><p>Najlepše je kad neko zarađuje od nečega što inače voli da radi.</p></blockquote>\n<p>Uz to, valjalo bi da proučite tržište pre nego što se “bacite” na učenje.</p>\n<p>Na primer, sada nije trenutak da se specijalizujete za pisanje sadržaja koji je vezan za putovanja, a pravi je momenat za sticanje veština koje, na bilo koji način, imaju veze sa onlajn prodavnicama i prodajom putem Interneta.</p>\n<p>Ukoliko želite da savladate web development, SEO, web dizajn ili web bezbednost, bitno je da se fokusirate na nove trendove, tehnologije i alate, kako bi vaše veštine bile primenljive i u budućnosti.</p>\n<p>Za različite poslove, uslovi rada mogu biti veoma različiti, pa bi i to valjalo imati na umu. Za neke vrste posla, radno vreme je fleksibilno, dok za druge, morate biti raspoloživi tokom određenog doba dana (ako radite kao korisnička podrška, na primer). I ovo bi trebalo da uzmete u obzir kada birate za koju oblast ćete se specijalizovati.</p>\n<h3>Konačno! Vreme je za prvi posao!</h3>\n<p>Ako ste zaposleni, bilo bi pametno da prištedite novac pre nego što napustite posao da biste se bavili isključivo frilensingom. Druga pametna opcija bi bila da vam na početku frilensing bude dodatni posao uz ono što već radite kako biste videli da li vam takav način rada odgovara ili ne. Ako postanete uspešni i shvatite da je frilensing nešto što odgovara vašim potrebama, tek tada napustite trenutni posao, ne pre toga.</p>\n<blockquote><p>Iako neki ljudi profitiraju kada rizikuju, dobro razmislite pre nego što preduzmete korake posle kojih nema nazad.</p></blockquote>\n<p>Evo nekoliko taktika koje su mi pomogle kada sam pokušavala da dobijem svoj prvi posao kao frilenser:</p>\n<p><i>Koristite platformu za frilensere</i> &#8211; iako nije obavezno, mnogo je lakše doći do prvog posla kada koristite neku platformu namenjenu frilenserima. U to doba, moj izbor je bio Upwork. Svakako, sada postoji i nekoliko drugih platformi pomoću kojih možete brže doći do prvog posla.</p>\n<p><i>Triput proverite svoju biografiju</i> &#8211; pretpostavljam da to nije nešto što bi trebalo da pomenem, ali svejedno ću naglasiti, za svaki slučaj. Ne pravite pravopisne greške u biografiji jer ćete time stvoriti utisak da niste temeljni i da će vam se greške lako potkrasti i dok obavljate svoj posao.</p>\n<p><i>Predstavite se profesionalno</i> &#8211; Uložite trud da svoje profesionalne veštine predstavite u najboljem mogućem svetlu, ali i dalje budite skromni. Nemojte napisati: &#8220;Najbolji WordPress developer koji nikada nije napisao loš kod&#8221;. Ovo nije zasnovano na dokazima i učiniće da izgledate arogantno. Umesto toga, možete napisati: &#8220;Web programer sa 3 godine iskustva i preko 50 zadovoljnih klijenata, specijalizovan za WordPress.&#8221; Ova izjava je zasnovana na činjenicama i deluje verodostojno.</p>\n<p><i>Popunite portfolio</i> &#8211; Ako imate bilo kakav prethodni rad (koji je naravno reprezentativan), trebalo bi da ga dodate u portfolio. Naglasak je na reprezentativan. Ako ne, možete da napravite nekoliko sajtova, dizajnirate skice sajtova ili napišete primere tekstova kako biste prikazali svoje veštine. Ovo se ne odnosi na sve poslove, kao što su SEO konsultanti ili korisnička podrška, ali ako imate priliku da napravite portfolio, iskoristite priliku.</p>\n<p><i>Koristite video materijale</i> &#8211; Kratki uvodni video će skrenuti pažnju na vas jer izrada promotivnog video materijala nije nešto što mnogi frilenseri rade. Pomoći će vam da delujete ljudskije i profesionalnije. Za svoje klijente nećete biti samo lista veština i prethodnih iskustava, već stvarna osoba koja zaista ima te veštine i iskustva i koja im pruža određenu uslugu.</p>\n<p><i>Imajte detaljnu strategiju pri izboru prvog poslodavca</i> &#8211; Birajte svog prvog poslodavca mudro. Ne mogu dovoljno da naglasim koliko je ovo važno, pa ću vam dati primer. Kada sam se prijavljivala za svoj prvi posao, uzela sam u obzir sledeće:</p>\n<ul>\n<li>Kako su ovog poslodavca ocenili drugi frilenseri koji su ranije radili za njega</li>\n<li>Kako je poslodavac ocenio druge frilensere</li>\n<li>Koliko novca je već potrošio na ovoj platformi i da li redovno objavljuje ponude za posao</li>\n<li>Broj otvorenih pozicija za ponuđeni posao i broj frilensera koji su se već prijavili. U mom slučaju, posao je imao oko 10 otvorenih radnih mesta, što je povećalo moje šanse za zapošljavanje, čak i u slučaju da je konkurencija velika.</li>\n</ul>\n<p>Kod prvog posla nije bitan samo novac &#8211; nemojte biti pohlepni. Ako budete dobro ocenjeni, vaš drugi posao može biti plaćen 2-3 puta više. A vaš treći posao može biti vrednovan i do 5 puta više. To je barem bilo moje iskustvo.</p>\n<h3>Vodite računa, odrasla ste osoba</h3>\n<p>Individualna odgovornost je ključna kada je u pitanju uspeh u frilensingu. Imate slobodu da izaberete za koga ćete raditi, kakav ćete posao prihvatiti i kako ćete isporučiti dogovoreno. A uz slobodu često dolazi i odgovornost. Oni su poput dve strane iste medalje.</p>\n<p>Nikada ne smete propustiti rok. Ako niste sigurni da ćete uspeti da završite, nemojte ni prihvatati posao ili, umesto toga, za svaki slučaj imajte nekoga vrlo pouzdanog da priskoči u pomoć ako zatreba. Kada propustite rok, vaš klijent gubi novac i ima puno pravo da se naljuti. Ovo će vrlo verovatno uticati na vaše ocene nakon obavljenog posla. A posledično, i na priliku da dobijete sledeći posao i tako dalje. To može pokrenuti silaznu spiralu za vašu karijeru.</p>\n<p>Međutim, svi smo ljudi i mogu se dogoditi nepredvidive stvari. Ako iz nekog razloga niste u mogućnosti da svoj posao obavite u roku, odmah obavestite svog klijenta kako bi imao dovoljno vremena da zaposli nekog drugog.</p>\n<p>Takođe je važno da sve bude jasno definisano unapred, pre nego što prihvatite posao. Obavestite svoje klijente o svojim očekivanjima i uverite se da razumete šta oni očekuju od vas. Na primer, ako treba da pišete tekst za sajt, uverite se da znate dužinu teksta u karakterima ili rečima, pitajte da li treba koristiti neke ključne reči i koliko često, koji stil pisanja preferira vaš klijent itd. A ako ste dizajner, navedite koliko je revizija uključeno u cenu.</p>\n<blockquote><p>Što je početni dogovor jasniji, to ćete na kraju biti zadovoljniji i vi i vaši klijenti.</p></blockquote>\n<p>Ako imate fleksibilno radno vreme, ne dozvolite da vas drugi ljudi prekidaju. Ako se vaši prijatelji i porodica ne bi svakodnevno pojavljivali u vašoj kancelariji da ste bankarski službenik, ne bi trebalo da vas prekidaju ni kada radite od kuće. To je isti princip i na vama je da postavite granice i obavestite ih o svom radnom vremenu. To nije njihov zadatak.</p>\n<p>Ovo su neke osnovne smernice koje su mi pomogle u započinjanju karijere frilensera i nadam se da će biti korisne i vama.</p>\n<blockquote><p>Ne postoji jedinstveni recept i jedna veličina ne odgovara svima kada je reč o putu kojim treba da krenete.</p></blockquote>\n<p>Važno je samo ostati fokusiran na svoje ciljeve i biti otvoren za nove mogućnosti.</p>\n<p>Ako ste se pitali zašto više nisam frilenser, evo odgovora. Stalnim sagledavanjem različitih mogućnosti, shvatila sam da frilensing nije jedini način da postignem svoje ciljeve. Postoje kompanije koje nude fleksibilno radno vreme i mirno radno okruženje, istovremeno stimulišući profesionalni rast i kreativno razmišljanje.</p>\n<p>Uz to, stekla sam nešto vrlo dragoceno pridruživanjem timu &#8211; moje kolege su postale moj sistem podrške i profesionalno i privatno, i to je ono što mi je nedostajalo dok sam bila frilenser.</p>\n<p>Želim vam puno sreće i uspeha u budućnosti, bez obzira na put koji ste odabrali!</p>\n<p>The post <a rel=\"nofollow\" href=\"https://heropress.com/essays/how-to-become-a-freelancer-a-few-things-i-learned-before-i-gave-up/\">How To Become A Freelancer &#8211; A Few Things I Learned Before I Gave Up</a> appeared first on <a rel=\"nofollow\" href=\"https://heropress.com\">HeroPress</a>.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 16 Sep 2020 06:00:13 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Tijana Andrejic\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:49;a:6:{s:4:\"data\";s:13:\"\n	\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:112:\"WPTavern: Upcoming API Change Will Break Facebook and Instagram oEmbed Links Across the Web Beginning October 24\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wptavern.com/?p=104140\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:269:\"https://wptavern.com/upcoming-api-change-will-break-facebook-and-instagram-oembed-links-across-the-web-beginning-october-24?utm_source=rss&utm_medium=rss&utm_campaign=upcoming-api-change-will-break-facebook-and-instagram-oembed-links-across-the-web-beginning-october-24\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:5294:\"<p>In an extraordinarily inconvenient API change, Facebook and Instagram will be <a href=\"https://developers.facebook.com/docs/plugins/oembed-legacy\">dropping unauthenticated oEmbed support</a>&nbsp;on October&nbsp;24, breaking content across millions of websites. The change will force users to generate&nbsp;an app ID with a developer account in order to continue embedding links via oEmbed:</p>\n\n\n\n<blockquote class=\"wp-block-quote\"><p><strong>Changes to tokenless access for User Picture and FB/IG OEmbed endpoints:</strong>&nbsp;By October 24, 2020, developers must leverage a user, app, or client token when querying Graph API for user profile pictures via UID, FB OEmbeds and IG OEmbeds. Developers should provide a user or app token when querying for profile pictures via a UID or ASID, though client tokens are supported as well. Please visit our changelog for&nbsp;<a href=\"https://developers.facebook.com/docs/graph-api/changelog/version8.0#users\">User Picture</a>,&nbsp;<a href=\"https://developers.facebook.com/docs/graph-api/changelog/version8.0#social-plugins\">Facebook OEmbed</a>&nbsp;and&nbsp;<a href=\"https://developers.facebook.com/docs/graph-api/changelog/version8.0#instagram\">Instagram OEmbed</a>&nbsp;for details on how to start calling these Graph API endpoints today.</p><cite><a href=\"https://developers.facebook.com/blog/post/2020/08/04/Introducing-graph-v8-marketing-api-v8/\">Facebook for Developers blog</a></cite></blockquote>\n\n\n\n<p>In 2008, Leah Culver, one of the collaborators on the <a href=\"https://oembed.com/\">oEmbed</a> spec, <a href=\"https://blog.leahculver.com/2008/05/announcing-oembed-an-open-standard-for-embedded-content.html\">said</a> it was created to be &ldquo;an open web API standard for fetching embed code based on a URL.&rdquo; Requiring authentication in order to use oEmbed links seems like a violation of its intended purpose. For more than a decade, oEmbed has made it possible for users to easily share media across websites and social networks, without having to touch any code. It underpins a flourishing, connected landscape of web sharing that opens up new audiences for posts that might otherwise be buried in a social network&rsquo;s fast-moving timeline.</p>\n\n\n\n<p>In pursuit of a more secure walled garden, Facebook will now require all publishers to obtain developer app credentials in order to embed content that was previously available through simple URLs. Many users will be understandably frustrated when they find they can no longer embed Facebook and Instagram links the way they could in the past. Some will not be motivated to surmount the hurdle of setting up a Facebook app and may resort to posting screenshots or omitting the content altogether. A feature so widely used by non-technical users should not be suddenly locked away behind developer credentials.</p>\n\n\n\n<div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"twitter-tweet\"><p lang=\"en\" dir=\"ltr\">Facebook turning off its oEmbed endpoint for FB and Instagram is another brick in the wall around Facebook reality.</p>&mdash; &#9899; Your roots are in the infinite (@thejaymo) <a href=\"https://twitter.com/thejaymo/status/1305960256082784259?ref_src=twsrc%5Etfw\">September 15, 2020</a></blockquote>\n</div>\n\n\n\n<p>At the time of publishing, none of the original oEmbed spec authors were available for comment regarding Facebook&rsquo;s API change, but we will update the post as new information becomes available.</p>\n\n\n\n<h2>WordPress to Remove Facebook and Instagram oEmbed Providers</h2>\n\n\n\n<p>In response to Facebook&rsquo;s API change, WordPress will be&nbsp;<a rel=\"noreferrer noopener\" href=\"https://core.trac.wordpress.org/ticket/50861\" target=\"_blank\">removing Facebook as an oEmbed provider</a>&nbsp;in an upcoming core release. This will break a lot of content &ndash; many years&rsquo; worth of posts in some instances, and will require users to install a fallback plugin. WordPress plugin developer <a href=\"https://profiles.wordpress.org/ayeshrajans/\">Ayesh Karunaratne</a> has created a new plugin called <a href=\"https://wordpress.org/plugins/oembed-plus/\">oEmbed Plus</a> that brings back support for Facebook and Instagram content embedding. It guides users through the process of setting up Facebook developer app credentials.</p>\n\n\n\n<p>For those who are using the Gutenberg plugin, the Facebook and Instagram blocks have been <a href=\"https://github.com/WordPress/gutenberg/pull/24472\">removed</a> as part of tomorrow&rsquo;s version 9.0 release. oEmbed links will continue to work until Facebook&rsquo;s API change goes into effect.</p>\n\n\n\n<p>Moving forward, publishers will need to re-examine how they include social media links within their content. <a href=\"https://wptavern.com/wordpress-5-5-to-remove-hulu-from-list-of-supported-oembed-providers\">Hulu recently dropped oEmbed support</a> after being available as an oEmbed provider in WordPress for the past 11 years. As major players like Facebook and Instagram follow suit in abandoning open web API&rsquo;s, the web is growing increasingly more fragmented. Facebook&rsquo;s upcoming API change will leave millions of broken embeds in its wake, with little pieces of embedded history lost along the way, in instances where website owners are no longer updating their content.</p>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 15 Sep 2020 22:47:12 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Sarah Gooding\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:8:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Mon, 19 Oct 2020 06:12:15 GMT\";s:12:\"content-type\";s:8:\"text/xml\";s:4:\"vary\";s:15:\"Accept-Encoding\";s:13:\"last-modified\";s:29:\"Mon, 19 Oct 2020 06:00:08 GMT\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 1\";s:16:\"content-encoding\";s:4:\"gzip\";}}s:5:\"build\";s:14:\"20200501142607\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(369, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1603131140', 'no'),
(370, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1603087940', 'no'),
(371, '_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b', '1603131140', 'no'),
(372, '_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2020/10/the-month-in-wordpress-september-2020/\'>The Month in WordPress: September 2020</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://buddypress.org/2020/10/buddypress-7-0-0-beta1/\'>BuddyPress: BuddyPress 7.0.0-beta1</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/using-the-web-stories-for-wordpress-plugin-you-better-play-by-googles-rules?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=using-the-web-stories-for-wordpress-plugin-you-better-play-by-googles-rules\'>WPTavern: Using the Web Stories for WordPress Plugin? You Better Play By Google’s Rules</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/stripe-acquires-paystack-for-200m?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=stripe-acquires-paystack-for-200m\'>WPTavern: Stripe Acquires Paystack for $200M+</a></li></ul></div>', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 10, '_wp_attached_file', '2020/10/logoal.png'),
(4, 10, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:280;s:6:\"height\";i:280;s:4:\"file\";s:18:\"2020/10/logoal.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"logoal-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(5, 8, '_edit_lock', '1602997649:1'),
(6, 5, '_edit_lock', '1602997678:1'),
(7, 2, '_edit_lock', '1602997695:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-10-18 04:19:28', '2020-10-18 04:19:28', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2020-10-18 04:19:28', '2020-10-18 04:19:28', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2020-10-18 04:19:28', '2020-10-18 04:19:28', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-10-18 04:19:28', '2020-10-18 04:19:28', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-10-18 04:19:28', '2020-10-18 04:19:28', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-10-18 04:19:28', '2020-10-18 04:19:28', '', 0, 'http://localhost/wordpress/?page_id=3', 0, 'page', '', 0),
(4, 1, '2020-10-18 04:19:44', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-10-18 04:19:44', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=4', 0, 'post', '', 0),
(5, 1, '2020-10-18 04:36:27', '2020-10-18 04:36:27', '', 'wphr Subscription', '', 'publish', 'closed', 'closed', '', 'wphr-subscription', '', '', '2020-10-18 04:36:27', '2020-10-18 04:36:27', '', 0, 'http://localhost/wordpress/wphr-subscription/', 0, 'page', '', 0),
(6, 1, '2020-10-18 04:36:31', '2020-10-18 04:36:31', '[wp-hr-employee-list]', 'Employee List', '', 'publish', 'closed', 'closed', '', 'employee-list', '', '', '2020-10-18 04:36:31', '2020-10-18 04:36:31', '', 0, 'http://localhost/wordpress/employee-list/', 0, 'page', '', 0),
(7, 1, '2020-10-18 04:36:32', '2020-10-18 04:36:32', '[wp-hr-employee-profile]', 'Employee profile', '', 'publish', 'closed', 'closed', '', 'employee-profile', '', '', '2020-10-18 04:36:32', '2020-10-18 04:36:32', '', 0, 'http://localhost/wordpress/employee-profile/', 0, 'page', '', 0),
(8, 1, '2020-10-18 04:36:32', '2020-10-18 04:36:32', '[wp-hr-dashboard]', 'Dashboard', '', 'publish', 'closed', 'closed', '', 'dashboard', '', '', '2020-10-18 04:36:32', '2020-10-18 04:36:32', '', 0, 'http://localhost/wordpress/dashboard/', 0, 'page', '', 0),
(9, 1, '2020-10-18 04:36:32', '2020-10-18 04:36:32', '[wp-hr-my-profile]', 'My Profile', '', 'publish', 'closed', 'closed', '', 'my-profile', '', '', '2020-10-18 04:36:32', '2020-10-18 04:36:32', '', 0, 'http://localhost/wordpress/my-profile/', 0, 'page', '', 0),
(10, 1, '2020-10-18 04:40:26', '2020-10-18 04:40:26', '', 'logoal', '', 'inherit', 'open', 'closed', '', 'logoal', '', '', '2020-10-18 04:40:26', '2020-10-18 04:40:26', '', 0, 'http://localhost/wordpress/wp-content/uploads/2020/10/logoal.png', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'wordpress_main'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:2:{s:13:\"administrator\";b:1;s:15:\"wphr_hr_manager\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_user-settings', 'libraryContent=browse&mfold=o'),
(18, 1, 'wp_user-settings-time', '1602994779'),
(19, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(20, 2, 'nickname', 'arifh6132@gmail.com'),
(21, 2, 'first_name', 'Kamal'),
(22, 2, 'last_name', 'Hasan'),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'syntax_highlighting', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'fresh'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'locale', ''),
(31, 2, 'wp_capabilities', 'a:1:{s:8:\"employee\";b:1;}'),
(32, 2, 'wp_user_level', '0'),
(33, 2, 'dismissed_wp_pointers', ''),
(34, 2, 'photo_id', '0'),
(35, 2, 'user_id', '0'),
(36, 2, 'middle_name', ''),
(37, 2, 'other_email', ''),
(38, 2, 'phone', ''),
(39, 2, 'work_phone', '01782763384'),
(40, 2, 'mobile', ''),
(41, 2, 'address', ''),
(42, 2, 'gender', 'male'),
(43, 2, 'marital_status', 'single'),
(44, 2, 'nationality', '-1'),
(45, 2, 'driving_license', ''),
(46, 2, 'hobbies', ''),
(47, 2, 'street_1', ''),
(48, 2, 'street_2', ''),
(49, 2, 'city', ''),
(50, 2, 'country', '-1'),
(51, 2, 'state', ''),
(52, 2, 'postal_code', ''),
(53, 1, 'session_tokens', 'a:2:{s:64:\"971e66619af9fffde07245e9ad8a85db236747bd7beefd5e9d69e7219cded104\";a:4:{s:10:\"expiration\";i:1603170678;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36\";s:5:\"login\";i:1602997878;}s:64:\"89169f43e60acb5ab1848d65e22d771b2777e953b9cdad285019d3152936bfad\";a:4:{s:10:\"expiration\";i:1604231955;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36\";s:5:\"login\";i:1603022355;}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'wordpress_main', '$P$BxHNsOKzw7wwtIsfQcSnlc1okCmmUl1', 'wordpress_main', 'arifh3261@gmail.com', 'http://localhost/wordpress', '2020-10-18 04:19:27', '', 0, 'wordpress_main'),
(2, 'arifh6132@gmail.com', '$P$BDZ6pc3uoh7eULq74gNacCVwpHxqLt/', 'arifh6132gmail-com', 'arifh6132@gmail.com', '', '2020-10-18 04:45:10', '', 0, 'Kamal Hasan');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_audit_log`
--

CREATE TABLE `wp_wphr_audit_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `component` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sub_component` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data_id` bigint(20) DEFAULT NULL,
  `old_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changetype` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wphr_audit_log`
--

INSERT INTO `wp_wphr_audit_log` (`id`, `component`, `sub_component`, `data_id`, `old_value`, `new_value`, `message`, `changetype`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'HRM', 'designation', NULL, '', '', '<strong>Manager</strong> designation has been created', 'add', 1, '2020-10-18 04:42:35', NULL),
(2, 'HRM', 'designation', NULL, '', '', '<strong>Assistant</strong> designation has been created', 'add', 1, '2020-10-18 04:42:43', NULL),
(3, 'HRM', 'designation', NULL, '', '', '<strong>Peon</strong> designation has been created', 'add', 1, '2020-10-18 04:42:55', NULL),
(4, 'HRM', 'department', NULL, '', '', '<strong>Design</strong> department has been created', 'add', 1, '2020-10-18 04:43:45', NULL),
(5, 'HRM', 'employee', NULL, '', '', '<strong>Kamal</strong> employee has been created', 'add', 1, '2020-10-18 04:45:13', NULL),
(6, 'HRM', 'leave', NULL, 'YToxOntzOjg6ImVuZF9kYXRlIjtzOjEwOiIxMC0yMy0yMDIwIjt9', 'YToxOntzOjg6ImVuZF9kYXRlIjtzOjEwOiIxMC0yNC0yMDIwIjt9', '<strong>Eid</strong> holiday has been edited', 'edit', 1, '2020-10-18 04:48:34', NULL),
(7, 'HRM', 'leave', NULL, 'YToxOntzOjg6ImVuZF9kYXRlIjtzOjEwOiIxMC0yNC0yMDIwIjt9', 'YToxOntzOjg6ImVuZF9kYXRlIjtzOjEwOiIxMC0yNi0yMDIwIjt9', '<strong>Eid</strong> holiday has been edited', 'edit', 1, '2020-10-18 04:48:52', NULL),
(8, 'HRM', 'leave', NULL, 'YToxOntzOjg6ImVuZF9kYXRlIjtzOjEwOiIxMC0yNi0yMDIwIjt9', 'YToxOntzOjg6ImVuZF9kYXRlIjtzOjEwOiIxMC0yMy0yMDIwIjt9', '<strong>Eid</strong> holiday has been edited', 'edit', 1, '2020-10-18 04:49:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_company_locations`
--

CREATE TABLE `wp_wphr_company_locations` (
  `id` int(11) UNSIGNED NOT NULL,
  `company_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_timezone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `office_start_time` time DEFAULT NULL,
  `office_end_time` time DEFAULT NULL,
  `office_working_hours` int(2) DEFAULT 9,
  `office_financial_day_start` int(2) DEFAULT 1,
  `office_financial_year_start` int(2) DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_files_upload`
--

CREATE TABLE `wp_wphr_files_upload` (
  `id` int(19) NOT NULL,
  `user_id` int(255) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `downloads` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` timestamp NULL DEFAULT NULL,
  `last_download` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_announcement`
--

CREATE TABLE `wp_wphr_hr_announcement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(11) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_dependents`
--

CREATE TABLE `wp_wphr_hr_dependents` (
  `id` int(11) UNSIGNED NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_depts`
--

CREATE TABLE `wp_wphr_hr_depts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `employee_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead` int(11) UNSIGNED DEFAULT 0,
  `parent` int(11) UNSIGNED DEFAULT 0,
  `status` tinyint(1) UNSIGNED DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wphr_hr_depts`
--

INSERT INTO `wp_wphr_hr_depts` (`id`, `title`, `employee_label`, `description`, `lead`, `parent`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Design', 'Employee', '', 0, 0, 1, '2020-10-18 04:43:45', '2020-10-18 04:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_designations`
--

CREATE TABLE `wp_wphr_hr_designations` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wphr_hr_designations`
--

INSERT INTO `wp_wphr_hr_designations` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '', 1, '2020-10-18 04:42:35', '2020-10-18 04:42:35'),
(2, 'Assistant', '', 1, '2020-10-18 04:42:43', '2020-10-18 04:42:43'),
(3, 'Peon', '', 1, '2020-10-18 04:42:55', '2020-10-18 04:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_education`
--

CREATE TABLE `wp_wphr_hr_education` (
  `id` int(11) UNSIGNED NOT NULL,
  `employee_id` int(11) UNSIGNED DEFAULT NULL,
  `school` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finished` int(4) UNSIGNED DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_employees`
--

CREATE TABLE `wp_wphr_hr_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `employee_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `job_title_detail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `department` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `location` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hiring_source` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hiring_date` date NOT NULL,
  `termination_date` date NOT NULL,
  `date_of_birth` date NOT NULL,
  `reporting_to` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `send_mail_to_reporter` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_leave_by_reporter` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_rate` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `pay_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` datetime DEFAULT NULL,
  `leave_year` int(2) DEFAULT 1,
  `apply_leave_year` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anniversary_permission` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_permission` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inout_office` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wphr_hr_employees`
--

INSERT INTO `wp_wphr_hr_employees` (`id`, `user_id`, `employee_id`, `designation`, `job_title_detail`, `department`, `location`, `hiring_source`, `hiring_date`, `termination_date`, `date_of_birth`, `reporting_to`, `send_mail_to_reporter`, `manage_leave_by_reporter`, `pay_rate`, `pay_type`, `type`, `status`, `deleted_at`, `leave_year`, `apply_leave_year`, `anniversary_permission`, `work_permission`, `inout_office`) VALUES
(1, 2, '0001', 3, '', 1, 0, 'direct', '2020-06-01', '0000-00-00', '0000-00-00', 0, 'on', 'on', 30000, 'monthly', 'permanent', 'active', NULL, 1, NULL, 'on', 'on', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_employee_history`
--

CREATE TABLE `wp_wphr_hr_employee_history` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `module` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `additional` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wphr_hr_employee_history`
--

INSERT INTO `wp_wphr_hr_employee_history` (`id`, `user_id`, `module`, `category`, `type`, `comment`, `data`, `date`, `additional`) VALUES
(1, 2, 'employment', '', 'permanent', '', '', '0000-00-00 00:00:00', ''),
(2, 2, 'compensation', 'monthly', '30000', '', '', '0000-00-00 00:00:00', ''),
(3, 2, 'job', 'Design', NULL, 'Peon', '0', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_employee_notes`
--

CREATE TABLE `wp_wphr_hr_employee_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `additional` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_employee_performance`
--

CREATE TABLE `wp_wphr_hr_employee_performance` (
  `id` int(11) UNSIGNED NOT NULL,
  `employee_id` int(11) UNSIGNED DEFAULT NULL,
  `reporting_to` int(11) UNSIGNED DEFAULT NULL,
  `job_knowledge` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_quality` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dependablity` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewer` int(11) UNSIGNED DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `goal_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_assessment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supervisor` int(11) UNSIGNED DEFAULT NULL,
  `supervisor_assessment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `performance_date` datetime DEFAULT NULL,
  `additional` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_holiday`
--

CREATE TABLE `wp_wphr_hr_holiday` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` timestamp NOT NULL DEFAULT current_timestamp(),
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `range_status` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `location_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wphr_hr_holiday`
--

INSERT INTO `wp_wphr_hr_holiday` (`id`, `title`, `start`, `end`, `description`, `range_status`, `created_at`, `updated_at`, `location_id`) VALUES
(1, 'Eid', '2020-10-21 18:00:00', '2020-10-22 18:00:00', '', '', '2020-10-18 04:48:04', '2020-10-18 04:49:02', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_leaves`
--

CREATE TABLE `wp_wphr_hr_leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `length_hours` decimal(6,2) UNSIGNED NOT NULL,
  `length_days` decimal(6,2) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `duration_type` tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_leave_entitlements`
--

CREATE TABLE `wp_wphr_hr_leave_entitlements` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `policy_id` int(11) UNSIGNED DEFAULT NULL,
  `days` mediumint(4) DEFAULT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_leave_policies`
--

CREATE TABLE `wp_wphr_hr_leave_policies` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumint(5) DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` int(11) NOT NULL,
  `designation` int(11) NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` int(3) NOT NULL,
  `effective_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `activate` int(2) NOT NULL,
  `execute_day` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_leave_requests`
--

CREATE TABLE `wp_wphr_hr_leave_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `policy_id` int(11) UNSIGNED NOT NULL,
  `days` tinyint(3) UNSIGNED DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(2) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  `is_archived` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_upload`
--

CREATE TABLE `wp_wphr_hr_upload` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `uploaded_on` datetime NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_hr_work_exp`
--

CREATE TABLE `wp_wphr_hr_work_exp` (
  `id` int(11) UNSIGNED NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_peoplemeta`
--

CREATE TABLE `wp_wphr_peoplemeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `wphr_people_id` bigint(20) DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_peoples`
--

CREATE TABLE `wp_wphr_peoples` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT 0,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_people_types`
--

CREATE TABLE `wp_wphr_people_types` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wphr_people_types`
--

INSERT INTO `wp_wphr_people_types` (`id`, `name`) VALUES
(2, 'company'),
(1, 'contact'),
(3, 'customer'),
(4, 'vendor');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphr_people_type_relations`
--

CREATE TABLE `wp_wphr_people_type_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `people_id` bigint(20) UNSIGNED DEFAULT NULL,
  `people_types_id` int(11) UNSIGNED DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `wp_wphr_audit_log`
--
ALTER TABLE `wp_wphr_audit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_company_locations`
--
ALTER TABLE `wp_wphr_company_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `wp_wphr_files_upload`
--
ALTER TABLE `wp_wphr_files_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_hr_announcement`
--
ALTER TABLE `wp_wphr_hr_announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_hr_dependents`
--
ALTER TABLE `wp_wphr_hr_dependents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `wp_wphr_hr_depts`
--
ALTER TABLE `wp_wphr_hr_depts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_hr_designations`
--
ALTER TABLE `wp_wphr_hr_designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_hr_education`
--
ALTER TABLE `wp_wphr_hr_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `wp_wphr_hr_employees`
--
ALTER TABLE `wp_wphr_hr_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_wphr_hr_employee_history`
--
ALTER TABLE `wp_wphr_hr_employee_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `module` (`module`);

--
-- Indexes for table `wp_wphr_hr_employee_notes`
--
ALTER TABLE `wp_wphr_hr_employee_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_hr_employee_performance`
--
ALTER TABLE `wp_wphr_hr_employee_performance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `wp_wphr_hr_holiday`
--
ALTER TABLE `wp_wphr_hr_holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_hr_leaves`
--
ALTER TABLE `wp_wphr_hr_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `wp_wphr_hr_leave_entitlements`
--
ALTER TABLE `wp_wphr_hr_leave_entitlements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_wphr_hr_leave_policies`
--
ALTER TABLE `wp_wphr_hr_leave_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_hr_leave_requests`
--
ALTER TABLE `wp_wphr_hr_leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `policy_id` (`policy_id`);

--
-- Indexes for table `wp_wphr_hr_upload`
--
ALTER TABLE `wp_wphr_hr_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_wphr_hr_work_exp`
--
ALTER TABLE `wp_wphr_hr_work_exp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `wp_wphr_peoplemeta`
--
ALTER TABLE `wp_wphr_peoplemeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `wphr_people_id` (`wphr_people_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_wphr_peoples`
--
ALTER TABLE `wp_wphr_peoples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_wphr_people_types`
--
ALTER TABLE `wp_wphr_people_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `wp_wphr_people_type_relations`
--
ALTER TABLE `wp_wphr_people_type_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `people_id` (`people_id`),
  ADD KEY `people_types_id` (`people_types_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_wphr_audit_log`
--
ALTER TABLE `wp_wphr_audit_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wp_wphr_company_locations`
--
ALTER TABLE `wp_wphr_company_locations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_files_upload`
--
ALTER TABLE `wp_wphr_files_upload`
  MODIFY `id` int(19) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_announcement`
--
ALTER TABLE `wp_wphr_hr_announcement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_dependents`
--
ALTER TABLE `wp_wphr_hr_dependents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_depts`
--
ALTER TABLE `wp_wphr_hr_depts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_designations`
--
ALTER TABLE `wp_wphr_hr_designations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_education`
--
ALTER TABLE `wp_wphr_hr_education`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_employees`
--
ALTER TABLE `wp_wphr_hr_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_employee_history`
--
ALTER TABLE `wp_wphr_hr_employee_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_employee_notes`
--
ALTER TABLE `wp_wphr_hr_employee_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_employee_performance`
--
ALTER TABLE `wp_wphr_hr_employee_performance`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_holiday`
--
ALTER TABLE `wp_wphr_hr_holiday`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_leaves`
--
ALTER TABLE `wp_wphr_hr_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_leave_entitlements`
--
ALTER TABLE `wp_wphr_hr_leave_entitlements`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_leave_policies`
--
ALTER TABLE `wp_wphr_hr_leave_policies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_leave_requests`
--
ALTER TABLE `wp_wphr_hr_leave_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_upload`
--
ALTER TABLE `wp_wphr_hr_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_hr_work_exp`
--
ALTER TABLE `wp_wphr_hr_work_exp`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_peoplemeta`
--
ALTER TABLE `wp_wphr_peoplemeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_peoples`
--
ALTER TABLE `wp_wphr_peoples`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wphr_people_types`
--
ALTER TABLE `wp_wphr_people_types`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wp_wphr_people_type_relations`
--
ALTER TABLE `wp_wphr_people_type_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `work`
--
CREATE DATABASE IF NOT EXISTS `work` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `work`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `status`, `create_date`, `update_date`) VALUES
(1, 'admin@gmail.com', 'admin@gmail.com', 'admin', '2020-10-17 13:43:26', '2020-10-19 14:30:55');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `month` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `employee_id`, `check_in`, `check_out`, `time`, `date`, `month`, `create_time`, `update_time`) VALUES
(6, 4, 'EID-9', '2020-10-19 06:58:27', '2020-10-19 07:00:50', '00:2', '2020-10-19', '2020-10', '2020-10-19 16:58:27', '2020-10-20 04:29:06'),
(9, 1, 'EID-1', '2020-10-20 07:21:28', '2020-10-20 07:24:53', '00:3', '2020-10-20', '2020-10', '2020-10-20 17:21:28', '2020-10-20 17:24:53'),
(10, 4, 'EID-9', '2020-10-20 07:29:53', '2020-10-20 07:36:36', '00:6', '2020-10-20', '2020-10', '2020-10-20 17:29:53', '2020-10-20 17:36:36'),
(12, 1, 'EID-1', '2020-10-21 09:36:18', '2020-10-21 09:47:24', '00:11', '2020-10-21', '2020-10', '2020-10-21 07:36:18', '2020-10-21 07:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dept` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `dept`, `create_time`, `update_time`) VALUES
(3, 'Computer', '2020-10-18 07:03:36', '2020-10-18 07:03:36'),
(4, 'RSC', '2020-10-18 08:32:06', '2020-10-18 08:48:02'),
(5, 'Civil', '2020-10-18 08:42:53', '2020-10-18 08:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `leave_request`
--

CREATE TABLE `leave_request` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `days` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_request`
--

INSERT INTO `leave_request` (`id`, `employee_id`, `employee_name`, `from_date`, `to_date`, `days`, `reason`, `description`, `status`, `year`, `month`, `create_date`, `update_date`) VALUES
(8, 'EID-1', 'Arafat Hossain', '2020-10-20', '2020-10-21', 2, 'Annual Leave', 'Sick Leave', 'accepted', '2020', '2020-10', '2020-10-20 15:41:38', '2020-10-20 16:49:36'),
(9, 'EID-1', 'Arafat Hossain', '2020-10-20', '2020-10-20', 1, 'Festival Leave', 'Sick Leave', 'pending', '2020', '2020-10', '2020-10-20 15:44:06', '2020-10-20 16:49:40'),
(10, 'EID-1', 'Arafat Hossain', '2020-10-20', '2020-10-24', 4, 'Annual Leave', 'test', 'pending', '2020', '2020-10', '2020-10-20 15:54:29', '2020-10-20 16:49:42'),
(11, 'EID-1', 'Arafat Hossain', '2020-10-15', '2020-10-17', 3, 'Medical Leave', 'sick', 'pending', '2020', '2020-10', '2020-10-20 16:52:31', '2020-10-20 16:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `state` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `subject`, `description`, `state`, `status`, `date_time`) VALUES
(1, 1, 'test', 'test', 'sent', 1, '2020-10-19 11:18:59'),
(2, 1, 'test', 'reply test', 'reply', 1, '2020-10-19 12:03:25'),
(3, 1, 'test', 'second reply', 'sent', 1, '2020-10-19 12:07:15'),
(4, 1, 'test', 'third reply', 'reply', 1, '2020-10-19 12:08:54'),
(5, 1, 'test', 'dfdfd', 'sent', 0, '2020-10-20 06:01:37'),
(6, 4, 'test', 'EID-9', 'sent', 0, '2020-10-21 03:59:58');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `pos` varchar(255) NOT NULL,
  `annual_leave` int(11) NOT NULL,
  `casual_leave` int(11) NOT NULL,
  `medical_leave` int(11) NOT NULL,
  `maternity_leave` int(11) NOT NULL,
  `festival_leave` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `pos`, `annual_leave`, `casual_leave`, `medical_leave`, `maternity_leave`, `festival_leave`, `create_time`, `update_time`) VALUES
(2, 'Peon', 6, 4, 5, 7, 3, '2020-10-18 11:50:40', '2020-10-20 13:28:20'),
(3, 'Managear', 6, 2, 6, 5, 8, '2020-10-18 11:52:54', '2020-10-20 13:27:41'),
(4, 'Assistant', 4, 6, 4, 8, 3, '2020-10-18 11:56:03', '2020-10-20 13:29:23'),
(6, 'Test', 8, 5, 4, 2, 5, '2020-10-20 13:20:13', '2020-10-20 13:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token`, `update_date`) VALUES
(1, '123abc456', '2020-10-19 03:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dept` varchar(255) NOT NULL,
  `pos` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `hire_date` date NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `nid` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `first_name`, `last_name`, `password`, `dept`, `pos`, `salary`, `hire_date`, `birthday`, `gender`, `marital_status`, `phone`, `nid`, `address`, `photo`, `create_time`, `update_time`) VALUES
(1, 'EID-1', 'Arafat', 'Hossain', 'EID-1', 'Computer', 'Managear', '20000', '2020-06-01', '2010-06-08', 'Male', 'Married', '01782763384', '17827633845', 'Bhola, Barisal, Bangladesh', '516285ad67.png', '2020-10-18 13:25:23', '2020-10-21 03:59:35'),
(4, 'EID-9', 'Aklima', 'Akter', 'EID-9', 'RSC', 'Assistant', '15000', '2020-06-18', '2020-10-30', 'Female', 'Widowed', '01782763389', '17827633890', 'Bhola, Barisal, Bangladesh', '0c4107ef24.gif', '2020-10-18 14:08:53', '2020-10-21 03:59:28'),
(8, 'EID-6', 'Jamal', 'Hasan', 'EID-6', 'RSC', 'Assistant', '33454', '2020-06-30', '1987-07-07', 'Male', 'Married', '01782763347', '45782763347', 'Banani', 'c0d100874e.png', '2020-10-21 06:53:30', '2020-10-21 06:53:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_request`
--
ALTER TABLE `leave_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leave_request`
--
ALTER TABLE `leave_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
