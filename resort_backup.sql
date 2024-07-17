-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: holiday_cabins
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activity_ID` int NOT NULL,
  `activity_name` varchar(50) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`activity_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Surfing',50),(2,'Spa',30),(3,'Hiking Trail',15),(4,'Crafts',10),(5,'Cycling',25),(6,'Dinner',20);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `activitiesItem_Before_Insert` BEFORE INSERT ON `activities` FOR EACH ROW BEGIN
	SET new.activity_name = CONCAT(UPPER(SUBSTRING(NEW.activity_name,1,1)),
							LOWER(SUBSTRING(NEW.activity_name FROM 2)));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `booked_activities`
--

DROP TABLE IF EXISTS `booked_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_activities` (
  `activities_booked_ID` int NOT NULL,
  `activity_ID` int NOT NULL,
  `date_of_activity` date DEFAULT NULL,
  `quantity` int NOT NULL,
  `booking_ID` int DEFAULT NULL,
  PRIMARY KEY (`activities_booked_ID`),
  KEY `activity_ID` (`activity_ID`),
  KEY `booking_ID` (`booking_ID`),
  CONSTRAINT `booked_activities_ibfk_1` FOREIGN KEY (`activity_ID`) REFERENCES `activities` (`activity_ID`),
  CONSTRAINT `booked_activities_ibfk_2` FOREIGN KEY (`booking_ID`) REFERENCES `bookings` (`booking_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked_activities`
--

LOCK TABLES `booked_activities` WRITE;
/*!40000 ALTER TABLE `booked_activities` DISABLE KEYS */;
INSERT INTO `booked_activities` VALUES (1,1,'2023-12-12',1,1),(2,1,'2023-12-12',2,2),(3,2,'2023-12-12',3,5),(4,2,'2023-12-12',1,4),(5,5,'2023-12-13',3,4),(6,3,'2023-12-13',2,13),(7,4,'2023-12-13',4,15),(8,4,'2023-12-13',5,15),(9,1,'2023-12-13',1,16),(10,2,'2023-12-14',1,17),(11,3,'2023-12-14',2,18),(12,1,'2023-12-12',4,21),(13,4,'2023-12-12',3,1),(14,1,'2023-12-14',3,19),(15,2,'2023-12-14',4,20),(16,1,'2023-12-15',2,21),(17,3,'2023-12-15',2,22),(18,1,'2023-12-15',1,23),(19,1,'2023-12-15',2,24),(20,2,'2023-12-16',2,25),(21,2,'2023-12-17',1,26),(22,4,'2023-12-17',5,27),(23,5,'2023-12-17',2,28),(24,3,'2023-12-17',4,29),(25,1,'2023-12-18',3,16),(26,2,'2023-12-18',2,9),(27,5,'2023-12-19',2,19),(28,4,'2023-12-19',4,10),(29,2,'2023-12-19',4,13),(30,1,'2023-12-19',5,1);
/*!40000 ALTER TABLE `booked_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `booked_activities_details`
--

DROP TABLE IF EXISTS `booked_activities_details`;
/*!50001 DROP VIEW IF EXISTS `booked_activities_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `booked_activities_details` AS SELECT 
 1 AS `activities_booked_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `phone`,
 1 AS `email_address`,
 1 AS `activity_name`,
 1 AS `price`,
 1 AS `date_of_activity`,
 1 AS `quantity`,
 1 AS `date_booked`,
 1 AS `total_activity_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `booked_cabins`
--

DROP TABLE IF EXISTS `booked_cabins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_cabins` (
  `cabin_booking_id` int NOT NULL AUTO_INCREMENT,
  `cabin_ID` int NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `nights_booked` int DEFAULT NULL,
  `booking_ID` int NOT NULL,
  PRIMARY KEY (`cabin_booking_id`),
  KEY `cabin_ID` (`cabin_ID`),
  KEY `booking_ID` (`booking_ID`),
  CONSTRAINT `booked_cabins_ibfk_1` FOREIGN KEY (`cabin_ID`) REFERENCES `cabins` (`cabin_ID`),
  CONSTRAINT `booked_cabins_ibfk_2` FOREIGN KEY (`booking_ID`) REFERENCES `bookings` (`booking_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked_cabins`
--

LOCK TABLES `booked_cabins` WRITE;
/*!40000 ALTER TABLE `booked_cabins` DISABLE KEYS */;
INSERT INTO `booked_cabins` VALUES (1,7,'2023-07-09','2023-07-13',4,1),(2,8,'2023-07-17','2023-07-19',2,2),(3,1,'2023-07-09','2023-07-11',2,3),(4,11,'2023-07-03','2023-07-07',4,4),(5,6,'2023-07-08','2023-07-12',4,5),(6,6,'2023-07-17','2023-07-19',2,6),(7,10,'2023-07-22','2023-07-26',4,7),(8,10,'2023-07-16','2023-07-19',3,8),(9,11,'2023-07-20','2023-07-26',6,9),(10,11,'2023-07-11','2023-07-15',4,10),(11,2,'2023-07-11','2023-07-15',4,10),(12,9,'2023-07-31','2023-08-02',2,11),(13,12,'2023-07-29','2023-08-03',5,12),(14,6,'2023-07-03','2023-07-06',3,13),(15,3,'2023-07-03','2023-07-05',2,14),(16,5,'2023-07-14','2023-07-17',3,15),(17,9,'2023-07-18','2023-07-25',7,16),(18,3,'2023-07-18','2023-07-25',7,16),(19,4,'2023-07-18','2023-07-25',7,16),(20,3,'2023-07-07','2023-07-12',5,17),(21,4,'2023-07-03','2023-07-05',2,18),(22,12,'2023-07-10','2023-07-17',7,19),(23,2,'2023-08-01','2023-08-05',4,20),(24,10,'2023-07-30','2023-08-02',3,21),(25,8,'2023-07-24','2023-07-25',1,22),(26,7,'2023-07-22','2023-07-27',5,23),(27,4,'2023-07-28','2023-07-31',3,24),(28,5,'2023-07-24','2023-07-26',2,25),(29,5,'2023-07-31','2023-08-03',3,26),(30,4,'2023-08-07','2023-08-09',2,27);
/*!40000 ALTER TABLE `booked_cabins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_ID` int NOT NULL,
  `date_booked` date NOT NULL,
  `customer_ID` int NOT NULL,
  PRIMARY KEY (`booking_ID`),
  KEY `customer_ID` (`customer_ID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer_details` (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2023-01-01',25),(2,'2023-01-23',3),(3,'2023-02-02',8),(4,'2023-02-07',15),(5,'2023-03-01',18),(6,'2023-03-02',22),(7,'2023-04-27',20),(8,'2023-05-08',19),(9,'2023-05-09',17),(10,'2023-05-10',7),(11,'2023-05-11',4),(12,'2023-05-16',9),(13,'2023-05-19',1),(14,'2023-05-20',25),(15,'2023-05-22',2),(16,'2023-05-27',20),(17,'2023-06-01',24),(18,'2023-06-11',5),(19,'2023-06-17',1),(20,'2023-07-20',23),(21,'2023-07-28',6),(22,'2023-08-08',8),(23,'2023-09-09',16),(24,'2023-09-10',6),(25,'2023-10-10',14),(26,'2023-10-20',11),(27,'2023-11-01',8),(28,'2023-11-11',13),(29,'2023-11-18',21),(30,'2023-12-01',12);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cabin_bookings_details`
--

DROP TABLE IF EXISTS `cabin_bookings_details`;
/*!50001 DROP VIEW IF EXISTS `cabin_bookings_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cabin_bookings_details` AS SELECT 
 1 AS `cabin_name`,
 1 AS `treehouse`,
 1 AS `bedrooms`,
 1 AS `guests`,
 1 AS `price`,
 1 AS `cabin_booking_id`,
 1 AS `arrival_date`,
 1 AS `departure_date`,
 1 AS `nights_booked`,
 1 AS `date_booked`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `phone`,
 1 AS `email_address`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cabins`
--

DROP TABLE IF EXISTS `cabins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabins` (
  `cabin_ID` int NOT NULL,
  `cabin_name` varchar(55) NOT NULL,
  `treehouse` tinyint(1) DEFAULT NULL,
  `bedrooms` varchar(10) NOT NULL,
  `guests` varchar(10) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`cabin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabins`
--

LOCK TABLES `cabins` WRITE;
/*!40000 ALTER TABLE `cabins` DISABLE KEYS */;
INSERT INTO `cabins` VALUES (1,'Rabbit Hill',0,'1','2',100),(2,'Trout Corner',1,'2','5',150),(3,'Goose Hollow',0,'2','5',200),(4,'Fox Run',0,'1','2',125),(5,'Slipper Slope',1,'2','4',170),(6,'Lavender Lodge',1,'1','2',100),(7,'Daisy Hideaway',0,'3','5',200),(8,'Swollow’s Nest',1,'2','3',130),(9,'Wildflower Hutch',1,'1','2',100),(10,'Willow Grove',0,'2','5',240),(11,'Oak Nook',0,'3','6',250),(12,'Sunset End',0,'4','8',300);
/*!40000 ALTER TABLE `cabins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `contact_details`
--

DROP TABLE IF EXISTS `contact_details`;
/*!50001 DROP VIEW IF EXISTS `contact_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_details` AS SELECT 
 1 AS `customer_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email_address`,
 1 AS `phone`,
 1 AS `first_line`,
 1 AS `second_line`,
 1 AS `town`,
 1 AS `post_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addresses` (
  `address_ID` int NOT NULL,
  `first_line` varchar(50) NOT NULL,
  `second_line` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `post_code` varchar(10) NOT NULL,
  PRIMARY KEY (`address_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addresses`
--

LOCK TABLES `customer_addresses` WRITE;
/*!40000 ALTER TABLE `customer_addresses` DISABLE KEYS */;
INSERT INTO `customer_addresses` VALUES (1,'5 Fisher Place','','Thirlmere','CA12 4TW'),(2,'18 Muncaster Way','','West Haddon','NN6 7DU'),(3,'30 King Edward Street','','Macclesfield','SK10 1AE'),(4,'1 Western Road','','Crediton','EX17 3LZ'),(5,'Tudorwell','Broad Bush','Blunsdon','SN26 7DH'),(6,'34 Kerr Close','','Knebworth','SG3 6AB'),(7,'7 Station Road','','Hessle','HU13 0BD'),(8,'Penygraig','Quay Road','Goodwick','SA64 0BS'),(9,'31 Redcar Road','','Guisborough','TS14 6HR'),(10,'5 Hookstone Grange Court','','Harrogate','HG2 7BP'),(11,'35 Elmwood Drive','','Blythe Bridge','ST11 9NE'),(12,'17 Stanion Lane','','Corby','NN18 8ES'),(13,'116 Ketley Park Road','','Ketley','TF1 5FA'),(14,'7 Paradise Road','','Richmond','TW9 1RX'),(15,'Highfields House','23 The Kings Gap','Shrewsbury','SY3 9BJ'),(16,'5 Wigeon Close','','Great Notley','CM77 7WB'),(17,'Brow Edge','','Drigg','CA19 1XS'),(18,'6 Kingsport Close','','Stockton-On-Tees','TS18 2LE'),(19,'103 Forest Road','','Northallerton','DL6 1LD'),(20,'18 Meadlands','','Corston','BA2 9AS'),(21,'256 Brantingham Road','Chorlton-Cum-Hardy','Manchester','M21 0QZ'),(22,'Pod 104 The Overstrand','Boscombe Promenade','Bournemouth','BH5 1BN'),(23,'8 Malvern Close','','Ottershaw','KT16 0NY'),(24,'3 Lindum Way','','Worthing','BN13 1LS'),(25,'22 Leslie Avenue','','Hebburn','NE31 1XN'),(26,'48 Butterslade Grove','','Ynysforgan','SA6 6QU');
/*!40000 ALTER TABLE `customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `customer_ID` int NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `address_ID` int NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_ID`),
  KEY `address_ID` (`address_ID`),
  CONSTRAINT `customer_details_ibfk_1` FOREIGN KEY (`address_ID`) REFERENCES `customer_addresses` (`address_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (1,'Hillary','Riley',1,'in.hendrerit.consectetuer@atrisusNunc.co.uk','07768 743633'),(2,'Mari','Baldwin',2,'ornare.facilisis@eliterat.org','07327 767123'),(3,'Lysandra','Daniel',3,'malesuada@lorem.edu','07625 131765'),(4,'Indira','Marquez',4,'non.lorem@consequatpurus.net','(01363) 405417'),(5,'Jack','Massey',5,'gravida@ametrisus.edu','(01793) 182452'),(6,'Timon','Frost',6,'molestie@scelerisquescelerisque.ca','(01438) 180844'),(7,'Ahmed','Gregory',7,'ornare.placerat.orci@pedeacurna.edu','07265 845658'),(8,'Jemima','Adkins',8,'enim@vulputateduinec.edu','07115 228569'),(9,'Leah','Snow',8,'a.felis.ullamcorper@feugiatSed.ca','(01348) 355808'),(10,'Deanna','Simpson',9,'libero.et.tristique@sit.edu','(01423) 561214'),(11,'Hayfa','Gillespie',10,'tellus.imperdiet.non@CuraePhasellus.net','(01782) 736278'),(12,'Hu','Sweeney',11,'In.tincidunt.congue@tinciduntorciquis.co.uk','07778 544658'),(13,'Burton','Glover',12,'dui.augue.eu@risusNuncac.org','07665 592256'),(14,'Yoko','Sanford',12,'eget.dictum.placerat@natoquepenatibus.com','(01952) 160285'),(15,'Kane','Brooks',13,'iaculis.quis.pede@fringillapurusmauris.edu','07411 029080'),(16,'Damon','Welch',14,'porttitor@massa.co.uk','07633 665859'),(17,'Sybill','Berger',15,'et.magnis@adlitora.ca','(01376) 755648'),(18,'Gage','Moody',15,'erat@orciDonecnibh.org','(01642) 508634'),(19,'Darryl','Rollins',16,'eu@Phaselluselit.org','07845 651975'),(20,'Rama','Jones',17,'Morbi.accumsan@metus.edu','07494 156321'),(21,'Patricia','Vaughn',18,'luctus.vulputate@Donecvitae.ca','(0161) 351 1123'),(22,'Jameson','Stuart',19,'nec.mauris.blandit@lacinia.com','(01202) 624754'),(23,'Pandora','Dillard',20,'sit.amet@eu.co.uk','(01932) 626177'),(24,'Quyn','Mcmillan',21,'sit.amet@elementumdui.com','07465 215654'),(25,'Timothy','Barlow',22,'a.mi@eget.edu','07845 262336');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'holiday_cabins'
--

--
-- Dumping routines for database 'holiday_cabins'
--
/*!50003 DROP FUNCTION IF EXISTS `discounted_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `discounted_price`(input_amount DECIMAL(7,2)) RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE output_amount DECIMAL(7,2);
    SET output_amount = input_amount -10/100*input_amount;
    RETURN output_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bikes_needed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bikes_needed`(on_date DATE)
BEGIN
	SELECT 
		SUM(quantity) AS total_bikes_needed
	FROM 
		Booked_activities AS ba
	WHERE activity_id IN (
		SELECT activity_id
		FROM activities AS a
		WHERE a.activity_name = 'Cycling')
		AND ba.date_of_activity = on_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `surfboards_needed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `surfboards_needed`(on_date DATE)
BEGIN
	SELECT 
		SUM(quantity) AS total_surfboards_needed
	FROM 
		Booked_activities AS ba
	WHERE activity_id IN (
		SELECT activity_id
		FROM activities AS a
		WHERE a.activity_name = 'Surfing')
		AND ba.date_of_activity = on_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `booked_activities_details`
--

/*!50001 DROP VIEW IF EXISTS `booked_activities_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booked_activities_details` AS select `ba`.`activities_booked_ID` AS `activities_booked_id`,`cd`.`first_name` AS `first_name`,`cd`.`last_name` AS `last_name`,`cd`.`phone` AS `phone`,`cd`.`email_address` AS `email_address`,`a`.`activity_name` AS `activity_name`,`a`.`price` AS `price`,`ba`.`date_of_activity` AS `date_of_activity`,`ba`.`quantity` AS `quantity`,`b`.`date_booked` AS `date_booked`,(`a`.`price` * `ba`.`quantity`) AS `total_activity_price` from (((`activities` `a` join `booked_activities` `ba` on((`ba`.`activity_ID` = `a`.`activity_ID`))) join `bookings` `b` on((`b`.`booking_ID` = `ba`.`booking_ID`))) join `customer_details` `cd` on((`cd`.`customer_ID` = `b`.`customer_ID`))) order by `ba`.`activities_booked_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cabin_bookings_details`
--

/*!50001 DROP VIEW IF EXISTS `cabin_bookings_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cabin_bookings_details` AS select `c`.`cabin_name` AS `cabin_name`,`c`.`treehouse` AS `treehouse`,`c`.`bedrooms` AS `bedrooms`,`c`.`guests` AS `guests`,`c`.`price` AS `price`,`bc`.`cabin_booking_id` AS `cabin_booking_id`,`bc`.`arrival_date` AS `arrival_date`,`bc`.`departure_date` AS `departure_date`,`bc`.`nights_booked` AS `nights_booked`,`b`.`date_booked` AS `date_booked`,`cd`.`first_name` AS `first_name`,`cd`.`last_name` AS `last_name`,`cd`.`phone` AS `phone`,`cd`.`email_address` AS `email_address`,(`bc`.`nights_booked` * `c`.`price`) AS `total_price` from (((`booked_cabins` `bc` join `cabins` `c` on((`c`.`cabin_ID` = `bc`.`cabin_ID`))) join `bookings` `b` on((`b`.`booking_ID` = `bc`.`booking_ID`))) join `customer_details` `cd` on((`cd`.`customer_ID` = `b`.`customer_ID`))) order by `bc`.`cabin_booking_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_details`
--

/*!50001 DROP VIEW IF EXISTS `contact_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_details` AS select `cd`.`customer_ID` AS `customer_id`,`cd`.`first_name` AS `first_name`,`cd`.`last_name` AS `last_name`,`cd`.`email_address` AS `email_address`,`cd`.`phone` AS `phone`,`ca`.`first_line` AS `first_line`,`ca`.`second_line` AS `second_line`,`ca`.`town` AS `town`,`ca`.`post_code` AS `post_code` from (`customer_details` `cd` left join `customer_addresses` `ca` on((`cd`.`address_ID` = `ca`.`address_ID`))) */;
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

-- Dump completed on 2023-11-27 20:19:05
