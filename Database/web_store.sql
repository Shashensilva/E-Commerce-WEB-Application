-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2024 at 07:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `A_ID` int(11) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`A_ID`, `Name`, `Password`, `Email`) VALUES
(1, 'Lakshan', 'sdsdd', 'Lakshanlop@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `O_ID` int(5) NOT NULL,
  `UserId` int(4) NOT NULL,
  `PID` int(5) NOT NULL,
  `Billing_Address` varchar(20) NOT NULL,
  `Quantity` text NOT NULL,
  `Mobile` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PID` int(5) NOT NULL,
  `P_Name` varchar(500) NOT NULL,
  `P_Quantity` int(5) NOT NULL,
  `P_description` varchar(10000) NOT NULL,
  `P_Price` int(4) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `A_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PID`, `P_Name`, `P_Quantity`, `P_description`, `P_Price`, `image`, `A_ID`) VALUES
(14, 'Royal Blue & Navy Blue Sports T Shirt', 10, 'he Royal Blue & Navy Blue Sports T-Shirt is made of high-performance moisture-wicking fabrics, fine durable stitches and export-ready production standards to give you the best value, lightweight ease and maximum comfort. The fit of the t-shirt falls between regular and slim. Relaxed on shoulders and neck, slightly slimmer yet comfortable on the body. A precise tailor-made fit to suit all body types. Crafted to emphasize muscle detail and form, this t-shirt ensures you look your best, whether hitting the gym or enjoying a relaxed outing.', 54, 'Uploads/Royal-Blue-Navy-Blue-Sports-T-Shirt.webp', 1),
(15, 'Purple & Violet Sports T Shirt', 17, 'The Purple & Violet Sports T-Shirt is made of high-performance moisture-wicking fabrics, fine durable stitches and export-ready production standards to give you the best value, lightweight ease and maximum comfort. The fit of the t-shirt falls between regular and slim. Relaxed on shoulders and neck, slightly slimmer yet comfortable on the body. A precise tailor-made fit to suit all body types. Crafted to emphasize muscle detail and form, this t-shirt ensures you look your best, whether hitting the gym or enjoying a relaxed outing.', 75, 'Uploads/Purple-Violet-Sports-T-Shirt.webp', 1),
(16, 'Neon Yellow & Steel Grey Sports T Shirt', 23, 'The Neon Yellow & Steel Grey Sports T-Shirt is made of high-performance moisture-wicking fabrics, fine durable stitches and export-ready production standards to give you the best value, lightweight ease and maximum comfort. The fit of the t-shirt falls between regular and slim. Relaxed on shoulders and neck, slightly slimmer yet comfortable on the body. A precise tailor-made fit to suit all body types. Crafted to emphasize muscle detail and form, this t-shirt ensures you look your best, whether hitting the gym or enjoying a relaxed outing.', 43, 'Uploads/Neon-Yellow-Steel-Grey-Sports-T-Shirt.webp', 1),
(17, 'Navy Blue & Jet Black Sports T Shirt', 21, 'The Navy Blue & Jet Black Sports T-Shirt is made of high-performance moisture-wicking fabrics, fine durable stitches and export-ready production standards to give you the best value, lightweight ease and maximum comfort. The fit of the t-shirt falls between regular and slim. Relaxed on shoulders and neck, slightly slimmer yet comfortable on the body. A precise tailor-made fit to suit all body types. Crafted to emphasize muscle detail and form, this t-shirt ensures you look your best, whether hitting the gym or enjoying a relaxed outing.', 43, 'Uploads/Navy-Blue-Jet-Black-Sports-T-Shirt.webp', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(4) NOT NULL,
  `UserName` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `UserName`, `Email`, `Password`) VALUES
(1, 'Lakshan', 'Lakshanlop@gmail.com', '32763'),
(7, 'Bamitha', 'bamitha@gmail.com', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`A_ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`O_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `admin foreign key` (`A_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `A_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `O_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `PID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `admin foreign key` FOREIGN KEY (`A_ID`) REFERENCES `admin` (`A_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
