-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2022 at 02:02 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbier`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `street_address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` char(2) DEFAULT NULL,
  `postal_code` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `street_address`, `city`, `province`, `postal_code`) VALUES
(2, 'Aaron Champagne', 'achampag@ualberta.ca', '2317 138 A Avenue', 'Edmonton', 'AB', 'T5Y1B9'),
(3, 'James Grieve', 'jgrieve@ualberta.ca', '1234 123 Street', 'Edmonton', 'AB', 'T2B1G4'),
(4, 'Bo Cen', 'bcen@ualberta.ca', '5672 98 Avenue', 'Edmonton', 'AB', 'T3C4B7'),
(5, 'Stephanie Smothers', 'ssmoth@ualberta.ca', NULL, NULL, NULL, NULL),
(6, 'Emily Nelson', NULL, '1 Winston Churchill Square', 'Edmonton', 'AB', 'T4A1B7'),
(7, 'Sean Townsend', 'stown@ualberta.ca', NULL, NULL, NULL, NULL),
(8, 'Diana Hyland', NULL, NULL, NULL, NULL, NULL),
(9, 'Dennis Nylon', 'dnylon@ualberta.ca', '1298 76 Street', 'Edmonton', 'AB', 'T5R6F8'),
(10, 'Chloe Beale', NULL, '7393 78 Ave', 'Edmonton', 'AB', 'T8FW7C');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_header_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `sub_total` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_header_id`, `product_id`, `order_qty`, `sub_total`) VALUES
(1, 1, 5, 1, '775.99'),
(2, 2, 1, 2, '751.98'),
(3, 2, 7, 1, '425.99'),
(4, 3, 6, 1, '550.00'),
(5, 3, 2, 2, '553.00'),
(6, 4, 3, 1, '23.60'),
(7, 5, 4, 1, '450.25'),
(8, 5, 7, 1, '425.99'),
(9, 6, 6, 2, '1100.00'),
(10, 6, 7, 2, '851.98'),
(11, 7, 1, 1, '375.99');

-- --------------------------------------------------------

--
-- Table structure for table `order_header`
--

CREATE TABLE `order_header` (
  `order_header_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total_price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_header`
--

INSERT INTO `order_header` (`order_header_id`, `customer_id`, `order_date`, `total_price`) VALUES
(1, 1, '2022-01-01', '775.99'),
(2, 2, '2022-01-02', '1177.97'),
(3, 3, '2022-01-04', '1103.00'),
(4, 1, '2022-01-12', '23.60'),
(5, 4, '2022-01-14', '876.24'),
(6, 5, '2022-01-20', '1951.98'),
(7, 6, '2022-01-22', '375.99');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` varchar(200) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `price`, `quantity_in_stock`) VALUES
(1, 'Guitar', 'An acoustic guitar made by Epiphone.', '375.99', 5),
(2, 'Microphone', 'A Shure microphone ideal for stage.', '276.50', 3),
(3, 'Tambourine', 'Mother of pearl handle.', '23.60', 15),
(4, 'Bass Guitar', 'A four-string, fretless bass guitar by Ibanez.', '450.25', 2),
(5, 'Electric Guitar', 'An electric guitar made by Epiphone', '775.99', 1),
(6, 'MIDI Keyboard', 'A two-octave keyboard with USB cable for making digital music.', '550.00', 4),
(7, '50-Watt Amplifier', 'A medium sized amp by Marshall.', '425.99', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_header_id` (`order_header_id`,`product_id`);

--
-- Indexes for table `order_header`
--
ALTER TABLE `order_header`
  ADD PRIMARY KEY (`order_header_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_header`
--
ALTER TABLE `order_header`
  MODIFY `order_header_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
