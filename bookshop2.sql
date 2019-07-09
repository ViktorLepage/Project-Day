-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 09, 2019 at 01:52 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshop2`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_firstname` varchar(45) DEFAULT NULL,
  `auth_lastname` varchar(45) DEFAULT NULL,
  `auth_dob` date DEFAULT NULL,
  `auth_gen` varchar(1) DEFAULT NULL,
  `auth_bio` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `auth_firstname`, `auth_lastname`, `auth_dob`, `auth_gen`, `auth_bio`) VALUES
(1, 'Jane', 'Austen', '1775-12-16', 'f', 'An English novelist known primarily for her six major novels, which interpret, critique and comment upon the British landed gentry at the end of the 18th century. Austen\'s plots often explore the dependence of women on marriage in the pursuit of favourable social standing and economic security'),
(2, 'Tom', 'Clancy', '1947-04-12', 'm', 'Was an American novelist best known for his technically detailed espionage and military-science storylines set during and after the Cold War. Seventeen of his novels were bestsellers, and more than 100 million copies of his books were sold');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `format_id` int(11) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `book_pubdate` date DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id_idx` (`author_id`),
  KEY `format_id_idx` (`format_id`),
  KEY `category_id_idx` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'reference'),
(2, 'textbook'),
(3, 'biography'),
(4, 'nonfiction other'),
(5, 'scifi'),
(6, 'romance'),
(7, 'horror'),
(8, 'thriller'),
(9, 'classics'),
(10, 'fiction other'),
(11, 'childrens fiction'),
(12, 'childrens fiction');

-- --------------------------------------------------------

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
CREATE TABLE IF NOT EXISTS `formats` (
  `format_id` int(11) NOT NULL AUTO_INCREMENT,
  `format_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formats`
--

INSERT INTO `formats` (`format_id`, `format_name`) VALUES
(1, 'pocket'),
(2, 'paperback'),
(3, 'hardback'),
(4, 'large');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_price` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`book_id`),
  KEY `book_id_idx` (`book_id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_price` decimal(2,0) DEFAULT NULL,
  `paytype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(45) DEFAULT NULL,
  `user_lastname` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_pass` varchar(45) DEFAULT NULL,
  `user_address1` varchar(45) DEFAULT NULL,
  `user_address2` varchar(45) DEFAULT NULL,
  `user_postcode` varchar(45) DEFAULT NULL,
  `user_country` varchar(45) DEFAULT NULL,
  `user_telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `format_id` FOREIGN KEY (`format_id`) REFERENCES `formats` (`format_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
