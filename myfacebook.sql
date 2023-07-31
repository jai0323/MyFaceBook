-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: myfacebook
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) DEFAULT NULL,
  `rec` varchar(50) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `dor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,'jaishobhit45@gmail.com','chitrangda03@gmail.com',1,'Mon Sep 26 01:21:44 IST 2022'),(3,'jaishobhit45@gmail.com','raghav16@gmail.com',1,'Tue Sep 27 19:23:04 IST 2022'),(4,'aman@gmail.com','chitrangda03@gmail.com',0,'Thu Nov 17 14:19:50 IST 2022'),(5,'rooshni@gmail.com','chitrangda03@gmail.com',1,'Thu Nov 17 16:24:09 IST 2022'),(7,'chitrangda03@gmail.com',NULL,0,'Sun Dec 18 00:05:17 IST 2022');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hearts`
--

DROP TABLE IF EXISTS `hearts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hearts` (
  `wid` int NOT NULL,
  `likes` int DEFAULT NULL,
  `com` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hearts`
--

LOCK TABLES `hearts` WRITE;
/*!40000 ALTER TABLE `hearts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hearts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `emailid` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pno` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aman@gmail.com','aman','Aman','7387483902','Male'),('chitrangda03@gmail.com','jai143','chitrangda','8279946510','Female'),('jaishobhit45@gmail.com','india','Jai Shobhit','9927155685','Male'),('raghav16@gmail.com','nidia','raghav','767681128','Male'),('rooshni@gmail.com','roshni','Roshni','123456789','Female');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wpost`
--

DROP TABLE IF EXISTS `wpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wpost` (
  `wid` int NOT NULL AUTO_INCREMENT,
  `p` varchar(100) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `dop` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` blob,
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wpost`
--

LOCK TABLES `wpost` WRITE;
/*!40000 ALTER TABLE `wpost` DISABLE KEYS */;
INSERT INTO `wpost` VALUES (1,'J2EE is Crazy......!','jaishobhit45@gmail.com','Mon Sep 26 20:43:50 IST 2022','Jai Shobhit',NULL),(2,'hello India','chitrangda03@gmail.com','Thu Nov 17 14:23:16 IST 2022','chitrangda',NULL),(3,'hello world','chitrangda03@gmail.com','Thu Nov 17 16:25:34 IST 2022','chitrangda',NULL),(4,'hello','jaishobhit45@gmail.com','Tue Dec 13 20:03:58 IST 2022','Jai Shobhit',NULL);
/*!40000 ALTER TABLE `wpost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 18:01:51
