-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 217.182.78.23    Database: mechanic-sql-tut
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `CARS`
--

DROP TABLE IF EXISTS `CARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CARS` (
  `id_plate` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `engine_cap_dm3` int(11) DEFAULT NULL,
  `power_horse` int(11) DEFAULT NULL,
  `prod_year` int(11) NOT NULL,
  PRIMARY KEY (`id_plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CUSTOMERS_COMPANY`
--

DROP TABLE IF EXISTS `CUSTOMERS_COMPANY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CUSTOMERS_COMPANY` (
  `id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `nip` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CUSTOMERS_EMPLOYEE`
--

DROP TABLE IF EXISTS `CUSTOMERS_EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CUSTOMERS_EMPLOYEE` (
  `id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `CUSTOMERS_COMPANY_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CUSTOMES_EMPLOEE_CUSTOMERS_COMPANY1_idx` (`CUSTOMERS_COMPANY_id`),
  CONSTRAINT `fk_CUSTOMES_EMPLOEE_CUSTOMERS_COMPANY1` FOREIGN KEY (`CUSTOMERS_COMPANY_id`) REFERENCES `CUSTOMERS_COMPANY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FAILURES`
--

DROP TABLE IF EXISTS `FAILURES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FAILURES` (
  `id` bigint(20) NOT NULL,
  `status` enum('WAITING_FOR_DIAGNOSE','WAITING_FOR_PARTS','WAITING_FOR_PICKING_UP','IN_PROGRESS','DONE') DEFAULT NULL,
  `enter_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `payment` double DEFAULT NULL,
  `part_cost` double DEFAULT NULL,
  `CARS_id_plate` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_FAILURES_CARS1_idx` (`CARS_id_plate`),
  CONSTRAINT `fk_FAILURES_CARS1` FOREIGN KEY (`CARS_id_plate`) REFERENCES `CARS` (`id_plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `R_CUSTOMERS_EMPLOYEE_CARS`
--

DROP TABLE IF EXISTS `R_CUSTOMERS_EMPLOYEE_CARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `R_CUSTOMERS_EMPLOYEE_CARS` (
  `CUSTOMERS_EMPLOYEE_id` bigint(20) NOT NULL,
  `CARS_id_plate` varchar(45) NOT NULL,
  PRIMARY KEY (`CUSTOMERS_EMPLOYEE_id`,`CARS_id_plate`),
  KEY `fk_CUSTOMES_EMPLOEE_has_CARS_CARS1_idx` (`CARS_id_plate`),
  KEY `fk_CUSTOMES_EMPLOEE_has_CARS_CUSTOMES_EMPLOEE1_idx` (`CUSTOMERS_EMPLOYEE_id`),
  CONSTRAINT `fk_CUSTOMES_EMPLOEE_has_CARS_CARS1` FOREIGN KEY (`CARS_id_plate`) REFERENCES `CARS` (`id_plate`),
  CONSTRAINT `fk_CUSTOMES_EMPLOEE_has_CARS_CUSTOMES_EMPLOEE1` FOREIGN KEY (`CUSTOMERS_EMPLOYEE_id`) REFERENCES `CUSTOMERS_EMPLOYEE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-15 14:16:01
