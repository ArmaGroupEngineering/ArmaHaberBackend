-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 15, 2021 at 08:16 AM
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
-- Table structure for table `adminhistory`
--

CREATE TABLE `adminhistory` (
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
-- Table structure for table `mailsubscription`
--

CREATE TABLE `mailsubscription` (
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
  `typeID` int(11) NOT NULL COMMENT 'Message TypeID',
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
  `editedAt` datetime NOT NULL COMMENT 'Edited At',
  `isActive` tinyint(1) NOT NULL COMMENT 'New Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`ID`, `categoryID`, `typeID`, `title`, `image`, `summary`, `authorID`, `createdAt`, `editedAt`, `isActive`) VALUES
(1, 1, 1, 'MAX BU KEZ BASARDI!!', '/path/to/image.png', 'F1 Yarismasini galibi Max oldu. Son virajda Hamilton\'i gecen max verstappen 2 milisaniye gibi bir farkla dünya sampiyonu olmayi hak kazandi. Kendisini tebrik ediyoruz..', 1, '2021-12-15 07:58:55', '2021-12-15 07:58:55', 1);

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

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `firstName`, `lastName`, `username`, `email`, `password`, `joinedAt`, `token`, `expiresAt`, `permissions`, `tags`, `isActive`) VALUES
(1, 'Yusuf Berkay', 'Girgin', 'ybgirgin', 'ybgirgin@armagroupholding.com', 'ybgirgin123', '2021-12-15 07:57:00', '1!+^%\'jhaskhr18134kgakghfkfljg', '2021-12-15 07:57:00', 0x0111110000000000000000000000000000000000000000000000000000000000, 'spor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usersarchive`
--

CREATE TABLE `usersarchive` (
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
-- Indexes for table `adminhistory`
--
ALTER TABLE `adminhistory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `adminID` (`adminID`,`newsID`),
  ADD KEY `newsID` (`newsID`);

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
  ADD PRIMARY KEY (`ID`),
  ADD KEY `newsID` (`newsID`,`authorID`),
  ADD KEY `authorID` (`authorID`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `newsID` (`newsID`);

--
-- Indexes for table `mailsubscription`
--
ALTER TABLE `mailsubscription`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `newsID` (`newsID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `type` (`typeID`,`userID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `typeID` (`typeID`);

--
-- Indexes for table `messagetype`
--
ALTER TABLE `messagetype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `categoryID` (`categoryID`,`typeID`,`authorID`),
  ADD KEY `typeID` (`typeID`),
  ADD KEY `authorID` (`authorID`);

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
-- Indexes for table `usersarchive`
--
ALTER TABLE `usersarchive`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`,`newsID`),
  ADD KEY `newsID` (`newsID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User ID';

--
-- AUTO_INCREMENT for table `adminhistory`
--
ALTER TABLE `adminhistory`
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
-- AUTO_INCREMENT for table `mailsubscription`
--
ALTER TABLE `mailsubscription`
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'News ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newstype`
--
ALTER TABLE `newstype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'News Type ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usersarchive`
--
ALTER TABLE `usersarchive`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Archive ID';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminhistory`
--
ALTER TABLE `adminhistory`
  ADD CONSTRAINT `adminhistory_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`ID`),
  ADD CONSTRAINT `adminhistory_ibfk_2` FOREIGN KEY (`newsID`) REFERENCES `news` (`ID`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`newsID`) REFERENCES `news` (`ID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`authorID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`newsID`) REFERENCES `news` (`ID`);

--
-- Constraints for table `mailsubscription`
--
ALTER TABLE `mailsubscription`
  ADD CONSTRAINT `mailsubscription_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`newsID`) REFERENCES `news` (`ID`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`typeID`) REFERENCES `messagetype` (`ID`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`typeID`) REFERENCES `newstype` (`ID`),
  ADD CONSTRAINT `news_ibfk_3` FOREIGN KEY (`authorID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `usersarchive`
--
ALTER TABLE `usersarchive`
  ADD CONSTRAINT `usersarchive_ibfk_1` FOREIGN KEY (`newsID`) REFERENCES `news` (`ID`),
  ADD CONSTRAINT `usersarchive_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
