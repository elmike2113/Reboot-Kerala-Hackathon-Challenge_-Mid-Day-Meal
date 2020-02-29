-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 29, 2020 at 10:03 AM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flaskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `amaranth`
--

CREATE TABLE IF NOT EXISTS `amaranth` (
  `vitA` float NOT NULL,
  `vitC` float NOT NULL,
  `vitD` float NOT NULL,
  `calcium` float NOT NULL,
  `vitB1` float NOT NULL,
  `vitB3` float NOT NULL,
  `vitK` float NOT NULL,
  `selenium` float NOT NULL,
  `vitB9` float NOT NULL,
  PRIMARY KEY (`vitA`,`vitC`,`vitD`,`calcium`,`vitB1`,`vitB3`,`vitK`,`selenium`,`vitB9`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `amaranth`
--

INSERT INTO `amaranth` (`vitA`, `vitC`, `vitD`, `calcium`, `vitB1`, `vitB3`, `vitK`, `selenium`, `vitB9`) VALUES
(0, 5, 0, 16, 10, 6, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `title` varchar(50) NOT NULL,
  `body` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`title`, `body`, `author`) VALUES
('mid day meal', '<p>qqqwssscmmmc&nbsp; knckkxmck knkmcxlmkcmjsnkmxl', 'akashh');

-- --------------------------------------------------------

--
-- Table structure for table `beetroots`
--

CREATE TABLE IF NOT EXISTS `beetroots` (
  `vitA` float NOT NULL,
  `vitC` float NOT NULL,
  `vitD` float NOT NULL,
  `calcium` float NOT NULL,
  `vitB1` float NOT NULL,
  `vitB3` float NOT NULL,
  `vitK` float NOT NULL,
  `selenium` float NOT NULL,
  `vitB9` float NOT NULL,
  PRIMARY KEY (`vitA`,`vitC`,`vitD`,`calcium`,`vitB1`,`vitB3`,`vitK`,`selenium`,`vitB9`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beetroots`
--

INSERT INTO `beetroots` (`vitA`, `vitC`, `vitD`, `calcium`, `vitB1`, `vitB3`, `vitK`, `selenium`, `vitB9`) VALUES
(0, 6, 0, 2, 3, 2, 0, 0, 27);

-- --------------------------------------------------------

--
-- Table structure for table `countdetails`
--

CREATE TABLE IF NOT EXISTS `countdetails` (
  `scode` int(11) NOT NULL,
  `diseasecount` int(11) NOT NULL,
  `totaldiseasecount` int(11) NOT NULL,
  PRIMARY KEY (`scode`,`diseasecount`,`totaldiseasecount`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drumstick`
--

CREATE TABLE IF NOT EXISTS `drumstick` (
  `vitA` float NOT NULL,
  `vitC` float NOT NULL,
  `vitD` float NOT NULL,
  `calcium` float NOT NULL,
  `vitB1` float NOT NULL,
  `vitB3` float NOT NULL,
  `vitK` float NOT NULL,
  `selenium` float NOT NULL,
  `vitB9` float NOT NULL,
  PRIMARY KEY (`vitA`,`vitC`,`vitD`,`calcium`,`vitB1`,`vitB3`,`vitK`,`selenium`,`vitB9`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drumstick`
--

INSERT INTO `drumstick` (`vitA`, `vitC`, `vitD`, `calcium`, `vitB1`, `vitB3`, `vitK`, `selenium`, `vitB9`) VALUES
(41, 62, 0, 2, 3, 2, 0, 0, 27);

-- --------------------------------------------------------

--
-- Table structure for table `foodcontent`
--

CREATE TABLE IF NOT EXISTS `foodcontent` (
  `food` varchar(30) NOT NULL DEFAULT '',
  `vitminA` float NOT NULL,
  `vitaminK` float NOT NULL,
  `vitaminC` float NOT NULL,
  `iron` float NOT NULL,
  `iodine` float NOT NULL,
  PRIMARY KEY (`food`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodcontent`
--

INSERT INTO `foodcontent` (`food`, `vitminA`, `vitaminK`, `vitaminC`, `iron`, `iodine`) VALUES
('Amaranth', 1250, 50, 30, 20, 35),
('Drumstick_leaf', 1000, 20, 38, 60, 42),
('Spinach', 1200, 45, 25, 36, 28);

-- --------------------------------------------------------

--
-- Table structure for table `fooddisease`
--

CREATE TABLE IF NOT EXISTS `fooddisease` (
  `food` varchar(30) NOT NULL,
  `anemia` int(11) NOT NULL,
  `Night_Blindness` int(11) NOT NULL,
  `Haemophilia` int(11) NOT NULL,
  `Scurvy` int(11) NOT NULL,
  `beriberi` int(11) NOT NULL,
  PRIMARY KEY (`food`,`anemia`,`Night_Blindness`,`Haemophilia`,`Scurvy`,`beriberi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooddisease`
--

INSERT INTO `fooddisease` (`food`, `anemia`, `Night_Blindness`, `Haemophilia`, `Scurvy`, `beriberi`) VALUES
('beetroot', 1, 0, 1, 0, 0),
('cabbage', 0, 0, 0, 1, 0),
('carrot', 0, 1, 0, 1, 0),
('greengram', 0, 0, 0, 0, 1),
('papaya', 1, 0, 0, 1, 0),
('spinach', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `foodnutrition`
--

CREATE TABLE IF NOT EXISTS `foodnutrition` (
  `food` varchar(30) NOT NULL,
  `iron` int(11) NOT NULL,
  `vitA` int(11) NOT NULL,
  `vitC` int(11) NOT NULL,
  `vitB1` int(11) NOT NULL,
  `vitB3` int(11) NOT NULL,
  `vitB9` int(11) NOT NULL,
  `selenium` int(11) NOT NULL,
  `vitK` int(11) NOT NULL,
  PRIMARY KEY (`food`,`iron`,`vitA`,`vitC`,`vitB1`,`vitB3`,`vitB9`,`selenium`,`vitK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodnutrition`
--

INSERT INTO `foodnutrition` (`food`, `iron`, `vitA`, `vitC`, `vitB1`, `vitB3`, `vitB9`, `selenium`, `vitK`) VALUES
('beetroot', 1, 0, 0, 0, 0, 1, 0, 0),
('spinach', 0, 1, 1, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `scode` int(5) DEFAULT NULL,
  `sname` varchar(30) DEFAULT NULL,
  `semail` text,
  `password` text,
  `district` varchar(40) DEFAULT NULL,
  `dcoord` varchar(40) DEFAULT NULL,
  `ph` int(13) DEFAULT NULL,
  `princi` varchar(40) DEFAULT NULL,
  `schooltotalstud` int(4) DEFAULT NULL,
  `numberstudentsmdm` int(4) DEFAULT NULL,
  `rpassword` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`scode`, `sname`, `semail`, `password`, `district`, `dcoord`, `ph`, `princi`, `schooltotalstud`, `numberstudentsmdm`, `rpassword`) VALUES
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38038, 'GHSS KONNI', 'ghsskonni@gmail.com', '12345', 'Pathanamthitta', 'ABCD', 1234556789, 'PQRS', 150, 35, '12345'),
(38032, 'RVHSS Konni', 'rvhsskonni@gmail.com', '123456', 'Pathanamthitta', 'qwerty', 1234667889, 'yuio', 680, 280, '123456'),
(4001, 'GOVT HSS ALAPPUZHA', 'ghssalapuzha@gmail.com', '123457', 'Alapuzha', 'wert', 1234123412, 'hjkl', 360, 250, '123457'),
(40023, 'GOVT MHSS AMBALAPPUZHA', 'mhssalapuzha@gmail.com', '123456', 'Alapuzha', 'fghjk', 1221346789, 'asdf', 126, 38, '123456'),
(38038, 'GHSS KONNI', 'ghsskonni@gmail.com', '12345', 'Pathanamthitta', 'ABCD', 1234556789, 'PQRS', 150, 35, '12345'),
(38032, 'RVHSS Konni', 'rvhsskonni@gmail.com', '123456', 'Pathanamthitta', 'qwerty', 1234667889, 'yuio', 680, 280, '123456'),
(4001, 'GOVT HSS ALAPPUZHA', 'ghssalapuzha@gmail.com', '123457', 'Alapuzha', 'wert', 1234123412, 'hjkl', 360, 250, '123457'),
(40023, 'GOVT MHSS AMBALAPPUZHA', 'mhssalapuzha@gmail.com', '123456', 'Alapuzha', 'fghjk', 1221346789, 'asdf', 126, 38, '123456'),
(38038, 'GHSS KONNI', 'ghsskonni@gmail.com', '12345', 'Pathanamthitta', 'ABCD', 1234556789, 'PQRS', 150, 35, '12345'),
(38032, 'RVHSS Konni', 'rvhsskonni@gmail.com', '123456', 'Pathanamthitta', 'qwerty', 1234667889, 'yuio', 680, 280, '123456'),
(4001, 'GOVT HSS ALAPPUZHA', 'ghssalapuzha@gmail.com', '123457', 'Alapuzha', 'wert', 1234123412, 'hjkl', 360, 250, '123457'),
(40023, 'GOVT MHSS AMBALAPPUZHA', 'mhssalapuzha@gmail.com', '123456', 'Alapuzha', 'fghjk', 1221346789, 'asdf', 126, 38, '123456');

-- --------------------------------------------------------

--
-- Table structure for table `registers`
--

CREATE TABLE IF NOT EXISTS `registers` (
  `scode` int(5) DEFAULT NULL,
  `sname` varchar(30) DEFAULT NULL,
  `semail` text,
  `password` text,
  `district` varchar(40) DEFAULT NULL,
  `dcoord` varchar(40) DEFAULT NULL,
  `ph` int(13) DEFAULT NULL,
  `princi` varchar(40) DEFAULT NULL,
  `schooltotalstud` int(4) DEFAULT NULL,
  `numberstudentsmdm` int(4) DEFAULT NULL,
  `rpassword` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registers`
--

INSERT INTO `registers` (`scode`, `sname`, `semail`, `password`, `district`, `dcoord`, `ph`, `princi`, `schooltotalstud`, `numberstudentsmdm`, `rpassword`) VALUES
(38038, 'GHSS KONNI', 'ghsskonni@gmail.com', '12345', 'Pathanamthitta', 'ABCD', 1234556789, 'PQRS', 150, 35, '12345'),
(38032, 'RVHSS Konni', 'rvhsskonni@gmail.com', '123456', 'Pathanamthitta', 'qwerty', 1234667889, 'yuio', 680, 280, '123456'),
(4001, 'GOVT HSS ALAPPUZHA', 'ghssalapuzha@gmail.com', '123457', 'Alapuzha', 'wert', 1234123412, 'hjkl', 360, 250, '123457'),
(40023, 'GOVT MHSS AMBALAPPUZHA', 'mhssalapuzha@gmail.com', '123456', 'Alapuzha', 'fghjk', 1221346789, 'asdf', 126, 38, '123456'),
(48048, 'GHSS Kadavoor Alapuzha', 'ghsskadavoor@gmail.com', '12345', 'Alapuzha', 'tttt', 1234123456, 'wwww', 345, 50, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `schooldiseasenew`
--

CREATE TABLE IF NOT EXISTS `schooldiseasenew` (
  `scode` int(11) NOT NULL,
  `anemia` int(11) NOT NULL,
  `Night_Blindness` int(11) NOT NULL,
  `Haemophilia` int(11) NOT NULL,
  `Scurvy` int(11) NOT NULL,
  `beriberi` int(11) NOT NULL,
  PRIMARY KEY (`scode`,`anemia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schooldiseasenew`
--

INSERT INTO `schooldiseasenew` (`scode`, `anemia`, `Night_Blindness`, `Haemophilia`, `Scurvy`, `beriberi`) VALUES
(4001, 0, 1, 1, 1, 0),
(38032, 1, 1, 0, 0, 0),
(38038, 0, 1, 0, 1, 1),
(40023, 0, 0, 1, 1, 0),
(48048, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `email`, `username`, `password`) VALUES
('vyshnavi', 'vysh1@gmail.com', 'vysh', '0'),
('jiluna', 'jiluna@gmail.com', 'jilu', '$5$rounds=535000$OCQuBtyM4jz5sjgN$BrjwSTk63HYPJXuPHe4DDBhPmtCAZWx7LZoS64B4n4/'),
('amal', 'amal@gmail.com', 'amall', '$5$rounds=535000$o7BNB6DLPLZHt8mr$LnRD7C/4ny.ESdIKw7XIbjEWUp8tUDe/1I2fsRoDE56'),
('akash', 'akash@gmail.com', 'akashh', '1234');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
