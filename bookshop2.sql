-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 10, 2019 at 01:56 PM
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
  `book_blurb` varchar(2000) DEFAULT NULL,
  `book_image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id_idx` (`author_id`),
  KEY `format_id_idx` (`format_id`),
  KEY `category_id_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `category_id`, `format_id`, `price`, `author_id`, `book_pubdate`, `book_blurb`, `book_image`) VALUES
(1, 'Pride and Prejudice', 9, 2, '12.99', 1, '1813-01-01', 'An 1813 romantic novel of manners written by Jane Austen. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book, who learns about the repercussions of hasty judgments and eventually comes to appreciate the difference between superficial goodness and actual goodness. A classic piece filled with comedy, its humor lies in its honest depiction of manners, education, marriage and money during the Regency era in Great Britain', 'images/book1.jpg'),
(2, 'Northanger Abbey', 9, 3, '29.99', 1, '1817-01-01', 'Was the first of Jane Austen\'s novels to be completed for publication, in 1803. However, it was not published until after her death in 1817, along with another novel of hers, Persuasion. Northanger Abbey is a satire of Gothic novels, which were quite popular at the time, in 1798–99. This coming-of-age story revolves around Catherine Morland, a young and naïve \"heroine\", who entertains the reader on her journey to a better understanding of the world and those around her. In the course of the novel, she discovers that she differs from those other women who crave wealth or social acceptance, as instead she wishes only to have happiness supported by genuine morality.', 'images/book2.png'),
(3, 'Love and Fiendship', 6, 3, '24.99', 1, '1790-01-01', 'A short epistolary novel by Jane Austen, possibly written in 1794 but not published until 1871. This early complete work, which the author never submitted for publication, describes the schemes of the title character.', 'images/book3.png'),
(4, 'The Hunt for Red October', 8, 2, '10.99', 2, '1984-01-01', 'The debut novel by Tom Clancy, first published on October 1, 1984 by the Naval Institute Press. It depicts Soviet submarine captain Marko Ramius as he seemingly goes rogue with his country\'s cutting-edge ballistic missile submarine Red October, and marks the first appearance of Clancy\'s most popular fictional character Jack Ryan, an analyst working for the Central Intelligence Agency, as he must prove his theory that Ramius had intended to defect to the United States. The book was loosely inspired by the mutiny on the Soviet frigate Storozhevoy in 1975. The Hunt for Red October launched Clancy\'s successful career as a novelist, especially after then-U.S. President Ronald Reagan remarked that he had enjoyed reading the book. A namesake film adaptation was released on March 2, 1990, and several computer and video games based on the book have been developed. Since then, the book has become instrumental in bringing the book genre of techno-thriller into the mainstream.', 'images/book4.jpg'),
(5, 'Clear and Present Danger', 8, 2, '9.99', 2, '1989-01-01', 'A political thriller novel, written by Tom Clancy and published on August 17, 1989. A sequel to The Cardinal of the Kremlin (1988), main character Jack Ryan becomes acting Deputy Director of Intelligence in the Central Intelligence Agency, and discovers that he is being kept in the dark by his colleagues who are conducting a covert war against a drug cartel based in Colombia. It debuted at number one on the New York Times bestseller list. A film adaptation, featuring Harrison Ford reprising his role as Ryan, was released on August 3, 1994.', 'images/book5.jpg'),
(6, 'Patriot Games', 8, 2, '11.99', 2, '1987-07-01', 'A thriller novel, written by Tom Clancy and published on July 1987. It is the indirect sequel to Without Remorse, and is chronologically the first book featuring Jack Ryan, the main character in most of Clancy’s novels. The novel focuses on Ryan being the target of Irish terrorist group Ulster Liberation Army for thwarting their kidnapping attempt on the Prince and Princess of Wales in London. It debuted at number one on the New York Times bestseller list. A film adaptation, starring Harrison Ford as Ryan, premiered on June 5, 1992.', 'images/book6.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_pass`, `user_address1`, `user_address2`, `user_postcode`, `user_country`, `user_telephone`) VALUES
(1, 'Stuart', 'Walker', 'batecsw@hotmail.com', 'anypassowrd', '14 rue des Carrieres', 'Strassen', '8016', 'Luxembourg', '654321098'),
(2, 'John', 'Bull', 'jbullocks@gmail.com', 'anotherpassword', '23 rue Aubepines', 'Luxembourg', '1559', 'Luxembourg', '666555444');

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
