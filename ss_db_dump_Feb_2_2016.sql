-- MySQL dump 10.13  Distrib 5.6.26, for osx10.8 (x86_64)
--
-- Host: localhost    Database: ss
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `add_line_1` varchar(100) NOT NULL,
  `add_line_2` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'98xxxxxxxx','121 Old Street','M-Block','110019','UP','2016-01-29 20:33:57','2016-01-29 20:33:57',NULL),(2,'98xxxxxxxx','121 New Street','C-Block','110020','Haryana','2016-01-29 20:34:22','2016-01-29 20:34:22',NULL),(3,'98xxxxxxxx','980 New Street','S-Block','110022','Punjab','2016-01-29 20:35:46','2016-01-29 20:35:46',NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker`
--

DROP TABLE IF EXISTS `broker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `services` varchar(50) DEFAULT NULL,
  `is_blacklisted` tinyint(1) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker`
--

LOCK TABLES `broker` WRITE;
/*!40000 ALTER TABLE `broker` DISABLE KEYS */;
INSERT INTO `broker` VALUES (1,'Rajesh','Sharma','rajesh@agc.com','pwd','Bhicaji Cama','New Delhi','PP',0,1,'2015-12-28 01:10:41','2015-12-28 01:10:41'),(2,'Robert','Sharma','werajesh@agc.com','pwd','Bhicaji Cama','New Delhi','PP',0,1,'2015-12-28 01:11:30','2015-12-28 01:11:30'),(3,'Mukesh','Singh','rajesh@agc.com','pwd','Bhicaji Cama','New Delhi','PP',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(4,'Ramesh','Chauhan','chauh@agc.com','pwd','Bhicaji Cama','New Delhi','PP',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(5,'Harish','Mishra','mish@agc.com','pwd','Cannaught Palace','New Delhi','PP',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(6,'Umesh','Tikoo','tikoo@agc.com','pwd','Azadpur','New Delhi','Affidavit',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(7,'Chatur','Sen','sen@agc.com','pwd','Bhicaji Cama','New Delhi','Affidavit',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(8,'Ashish','Varma','ashish@agc.com','pwd','Rohini','New Delhi','Birth Certificate',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(9,'Gaurav','Prakash','gaurav@agc.com','pwd','Vikas Puri','New Delhi','Marriage Certificate',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(10,'Akhil','Chaudhary','akhil@agc.com','pwd','Janak Puri','New Delhi','Marriage Certificate',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(11,'Kshitiz','Gautam','gautam@agc.com','pwd','Sen Road','Kolkata','Marriage Certificate',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(12,'Amit','Singh','singh@agc.com','pwd','MG Road','Bangalore','PP',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(13,'Sumit','Goel','goel@agc.com','pwd','Worli','Mumbai','PP',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(14,'Punit','Khan','khan@agc.com','pwd','Andheri W','Mumbai','PP',0,1,'2015-12-28 01:18:07','2015-12-28 01:18:07'),(15,'Hritik','Roshan','hrosha@agc.com','pwd','Naramain Point','Mumbai','PP',0,1,'2015-12-28 01:18:09','2015-12-28 01:18:09');
/*!40000 ALTER TABLE `broker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flows_master`
--

DROP TABLE IF EXISTS `flows_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flows_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_desc` varchar(50) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flows_master`
--

LOCK TABLES `flows_master` WRITE;
/*!40000 ALTER TABLE `flows_master` DISABLE KEYS */;
INSERT INTO `flows_master` VALUES (1,'COMPANY FORMATION',1,'2015-12-28 05:27:01','2015-12-28 05:27:01'),(2,'NEW PASSPORT',1,'2015-12-28 05:27:19','2015-12-28 05:27:19'),(3,'RENEW PASSPORT',1,'2015-12-28 05:27:27','2015-12-28 05:27:27'),(4,'BIRTH CERTIFICATE',1,'2015-12-28 05:27:38','2015-12-28 05:27:38'),(5,'MARRIAGE CERTIFICATE',1,'2015-12-28 05:27:46','2015-12-28 05:27:46'),(6,'Marriage Registration',1,'2015-12-28 05:28:54','2015-12-28 05:28:54'),(7,'House Naksha Pass',1,'2015-12-28 05:29:07','2015-12-28 05:29:07'),(8,'Gun License',1,'2015-12-28 05:29:29','2015-12-28 05:29:29'),(9,'Home Lease Affidavit',1,'2015-12-28 05:29:47','2015-12-28 05:29:47'),(10,'Death Certificate',1,'2015-12-28 05:30:02','2015-12-28 05:30:02'),(11,'Apply New PAN Card',1,'2015-12-28 05:30:14','2015-12-28 05:30:14'),(12,'Apply for VISA any country',1,'2015-12-28 05:30:29','2015-12-28 05:30:29'),(13,'Apply OCI',1,'2015-12-28 05:31:35','2015-12-28 05:31:35'),(14,'Apply Voter ID',1,'2015-12-28 05:31:45','2015-12-28 05:31:45'),(15,'Apply New Water Meter',1,'2015-12-28 05:31:55','2015-12-28 05:31:55'),(16,'Apply New Gas Connection',1,'2015-12-28 05:32:01','2015-12-28 05:32:01'),(17,'Import Good into India',1,'2015-12-28 05:32:15','2015-12-28 05:32:15'),(18,'Export Goods out of India',1,'2015-12-28 05:32:31','2015-12-28 05:32:31'),(19,'New Electricity Connection',1,'2015-12-28 05:32:50','2015-12-28 05:32:50'),(20,'Legal Name Change',1,'2015-12-28 05:33:05','2015-12-28 05:33:05'),(21,'Transfer Property To Another Buyer',1,'2015-12-28 05:33:22','2015-12-28 05:33:22'),(22,'Create Will for Family',1,'2015-12-28 05:33:39','2015-12-28 05:33:39'),(23,'Import Pets into India',1,'2015-12-28 05:33:52','2015-12-28 05:33:52'),(24,'Filing PIL',1,'2015-12-28 05:34:19','2015-12-28 05:34:19'),(25,'Buy Or Sell Used Vehicle',1,'2015-12-28 05:34:37','2015-12-28 05:34:37'),(26,'Buy or Sell House',1,'2015-12-28 05:35:02','2015-12-28 05:35:02'),(27,'Adding Wife/Family To Property',1,'2015-12-28 05:35:27','2015-12-28 05:35:27'),(28,'Register a PATENT',1,'2015-12-28 05:35:51','2015-12-28 05:35:51'),(29,'Register A TradeMark',1,'2015-12-28 05:36:03','2015-12-28 05:36:03'),(30,'Dissolution Of Business',1,'2015-12-28 05:36:15','2015-12-28 05:36:15'),(31,'Aadhar Card',1,'2016-01-30 05:47:04','2016-01-30 05:47:04'),(32,'US Visa',1,'2016-01-30 05:47:24','2016-01-30 05:47:24');
/*!40000 ALTER TABLE `flows_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  `passportNum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_key` varchar(32) NOT NULL,
  `question_text` text NOT NULL,
  `question_type` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `serviceid` int(11) DEFAULT NULL,
  `validation_type` varchar(10) DEFAULT NULL,
  `page_break` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `it` int(11) NOT NULL AUTO_INCREMENT,
  `broker_id` int(11) DEFAULT NULL,
  `text` longtext,
  `start` int(11) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`it`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,'He was very help full.',5,1,2,'2015-12-28 04:41:17','2015-12-28 04:41:17'),(2,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(3,3,'I review him good.',5,1,3,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(4,4,'Good.',5,1,4,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(5,4,'Bad.',5,1,5,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(6,5,'Unprofessional.',5,1,6,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(7,5,'Impressed and recommend.',5,1,7,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(8,5,'he is very knowledgeable.',5,1,8,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(9,4,'Knows what he does',5,1,9,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(10,4,'Lucky that I found him.',5,1,9,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(11,4,'It was a breeze to deal with him.',5,1,9,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(12,2,'Vey professional.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(13,2,'Unprofessional.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(14,2,'Highly-recommend',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(15,1,'Very courteous and helpful',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(16,1,'Amazing.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(17,1,'Professional',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(18,6,'Smart & professional.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(19,6,'Pleased!',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(20,7,'I liked dealing him.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(21,7,'Everything was very clean and clear.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(22,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(23,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(24,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(25,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(26,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(27,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(28,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(29,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(30,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(31,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(32,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(33,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(34,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(35,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(36,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(37,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(38,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(39,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(40,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(41,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(42,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(43,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(44,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(45,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(46,2,'He was very help full.',5,1,2,'2015-12-28 04:47:22','2015-12-28 04:47:22'),(47,2,'He was very help full.',5,1,2,'2015-12-28 04:47:23','2015-12-28 04:47:23');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `is_blacklisted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Salman','Khan','salman@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(2,'Shakhrukh','Khan','sds@as.com','asdfs',13,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(3,'Amir','Khan','salmsdsdan@as.com','asdfs',14,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(4,'Suheel','Khan','sd@as.com','asdfs',15,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(5,'Harshit','Singh','geer@as.com','asdfs',16,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(6,'Natwar','Singh','er@as.com','asdfs',16,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(7,'Amitabh','Bachan','er@as.com','asdfs',17,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(8,'Suneel','Shetty','34re@as.com','asdfs',18,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(9,'Mithun','Sen','er@as.com','asdfs',19,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(10,'Mandakni','Kapoor','erer@as.com','asdfs',20,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(11,'Urmila','Arora','wtg@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(12,'Madhuri','Dikshit','ererer@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(13,'Sanjay','Dutt','erre@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(14,'Gauri','Kapoor','lkf@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(15,'Udit','Mihra','rgf@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(16,'Akshay','Meena','salman@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(17,'Prakash','Gautam','sdnsdn@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(18,'Teena','Singh','salman@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(19,'Reena','Singh','salman@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(20,'Meena','Gupta','salman@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(21,'Salman','Goel','salman@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(22,'Sheena','Mittal','salman@as.com','asdfs',12,0,'2015-12-28 01:27:21','2015-12-28 01:27:21',NULL),(23,'Jeetu','Lakhan','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(24,'Anil','Kapoor','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(25,'Sunil','Arora','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(26,'Chapu','Sehgal','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(27,'Ram','Singh','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(28,'Kapil','Chauhan','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(29,'Jacky','Mehra','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(30,'Jack','Mehta','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(31,'Jill','Hoel','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(32,'Dinoo','Bheja','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(33,'Tinoo','Ting','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL),(34,'Meenu','Ming','salman@as.com','asdfs',12,0,'2015-12-28 01:27:22','2015-12-28 01:27:22',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-02 18:10:10
