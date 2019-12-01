CREATE DATABASE  IF NOT EXISTS `Group_15_Project_CRM` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Group_15_Project_CRM`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: Group_15_Project_CRM
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Opportunity`
--

DROP TABLE IF EXISTS `Opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Opportunity` (
  `Salesman_SSN` int(11) DEFAULT NULL,
  `Request_Number` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Opportunity_Number` int(11) NOT NULL,
  `Requirements` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Opportunity_Number`),
  KEY `Request_Number_idx` (`Request_Number`),
  KEY `SalesMan_idx` (`Salesman_SSN`),
  CONSTRAINT `Request_Number` FOREIGN KEY (`Request_Number`) REFERENCES `request_for_proposal` (`Request_Number`),
  CONSTRAINT `SalesMan` FOREIGN KEY (`Salesman_SSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Opportunity`
--

LOCK TABLES `Opportunity` WRITE;
/*!40000 ALTER TABLE `Opportunity` DISABLE KEYS */;
INSERT INTO `Opportunity` VALUES (441504129,1000,'Installation',1,'Windows domain installation and setup'),(441504129,1001,'Installation',2,'New Server Rack'),(441504129,1003,'Installation',3,'20 new desktops');
/*!40000 ALTER TABLE `Opportunity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 15:41:26
