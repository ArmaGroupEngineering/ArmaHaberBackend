-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 14, 2021 at 11:18 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ARMANEWS`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL COMMENT 'User ID',
  `firstName` varchar(50) NOT NULL COMMENT 'First Name',
  `lastName` varchar(50) NOT NULL COMMENT 'Last Name',
  `username` varchar(50) NOT NULL COMMENT 'Username',
  `email` varchar(50) NOT NULL COMMENT 'Email',
  `password` varchar(50) NOT NULL COMMENT 'Password',
  `joinedAt` datetime NOT NULL COMMENT 'Joined At',
  `token` varchar(200) NOT NULL COMMENT 'Token',
  `expiresAt` datetime NOT NULL COMMENT 'Token Expires At',
  `permissions` binary(32) NOT NULL COMMENT 'User Permissions',
  `isActive` tinyint(1) NOT NULL COMMENT 'Is User Account Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminHistory`
--

CREATE TABLE `adminHistory` (
  `ID` int(11) NOT NULL COMMENT 'History ID',
  `adminID` int(11) NOT NULL COMMENT 'Admin ID',
  `newsID` int(11) NOT NULL COMMENT 'News ID',
  `detail` text NOT NULL COMMENT 'Log Detail'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL COMMENT 'Category ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL COMMENT 'Category Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `name`) VALUES
(2, 'Ekonomi'),
(3, 'Siyaset'),
(1, 'Spor');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `ID` int(11) NOT NULL COMMENT 'Comment ID',
  `newsID` int(11) NOT NULL COMMENT 'News ID',
  `authorID` int(11) NOT NULL COMMENT 'Author ID',
  `detail` text NOT NULL COMMENT 'Comment Detail',
  `createdAt` datetime NOT NULL COMMENT 'Comment Created At',
  `editedAt` datetime NOT NULL COMMENT 'Comment Edited At',
  `isAccepted` tinyint(1) NOT NULL COMMENT 'Is Comment Accepted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `ID` int(11) NOT NULL COMMENT 'Gallery ID',
  `newsID` int(11) NOT NULL COMMENT 'News ID',
  `gallery` varchar(200) NOT NULL COMMENT 'Gallery Path',
  `detail` text NOT NULL COMMENT 'Gallery Detail',
  `isActive` tinyint(1) NOT NULL COMMENT 'Is Comment Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mailSubscription`
--

CREATE TABLE `mailSubscription` (
  `ID` int(11) NOT NULL COMMENT 'Subscription ID',
  `userID` int(11) NOT NULL COMMENT 'User ID',
  `detail` text NOT NULL COMMENT 'Mail Detail',
  `sentAt` datetime NOT NULL COMMENT 'Mail Sent At',
  `isActive` tinyint(1) NOT NULL COMMENT 'is Subscription Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `ID` int(11) NOT NULL COMMENT 'Media ID',
  `newsID` int(11) NOT NULL COMMENT 'News ID',
  `video` varchar(100) NOT NULL COMMENT 'Video Path',
  `detail` text NOT NULL COMMENT 'News Detail'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `ID` int(11) NOT NULL COMMENT 'Message ID',
  `type` varchar(50) NOT NULL COMMENT 'Message Type',
  `userID` int(11) NOT NULL COMMENT 'User ID',
  `subject` varchar(100) NOT NULL COMMENT 'Message Subject',
  `detail` text NOT NULL COMMENT 'Message Detail',
  `sentAt` datetime NOT NULL COMMENT 'Message Sent At',
  `firstName` varchar(50) DEFAULT NULL COMMENT 'Unauthorized User First Name',
  `lastName` varchar(50) DEFAULT NULL COMMENT 'Unauthorized User Last Name',
  `email` varchar(50) DEFAULT NULL COMMENT 'Unauthorized User Email Address'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messagetype`
--

CREATE TABLE `messagetype` (
  `ID` int(11) NOT NULL COMMENT 'Message Type ID',
  `type` varchar(50) NOT NULL COMMENT 'Message Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `ID` int(11) NOT NULL COMMENT 'News ID',
  `categoryID` int(11) NOT NULL COMMENT 'Category ID',
  `typeID` int(11) NOT NULL COMMENT 'Type ID',
  `title` varchar(200) NOT NULL COMMENT 'News Title',
  `image` varchar(200) NOT NULL COMMENT 'Image Path',
  `summary` text NOT NULL COMMENT 'Summary',
  `authorID` int(11) NOT NULL COMMENT 'Author ID',
  `createdAt` datetime NOT NULL COMMENT 'Created At',
  `Edited At` datetime NOT NULL COMMENT 'Edited At',
  `isActive` tinyint(1) NOT NULL COMMENT 'New Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `newstype`
--

CREATE TABLE `newstype` (
  `ID` int(11) NOT NULL COMMENT 'News Type ID',
  `type` varchar(50) NOT NULL COMMENT 'News Type Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `newstype`
--

INSERT INTO `newstype` (`ID`, `type`) VALUES
(2, 'Foto Galeri'),
(1, 'Makale');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL COMMENT 'User ID',
  `firstName` varchar(50) NOT NULL COMMENT 'First Name',
  `lastName` varchar(50) NOT NULL COMMENT 'Last Name',
  `username` varchar(50) NOT NULL COMMENT 'Username',
  `email` varchar(50) NOT NULL COMMENT 'Email',
  `password` varchar(50) NOT NULL COMMENT 'Password',
  `joinedAt` datetime NOT NULL COMMENT 'Joined At',
  `token` varchar(200) NOT NULL COMMENT 'Token',
  `expiresAt` datetime NOT NULL COMMENT 'Token Expires At',
  `permissions` binary(32) NOT NULL COMMENT 'User Permissions',
  `tags` varchar(300) NOT NULL COMMENT 'User Tags',
  `isActive` tinyint(1) NOT NULL COMMENT 'Is User Account Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usersArchive`
--

CREATE TABLE `usersArchive` (
  `ID` int(11) NOT NULL COMMENT 'Archive ID',
  `userID` int(11) NOT NULL COMMENT 'User ID',
  `newsID` int(11) NOT NULL COMMENT 'News ID',
  `userReaction` binary(8) NOT NULL COMMENT 'User Reaction'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `adminHistory`
--
ALTER TABLE `adminHistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`name`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mailSubscription`
--
ALTER TABLE `mailSubscription`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `messagetype`
--
ALTER TABLE `messagetype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `newstype`
--
ALTER TABLE `newstype`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Type` (`type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `usersArchive`
--
ALTER TABLE `usersArchive`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User ID';

--
-- AUTO_INCREMENT for table `adminHistory`
--
ALTER TABLE `adminHistory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'History ID';

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Category ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Comment ID';

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Gallery ID';

--
-- AUTO_INCREMENT for table `mailSubscription`
--
ALTER TABLE `mailSubscription`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Subscription ID';

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Media ID';

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Message ID';

--
-- AUTO_INCREMENT for table `messagetype`
--
ALTER TABLE `messagetype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Message Type ID';

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'News ID';

--
-- AUTO_INCREMENT for table `newstype`
--
ALTER TABLE `newstype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'News Type ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User ID';

--
-- AUTO_INCREMENT for table `usersArchive`
--
ALTER TABLE `usersArchive`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Archive ID';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
