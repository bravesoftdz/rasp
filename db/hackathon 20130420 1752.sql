-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.11-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema hackathon
--

CREATE DATABASE IF NOT EXISTS hackathon;
USE hackathon;

--
-- Definition of table `anemometru`
--

DROP TABLE IF EXISTS `anemometru`;
CREATE TABLE `anemometru` (
  `UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `speed` float NOT NULL,
  PRIMARY KEY (`UTC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anemometru`
--

/*!40000 ALTER TABLE `anemometru` DISABLE KEYS */;
/*!40000 ALTER TABLE `anemometru` ENABLE KEYS */;


--
-- Definition of table `dez`
--

DROP TABLE IF EXISTS `dez`;
CREATE TABLE `dez` (
  `UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dez` int(10) unsigned NOT NULL,
  `resolution` int(10) unsigned NOT NULL,
  PRIMARY KEY (`UTC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `dez` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
