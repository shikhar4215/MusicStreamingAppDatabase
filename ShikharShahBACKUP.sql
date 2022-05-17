CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `idalbums` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `releaseDate` date NOT NULL,
  `composer` varchar(35) NOT NULL,
  `producer` varchar(45) NOT NULL,
  PRIMARY KEY (`idalbums`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (4,'Loving in Stereo','2021-05-05','Jungle','Jungle'),(5,'The Apple Drop','2021-02-01','Jungle','Jungle'),(6,'Happier Than Ever','2021-02-15','Billie Eilish','Finneas'),(7,'Anomaly','2018-06-08','Lecrea','808xElite'),(8,'Divine','2017-11-09','Ed Sheeran','Ed Sheeran'),(9,'Tera Surror','2021-08-02','Himesh Reshamiya','Himesh Reshamiya'),(10,'Love Aaj kal','2019-03-27','Arijit Singh','Arijit Singh');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_has_singers`
--

DROP TABLE IF EXISTS `albums_has_singers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums_has_singers` (
  `albums_idalbums` int(11) NOT NULL,
  `singers_idsingers` int(11) NOT NULL,
  PRIMARY KEY (`albums_idalbums`,`singers_idsingers`),
  KEY `fk_albums_has_singers_singers1_idx` (`singers_idsingers`),
  KEY `fk_albums_has_singers_albums1_idx` (`albums_idalbums`),
  CONSTRAINT `fk_albums_has_singers_albums1` FOREIGN KEY (`albums_idalbums`) REFERENCES `albums` (`idalbums`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_albums_has_singers_singers1` FOREIGN KEY (`singers_idsingers`) REFERENCES `singers` (`idsingers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_has_singers`
--

LOCK TABLES `albums_has_singers` WRITE;
/*!40000 ALTER TABLE `albums_has_singers` DISABLE KEYS */;
INSERT INTO `albums_has_singers` VALUES (4,3),(4,4),(5,6),(5,7),(6,6),(7,6),(7,7),(9,2),(10,1),(10,2);
/*!40000 ALTER TABLE `albums_has_singers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `idcities` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(45) NOT NULL,
  `Provinces_idProvinces` int(11) NOT NULL,
  PRIMARY KEY (`idcities`),
  KEY `fk_cities_Provinces1_idx` (`Provinces_idProvinces`),
  CONSTRAINT `fk_cities_Provinces1` FOREIGN KEY (`Provinces_idProvinces`) REFERENCES `provinces` (`idProvinces`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Toronto',1),(2,'Kitchener',1),(3,'Waterloo',1),(4,'Quebec City',2),(5,'Montreal',2),(6,'Levis',2),(7,'Edmonton',3),(8,'Calgary',3),(9,'Lathbridge',3),(10,'Ahmedabad',4),(11,'Surat',4),(12,'Vadodara',4),(13,'Udaipur',5),(14,'Jaipur',5),(15,'Jodhpur',5),(16,'Mumbai',6),(17,'Pune',6),(18,'Nagpur',6),(19,'Halifax',7),(20,'Sydney',7),(21,'Liverpool',7);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `idcountries` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(45) NOT NULL,
  PRIMARY KEY (`idcountries`),
  UNIQUE KEY `countryName_UNIQUE` (`countryName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Canada'),(2,'India');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `idgenres` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  PRIMARY KEY (`idgenres`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (2,'Contemporary'),(6,'Disco'),(7,'EDM'),(3,'Hip-Hop'),(4,'Jazz'),(5,'Rock'),(1,'Romantic');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membershiptype`
--

DROP TABLE IF EXISTS `membershiptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membershiptype` (
  `idmemberShipType` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `amount` decimal(5,2) NOT NULL,
  PRIMARY KEY (`idmemberShipType`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershiptype`
--

LOCK TABLES `membershiptype` WRITE;
/*!40000 ALTER TABLE `membershiptype` DISABLE KEYS */;
INSERT INTO `membershiptype` VALUES (1,'Standard',6.00),(2,'Gold',8.00),(3,'Premium',10.00);
/*!40000 ALTER TABLE `membershiptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmethod` (
  `idpaymentMethod` int(11) NOT NULL AUTO_INCREMENT,
  `MethodType` varchar(20) NOT NULL,
  `paymentDate` datetime NOT NULL,
  `amount` decimal(5,2) NOT NULL,
  PRIMARY KEY (`idpaymentMethod`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Credit Card','2021-05-11 00:00:00',6.00),(2,'Credit Card','2021-03-05 00:00:00',6.00),(3,'Credit Card','2021-07-15 00:00:00',6.00),(4,'Pay via UPI','2021-04-15 00:00:00',6.00),(5,'Credit Card','2021-06-18 00:00:00',6.00),(6,'Debit Card','2021-07-01 00:00:00',8.00),(7,'Debit Card','2021-02-25 00:00:00',8.00),(8,'Pay Via UPI','2021-02-21 00:00:00',10.00),(9,'Net Banking','2021-02-04 00:00:00',10.00),(10,'Credit Card','2021-02-04 00:00:00',10.00);
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod_has_users`
--

DROP TABLE IF EXISTS `paymentmethod_has_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmethod_has_users` (
  `paymentMethod_idpaymentMethod` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  PRIMARY KEY (`paymentMethod_idpaymentMethod`,`users_idusers`),
  KEY `fk_paymentMethod_has_users_users1_idx` (`users_idusers`),
  KEY `fk_paymentMethod_has_users_paymentMethod1_idx` (`paymentMethod_idpaymentMethod`),
  CONSTRAINT `fk_paymentMethod_has_users_paymentMethod1` FOREIGN KEY (`paymentMethod_idpaymentMethod`) REFERENCES `paymentmethod` (`idpaymentMethod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paymentMethod_has_users_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod_has_users`
--

LOCK TABLES `paymentmethod_has_users` WRITE;
/*!40000 ALTER TABLE `paymentmethod_has_users` DISABLE KEYS */;
INSERT INTO `paymentmethod_has_users` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `paymentmethod_has_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `idProvinces` int(11) NOT NULL AUTO_INCREMENT,
  `provinceName` varchar(45) NOT NULL,
  `countries_idcountries` int(11) NOT NULL,
  PRIMARY KEY (`idProvinces`),
  KEY `fk_Provinces_countries1_idx` (`countries_idcountries`),
  CONSTRAINT `fk_Provinces_countries1` FOREIGN KEY (`countries_idcountries`) REFERENCES `countries` (`idcountries`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'Ontario',1),(2,'Quebec',1),(3,'Alberta',1),(4,'Gujarat',2),(5,'Rajasthan',2),(6,'Maharashtra',2),(7,'Nova Scotia',1);
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singers`
--

DROP TABLE IF EXISTS `singers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `singers` (
  `idsingers` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `gender` char(1) NOT NULL,
  PRIMARY KEY (`idsingers`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singers`
--

LOCK TABLES `singers` WRITE;
/*!40000 ALTER TABLE `singers` DISABLE KEYS */;
INSERT INTO `singers` VALUES (1,'Arijit Singh','1987-10-14','M'),(2,'Himesh Resamiya','1981-03-09','M'),(3,'BAS','1988-01-13','M'),(4,'Salena Gomez','1996-11-05','F'),(5,'Adnan Sami','1979-02-04','M'),(6,'Ed Sheeren','1989-09-08','M'),(7,'Alan Walker','1988-10-30','M');
/*!40000 ALTER TABLE `singers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `idsongs` int(11) NOT NULL AUTO_INCREMENT,
  `songLength` decimal(4,2) NOT NULL,
  `songName` varchar(45) NOT NULL,
  `singers_idsingers` int(11) NOT NULL,
  `albums_idalbums` int(11) NOT NULL,
  `genres_idgenres1` int(11) NOT NULL,
  PRIMARY KEY (`idsongs`),
  KEY `fk_songs_singers1_idx` (`singers_idsingers`),
  KEY `fk_songs_albums1_idx` (`albums_idalbums`),
  KEY `fk_songs_genres2_idx` (`genres_idgenres1`),
  CONSTRAINT `fk_songs_albums1` FOREIGN KEY (`albums_idalbums`) REFERENCES `albums` (`idalbums`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_genres2` FOREIGN KEY (`genres_idgenres1`) REFERENCES `genres` (`idgenres`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_singers1` FOREIGN KEY (`singers_idsingers`) REFERENCES `singers` (`idsingers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,5.00,'Keep Moving',3,4,2),(2,7.00,'Talk About it',3,4,4),(3,3.00,'Romeo',3,4,4),(4,4.00,'Heart want want its want',4,4,2),(5,6.00,'Disaster',6,5,6),(6,4.00,'World End',7,5,7),(7,8.00,'Big Appetite',6,5,2),(8,5.00,'Alone',7,7,3),(9,5.00,'On my way',7,7,6),(10,4.00,'Shape of you',6,7,4),(11,4.00,'Perfect',6,6,6),(12,10.00,'Yaadein',1,9,1),(13,9.15,'Aaj din chadeya',2,9,1),(14,13.40,'Tere liye',1,10,1),(15,5.00,'Disco Deewane',2,10,2);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_listen_by_users`
--

DROP TABLE IF EXISTS `songs_listen_by_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_listen_by_users` (
  `songs_idsongs` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `listeningTime` datetime NOT NULL,
  PRIMARY KEY (`songs_idsongs`,`users_idusers`),
  KEY `fk_users_has_songs_songs1_idx` (`songs_idsongs`),
  KEY `fk_users_has_songs_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_users_has_songs_songs1` FOREIGN KEY (`songs_idsongs`) REFERENCES `songs` (`idsongs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_songs_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_listen_by_users`
--

LOCK TABLES `songs_listen_by_users` WRITE;
/*!40000 ALTER TABLE `songs_listen_by_users` DISABLE KEYS */;
INSERT INTO `songs_listen_by_users` VALUES (1,1,'2021-05-12 00:00:00'),(1,2,'2021-02-12 00:00:00'),(2,1,'2021-02-04 12:30:30'),(2,6,'2021-02-04 04:30:30'),(2,8,'2021-02-04 10:30:30'),(3,10,'2021-02-04 12:30:45'),(7,9,'2021-06-07 12:30:30'),(8,5,'2021-02-04 12:45:45'),(10,10,'2021-02-04 12:40:30'),(11,10,'2021-02-04 12:30:30'),(13,1,'2021-02-04 12:30:30'),(13,2,'2021-02-04 12:30:30'),(13,3,'2021-02-04 12:30:30'),(13,5,'2021-02-04 12:30:30'),(14,1,'2021-02-04 12:30:30'),(14,2,'2021-02-04 12:30:30'),(14,3,'2021-02-04 12:30:30'),(14,10,'2021-02-04 12:30:30'),(15,1,'2021-01-12 00:00:00'),(15,2,'2021-01-01 00:00:00'),(15,3,'2021-03-15 00:00:00'),(15,5,'2021-06-12 00:00:00'),(15,10,'2021-02-08 12:30:30');
/*!40000 ALTER TABLE `songs_listen_by_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `gender` char(1) NOT NULL,
  `phNo` varchar(10) NOT NULL,
  `address` varchar(155) NOT NULL,
  `emailID` varchar(30) NOT NULL,
  `cities_idcities` int(11) NOT NULL,
  `Provinces_idProvinces` int(11) NOT NULL,
  `countries_idcountries` int(11) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `emailID_UNIQUE` (`emailID`),
  UNIQUE KEY `phNo_UNIQUE` (`phNo`),
  KEY `fk_users_cities1_idx` (`cities_idcities`),
  KEY `fk_users_Provinces1_idx` (`Provinces_idProvinces`),
  KEY `fk_users_countries1_idx` (`countries_idcountries`),
  CONSTRAINT `fk_users_Provinces1` FOREIGN KEY (`Provinces_idProvinces`) REFERENCES `provinces` (`idProvinces`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_cities1` FOREIGN KEY (`cities_idcities`) REFERENCES `cities` (`idcities`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_countries1` FOREIGN KEY (`countries_idcountries`) REFERENCES `countries` (`idcountries`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Miten','Patel','1996-11-05','M','78958684','New Ranip','mpatel13@gmail.com',10,4,2),(2,'Shikhar','Shah','2000-06-24','M','4586985','Stirling Ave ','sshah@gmail.com',2,1,1),(3,'Keval','Patel','1998-04-30','M','986877545','Vasna','kpatel@gmail.com',10,4,2),(4,'Brinda','Patel','1999-02-12','F','7458965841','Etobicoke','bpatel@gmail.com',1,1,1),(5,'Meera','Patel','1999-05-04','F','7896574251','Pinnacle dr','mpatel@gmail.com',2,1,1),(6,'Moksh','Panchal','1998-12-12','M','789658745','Dark Ave','mpanchal@gmail.com',4,2,1),(7,'Parth','Langhoda','1999-10-12','M','7589658542','Ghatlodia','planghoda@gmail.com',10,4,2),(8,'Hemal','Raval','1999-10-16','M','9856987574','Ranip','hraval@gmail.com',4,2,1),(9,'Ayush','Patel','2000-10-17','M','7896585241','Lucifier Ave','apatel@gmail.com',7,3,1),(10,'Nidhi','Patel','1997-10-19','F','7968542365','Linden Ave','npatel@gmail.com',3,1,1),(11,'Pratik','Patel','1998-09-09','M','7895447477','Pacific Ave','pratikp@gmail.com',3,1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_membershiptype`
--

DROP TABLE IF EXISTS `users_has_membershiptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_has_membershiptype` (
  `users_idusers` int(11) NOT NULL,
  `memberShipType_idmemberShipType` int(11) NOT NULL,
  `start_Date` datetime NOT NULL,
  PRIMARY KEY (`users_idusers`,`memberShipType_idmemberShipType`),
  KEY `fk_users_has_memberShipType_memberShipType1_idx` (`memberShipType_idmemberShipType`),
  KEY `fk_users_has_memberShipType_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_users_has_memberShipType_memberShipType1` FOREIGN KEY (`memberShipType_idmemberShipType`) REFERENCES `membershiptype` (`idmemberShipType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_memberShipType_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_membershiptype`
--

LOCK TABLES `users_has_membershiptype` WRITE;
/*!40000 ALTER TABLE `users_has_membershiptype` DISABLE KEYS */;
INSERT INTO `users_has_membershiptype` VALUES (1,1,'2021-05-11 00:00:00'),(2,1,'2021-03-05 00:00:00'),(3,1,'2021-07-15 00:00:00'),(4,1,'2021-04-15 00:00:00'),(5,1,'2021-06-18 00:00:00'),(6,2,'2021-07-01 00:00:00'),(7,2,'2021-02-25 00:00:00'),(8,3,'2021-02-21 00:00:00'),(9,3,'2021-02-04 00:00:00'),(10,3,'2021-02-04 00:00:00');
/*!40000 ALTER TABLE `users_has_membershiptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `genderWithMembership` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `genderWithMembership`()
BEGIN

DECLARE countfemale INT;
DECLARE countmale INT;
 SELECT count(*) INTO countfemale from users where gender='F';
 SELECT count(*) INTO countmale from users where gender='M';
 
 IF countfemale > countmale THEN 
 select "Female has most number of subscriber with " AS "MOST SUBSCRIBERS",countfemale AS COUNT;
 else
 select "Male has most number of subscriber With" AS "MOST SUBSCRIBERS",countmale AS COUNT;
 END IF;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paymethodUsed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paymethodUsed`()
BEGIN
DECLARE leastMethodUsed VARCHAR(105);
DECLARE maxMethodUsed VARCHAR(105);
SELECT CONCAT(MethodType ," Method is  Least Popular With ", NUMBER ," Time Used") INTO leastMethodUsed FROM 
(SELECT MethodType,COUNT(*) AS NUMBER
 FROM paymentmethod
 GROUP BY MethodType )t WHERE NUMBER=(SELECT MIN(NUM) FROM (SELECT COUNT(*) AS NUM FROM paymentmethod
 GROUP BY MethodType) x);
 
 SELECT CONCAT(MethodType ," Method is  Most Popular With ", NUMBER ," Time Used") INTO maxMethodUsed FROM 
(SELECT MethodType,COUNT(*) AS NUMBER
 FROM paymentmethod
 GROUP BY MethodType )t WHERE NUMBER=(SELECT MAX(NUM) FROM (SELECT COUNT(*) AS NUM FROM paymentmethod
 GROUP BY MethodType) x);
SELECT maxMethodUsed AS "Most Popular Payment Method" ,  leastMethodUsed AS "Least Popular Payment Method";
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-16 14:08:49
