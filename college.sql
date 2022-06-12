-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: college
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `MessageID` int NOT NULL AUTO_INCREMENT,
  `MessageSender` varchar(45) DEFAULT NULL,
  `MessengerRole` varchar(45) DEFAULT NULL,
  `MessageContent` varchar(45) DEFAULT NULL,
  `MessageDate` varchar(45) DEFAULT NULL,
  `MessageReceiver` varchar(45) DEFAULT NULL,
  `RecieverRole` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Ali','Student','hello','2021-01-11','Ziad Amr','Staff'),(2,'Ziad Amr','Staff','Hello Back','2021-01-11','Ali','Student'),(3,'Ziad Amr','Staff','Hello Waleed','2021-01-12','waleed kamal','Student'),(4,'Ziad Amr','Staff','a7la mesa','2021-01-12','Ibrahim Hany','Staff'),(21,'Ziad Amr','Staff','e5waty','2021-01-12','Ibrahim Hany','Staff'),(23,'Ziad Amr','Staff','gggggg','2021-01-12','Ziad Amr','Staff'),(24,'Ziad Amr','Staff','hgfhfgjghj','2021-01-12','Ziad Amr','Staff'),(25,'Ziad Amr','Staff','hgfhfgjghj','2021-01-12','Ibrahim Hany','Staff'),(26,'Ziad Amr','Staff','hgfhfgjghj','2021-01-12','Kamel Mohamed','Staff'),(27,'Ziad Amr','Staff','Hello Niggas','2021-01-12','Ibrahim Hany','Staff'),(28,'Ziad Amr','Staff','Hello Niggas','2021-01-12','Kamel Mohamed','Staff'),(29,'Ziad Amr','Staff','hdghgfhfg','2021-01-13','Ali','Student'),(30,'zoz','Staff','A5oya abo kamal','2021-01-14','waleed kamal','Student'),(32,'zoz','Staff','A5watyyyyy','2021-01-14','Ibrahim Hany','Staff'),(33,'zoz','Staff','A5watyyyyy','2021-01-14','Kamel Mohamed','Staff'),(34,'Abo Kamal','Student','A5oyaaaa','2021-01-15','Zoz','Staff'),(35,'Abo Kamal','Student','A5oyaaaa','2021-01-15','Zoz','Staff'),(37,'Abo Kamal','Student','A5oyaaaa','2021-01-15','Zoz','Staff'),(39,'Zoz','Staff','How are you guys','2021-01-15','Ibrahim Hany','Staff'),(40,'Zoz','Staff','How are you guys','2021-01-15','Kamel Mohamed','Staff');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officehours`
--

DROP TABLE IF EXISTS `officehours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officehours` (
  `ReservationID` int NOT NULL AUTO_INCREMENT,
  `staffName` varchar(45) DEFAULT NULL,
  `SlotFrom` varchar(45) DEFAULT NULL,
  `SlotTo` varchar(45) DEFAULT NULL,
  `Subject` varchar(45) DEFAULT NULL,
  `Department` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`ReservationID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officehours`
--

LOCK TABLES `officehours` WRITE;
/*!40000 ALTER TABLE `officehours` DISABLE KEYS */;
INSERT INTO `officehours` VALUES (1,'ziad amr','1','3','Web','IS','Farag Amer','2021-01-15 00:00:00'),(2,'Ibrahim Hany','2','5','Web','IS','Ibrahim Farag','2021-01-15 00:00:00');
/*!40000 ALTER TABLE `officehours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` int NOT NULL AUTO_INCREMENT,
  `staffName` varchar(45) DEFAULT NULL,
  `studentName` varchar(45) DEFAULT NULL,
  `studentEmail` varchar(45) DEFAULT NULL,
  `slot` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `staffEmail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ReservationID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (9,'ziad amr','Abo Kamal','waleedkamal1999@gmail.com','2','2021-01-15 00:00:00','ziadamr129@gmail.com'),(11,'Ibrahim Hany','Abo Kamal','waleedkamal1999@gmail.com','1','2021-01-15 00:00:00','himahany1368@gmail.com');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffID` int NOT NULL AUTO_INCREMENT,
  `staffEmail` varchar(45) DEFAULT NULL,
  `staffName` varchar(45) DEFAULT NULL,
  `staffPassword` varchar(45) DEFAULT NULL,
  `Department` varchar(45) DEFAULT NULL,
  `CurrentSubject` varchar(45) DEFAULT NULL,
  `staffContact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'ziadamr129@gmail.com','Zoz','123','IS','web','01062640062'),(2,'himahany1368@gmail.com','Ibrahim Hany','456','IS','web','01113119989'),(3,'kemoyar@gmail.com','Kamel Mohamed','789','IS','web','01225344880');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentID` int NOT NULL AUTO_INCREMENT,
  `studentEmail` varchar(45) NOT NULL,
  `studentName` varchar(45) DEFAULT NULL,
  `studentPassword` varchar(45) DEFAULT NULL,
  `Department` varchar(45) DEFAULT NULL,
  `studentGPA` double DEFAULT '0',
  PRIMARY KEY (`studentID`,`studentEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'waleedkamal1999@gmail.com','Abo Kamal','123','CS',3.14);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-15 22:18:52
