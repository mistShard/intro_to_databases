-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: art_gallery
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `lname` varchar(25) NOT NULL,
  `dob` int NOT NULL,
  `dod` int DEFAULT NULL,
  `country` varchar(25) NOT NULL,
  `local_artist` enum('y','n') DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Vincent',NULL,'van Gogh',1853,1890,'France','n'),(2,'Rembrandt','Harmenszoon','van Rijn',1606,1669,'Netherlands','n'),(3,'Leonardo',NULL,'da Vinci',1452,1519,'Italy','n'),(4,'Venture','Lonzo','Coy',1965,NULL,'United States','y'),(5,'Deborah',NULL,'Gill',1970,NULL,'United States','y'),(6,'Claude',NULL,'Monet',1840,1926,'France','n'),(7,'Pablo',NULL,'Picasso',1904,1973,'Spain','n'),(8,'Michelangelo','di Lodovico','Simoni',1475,1564,'Italy','n');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork` (
  `artwork_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `artyear` int NOT NULL,
  `period` varchar(25) DEFAULT NULL,
  `arttype` varchar(20) DEFAULT NULL,
  `artfile` varchar(25) NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`artwork_id`),
  KEY `fk_artwork_artist1_idx` (`artist_id`),
  CONSTRAINT `fk_artwork_artist1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
INSERT INTO `artwork` VALUES (1,'Irises',1889,'Impressionism','Oil','irises.jpg',1),(2,'The Starry Night',1889,'Post-Impressionism','Oil','starrynight.jpg',1),(3,'Sunflowers',1888,'Post-impressionism','Oil','sunflowers.jpg',1),(4,'Night Watch',1642,'Baroque','Oil','nightwatch.jpg',2),(5,'Storm on the Sea of Galilee',1633,'Dutch Golden Age','Oil','stormgalilee.jpg',2),(6,'Head of a Woman',1508,'High Renaissance','Oil','headwoman.jpg',3),(7,'Last Supper',1498,'Renaissance','Tempra','lastsupper.jpg',3),(8,'Mona Lisa',1517,'Renaissance','Oil','monalisa.jpg',3),(9,'Hillside Stream',2005,'Modern','Oil','hillsidestream.jpg',4),(10,'Old Barn',1992,'Modern','Oil','oldbarn.jpg',4),(11,'Beach Baby',1999,'Modern','Watercolor','beachbaby.jpg',5),(12,'Women in the Garden',1866,'Impressionism','Oil','Womengarden.jpg',6),(13,'Old Guitarist',1904,'Modern','Oil','guitarist.jpg',7);
/*!40000 ALTER TABLE `artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artwork_has_keyword`
--

DROP TABLE IF EXISTS `artwork_has_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork_has_keyword` (
  `artwork_id` int NOT NULL,
  `keyword_id` int NOT NULL,
  PRIMARY KEY (`artwork_id`,`keyword_id`),
  KEY `fk_artwork_has_keyword_keyword1_idx` (`keyword_id`),
  KEY `fk_artwork_has_keyword_artwork1_idx` (`artwork_id`),
  CONSTRAINT `fk_artwork_has_keyword_artwork1` FOREIGN KEY (`artwork_id`) REFERENCES `artwork` (`artwork_id`),
  CONSTRAINT `fk_artwork_has_keyword_keyword1` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork_has_keyword`
--

LOCK TABLES `artwork_has_keyword` WRITE;
/*!40000 ALTER TABLE `artwork_has_keyword` DISABLE KEYS */;
INSERT INTO `artwork_has_keyword` VALUES (1,1),(3,1),(12,1),(2,2),(13,2),(2,3),(9,3),(10,3),(12,3),(4,4),(6,4),(8,4),(4,5),(5,5),(6,5),(7,5),(8,5),(11,5),(12,5),(13,5),(4,6),(5,7),(5,8),(9,8),(11,8),(5,9),(7,9),(7,10),(11,11);
/*!40000 ALTER TABLE `artwork_has_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyword` (
  `keyword_id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(15) NOT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
INSERT INTO `keyword` VALUES (1,'flowers'),(2,'blue'),(3,'landscape'),(4,'girl'),(5,'people'),(6,'battle'),(7,'boat'),(8,'water'),(9,'Christ'),(10,'food'),(11,'baby');
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 18:27:10
