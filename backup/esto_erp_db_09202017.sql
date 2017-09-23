-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: esto_erp_db
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tberp_address`
--

DROP TABLE IF EXISTS `tberp_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_address` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Line1` varchar(100) DEFAULT NULL,
  `Line2` varchar(100) DEFAULT NULL,
  `Line3` varchar(100) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `City` varchar(60) DEFAULT NULL,
  `State` varchar(60) DEFAULT NULL,
  `CountryId` bigint(20) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_address`
--

LOCK TABLES `tberp_address` WRITE;
/*!40000 ALTER TABLE `tberp_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_contact`
--

DROP TABLE IF EXISTS `tberp_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_contact` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Suffix` varchar(10) DEFAULT NULL,
  `Title` varchar(10) DEFAULT NULL,
  `FirstName` varchar(60) DEFAULT NULL,
  `MiddleName` varchar(60) DEFAULT NULL,
  `LastName` varchar(60) DEFAULT NULL,
  `Surname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `WorkPhone` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(15) DEFAULT NULL,
  `MobilPhone` varchar(15) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_contact`
--

LOCK TABLES `tberp_contact` WRITE;
/*!40000 ALTER TABLE `tberp_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_country`
--

DROP TABLE IF EXISTS `tberp_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_country` (
  `CountryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(3) DEFAULT NULL,
  `CountryName` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_country`
--

LOCK TABLES `tberp_country` WRITE;
/*!40000 ALTER TABLE `tberp_country` DISABLE KEYS */;
INSERT INTO `tberp_country` VALUES (1,'MEX','México');
/*!40000 ALTER TABLE `tberp_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_customer`
--

DROP TABLE IF EXISTS `tberp_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_customer` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone1` varchar(20) DEFAULT NULL,
  `Phone2` varchar(20) DEFAULT NULL,
  `AddressId` bigint(20) DEFAULT NULL,
  `ContactId` bigint(20) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_customer`
--

LOCK TABLES `tberp_customer` WRITE;
/*!40000 ALTER TABLE `tberp_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_customer_address`
--

DROP TABLE IF EXISTS `tberp_customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_customer_address` (
  `AddressId` bigint(20) NOT NULL,
  `CustomerId` bigint(20) NOT NULL,
  PRIMARY KEY (`AddressId`,`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_customer_address`
--

LOCK TABLES `tberp_customer_address` WRITE;
/*!40000 ALTER TABLE `tberp_customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_customer_contact`
--

DROP TABLE IF EXISTS `tberp_customer_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_customer_contact` (
  `ContactId` bigint(20) NOT NULL,
  `CustomerId` bigint(20) NOT NULL,
  PRIMARY KEY (`ContactId`,`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_customer_contact`
--

LOCK TABLES `tberp_customer_contact` WRITE;
/*!40000 ALTER TABLE `tberp_customer_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_customer_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_master`
--

DROP TABLE IF EXISTS `tberp_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_master` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` int(11) DEFAULT NULL,
  `Code` varchar(10) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_master`
--

LOCK TABLES `tberp_master` WRITE;
/*!40000 ALTER TABLE `tberp_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_product`
--

DROP TABLE IF EXISTS `tberp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_product` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsActive` bit(1) DEFAULT NULL,
  `Code` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `CategoryId` bigint(20) NOT NULL,
  `Weight` float DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Width` float DEFAULT NULL,
  `Height` float DEFAULT NULL,
  `Large` float DEFAULT NULL,
  `MinStock` int(11) DEFAULT NULL,
  `MaxStock` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_product`
--

LOCK TABLES `tberp_product` WRITE;
/*!40000 ALTER TABLE `tberp_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_product_component`
--

DROP TABLE IF EXISTS `tberp_product_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_product_component` (
  `Type` int(11) NOT NULL,
  `ProductId` bigint(20) NOT NULL,
  `ComponentId` bigint(20) NOT NULL,
  `Quantity` float NOT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Type`,`ProductId`,`ComponentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_product_component`
--

LOCK TABLES `tberp_product_component` WRITE;
/*!40000 ALTER TABLE `tberp_product_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_product_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_product_price_detail`
--

DROP TABLE IF EXISTS `tberp_product_price_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_product_price_detail` (
  `DetailId` bigint(20) NOT NULL AUTO_INCREMENT,
  `HeaderId` bigint(20) NOT NULL,
  `From` int(20) DEFAULT NULL,
  `To` int(20) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`DetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_product_price_detail`
--

LOCK TABLES `tberp_product_price_detail` WRITE;
/*!40000 ALTER TABLE `tberp_product_price_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_product_price_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_product_price_header`
--

DROP TABLE IF EXISTS `tberp_product_price_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_product_price_header` (
  `HeaderId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`HeaderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_product_price_header`
--

LOCK TABLES `tberp_product_price_header` WRITE;
/*!40000 ALTER TABLE `tberp_product_price_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_product_price_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_provider`
--

DROP TABLE IF EXISTS `tberp_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_provider` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone1` varchar(20) DEFAULT NULL,
  `Phone2` varchar(20) DEFAULT NULL,
  `AddressId` bigint(20) DEFAULT NULL,
  `ContactId` bigint(20) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_provider`
--

LOCK TABLES `tberp_provider` WRITE;
/*!40000 ALTER TABLE `tberp_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_provider_address`
--

DROP TABLE IF EXISTS `tberp_provider_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_provider_address` (
  `AddressId` bigint(20) NOT NULL,
  `ProviderId` bigint(20) NOT NULL,
  PRIMARY KEY (`AddressId`,`ProviderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_provider_address`
--

LOCK TABLES `tberp_provider_address` WRITE;
/*!40000 ALTER TABLE `tberp_provider_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_provider_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_provider_contact`
--

DROP TABLE IF EXISTS `tberp_provider_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_provider_contact` (
  `ContactId` bigint(20) NOT NULL,
  `ProviderId` bigint(20) NOT NULL,
  PRIMARY KEY (`ContactId`,`ProviderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_provider_contact`
--

LOCK TABLES `tberp_provider_contact` WRITE;
/*!40000 ALTER TABLE `tberp_provider_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_provider_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_quotation`
--

DROP TABLE IF EXISTS `tberp_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_quotation` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProviderId` bigint(20) DEFAULT NULL,
  `SubmaterialId` bigint(20) DEFAULT NULL,
  `ProviderCode` varchar(20) DEFAULT NULL,
  `LeadTime` int(11) DEFAULT NULL,
  `AdditionalCost` float DEFAULT NULL,
  `From` datetime DEFAULT NULL,
  `To` datetime DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_quotation`
--

LOCK TABLES `tberp_quotation` WRITE;
/*!40000 ALTER TABLE `tberp_quotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_range`
--

DROP TABLE IF EXISTS `tberp_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_range` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` int(11) DEFAULT NULL,
  `ItemKey` bigint(20) DEFAULT NULL,
  `From` float DEFAULT NULL,
  `To` float DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_range`
--

LOCK TABLES `tberp_range` WRITE;
/*!40000 ALTER TABLE `tberp_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tberp_submaterial`
--

DROP TABLE IF EXISTS `tberp_submaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tberp_submaterial` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsActive` bit(1) NOT NULL,
  `Code` varchar(20) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Weight` int(20) DEFAULT NULL,
  `MinStock` int(20) DEFAULT NULL,
  `MaxStock` int(20) DEFAULT NULL,
  `UOMId` bigint(20) DEFAULT NULL,
  `CategoryId` bigint(20) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tberp_submaterial`
--

LOCK TABLES `tberp_submaterial` WRITE;
/*!40000 ALTER TABLE `tberp_submaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `tberp_submaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsecurity_menu`
--

DROP TABLE IF EXISTS `tbsecurity_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsecurity_menu` (
  `MenuId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`MenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsecurity_menu`
--

LOCK TABLES `tbsecurity_menu` WRITE;
/*!40000 ALTER TABLE `tbsecurity_menu` DISABLE KEYS */;
INSERT INTO `tbsecurity_menu` VALUES (1,'System','System Menu',10,'',1,'2015-11-12 16:30:12',1,'2017-09-01 21:51:52'),(2,'Help','Help Menu',2000,'',1,'2015-11-12 16:30:12',1,'2017-08-27 20:13:47'),(3,'Catalogs','Catalogs',20,'',1,'2017-09-01 20:20:00',1,'2017-09-12 20:20:00');
/*!40000 ALTER TABLE `tbsecurity_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsecurity_module`
--

DROP TABLE IF EXISTS `tbsecurity_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsecurity_module` (
  `ModuleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `MenuId` bigint(20) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ModuleId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsecurity_module`
--

LOCK TABLES `tbsecurity_module` WRITE;
/*!40000 ALTER TABLE `tbsecurity_module` DISABLE KEYS */;
INSERT INTO `tbsecurity_module` VALUES (1,'Menus','System Menu Options',1,1010,'',1,'2015-11-12 16:30:13',1,'2017-09-01 21:52:01'),(2,'Modules','System modules',1,1020,'',1,'2015-11-12 16:30:13',1,'2015-11-12 16:30:13'),(3,'Roles','System User\'s roles',1,1030,'',1,'2015-11-12 16:30:13',1,'2015-11-12 16:30:13'),(4,'Users','System Users Catalog',1,1040,'',1,'2015-11-12 16:30:13',1,'2015-11-12 16:30:13'),(5,'Exit','Exit',1,1050,'',1,'2015-11-12 16:30:13',1,'2015-11-12 16:30:13'),(6,'About','About',2,200010,'',1,'2015-11-12 16:30:13',1,'2015-11-13 08:43:02'),(7,'Customers','Customers catalog',3,2010,'',1,'2017-09-01 20:20:00',1,'2017-09-19 09:41:07'),(8,'Providers','Providers catalog',3,2020,'',1,'2017-09-09 01:10:16',1,'2017-09-09 01:12:47'),(9,'Master Tables','Master Tables',3,2030,'',1,'2017-09-12 21:07:20',1,'2017-09-12 23:47:20'),(10,'Submaterials','Submaterials',3,2040,'',1,'2017-09-14 22:44:59',1,'2017-09-14 22:44:59'),(11,'Products','Products',3,2050,'',1,'2017-09-15 22:48:29',1,'2017-09-15 22:48:29');
/*!40000 ALTER TABLE `tbsecurity_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsecurity_role`
--

DROP TABLE IF EXISTS `tbsecurity_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsecurity_role` (
  `RoleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `EntryUserId` bigint(20) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsecurity_role`
--

LOCK TABLES `tbsecurity_role` WRITE;
/*!40000 ALTER TABLE `tbsecurity_role` DISABLE KEYS */;
INSERT INTO `tbsecurity_role` VALUES (1,'Admin','System Administration Role','',1,'2015-11-13 08:51:51',1,'2017-09-15 22:48:42');
/*!40000 ALTER TABLE `tbsecurity_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsecurity_rolemodule`
--

DROP TABLE IF EXISTS `tbsecurity_rolemodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsecurity_rolemodule` (
  `RoleId` bigint(20) NOT NULL,
  `ModuleId` bigint(20) NOT NULL,
  `IsCreated` bit(1) DEFAULT NULL,
  `IsUpdated` bit(1) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`RoleId`,`ModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsecurity_rolemodule`
--

LOCK TABLES `tbsecurity_rolemodule` WRITE;
/*!40000 ALTER TABLE `tbsecurity_rolemodule` DISABLE KEYS */;
INSERT INTO `tbsecurity_rolemodule` VALUES (1,1,'','',''),(1,2,'','',''),(1,3,'','',''),(1,4,'','',''),(1,5,'','',''),(1,6,'','',''),(1,7,'','',''),(1,8,'','',''),(1,9,'','',''),(1,10,'','',''),(1,11,'','','');
/*!40000 ALTER TABLE `tbsecurity_rolemodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsecurity_status`
--

DROP TABLE IF EXISTS `tbsecurity_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsecurity_status` (
  `StatusId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`StatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsecurity_status`
--

LOCK TABLES `tbsecurity_status` WRITE;
/*!40000 ALTER TABLE `tbsecurity_status` DISABLE KEYS */;
INSERT INTO `tbsecurity_status` VALUES (1,'Inactive'),(2,'Active'),(3,'All');
/*!40000 ALTER TABLE `tbsecurity_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsecurity_user`
--

DROP TABLE IF EXISTS `tbsecurity_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsecurity_user` (
  `UserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(35) DEFAULT NULL,
  `Password` varchar(35) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `EntryUserId` bit(1) DEFAULT NULL,
  `EntryDate` datetime DEFAULT NULL,
  `ModUserId` bigint(20) DEFAULT NULL,
  `ModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsecurity_user`
--

LOCK TABLES `tbsecurity_user` WRITE;
/*!40000 ALTER TABLE `tbsecurity_user` DISABLE KEYS */;
INSERT INTO `tbsecurity_user` VALUES (1,'Admin','E3AFED0047B08059D0FADA10F400C1E5','','','2015-11-12 16:30:13',1,'2017-08-31 21:06:43'),(2,'user','8F9BFE9D1345237CB3B2B205864DA075','','','2017-09-09 12:14:47',1,'2017-09-09 12:15:57');
/*!40000 ALTER TABLE `tbsecurity_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsecurity_usermodule`
--

DROP TABLE IF EXISTS `tbsecurity_usermodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsecurity_usermodule` (
  `UserId` bigint(20) NOT NULL,
  `ModuleId` bigint(20) NOT NULL,
  `IsCreated` bit(1) DEFAULT NULL,
  `IsUpdated` bit(1) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsecurity_usermodule`
--

LOCK TABLES `tbsecurity_usermodule` WRITE;
/*!40000 ALTER TABLE `tbsecurity_usermodule` DISABLE KEYS */;
INSERT INTO `tbsecurity_usermodule` VALUES (2,7,'','','\0'),(2,5,'\0','\0','\0'),(2,6,'\0','\0','\0'),(2,8,'','','\0');
/*!40000 ALTER TABLE `tbsecurity_usermodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsecurity_userrole`
--

DROP TABLE IF EXISTS `tbsecurity_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsecurity_userrole` (
  `UserId` bigint(20) NOT NULL,
  `RoleId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsecurity_userrole`
--

LOCK TABLES `tbsecurity_userrole` WRITE;
/*!40000 ALTER TABLE `tbsecurity_userrole` DISABLE KEYS */;
INSERT INTO `tbsecurity_userrole` VALUES (1,1);
/*!40000 ALTER TABLE `tbsecurity_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwsecurity_get_userrights`
--

DROP TABLE IF EXISTS `vwsecurity_get_userrights`;
/*!50001 DROP VIEW IF EXISTS `vwsecurity_get_userrights`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vwsecurity_get_userrights` AS SELECT 
 1 AS `UserId`,
 1 AS `MenuId`,
 1 AS `MenuName`,
 1 AS `MenuOrder`,
 1 AS `ModuleId`,
 1 AS `ModuleName`,
 1 AS `ItemOrder`,
 1 AS `IsCreated`,
 1 AS `IsUpdated`,
 1 AS `IsDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'esto_erp_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_address`(
	  IN Type_p			INTEGER
	, IN AddressId_p	BIGINT
	, IN Id_p			BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = 'Database transaction error!';

	IF NOT EXISTS(SELECT * FROM tberp_address CT WHERE CT.Id = AddressId_p) THEN
		SET	Msg_p = 'Address does not exist. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE Id = AddressId_p;
			IF Type_p = 0 THEN 		
				DELETE FROM tberp_customer_address WHERE CustomerId = Id_p AND AddressId = AddressId_p;
			ELSE 					
				DELETE FROM tberp_provider_address WHERE ProviderId = Id_p AND AddressId = AddressId_p;
            END IF;
            SET Msg_p = '';
		COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_component` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_component`(
	  IN Type_p 		INTEGER
	, IN ProductId_p	BIGINT
	, IN ComponentId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';
	IF NOT EXISTS(SELECT * FROM tberp_product_component PC WHERE PC.Type = Type_p AND PC.ProductId = ProductId_p AND PC.ComponentId = ComponentId_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSE
		DELETE FROM tberp_product_component WHERE `Type` = Type_p AND `ProductId` = ProductId_p AND `ComponentId` = ComponentId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_contact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_contact`(
	  IN Type_p			INTEGER
	, IN ContactId_p 	BIGINT
	, IN Id_p			BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = 'Database transaction error!';

	IF NOT EXISTS(SELECT * FROM tberp_contact CT WHERE CT.Id = ContactId_p) THEN
		SET	Msg_p = 'Contact does not exist. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_contact WHERE Id = ContactId_p;
            IF Type_p = 0 THEN 		
				DELETE FROM tberp_customer_contact WHERE CustomerId = Id_p AND ContactId = ContactId_p;
			ELSE 					
				DELETE FROM tberp_provider_contact WHERE ProviderId = Id_p AND ContactId = ContactId_p;
            END IF;
            SET Msg_p = '';
		COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_customer`(
	  IN  Id_p 	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_customer CT WHERE CT.Id = Id_p) THEN
		SET	Msg_p = 'Customer does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_customer_contact CC WHERE CC.CustomerId = Id_p) THEN
		SET	Msg_p = 'Customer has still contacts. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_customer_address CA WHERE CA.CustomerId = Id_p) THEN
		SET	Msg_p = 'Customer has still addresses. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE Id IN (SELECT CS.AddressId FROM tberp_customer CS WHERE CS.Id = Id_p);
            DELETE FROM tberp_customer_address WHERE CustomerId = Id_p AND AddressId IN (SELECT CS.AddressId FROM tberp_customer CS WHERE CS.Id = Id_p);
            DELETE FROM tberp_contact WHERE Id IN (SELECT CS.ContactId FROM tberp_customer CS WHERE CS.Id = Id_p);
            DELETE FROM tberp_customer_contact WHERE CustomerId = Id_p AND ContactId IN (SELECT CS.ContactId FROM tberp_customer CS WHERE CS.Id = Id_p);
			DELETE FROM tberp_customer WHERE Id = Id_p;
        COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_master` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_master`(
	  IN Id_p	BIGINT
	, IN Type_p	INTEGER
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_master MS WHERE MS.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSEIF Type_p = 0 AND EXISTS(SELECT * FROM tberp_product PR WHERE PR.CategoryId = Id_p) THEN
		SET	Msg_p = 'There are products still related with this record. Please verify!';
	ELSEIF Type_p = 1 AND EXISTS(SELECT * FROM tberp_submaterial PR WHERE PR.CategoryId = Id_p) THEN
		SET	Msg_p = 'There are submaterials still related with this record. Please verify!';
	ELSEIF Type_p = 2 AND EXISTS(SELECT * FROM tberp_submaterial PR WHERE PR.UOMId = Id_p) THEN
		SET	Msg_p = 'There are submaterials still related with this record. Please verify!';
	ELSE
		DELETE FROM tberp_master WHERE Id = Id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_product`(
	  IN Id_p	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_product SM WHERE SM.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSE
		DELETE FROM tberp_product WHERE Id = Id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_product_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`esto_usr`@`localhost` PROCEDURE `sperp_delete_product_category`(
	  IN CategoryId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_product_category PC WHERE PC.CategoryId = CategoryId_p) THEN
		SET	Msg_p = 'Product category does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_product PR WHERE PR.CategoryId = CategoryId_p) THEN
		SET	Msg_p = 'Category has still products. Please verify!';
	ELSE
		DELETE FROM tberp_product_category WHERE CategoryId = CategoryId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_provider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_provider`(
	  IN Id_p 	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_provider PR WHERE PR.Id = Id_p) THEN
		SET	Msg_p = 'Provider does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider_contact PC WHERE PC.ProviderId = Id_p) THEN
		SET	Msg_p = 'Provider has still contacts. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider_address PA WHERE PA.ProviderId = Id_p) THEN
		SET	Msg_p = 'Provider has still addresses. Please verify!';
	ELSE
		START TRANSACTION;
			DELETE FROM tberp_address WHERE Id IN (SELECT PR.AddressId FROM tberp_provider PR WHERE PR.Id = Id_p);
            DELETE FROM tberp_provider_address WHERE ProviderId = Id_p AND AddressId IN (SELECT PR.AddressId FROM tberp_provider PR WHERE PR.Id = Id_p);
            DELETE FROM tberp_contact WHERE Id IN (SELECT PR.ContactId FROM tberp_provider PR WHERE PR.Id = Id_p);
            DELETE FROM tberp_provider_contact WHERE ProviderId = Id_p AND ContactId IN (SELECT PR.ContactId FROM tberp_provider PR WHERE PR.Id = Id_p);
			DELETE FROM tberp_provider WHERE Id = Id_p;
        COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_quotation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_quotation`(
	  IN Id_p	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = 1 AND RN.ItemKey = Id_p) THEN
		SET	Msg_p = 'There is still cost records for this quotation. Please verify!';
	ELSE
		DELETE FROM tberp_quotation WHERE Id = Id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_range`(
	  IN Id_p	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_range RN WHERE RN.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSE
		DELETE FROM tberp_range WHERE Id = Id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_delete_submaterial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_delete_submaterial`(
	  IN Id_p	BIGINT
	, OUT Msg_p	VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Id = Id_p) THEN
		SET	Msg_p = 'Record does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_product_component PC WHERE PC.Type = 1 AND PC.ComponentId = Id_p) THEN
		SET	Msg_p = 'There are products still related with this record. Please verify!';
	ELSE
		DELETE FROM tberp_submaterial WHERE Id = Id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_addresses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_addresses`(
	  IN Type_p INTEGER
	, IN Id_p 	BIGINT
)
BEGIN
	IF Type_p = 0 THEN		
		SELECT
			  AD.`Id`
			, AD.`Line1`
			, AD.`Line2`
			, AD.`Line3`
			, AD.`ZipCode`
			, AD.`City`
			, AD.`State`

			, CO.`CountryId`
			, CO.`Code`
			, CO.`CountryName`
		FROM
			tberp_customer_address CA
			INNER JOIN tberp_address AD ON
				AD.Id = CA.AddressId
			INNER JOIN tberp_country CO ON
				CO.CountryId = AD.CountryId
		WHERE
			CA.CustomerId = Id_p;
	ELSE	
		SELECT
			  AD.`Id`
			, AD.`Line1`
			, AD.`Line2`
			, AD.`Line3`
			, AD.`ZipCode`
			, AD.`City`
			, AD.`State`

			, CO.`CountryId`
			, CO.`Code`
			, CO.`CountryName`
		FROM
			tberp_provider_address CA
			INNER JOIN tberp_address AD ON
				AD.Id = CA.AddressId
			INNER JOIN tberp_country CO ON
				CO.CountryId = AD.CountryId
		WHERE
			CA.ProviderId = Id_p;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_components` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_components`(
	  IN Type_p			INTEGER
    , IN ProductId_p	BIGINT
)
BEGIN
	IF Type_p = 0 THEN	
		SELECT
			  MS.`Id`			AS CategoryId
			, MS.`Code`			AS CategoryCode
			, MS.`Description`	AS CategoryDescription
			, CM.`Id`			AS ComponentId
			, CM.`Code`			AS ComponentCode
			, CM.`Description`	AS ComponentDescription
			, PC.`Quantity`
		FROM
			tberp_product_component PC
			INNER JOIN tberp_product CM ON
				CM.Id = PC.ComponentId
			INNER JOIN tberp_master MS ON
					MS.Type	= PC.Type
                AND MS.Id 	= CM.CategoryId
		WHERE
				PC.Type 		= Type_p
            AND PC.ProductId 	= ProductId_p;
	ELSE			
		SELECT
			  MS.`Id`			AS CategoryId
			, MS.`Code`			AS CategoryCode
			, MS.`Description`	AS CategoryDescription
			, CM.`Id`			AS ComponentId
			, CM.`Code`			AS ComponentCode
			, CM.`Description`	AS ComponentDescription
			, PC.`Quantity`
		FROM
			tberp_product_component PC
			INNER JOIN tberp_submaterial CM ON
				CM.Id = PC.ComponentId
			INNER JOIN tberp_master MS ON
					MS.Type	= PC.Type
                AND MS.Id 	= CM.CategoryId
		WHERE
				PC.Type 		= Type_p
            AND PC.ProductId 	= ProductId_p;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_component_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_component_list`(
	  IN Type_p 		INTEGER
    , IN CategoryId_p 	INTEGER
)
BEGIN
	IF Type_p = 0 THEN	
		SELECT
			  PR.`Id`
			, PR.`Code`
			, PR.`Description`
		FROM
			tberp_product PR
		WHERE
			PR.CategoryId = CategoryId_p;
	ELSE			
		SELECT
			  SB.`Id`
			, SB.`Code`
			, SB.`Description`
		FROM
			tberp_submaterial SB
		WHERE
			SB.CategoryId = CategoryId_p;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_contacts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_contacts`(
	  IN Type_p INTEGER
	, IN Id_p 	BIGINT
)
BEGIN
	IF Type_p = 0 THEN			
		SELECT
			  CT.`Id`
			, CT.`Suffix`
			, CT.`Title`
			, CT.`FirstName`
			, CT.`MiddleName`
			, CT.`LastName`
			, CT.`Surname`
			, CT.`Email`
			, CT.`WorkPhone`
			, CT.`HomePhone`
			, CT.`MobilPhone`
		FROM
			tberp_customer_contact CC
			INNER JOIN tberp_contact CT ON
				CT.Id = CC.ContactId
		WHERE
			CC.CustomerId = Id_p;
	ELSE			
		SELECT
			  CT.`Id`
			, CT.`Suffix`
			, CT.`Title`
			, CT.`FirstName`
			, CT.`MiddleName`
			, CT.`LastName`
			, CT.`Surname`
			, CT.`Email`
			, CT.`WorkPhone`
			, CT.`HomePhone`
			, CT.`MobilPhone`
		FROM
			tberp_provider_contact CC
			INNER JOIN tberp_contact CT ON
				CT.Id = CC.ContactId
		WHERE
			CC.ProviderId = Id_p;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_custumers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_custumers`()
BEGIN
	SELECT
		  CS.`Id`
		, CS.`Code`
		, CS.`Name`
		, CS.`Phone1`
		, CS.`Phone2`
		, CS.`Website`
		, CS.`Notes`

		, CS.`AddressId`
		, AD.`Line1`
		, AD.`Line2`
		, AD.`Line3`
		, AD.`ZipCode`
		, AD.`City`
		, AD.`State`

		, CO.`CountryId`
        , CO.`Code`
        , CO.`CountryName`

		, CS.`ContactId`
		, CT.`Suffix`
		, CT.`Title`
		, CT.`FirstName`
		, CT.`MiddleName`
		, CT.`LastName`
		, CT.`Surname`
		, CT.`Email`
		, CT.`WorkPhone`
		, CT.`HomePhone`
		, CT.`MobilPhone`
    FROM
		tberp_customer CS
        INNER JOIN tberp_address AD ON
			AD.Id = CS.AddressId
		INNER JOIN tberp_country CO ON
			CO.CountryId = AD.CountryId
        INNER JOIN tberp_contact CT ON
			CT.Id = CS.ContactId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_masters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_masters`(
	IN Type_p INTEGER
)
BEGIN
	SELECT
		  MS.`Id`
		, MS.`Code`
		, MS.`Description`
    FROM
		tberp_master MS
	WHERE
		MS.Type = Type_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_products`()
BEGIN
	SELECT
		  PR.`Id`
		, PR.`IsActive`
		, PR.`Code`
        , PR.`Description`
        , PR.`Weight`
        , PR.`Color`
        , PR.`Width`
        , PR.`Height`
        , PR.`Large`
        , PR.`MinStock`
        , PR.`MaxStock`
        , PR.`CategoryId`
        , MS.`Code` 		AS `CategoryCode`
        , MS.`Description`	AS `Category`
        , PR.`Notes`
    FROM
		tberp_product PR
		INNER JOIN tberp_master MS ON
			MS.Id = PR.CategoryId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_providers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_providers`()
BEGIN
	SELECT
		  PR.`Id`
		, PR.`Code`
		, PR.`Name`
		, PR.`Phone1`
		, PR.`Phone2`
		, PR.`Website`
		, PR.`Notes`

		, PR.`AddressId`
		, AD.`Line1`
		, AD.`Line2`
		, AD.`Line3`
		, AD.`ZipCode`
		, AD.`City`
		, AD.`State`

		, CO.`CountryId`
        , CO.`Code`
        , CO.`CountryName`

		, PR.`ContactId`
		, CT.`Suffix`
		, CT.`Title`
		, CT.`FirstName`
		, CT.`MiddleName`
		, CT.`LastName`
		, CT.`Surname`
		, CT.`Email`
		, CT.`WorkPhone`
		, CT.`HomePhone`
		, CT.`MobilPhone`
    FROM
		tberp_provider PR
        INNER JOIN tberp_address AD ON
			AD.Id = PR.AddressId
		INNER JOIN tberp_country CO ON
			CO.CountryId = AD.CountryId
        INNER JOIN tberp_contact CT ON
			CT.Id = PR.ContactId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_quotations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_quotations`(
	  IN ProviderId_p		BIGINT
	, IN SubmaterialId_p	BIGINT
)
BEGIN
	IF SubmaterialId_p = -1 THEN
		SELECT
			  QT.`Id`
			, SB.`CategoryId`
			, MS.`Code`			AS `CategoryCode`
			, MS.`Description`	AS `CategoryDescription`
			, QT.`SubmaterialId`
			, SB.`Code` 		AS `SubmaterialCode`
			, SB.`Description` 	AS `SubmaterialDescription`
			, QT.`ProviderCode`
			, QT.`LeadTime`
			, QT.`AdditionalCost`
			, QT.`From`
			, QT.`To`
			, QT.`Notes`
		FROM
			tberp_quotation QT
			INNER JOIN tberp_submaterial SB ON
				SB.Id = QT.SubmaterialId
			INNER JOIN tberp_master MS ON
					MS.Type	= 1
				AND MS.Id 	= SB.CategoryId
		WHERE
				QT.ProviderId 	= ProviderId_p
		ORDER BY
			QT.`From`;
	ELSE
		SELECT
			  QT.`Id`
			, SB.`CategoryId`
			, MS.`Code`			AS `CategoryCode`
			, MS.`Description`	AS `CategoryDescription`
			, QT.`SubmaterialId`
			, SB.`Code` 		AS `SubmaterialCode`
			, SB.`Description` 	AS `SubmaterialDescription`
			, QT.`ProviderCode`
			, QT.`LeadTime`
			, QT.`AdditionalCost`
			, QT.`From`
			, QT.`To`
			, QT.`Notes`
		FROM
			tberp_quotation QT
			INNER JOIN tberp_submaterial SB ON
				SB.Id = QT.SubmaterialId
			INNER JOIN tberp_master MS ON
					MS.Type	= 1
				AND MS.Id 	= SB.CategoryId
		WHERE
				QT.ProviderId 		= ProviderId_p
			AND QT.SubmaterialId 	= SubmaterialId_p
		ORDER BY
			QT.`From`;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_quotation_submaterial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_quotation_submaterial`(
	  IN ProviderId_p		BIGINT
)
BEGIN
	SELECT
		TM.*
	FROM (
		SELECT DISTINCT
			  SB.`Id`
			, SB.`Code`
			, SB.`Description`
		FROM
			tberp_submaterial SB
			INNER JOIN tberp_quotation QT ON
				QT.SubmaterialId = SB.Id
		WHERE
			QT.ProviderId  = ProviderId_p
		UNION ALL
		SELECT
			-1
			, ' ALL'
			, ' ALL'
	) TM
	ORDER BY
		TM.`Code`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_ranges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_ranges`(
	  IN Type_p		INTEGER
	, IN ItemKey_p	BIGINT
)
BEGIN
	SELECT
		  RN.`Id`
		, RN.`Type`
		, RN.`ItemKey`
		, RN.`From`
		, RN.`To`
		, RN.`Amount`
    FROM
		tberp_range RN
	WHERE
			RN.Type 	= Type_p
		AND RN.ItemKey	= ItemKey_p
	ORDER BY
		RN.`From`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_get_submaterials` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_get_submaterials`()
BEGIN
	SELECT
		  SM.`Id`
		, SM.`IsActive`
		, SM.`Code`
        , SM.`Description`
        , SM.`Weight`
        , SM.`MinStock`
        , SM.`MaxStock`
        , SM.`UOMId`
        , MU.`Code` 		AS `UOMCode`
        , MU.`Description`	AS `UOM`
        , SM.`CategoryId`
        , MS.`Code` 		AS `CategoryCode`
        , MS.`Description`	AS `Category`
        , SM.`Notes`
    FROM
		tberp_submaterial SM
        INNER JOIN tberp_master MU ON
            MU.Id = SM.UOMId
		INNER JOIN tberp_master MS ON
			MS.Id = SM.CategoryId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_address`(
	  IN Type_p			INTEGER
	, IN Id_p			BIGINT
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60) 
    , IN CountryId_p	BIGINT
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v 		DATETIME;
    DECLARE AddressId_v BIGINT;

	SET Date_v = NOW();
	SET Msg_p = 'Transaction error.';

	START TRANSACTION;
		INSERT tberp_address (
			  `Line1`
			, `Line2`
			, `Line3`
			, `ZipCode`
			, `City`
			, `State`
			, `CountryId`

			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Line1_p
			, Line2_p
			, Line3_p
			, ZipCode_p
			, City_p
			, State_p
			, CountryId_p
			
			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
        SET AddressId_v = last_insert_id();
        IF Type_p = 0 THEN		
			INSERT INTO tberp_customer_address (`AddressId`, `CustomerId`) VALUES ( AddressId_v, Id_p );
		ELSE
			INSERT INTO tberp_provider_address (`AddressId`, `ProviderId`) VALUES ( AddressId_v, Id_p );
        END IF;					
        SET Msg_p = '';
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_component` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_component`(
	  IN Type_p			INTEGER
	, IN ProductId_p	BIGINT
	, IN ComponentId_p	BIGINT
    , IN Quantity_p		FLOAT
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF EXISTS(SELECT * FROM tberp_product_component PC WHERE PC.Type = Type_p AND PC.ProductId = ProductId_p AND PC.ComponentId = ComponentId_p) THEN
		SET	Msg_p = 'Component already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		INSERT tberp_product_component(
			  `Type`
			, `ProductId`
			, `ComponentId`
            , `Quantity`
            
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Type_p
			, ProductId_p
			, ComponentId_p
			, Quantity_p
            
			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_contact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_contact`(
	  IN Type_p			INTEGER
	, IN Id_p			BIGINT
	, IN Suffix_p		VARCHAR(10)
	, IN Title_p		VARCHAR(10)
	, IN FirstName_p	VARCHAR(60)
    , IN MiddleName_p	VARCHAR(60)
    , IN LastName_p 	VARCHAR(60)
    , IN Surname_p 		VARCHAR(100)
    , IN Email_p		VARCHAR(100)
    , IN WorkPhone_p	VARCHAR(15)
    , IN HomePhone_p	VARCHAR(15)
    , IN MobilPhone_p	VARCHAR(15)

    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v 		DATETIME;
    DECLARE ContactId_v BIGINT;

	SET Date_v = NOW();
	SET Msg_p = 'Transaction error.';
	START TRANSACTION;
		INSERT tberp_contact (
			  `Suffix`
			, `Title`
			, `FirstName`
			, `MiddleName`
			, `LastName`
			, `Surname`
			, `Email`
			, `WorkPhone`
			, `HomePhone`
			, `MobilPhone`

			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Suffix_p
			, Title_p
			, FirstName_p
			, MiddleName_p
			, LastName_p
			, Surname_p
			, Email_p
			, WorkPhone_p
			, HomePhone_p
			, MobilPhone_p

			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET ContactId_v = last_insert_id();
        IF Type_p = 0 THEN			
			INSERT INTO tberp_customer_contact (`ContactId`, `CustomerId`) VALUES ( ContactId_v, Id_p );
		ELSE		
			INSERT INTO tberp_provider_contact (`ContactId`, `ProviderId`) VALUES ( ContactId_v, Id_p );
		END IF;
		SET Msg_p = '';
	COMMIT;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_customer`(
	
	  IN Code_p			VARCHAR(10)
	, IN Name_p			VARCHAR(100)
	, IN Phone1_p		VARCHAR(20)
    , IN Phone2_p		VARCHAR(20)
    , IN Website_p		VARCHAR(100)
    , IN Notes_p		VARCHAR(255)
    
    
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60)
    , IN CountryId_p	BIGINT
    
    
	, IN Suffix_p		VARCHAR(10)
	, IN Title_p		VARCHAR(10)
	, IN FirstName_p	VARCHAR(60)
    , IN MiddleName_p	VARCHAR(60)
    , IN LastName_p 	VARCHAR(60)
    , IN Surname_p 		VARCHAR(100)
    , IN Email_p		VARCHAR(100)
    , IN WorkPhone_p	VARCHAR(15)
    , IN HomePhone_p	VARCHAR(15)
    , IN MobilPhone_p	VARCHAR(15)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;
    DECLARE AddressId_v BIGINT;
    DECLARE ContactId_v BIGINT;

	IF EXISTS(SELECT * FROM tberp_customer CT WHERE CT.Code = Code_p) THEN
		SET	Msg_p = 'Customer code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_customer CT WHERE CT.Name = Name_p) THEN
		SET	Msg_p = 'Customer name already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		SET Msg_p = 'Transaction error';
        
        START TRANSACTION;
			INSERT tberp_address (
				  `Line1`
				, `Line2`
				, `Line3`
				, `ZipCode`
				, `City`
				, `State`
				, `CountryId`

				, `EntryDate`
				, `EntryUserId`
				, `ModDate`
				, `ModUserId`
			 ) VALUES (
				  Line1_p
				, Line2_p
				, Line3_p
				, ZipCode_p
				, City_p
				, State_p
				, CountryId_p
				
				, Date_v
				, UserId_p
				, Date_v
				, UserId_p
			);
			SET AddressId_v = last_insert_id();
			
			INSERT tberp_contact (
				  `Suffix`
				, `Title`
				, `FirstName`
				, `MiddleName`
				, `LastName`
				, `Surname`
				, `Email`
				, `WorkPhone`
				, `HomePhone`
				, `MobilPhone`

				, `EntryDate`
				, `EntryUserId`
				, `ModDate`
				, `ModUserId`
			 ) VALUES (
				  Suffix_p
				, Title_p
				, FirstName_p
				, MiddleName_p
				, LastName_p
				, Surname_p
				, Email_p
				, WorkPhone_p
				, HomePhone_p
				, MobilPhone_p

				, Date_v
				, UserId_p
				, Date_v
				, UserId_p
			);
			SET ContactId_v = last_insert_id();
			
			INSERT tberp_customer(
				  `Code`
				, `Name`
				, `Phone1`
				, `Phone2`
				, `AddressId`
				, `ContactId`
				, `Website`
				, `Notes`
				
				, `EntryDate`
				, `EntryUserId`
				, `ModDate`
				, `ModUserId`
			 ) VALUES (
				  Code_p
				, Name_p
				, Phone1_p
				, Phone2_p
				, AddressId_v
				, ContactId_v
				, Website_p
				, Notes_p

				, Date_v
				, UserId_p
				, Date_v
				, UserId_p
			);
			SET Msg_p = '';
		COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_master` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_master`(
      IN Type_p			INTEGER
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF EXISTS(SELECT * FROM tberp_master MS WHERE MS.Code = Code_p AND MS.Type = Type_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_master MS WHERE MS.Description = Description_p AND MS.Type = Type_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
        
		INSERT tberp_master(
			  `Type`
			, `Code`
			, `Description`
			
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Type_p
			, Code_p
			, Description_p

			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_product`(
	  IN IsActive_p		BIT
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    , IN Weight_p		FLOAT
    , IN Color_p		VARCHAR(20)
    , IN Width_p		FLOAT
    , IN Height_p		FLOAT
    , IN Large_p		FLOAT
    , IN MinStock_p		FLOAT
    , IN MaxStock_p		FLOAT
    , IN CategoryId_p	BIGINT
    , IN Notes_p		VARCHAR(255)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF EXISTS(SELECT * FROM tberp_product PR WHERE PR.Code = Code_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_product PR WHERE PR.Description = Description_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		INSERT tberp_product(
			  `IsActive`
			, `Code`
			, `Description`
            , `Weight`
            , `Color`
            , `Width`
            , `Height`
            , `Large`
			, `MinStock`
            , `MaxStock`
            , `CategoryId`
            , `Notes`
            
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  IsActive_p
			, Code_p
			, Description_p
			, Weight_p
            , Color_p
            , Width_p
            , Height_p
            , Large_p
            , MinStock_p
            , MaxStock_p
            , CategoryId_p
            , Notes_p
            
			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_provider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_provider`(
	
	  IN Code_p			VARCHAR(10)
	, IN Name_p			VARCHAR(100)
	, IN Phone1_p		VARCHAR(20)
    , IN Phone2_p		VARCHAR(20)
    , IN Website_p		VARCHAR(100)
    , IN Notes_p		VARCHAR(255)
    
    
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60)
    , IN CountryId_p	BIGINT
    
    
	, IN Suffix_p		VARCHAR(10)
	, IN Title_p		VARCHAR(10)
	, IN FirstName_p	VARCHAR(60)
    , IN MiddleName_p	VARCHAR(60)
    , IN LastName_p 	VARCHAR(60)
    , IN Surname_p 		VARCHAR(100)
    , IN Email_p		VARCHAR(100)
    , IN WorkPhone_p	VARCHAR(15)
    , IN HomePhone_p	VARCHAR(15)
    , IN MobilPhone_p	VARCHAR(15)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;
    DECLARE AddressId_v BIGINT;
    DECLARE ContactId_v BIGINT;

	IF EXISTS(SELECT * FROM tberp_provider CT WHERE CT.Code = Code_p) THEN
		SET	Msg_p = 'Provider code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider CT WHERE CT.Name = Name_p) THEN
		SET	Msg_p = 'Provider name already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		SET Msg_p = 'Transaction error';
        
        START TRANSACTION;
			INSERT tberp_address (
				  `Line1`
				, `Line2`
				, `Line3`
				, `ZipCode`
				, `City`
				, `State`
				, `CountryId`

				, `EntryDate`
				, `EntryUserId`
				, `ModDate`
				, `ModUserId`
			 ) VALUES (
				  Line1_p
				, Line2_p
				, Line3_p
				, ZipCode_p
				, City_p
				, State_p
				, CountryId_p
				
				, Date_v
				, UserId_p
				, Date_v
				, UserId_p
			);
			SET AddressId_v = last_insert_id();
			
			INSERT tberp_contact (
				  `Suffix`
				, `Title`
				, `FirstName`
				, `MiddleName`
				, `LastName`
				, `Surname`
				, `Email`
				, `WorkPhone`
				, `HomePhone`
				, `MobilPhone`

				, `EntryDate`
				, `EntryUserId`
				, `ModDate`
				, `ModUserId`
			 ) VALUES (
				  Suffix_p
				, Title_p
				, FirstName_p
				, MiddleName_p
				, LastName_p
				, Surname_p
				, Email_p
				, WorkPhone_p
				, HomePhone_p
				, MobilPhone_p

				, Date_v
				, UserId_p
				, Date_v
				, UserId_p
			);
			SET ContactId_v = last_insert_id();
			
			INSERT tberp_provider(
				  `Code`
				, `Name`
				, `Phone1`
				, `Phone2`
				, `AddressId`
				, `ContactId`
				, `Website`
				, `Notes`
				
				, `EntryDate`
				, `EntryUserId`
				, `ModDate`
				, `ModUserId`
			 ) VALUES (
				  Code_p
				, Name_p
				, Phone1_p
				, Phone2_p
				, AddressId_v
				, ContactId_v
				, Website_p
				, Notes_p

				, Date_v
				, UserId_p
				, Date_v
				, UserId_p
			);
			SET Msg_p = '';
		COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_quotation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_quotation`(
      IN ProviderId_p		BIGINT
    , IN SubmaterialId_p	BIGINT
	, IN ProviderCode_p		VARCHAR(20)
	, IN LeadTime_p			INTEGER
	, IN AdditionalCost_p	FLOAT
	, IN From_p				DATETIME
	, IN To_p				DATETIME
	, IN Notes_p			VARCHAR(255)
    
    , IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF From_p > To_p THEN
		SET	Msg_p = '"From" value must be less or equal than "To" value. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.ProviderId = ProviderId_p AND QT.SubmaterialId = SubmaterialId_p AND QT.From = From_p AND QT.To = To_p) THEN
		SET	Msg_p = 'Quotation already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.ProviderId = ProviderId_p AND QT.SubmaterialId = SubmaterialId_p AND QT.From <= From_p AND QT.To > From_p) THEN
		SET	Msg_p = 'The new quotation dates overslaps an existing quotation. Please verify!';
	ELSE
		SET Date_v = NOW();
        
		INSERT tberp_quotation(
			  `ProviderId`
			, `SubmaterialId`
			, `ProviderCode`
			, `LeadTime`
			, `AdditionalCost`
			, `From`
			, `To`
			, `Notes`
			
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  ProviderId_p
			, SubmaterialId_p
			, ProviderCode_p
			, LeadTime_p
			, AdditionalCost_p
			, From_p
			, To_p
			, Notes_p

			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_range`(
      IN Type_p		INTEGER
    , IN ItemKey_p	BIGINT
	, IN From_p		FLOAT
	, IN To_p		FLOAT
	, IN Amount_p	FLOAT
    
    , IN UserId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF From_p > To_p THEN
		SET	Msg_p = '"From" value must be less or equal than "To" value. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = Type_p AND RN.ItemKey = ItemKey_p AND RN.From = From_p AND RN.To = To_p) THEN
		SET	Msg_p = 'Range already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = Type_p AND RN.ItemKey = ItemKey_p AND RN.From <= From_p AND RN.To > From_p) THEN
		SET	Msg_p = 'The new range overslaps an existing range. Please verify!';
	ELSE
		SET Date_v = NOW();
        
		INSERT tberp_range(
			  `Type`
			, `ItemKey`
			, `From`
			, `To`
			, `Amount`
			
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  Type_p
			, ItemKey_p
			, From_p
			, To_p
			, Amount_p

			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_insert_submaterial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_insert_submaterial`(
	  IN IsActive_p		BIT
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    , IN Weight_p		FLOAT
    , IN MinStock_p		FLOAT
    , IN MaxStock_p		FLOAT
    , IN UOMId_p		BIGINT
    , IN CategoryId_p	BIGINT
    , IN Notes_p		VARCHAR(255)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Code = Code_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Description = Description_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		SET Date_v = NOW();
        
		INSERT tberp_submaterial(
			  `IsActive`
			, `Code`
			, `Description`
            , `Weight`
			, `MinStock`
            , `MaxStock`
            , `UOMId`
            , `CategoryId`
            , `Notes`
            
			, `EntryDate`
			, `EntryUserId`
			, `ModDate`
			, `ModUserId`
		 ) VALUES (
			  IsActive_p
			, Code_p
			, Description_p
			, Weight_p
            , MinStock_p
            , MaxStock_p
            , UOMId_p
            , CategoryId_p
            , Notes_p
            
			, Date_v
			, UserId_p
			, Date_v
			, UserId_p
		);
		SET Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_address`(
	  IN Id_p			BIGINT
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60)
    , IN CountryId_p	BIGINT

    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_address AD WHERE AD.Id = Id_p) THEN
		SET	Msg_p = 'Address does not exist. Please verify!';
	ELSE
		UPDATE tberp_address SET
			  `Line1` 		= Line1_p
			, `Line2`		= Line2_p
			, `Line3`		= Line3_p
			, `ZipCode` 	= ZipCode_p
			, `City`		= City_p
			, `State`		= State_p
			, `CountryId`	= CountryId_p

            , `ModDate`		= Date_v
            , `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_component` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_component`(
	  IN Type_p			INTEGER
	, IN ProductId_p	BIGINT
	, IN ComponentId_p	BIGINT
    , IN Quantity_p		FLOAT
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	IF NOT EXISTS(SELECT * FROM tberp_product_component PC WHERE PC.Type = Type_p AND PC.ProductId = ProductId_p AND PC.ComponentId = ComponentId_p) THEN
		SET	Msg_p = 'Component does not exist. Please verify!';
	ELSE
		SET Date_v = NOW();
		UPDATE tberp_product_component SET
			  `Quantity` 	= Quantity_p
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
				`Type`		= Type_p
            AND ProductId 	= ProductId_p
            AND ComponentId = ComponentId_p;
		SET	Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_contact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_contact`(
	  IN Id_p	BIGINT
	, IN Suffix_p		VARCHAR(10)
	, IN Title_p		VARCHAR(10)
	, IN FirstName_p	VARCHAR(60)
    , IN MiddleName_p	VARCHAR(60)
    , IN LastName_p 	VARCHAR(60)
    , IN Surname_p 		VARCHAR(100) 
    , IN Email_p		VARCHAR(100)
    , IN WorkPhone_p	VARCHAR(15)
    , IN HomePhone_p	VARCHAR(15)
    , IN MobilPhone_p	VARCHAR(15)

    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tberp_contact AD WHERE AD.Id = Id_p) THEN
		SET	Msg_p = 'Contact does not exist. Please verify!';
	ELSE
		UPDATE tberp_contact SET
			  `Suffix` 		= Suffix_p
			, `Title`		= Title_p
			, `FirstName`	= FirstName_p
			, `MiddleName` 	= MiddleName_p
			, `LastName`	= LastName_p
			, `Surname`		= Surname_p
			, `Email`		= Email_p
			, `WorkPhone`	= WorkPhone_p
            , `HomePhone`	= HomePhone_p
            , `MobilPhone`	= MobilPhone_p

            , `ModDate`		= Date_v
            , `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_customer`(
	
	  IN Id_p 			BIGINT
	, IN Code_p			VARCHAR(10)
	, IN Name_p			VARCHAR(100)
	, IN Phone1_p		VARCHAR(20)
    , IN Phone2_p		VARCHAR(20)
    , IN Website_p		VARCHAR(100)
    , IN Notes_p		VARCHAR(255)
    
    
    , IN AddressId_p 	BIGINT
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60)
    , IN CountryId_p	BIGINT
    
    
    , IN ContactId_p 	BIGINT
	, IN Suffix_p		VARCHAR(10)
	, IN Title_p		VARCHAR(10)
	, IN FirstName_p	VARCHAR(60)
    , IN MiddleName_p	VARCHAR(60)
    , IN LastName_p 	VARCHAR(60)
    , IN Surname_p 		VARCHAR(100)
    , IN Email_p		VARCHAR(100)
    , IN WorkPhone_p	VARCHAR(15)
    , IN HomePhone_p	VARCHAR(15)
    , IN MobilPhone_p	VARCHAR(15)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = 'Transaction error.';

	IF EXISTS(SELECT * FROM tberp_customer CT WHERE CT.Code = Code_p AND CT.Id <> Id_p) THEN
		SET	Msg_p = 'Customer code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_customer CT WHERE CT.Name = Name_p AND CT.Id <> Id_p) THEN
		SET	Msg_p = 'Customer name already exist. Please verify!';
	ELSE
		START TRANSACTION;
			UPDATE tberp_customer SET
				  `Code` 		= Code_p
				, `Name`		= Name_p
				, `Phone1`		= Phone1_p
				, `Phone2` 		= Phone2_p
				, `Website`		= Website_p
				, `Notes`		= Notes_p
				
				, `ModDate`		= Date_v
				, `ModUserId`	= UserId_p
			WHERE
				Id = Id_p;

			CALL `sperp_update_contact`(
				  ContactId_p
				, Suffix_p
				, Title_p
				, FirstName_p
				, MiddleName_p
				, LastName_p
				, Surname_p
				, Email_p
				, WorkPhone_p
				, HomePhone_p
				, MobilPhone_p
				, UserId_p
				, Msg_p);
			IF Msg_p = '' THEN
				CALL `sperp_update_address`(
					  AddressId_p
					, Line1_p
					, Line2_p
					, Line3_p
					, ZipCode_p
					, City_p
					, State_p
					, CountryId_p
					, UserId_p
					, Msg_p);
				IF Msg_p <> '' THEN
					ROLLBACK;
				END IF;
			ELSE
				ROLLBACK;
			END IF;
		COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_master` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_master`(
	  IN Id_p 			BIGINT
	, IN Type_p			INTEGER
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF EXISTS(SELECT * FROM tberp_master MS WHERE MS.Code = Code_p AND MS.Type = Type_p AND MS.Id <> Id_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_master MS WHERE MS.Description = Description_p AND MS.Type = Type_p AND MS.Id <> Id_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		UPDATE tberp_master SET
			  `Code` 		= Code_p
			, `Description`	= Description_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_product`(
	  IN Id_p 			BIGINT
	, IN IsActive_p		BIT
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    , IN Weight_p		FLOAT
    , IN Color_p		VARCHAR(20)
    , IN Width_p		FLOAT
    , IN Height_p		FLOAT
    , IN Large_p		FLOAT
    , IN MinStock_p		FLOAT
    , IN MaxStock_p		FLOAT
    , IN CategoryId_p	BIGINT
    , IN Notes_p		VARCHAR(255)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF EXISTS(SELECT * FROM tberp_product PR WHERE PR.Code = Code_p AND PR.Id <> Id_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_product PR WHERE PR.Description = Description_p AND PR.Id <> Id_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		UPDATE tberp_product SET
			  `IsActive` 	= IsActive_p
			, `Code` 		= Code_p
			, `Description`	= Description_p
            , `Weight` 		= Weight_p
            , `Color`		= Color_p
            , `Width`		= Width_p
            , `Height`		= Height_p
            , `Large`		= Large_p
            , `MinStock` 	= MinStock_p
            , `MaxStock` 	= MaxStock_p
            , `CategoryId` 	= CategoryId_p
            , `Notes` 		= Notes_p
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_product_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`esto_usr`@`localhost` PROCEDURE `sperp_update_product_category`(
	/* product category */
	  IN CategoryId_p 	BIGINT
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF EXISTS(SELECT * FROM tberp_product_category PC WHERE PC.Code = Code_p AND PC.CategoryId <> CategoryId_p) THEN
		SET	Msg_p = 'Product category code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_product_category PC WHERE PC.Description = Description_p AND PC.CategoryId <> CategoryId_p) THEN
		SET	Msg_p = 'Product category description already exist. Please verify!';
	ELSE
		UPDATE tberp_product_category SET
			  `Code` 		= Code_p
			, `Description`	= Description_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			CategoryId = CategoryId_p;
		SET	Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_provider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_provider`(
	
	  IN Id_p 			BIGINT
	, IN Code_p			VARCHAR(10)
	, IN Name_p			VARCHAR(100)
	, IN Phone1_p		VARCHAR(20)
    , IN Phone2_p		VARCHAR(20)
    , IN Website_p		VARCHAR(100)
    , IN Notes_p		VARCHAR(255)
    
    
    , IN AddressId_p 	BIGINT
	, IN Line1_p		VARCHAR(100)
	, IN Line2_p		VARCHAR(100)
	, IN Line3_p		VARCHAR(100)
    , IN ZipCode_p		VARCHAR(10)
    , IN City_p 		VARCHAR(60)
    , IN State_p 		VARCHAR(60)
    , IN CountryId_p	BIGINT
    
    
    , IN ContactId_p 	BIGINT
	, IN Suffix_p		VARCHAR(10)
	, IN Title_p		VARCHAR(10)
	, IN FirstName_p	VARCHAR(60)
    , IN MiddleName_p	VARCHAR(60)
    , IN LastName_p 	VARCHAR(60)
    , IN Surname_p 		VARCHAR(100)
    , IN Email_p		VARCHAR(100)
    , IN WorkPhone_p	VARCHAR(15)
    , IN HomePhone_p	VARCHAR(15)
    , IN MobilPhone_p	VARCHAR(15)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = 'Transaction error.';

	IF EXISTS(SELECT * FROM tberp_provider PR WHERE PR.Code = Code_p AND PR.Id <> Id_p) THEN
		SET	Msg_p = 'Provider code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_provider PR WHERE PR.Name = Name_p AND PR.Id <> Id_p) THEN
		SET	Msg_p = 'Provider name already exist. Please verify!';
	ELSE
		START TRANSACTION;
			UPDATE tberp_provider SET
				  `Code` 		= Code_p
				, `Name`		= Name_p
				, `Phone1`		= Phone1_p
				, `Phone2` 		= Phone2_p
				, `Website`		= Website_p
				, `Notes`		= Notes_p
				
				, `ModDate`		= Date_v
				, `ModUserId`	= UserId_p
			WHERE
				Id = Id_p;

			CALL `sperp_update_contact`(
				  ContactId_p
				, Suffix_p
				, Title_p
				, FirstName_p
				, MiddleName_p
				, LastName_p
				, Surname_p
				, Email_p
				, WorkPhone_p
				, HomePhone_p
				, MobilPhone_p
				, UserId_p
				, Msg_p);
			IF Msg_p = '' THEN
				CALL `sperp_update_address`(
					  AddressId_p
					, Line1_p
					, Line2_p
					, Line3_p
					, ZipCode_p
					, City_p
					, State_p
					, CountryId_p
					, UserId_p
					, Msg_p);
				IF Msg_p <> '' THEN
					ROLLBACK;
				END IF;
			ELSE
				ROLLBACK;
			END IF;
		COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_quotation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_quotation`(
	  IN Id_p 				BIGINT
    , IN ProviderId_p		BIGINT
    , IN SubmaterialId_p	BIGINT
	, IN ProviderCode_p		VARCHAR(20)
	, IN LeadTime_p			INTEGER
	, IN AdditionalCost_p	FLOAT
	, IN From_p				DATETIME
	, IN To_p				DATETIME
	, IN Notes_p			VARCHAR(255)
    
    , IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF NOT EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.Id = Id_p) THEN
		SET	Msg_p = 'Quotation not found. Please verify!';
	ELSEIF From_p > To_p THEN
		SET	Msg_p = '"From" value must be less or equal than "To" value. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.ProviderId = ProviderId_p AND QT.SubmaterialId = SubmaterialId_p AND QT.From = From_p AND QT.To = To_p AND QT.Id <> Id_p) THEN
		SET	Msg_p = 'Quotation already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_quotation QT WHERE QT.ProviderId = ProviderId_p AND QT.SubmaterialId = SubmaterialId_p AND QT.From <= From_p AND QT.To > From_p AND QT.Id <> Id_p) THEN
		SET	Msg_p = 'The new quotation dates overslaps an existing quotation. Please verify!';
	ELSE
		UPDATE tberp_quotation SET
			  `ProviderCode`	= ProviderCode_p
			, `LeadTime`		= LeadTime_p
			, `AdditionalCost`	= AdditionalCost_p
			, `From`			= From_p
			, `To`				= To_p
			, `Notes`			= Notes_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_range`(
	  IN Id_p 		BIGINT
	, IN Type_p		INTEGER
	, IN ItemKey_p	BIGINT
	, IN From_p		FLOAT
	, IN To_p		FLOAT
	, IN Amount_p	FLOAT
    
    , IN UserId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF NOT EXISTS(SELECT * FROM tberp_range RN WHERE RN.Id = Id_p) THEN
		SET	Msg_p = 'Range not found. Please verify!';
	ELSEIF From_p > To_p THEN
		SET	Msg_p = '"From" value must be less or equal than "To" value. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = Type_p AND RN.ItemKey = ItemKey_p AND RN.From = From_p AND RN.To = To_p AND RN.Id <> Id_p) THEN
		SET	Msg_p = 'Range already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_range RN WHERE RN.Type = Type_p AND RN.ItemKey = ItemKey_p AND RN.From <= From_p AND RN.To > From_p AND RN.Id <> Id_p) THEN
		SET	Msg_p = 'The new range overslaps an existing range. Please verify!';
	ELSE
		UPDATE tberp_range SET
			  `From`	= From_p
			, `To`		= To_p
			, `Amount`	= Amount_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sperp_update_submaterial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sperp_update_submaterial`(
	  IN Id_p 			BIGINT
	, IN IsActive_p		BIT
	, IN Code_p			VARCHAR(10)
	, IN Description_p	VARCHAR(100)
    , IN Weight_p		FLOAT
    , IN MinStock_p		FLOAT
    , IN MaxStock_p		FLOAT
    , IN UOMId_p		BIGINT
    , IN CategoryId_p	BIGINT
    , IN Notes_p		VARCHAR(255)
    
    , IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();

	IF EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Code = Code_p AND SM.Id <> Id_p) THEN
		SET	Msg_p = 'Code already exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tberp_submaterial SM WHERE SM.Description = Description_p AND SM.Id <> Id_p) THEN
		SET	Msg_p = 'Description already exist. Please verify!';
	ELSE
		UPDATE tberp_submaterial SET
			  `IsActive` 	= IsActive_p
			, `Code` 		= Code_p
			, `Description`	= Description_p
            , `Weight` 		= Weight_p
            , `MinStock` 	= MinStock_p
            , `MaxStock` 	= MaxStock_p
            , `UOMId` 		= UOMId_p
            , `CategoryId` 	= CategoryId_p
            , `Notes` 		= Notes_p
			
			, `ModDate`		= Date_v
			, `ModUserId`	= UserId_p
		WHERE
			Id = Id_p;
		SET	Msg_p = '';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Apply_UserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Apply_UserRole`(
      IN 	UserId_p	BIGINT
    , IN 	RoleId_p	BIGINT
	, IN 	Action_p	INTEGER				
	, IN 	ModUserId_p	BIGINT
	, OUT 	Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Msg_p = '';
	SET Date_v = NOW();

    
	IF EXISTS(SELECT * FROM tbSecurity_UserRole WHERE UserId = UserId_p AND RoleId = RoleId_p) AND Action_p = 0 THEN
		DELETE FROM tbSecurity_UserRole WHERE UserId = UserId_p AND RoleId = RoleId_p;

		UPDATE tbSecurity_User SET
			  ModUserId	= ModUserId_p
			, ModDate	= Date_v
		WHERE
			UserId = RoleId_p;
	END IF;

	IF NOT EXISTS(SELECT * FROM tbSecurity_UserRole WHERE UserId = UserId_p AND RoleId = RoleId_p) AND Action_p = 1 THEN
		INSERT INTO tbSecurity_UserRole (UserId, RoleId) VALUES( UserId_p, RoleId_p);

		UPDATE tbSecurity_User SET
			  ModUserId	= ModUserId_p
			, ModDate	= Date_v
		WHERE
			UserId = RoleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Delete_Menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Delete_Menu`(
      IN	MenuId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_Menu WHERE MenuId = MenuId_p) THEN
		SET	Msg_p = 'Menu does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_Module WHERE MenuId = MenuId_p) THEN
		SET	Msg_p = 'Menu cannot be deleted due to it is still been used!';
	ELSE
		 DELETE FROM tbSecurity_Menu WHERE MenuId = MenuId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Delete_Module` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Delete_Module`(
      IN	ModuleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_Module WHERE ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_RoleModule WHERE ModuleId = ModuleId_p)
			OR EXISTS(SELECT * FROM tbSecurity_UserModule WHERE ModuleId = ModuleId_p) THEN
		SET	Msg_p = 'Module cannot be deleted it is still been used!';
	ELSE
		 DELETE FROM tbSecurity_Module WHERE ModuleId = ModuleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Delete_Role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Delete_Role`(
      IN	RoleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_Role WHERE RoleId = RoleId_p) THEN
		SET Msg_p = 'Role does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_UserRole WHERE RoleId = RoleId_p)
			OR EXISTS(SELECT * FROM tbSecurity_RoleModule WHERE RoleId = RoleId_p) THEN
		SET Msg_p = 'Role cannot be deleted due to it is still been used!';
	ELSE
		 DELETE FROM tbSecurity_Role WHERE RoleId = RoleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Delete_RoleModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Delete_RoleModule`(
      IN	RoleId_p		BIGINT
    , IN 	ModuleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_RoleModule WHERE RoleId = RoleId_p AND ModuleId = ModuleId_p) THEN
		SET	Msg_p = 'Object is not included in the role. Please verify!';
	ELSE
		 DELETE FROM tbSecurity_RoleModule WHERE RoleId = RoleId_p AND ModuleId = ModuleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Delete_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Delete_User`(
      IN	UserId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_User WHERE UserId = UserId_p) THEN
		SET	Msg_p = 'User does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_UserRole WHERE UserId = UserId_p)
			OR EXISTS(SELECT * FROM tbSecurity_UserModule WHERE UserId = UserId_p)
			OR EXISTS(SELECT * FROM tbSecurity_Module WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p))
			OR EXISTS(SELECT * FROM tbSecurity_Role WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p))
			OR EXISTS(SELECT * FROM tbSecurity_Menu WHERE (EntryUserId = UserId_p OR ModUserId = UserId_p)) THEN
		SET	Msg_p = 'User cannot be deleted due to it is still being used!';
	ELSE
		DELETE FROM tbSecurity_User WHERE UserId = UserId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Delete_UserModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Delete_UserModule`(
      IN	UserId_p	BIGINT
    , IN 	ModuleId_p	BIGINT
	, OUT	Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_UserModule WHERE UserId = UserId_p AND ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Object is not included in the role. Please verify!';
	ELSE
		 DELETE FROM tbSecurity_UserModule WHERE UserId = UserId_p AND ModuleId = ModuleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_AssignedRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_AssignedRoles`(
	UserId_p BIGINT
)
BEGIN
    
	SELECT
		  RL.RoleId
		, RL.Name
	FROM 
		tbSecurity_Role RL
		INNER JOIN tbSecurity_UserRole UM ON
			UM.RoleId = RL.RoleId
	WHERE
		UM.UserId = UserId_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_AvailableRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_AvailableRoles`(
	UserId_p BIGINT
)
BEGIN
    
	SELECT
		  RL.RoleId
		, RL.Name
	FROM 
		tbSecurity_Role RL
	WHERE
		NOT RL.RoleId IN (
			SELECT UM.RoleId FROM tbSecurity_UserRole UM WHERE UM.UserId = UserId_p
		);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_MenuList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_MenuList`(
	IsActive_p INTEGER
)
BEGIN
    
	IF IsActive_p = 2 THEN
		SELECT 
			  SO.MenuId
			, SO.Name
			, SO.Description
			, SO.Order
			, SO.IsActive
			, SO.EntryDate
			, SO.EntryUserId
			, U1.Username AS EntryUser
			, SO.ModDate
			, SO.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbSecurity_Menu SO
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SO.ModUserId;
	ELSE
		SELECT 
			  SO.MenuId
			, SO.Name
			, SO.Description
			, SO.Order
			, SO.IsActive
			, SO.EntryDate
			, SO.EntryUserId
			, U1.Username AS EntryUser
			, SO.ModDate
			, SO.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbSecurity_Menu SO
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SO.ModUserId
		WHERE 
			SO.IsActive = IsActive_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_ModuleList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_ModuleList`(
	IsActive_p INTEGER
)
BEGIN
    
	IF IsActive_p = 2 THEN
		SELECT
			  SO.ModuleId
			, SO.Name
			, SO.Description
			, SM.MenuId
			, SM.Name		AS MenuName
			, SO.Order
			, SO.IsActive
			, SO.EntryDate
			, SO.EntryUserId
			, U1.Username	AS EntryUser
			, SO.ModDate
			, SO.ModUserId
			, U2.Username	AS ModUser
		FROM 
			tbSecurity_Module SO
			INNER JOIN tbSecurity_Menu SM ON
				SM.MenuId = SO.MenuId
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SO.ModUserId;
	ELSE
		SELECT 
			  SO.ModuleId
			, SO.Name
			, SO.Description
			, SM.MenuId
			, SM.Name		AS MenuName
			, SO.Order
			, SO.IsActive
			, SO.EntryDate
			, SO.EntryUserId
			, U1.Username 	AS EntryUser
			, SO.ModDate
			, SO.ModUserId
			, U2.Username 	AS ModUser
		FROM 
			tbSecurity_Module SO
			INNER JOIN tbSecurity_Menu SM ON
				SM.MenuId = SO.MenuId
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SO.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SO.ModUserId
		WHERE 
			SO.IsActive = IsActive_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_RoleList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_RoleList`(
	IsActive_p INTEGER
)
BEGIN
    
	IF IsActive_p = 2 THEN
		SELECT 
			  SR.RoleId
			, SR.Name
			, SR.Description
			, SR.IsActive
			, SR.EntryDate
			, SR.EntryUserId
			, U1.Username AS EntryUser
			, SR.ModDate
			, SR.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbSecurity_Role SR
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SR.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SR.ModUserId;
	ELSE
		SELECT 
			  SR.RoleId
			, SR.Name
			, SR.Description
			, SR.IsActive
			, SR.EntryDate
			, SR.EntryUserId
			, U1.Username AS EntryUser
			, SR.ModDate
			, SR.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbSecurity_Role SR
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SR.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SR.ModUserId
		WHERE 
			SR.IsActive = IsActive_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_RoleModuleList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_RoleModuleList`(
	RoleId_p	BIGINT
)
BEGIN
    
	SELECT 
		  SD.ModuleId
		, SO.Name		AS ModuleName
		, SD.IsCreated
		, SD.IsUpdated
		, SD.IsDeleted
	FROM 
		tbSecurity_RoleModule SD
		INNER JOIN tbSecurity_Module SO ON
			SO.ModuleId = SD.ModuleId
	WHERE 
		SD.RoleId = RoleId_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_StatusList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_StatusList`()
BEGIN
	SELECT * FROM tbSecurity_Status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_User`(
	  IN Username_p VARCHAR(35)
	, IN Password_p	VARCHAR(35)
)
BEGIN
	SELECT
		  U1.*
        , U2.UserName AS 'EntryUser'
        , U2.UserName AS 'ModUser'
	FROM
		tbSecurity_User U1
        LEFT JOIN tbsecurity_user U2 ON
			U2.UserId = U1.EntryUserId
        LEFT JOIN tbsecurity_user U3 ON
			U3.UserId = U1.ModUserId		
	WHERE
			U1.Username = Username_p
        AND U1.Password = Password_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_UserList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_UserList`(
	IsActive_p INTEGER
)
BEGIN
    
	IF IsActive_p = 2 THEN
		SELECT 
			  SU.UserId
			, SU.UserName
			, SU.Password
			, SU.IsActive
			, SU.EntryDate
			, SU.EntryUserId
			, U1.Username 	AS EntryUser
			, SU.ModDate
			, SU.ModUserId
			, U2.Username 	AS ModUser
		FROM 
			tbSecurity_User SU
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = SU.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SU.ModUserId;
	ELSE
		SELECT 
			  SU.UserId
			, SU.UserName
			, SU.Password
			, SU.IsActive
			, SU.EntryDate
			, SU.EntryUserId
			, U1.Username AS EntryUser
			, SU.ModDate
			, SU.ModUserId
			, U2.Username AS ModUser
		FROM 
			tbSecurity_User SU
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = SU.ModUserId
		WHERE 
			SU.IsActive = IsActive_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_UserModuleList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_UserModuleList`(
	IN UserId_p	BIGINT
)
BEGIN
    
	SELECT 
		  SU.ModuleId
		, SO.Name		AS ModuleName
		, SU.IsCreated
		, SU.IsUpdated
		, SU.IsDeleted
	FROM 
		tbSecurity_UserModule SU
		INNER JOIN tbSecurity_Module SO ON
			SO.ModuleId = SU.ModuleId
	WHERE 
		SU.UserId = UserId_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Get_UserRights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Get_UserRights`(
	IN UserId_p BIGINT
)
BEGIN
    
	SELECT
		*
	FROM 
		vwSecurity_Get_UserRights UR
	WHERE
		UR.UserId = UserId_p
	ORDER BY
		  UR.MenuOrder
		, UR.ItemOrder;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Insert_Menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Insert_Menu`(
	  IN	Name_p			VARCHAR(60)
	, IN	Description_p	VARCHAR(255)
	, IN	Order_p			INT
	, IN	UserId_p		BIGINT
	, OUT	Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Menu SO WHERE SO.Name = Name_p) THEN
		SET Msg_p = 'Menu already exist. Please verify object name!';
	ELSE
		INSERT tbSecurity_Menu ( 
			  `Name`
			, `Description`
			, `Order`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
			  Name_p 
			, Description_p
			, Order_p
			, 1
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Insert_Module` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Insert_Module`(
	  IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN MenuId_p		BIGINT
	, IN Order_p		INT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Module SO WHERE SO.Name = Name_p AND SO.MenuId = MenuId_p) THEN
		SET Msg_p = 'Module already exist. Please verify object name!';
	ELSE
		INSERT tbSecurity_Module ( 
			  `Name`
			, `Description`
			, `MenuId`
			, `Order`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
			  Name_p 
			, Description_p
			, MenuId_p
			, Order_p
			, 1
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Insert_Role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Insert_Role`(
	  IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Role SR WHERE SR.Name = Name_p) THEN
		SET	Msg_p = 'Role name already exist. Please verify role name!';
	ELSE
		INSERT tbSecurity_Role (
			  `Name`
			, `Description`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
			  Name_p
			, Description_p
			, 1
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Insert_RoleModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Insert_RoleModule`(
      IN RoleId_p		BIGINT
	, IN ModuleId_p		BIGINT
	, IN IsCreated_p	BIT
	, IN IsUpdated_p	BIT
	, IN IsDeleted_p	BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255) 
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_RoleModule SD WHERE SD.RoleId = RoleId_p AND SD.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module already includes in the role. Please verify!';
	ELSE
		INSERT tbSecurity_RoleModule (
			  `RoleId`
			, `ModuleId`
			, `IsCreated`
			, `IsUpdated`
			, `IsDeleted`
		 ) VALUES (
			  RoleId_p
			, ModuleId_p
			, IsCreated_p
			, IsUpdated_p
			, IsDeleted_p
		);

		UPDATE tbSecurity_Role SET
			  ModUserId	= UserId_p
			, ModDate	= Date_v
		WHERE
			RoleId = RoleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Insert_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Insert_User`(
	  IN Username_p	VARCHAR(35)
	, IN Password_p	VARCHAR(35)
	, IN UserId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_p DATETIME;

	SET Date_p 	= NOW();
	SET Msg_p	= '';

    
	IF EXISTS(SELECT * FROM tbSecurity_User SU WHERE SU.UserName = Username_p) THEN
		SET Msg_p = 'User name already exist. Please verify User name!';
	ELSE
		INSERT tbSecurity_User (
			  `UserName`
			, `Password`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
			  Username_p
			, Password_p
			, 1
			, UserId_p
			, Date_p
			, UserId_p
			, Date_p
		);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Insert_UserModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Insert_UserModule`(
      IN UserId_p		BIGINT
	, IN ModuleId_p		BIGINT
	, IN IsCreated_p	BIT
	, IN IsUpdated_p	BIT
	, IN IsDeleted_p	BIT
	, IN ModUserId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_p DATETIME;

	SET Date_p = NOW();
	SET Msg_p = '';

	IF EXISTS(SELECT * FROM tbSecurity_UserModule SU WHERE SU.UserId = UserId_p AND SU.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module is already included in the role. Please verify!';
	ELSE
		INSERT INTO tbSecurity_UserModule ( UserId, ModuleId, IsCreated, IsUpdated, IsDeleted ) 
        VALUES ( UserId_p, ModuleId_p, IsCreated_p, IsUpdated_p, IsDeleted_p );

		UPDATE tbSecurity_User SET
			  ModUserId		= ModUserId_p
			, ModDate		= Date_p
		WHERE
			UserId = UserId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Update_Menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Update_Menu`(
      IN MenuId_p		BIGINT
	, IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN Order_p		INT
	, IN IsActive_p		BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Menu SO WHERE SO.Name = Name_p AND SO.MenuId <> MenuId_p) THEN
		SET Msg_p = 'Menu name already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbSecurity_Menu SO WHERE SO.MenuId = MenuId_p) THEN
		SET Msg_p = 'Menu does not exist. Please verify!';
	ELSE
		UPDATE tbSecurity_Menu SET
			  `Name`		= Name_p
			, `Description`	= Description_p
			, `Order`		= Order_p
			, `IsActive`	= IsActive_p
			, `ModUserId`	= UserId_p
			, `ModDate`		= Date_v
		 WHERE
			MenuId = MenuId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Update_Module` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Update_Module`(
      IN ModuleId_p		BIGINT
	, IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN MenuId_p		BIGINT
	, IN Order_p		INT
	, IN IsActive_p		BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Module SO WHERE SO.Name = Name_p AND SO.ModuleId <> ModuleId_p AND SO.MenuId = MenuId_p) THEN
		SET Msg_p = 'Module name already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbSecurity_Module SO WHERE SO.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module does not exist. Please verify!';
	ELSE
		UPDATE tbSecurity_Module SET
			  `Name`		= Name_p
			, `Description`	= Description_p
			, `MenuId`		= MenuId_p
			, `Order`		= Order_p
			, `IsActive`	= IsActive_p
			, `ModUserId`	= UserId_p
			, `ModDate`		= Date_v
		 WHERE
			ModuleId = ModuleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Update_Role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Update_Role`(
      IN RoleId_p		BIGINT
	, IN Name_p			VARCHAR(60)
	, IN Description_p	VARCHAR(255)
	, IN IsActive_p		BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF EXISTS(SELECT * FROM tbSecurity_Role SR WHERE SR.Name = Name_p AND SR.RoleId <> RoleId_p) THEN
		SET Msg_p = 'Role name already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbSecurity_Role SR WHERE SR.RoleId = RoleId_p) THEN
		SET Msg_p = 'Role does not exist. Please verify!';
	ELSE
		UPDATE tbSecurity_Role SET
			  `Name`		= Name_p
			, `Description`	= Description_p
			, `IsActive`	= IsActive_p
			, `ModUserId`	= UserId_p
			, `ModDate`		= Date_v
		 WHERE
			RoleId = RoleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Update_RoleModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Update_RoleModule`(
      IN RoleId_p		BIGINT
	, IN ModuleId_p		BIGINT
	, IN IsCreated_p	BIT
	, IN IsUpdated_p	BIT
	, IN IsDeleted_p	BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_RoleModule SD WHERE SD.RoleId = RoleId_p AND SD.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module is not included in the role. Please verify!';
	ELSE 
		UPDATE tbSecurity_RoleModule SET
			  IsCreated	= IsCreated_p
			, IsUpdated	= IsUpdated_p
			, IsDeleted	= IsDeleted_p
		 WHERE
			    RoleId = RoleId_p
			AND ModuleId = ModuleId_p;

		UPDATE tbSecurity_Role SET
			  ModUserId		= UserId_p
			, ModDate		= Date_v
		WHERE
			RoleId = RoleId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Update_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Update_User`(
      IN UserId_p	BIGINT
	, IN Username_p	VARCHAR(35)
	, IN Password_p	VARCHAR(35)
	, IN IsActive_p	BIT
	, IN UserId2_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbSecurity_User SU WHERE SU.UserId = UserId_p) THEN
		SET Msg_p = 'User does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbSecurity_User SU WHERE SU.UserName = Username_p AND SU.UserId <> UserId_p) THEN
		SET Msg_p = 'User name already exists. Please verify!';
	ELSE
		UPDATE tbSecurity_User SET
			  `Password`	= Password_p
			, `UserName`	= Username_p
			, `IsActive`	= IsActive_p
			, `ModUserId`	= UserId2_p
			, `ModDate`		= Date_v
		 WHERE
			`UserId` = UserId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSecurity_Update_UserModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSecurity_Update_UserModule`(
      IN UserId_p		BIGINT
	, IN ModuleId_p		BIGINT
	, IN IsCreated_p	BIT
	, IN IsUpdated_p	BIT
	, IN IsDeleted_p	BIT
	, IN ModUserId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_p DATETIME;

	SET Date_p = NOW();
	SET Msg_p = '';

    
	IF NOT EXISTS(SELECT * FROM tbSecurity_UserModule SU WHERE SU.UserId = UserId_p AND SU.ModuleId = ModuleId_p) THEN
		SET Msg_p = 'Module is not included in the role. Please verify!';
	ELSE 
		UPDATE tbSecurity_UserModule SET
			  IsCreated	= IsCreated_p
			, IsUpdated	= IsUpdated_p
			, IsDeleted	= IsDeleted_p
		 WHERE
			    UserId = UserId_p
			AND ModuleId = ModuleId_p;

		UPDATE tbSecurity_User SET
			  ModUserId		= ModUserId_p
			, ModDate		= Date_p
		WHERE
			UserId = UserId_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vwsecurity_get_userrights`
--

/*!50001 DROP VIEW IF EXISTS `vwsecurity_get_userrights`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwsecurity_get_userrights` AS select `rl`.`UserId` AS `UserId`,`mn`.`MenuId` AS `MenuId`,`mn`.`Name` AS `MenuName`,`mn`.`Order` AS `MenuOrder`,`md`.`ModuleId` AS `ModuleId`,`md`.`Name` AS `ModuleName`,`md`.`Order` AS `ItemOrder`,`rl`.`IsCreated` AS `IsCreated`,`rl`.`IsUpdated` AS `IsUpdated`,`rl`.`IsDeleted` AS `IsDeleted` from ((`tbsecurity_usermodule` `rl` join `tbsecurity_module` `md` on(((`md`.`ModuleId` = `rl`.`ModuleId`) and (`md`.`IsActive` = 1)))) join `tbsecurity_menu` `mn` on(((`mn`.`MenuId` = `md`.`MenuId`) and (`mn`.`IsActive` = 1)))) union select `ur`.`UserId` AS `UserId`,`mn`.`MenuId` AS `MenuId`,`mn`.`Name` AS `MenuName`,`mn`.`Order` AS `MenuOrder`,`md`.`ModuleId` AS `ModuleId`,`md`.`Name` AS `ModuleName`,`md`.`Order` AS `ItemOrder`,`rm`.`IsCreated` AS `IsCreated`,`rm`.`IsUpdated` AS `IsUpdated`,`rm`.`IsDeleted` AS `IsDeleted` from (((`tbsecurity_userrole` `ur` join `tbsecurity_rolemodule` `rm` on((`ur`.`RoleId` = `rm`.`RoleId`))) join `tbsecurity_module` `md` on(((`md`.`ModuleId` = `rm`.`ModuleId`) and (`md`.`IsActive` = 1)))) join `tbsecurity_menu` `mn` on(((`mn`.`MenuId` = `md`.`MenuId`) and (`mn`.`IsActive` = 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-20 16:40:37
