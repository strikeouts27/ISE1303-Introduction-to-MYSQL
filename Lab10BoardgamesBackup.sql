CREATE DATABASE  IF NOT EXISTS `boardgames` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `boardgames`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: boardgames
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
-- Temporary view structure for view `admincustomerbalanceview`
--

DROP TABLE IF EXISTS `admincustomerbalanceview`;
/*!50001 DROP VIEW IF EXISTS `admincustomerbalanceview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admincustomerbalanceview` AS SELECT 
 1 AS `AccountID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `City`,
 1 AS `State`,
 1 AS `PhoneNumber`,
 1 AS `Balance`,
 1 AS `AccountStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `boardgames`
--

DROP TABLE IF EXISTS `boardgames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardgames` (
  `BoardgamesID` int NOT NULL,
  `Publisher` varchar(45) DEFAULT NULL,
  `BoardgameType` enum('AreaControl','Bluffing','Campaign','CombatGames','Cooperative','Dexterity','DiceGame','Drafting','DungeonCrawl','EngineBuilder','Eurogame','Legacy','Mystery','WorkerPlacement') DEFAULT NULL,
  `BoardgameName` varchar(45) DEFAULT NULL,
  `Price` decimal(2,0) DEFAULT NULL,
  `Rating` enum('A','B','C','F') DEFAULT NULL,
  `NumberOfPlayers` int DEFAULT NULL,
  `PlayMinutes` int DEFAULT NULL,
  `Inventory` int DEFAULT NULL,
  PRIMARY KEY (`BoardgamesID`),
  KEY `fk_BoardgameType_idx` (`BoardgameType`),
  KEY `fk_Publisher_idx` (`Publisher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardgames`
--

LOCK TABLES `boardgames` WRITE;
/*!40000 ALTER TABLE `boardgames` DISABLE KEYS */;
INSERT INTO `boardgames` VALUES (1,'AlderacEntertainmentGroup','Cooperative','TheCaptainIsDead',50,'A',4,60,10),(2,'FantasyFlightGames','Cooperative','EldritchHorror',50,'C',4,60,10),(3,'GuillotineGames','Cooperative','Zombicide',60,'C',6,60,10),(4,'BrotherwiseGames','CombatGames','BossMonster',20,'C',4,60,10),(5,'DaysOfWonder','Legacy','TicketToRide',40,'C',4,45,10),(6,'ReposProduction','Bluffing','Secrets',25,'C',8,45,10),(7,'CzechGames','AreaControl','LostRuinsofArnak',60,'B',4,45,10),(8,'DireWolf','EngineBuilder','Clank',60,'B',4,60,10),(9,'WizardsOfTheCoast','Campaign','Betrayal at House on the Hill',60,'B',4,60,10),(10,'Evil Hat Productions','CombatGames','TheDresdenFilesCooperativeCardGame',60,'B',4,60,10);
/*!40000 ALTER TABLE `boardgames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boardgametype`
--

DROP TABLE IF EXISTS `boardgametype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardgametype` (
  `BoardgameType` varchar(45) NOT NULL,
  `BoardgameTypeID` varchar(45) NOT NULL,
  PRIMARY KEY (`BoardgameTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardgametype`
--

LOCK TABLES `boardgametype` WRITE;
/*!40000 ALTER TABLE `boardgametype` DISABLE KEYS */;
INSERT INTO `boardgametype` VALUES ('AreaControl','A1'),('Bluffing','B1'),('Campaign','C1'),('CombatGames','CG1'),('Cooperative','COOP1'),('Dexterity','DEX1'),('DiceGame','DICE1'),('Drafting','DRAFT1'),('EngineBuilder','ENG1'),('Eurogame','Euro1'),('Legacy','LEG1');
/*!40000 ALTER TABLE `boardgametype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `AccountID` int NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `Balance` varchar(45) DEFAULT NULL,
  `ReceiptID` varchar(8) DEFAULT NULL,
  `OrderID` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (11111111,'Andrew','Stribling','404 Frustrated Programmer Ave','Frisco','Texas','2142057821','00.00','666666','88888888'),(111111112,'Stephen','Heard','404 Main Street','Brock','Texas','-8888','100.00','REC12346','123456789103'),(111111113,'Thomas','Lackey','404 No Error Street','Brock','Texas','-8889','1','REC12347','123456789103'),(111111114,'Nicholas','Hodgson','404 Geico Street','Richardson','Texas','-8881','1','REC12347','123456789104');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customeraccountview`
--

DROP TABLE IF EXISTS `customeraccountview`;
/*!50001 DROP VIEW IF EXISTS `customeraccountview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customeraccountview` AS SELECT 
 1 AS `AccountID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Address`,
 1 AS `City`,
 1 AS `State`,
 1 AS `PhoneNumber`,
 1 AS `Balance`,
 1 AS `ReceiptID`,
 1 AS `OrderID`,
 1 AS `Account Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerview`
--

DROP TABLE IF EXISTS `customerview`;
/*!50001 DROP VIEW IF EXISTS `customerview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerview` AS SELECT 
 1 AS `AccountID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Address`,
 1 AS `City`,
 1 AS `State`,
 1 AS `PhoneNumber`,
 1 AS `ReceiptID`,
 1 AS `OrderID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `managerinventoryview`
--

DROP TABLE IF EXISTS `managerinventoryview`;
/*!50001 DROP VIEW IF EXISTS `managerinventoryview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `managerinventoryview` AS SELECT 
 1 AS `BoardgamesID`,
 1 AS `BoardgameName`,
 1 AS `Publisher`,
 1 AS `BoardgameType`,
 1 AS `Price`,
 1 AS `Inventory`,
 1 AS `StockStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `AccountID` int DEFAULT NULL,
  `ReceiptID` int DEFAULT NULL,
  `CustomerName` varchar(45) DEFAULT NULL,
  `BoardgameID` varchar(45) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalBalance` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (88888888,123456789,666666,'AllenWalker','1234567890',1,100.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `Publisher` varchar(45) NOT NULL,
  `PublisherID` varchar(45) NOT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('AlderacEntertainmentGroup','1'),('EvilHatProductions','10'),('FantasyFlightGames','2'),('GuillotineGames','3'),('BrotherwiseGames','4'),('DaysOfWonder','5'),('ReposProduction','6'),('CzechGames','7'),('DireWolf','8'),('WizardsOfTheCoast','9');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `AccountID` varchar(12) NOT NULL,
  `ReceiptID` int DEFAULT NULL,
  `CustomerName` varchar(45) DEFAULT NULL,
  `BoardgameID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalBalance` decimal(6,3) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `admincustomerbalanceview`
--

/*!50001 DROP VIEW IF EXISTS `admincustomerbalanceview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admincustomerbalanceview` AS select `customer`.`AccountID` AS `AccountID`,`customer`.`FirstName` AS `FirstName`,`customer`.`LastName` AS `LastName`,`customer`.`City` AS `City`,`customer`.`State` AS `State`,`customer`.`PhoneNumber` AS `PhoneNumber`,`customer`.`Balance` AS `Balance`,(case when (`customer`.`Balance` < 0) then 'Negative Balance' when (`customer`.`Balance` = 0) then 'Zero Balance' when (`customer`.`Balance` <= 50) then 'Low Balance' else 'Good Standing' end) AS `AccountStatus` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customeraccountview`
--

/*!50001 DROP VIEW IF EXISTS `customeraccountview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customeraccountview` AS select `customer`.`AccountID` AS `AccountID`,`customer`.`FirstName` AS `FirstName`,`customer`.`LastName` AS `LastName`,`customer`.`Address` AS `Address`,`customer`.`City` AS `City`,`customer`.`State` AS `State`,`customer`.`PhoneNumber` AS `PhoneNumber`,`customer`.`Balance` AS `Balance`,`customer`.`ReceiptID` AS `ReceiptID`,`customer`.`OrderID` AS `OrderID`,(case when (`customer`.`Balance` < 0) then 'Customer Is Owed Money' when (`customer`.`Balance` = 0) then 'Customer is current on debts' when (`customer`.`Balance` <= 50) then 'Low Balance' else 'Customer account locked due to nonpayment' end) AS `Account Status` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerview`
--

/*!50001 DROP VIEW IF EXISTS `customerview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerview` AS select `customer`.`AccountID` AS `AccountID`,`customer`.`FirstName` AS `FirstName`,`customer`.`LastName` AS `LastName`,`customer`.`Address` AS `Address`,`customer`.`City` AS `City`,`customer`.`State` AS `State`,`customer`.`PhoneNumber` AS `PhoneNumber`,`customer`.`ReceiptID` AS `ReceiptID`,`customer`.`OrderID` AS `OrderID` from `customer` where (`customer`.`AccountID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `managerinventoryview`
--

/*!50001 DROP VIEW IF EXISTS `managerinventoryview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `managerinventoryview` AS select `boardgames`.`BoardgamesID` AS `BoardgamesID`,`boardgames`.`BoardgameName` AS `BoardgameName`,`boardgames`.`Publisher` AS `Publisher`,`boardgames`.`BoardgameType` AS `BoardgameType`,`boardgames`.`Price` AS `Price`,`boardgames`.`Inventory` AS `Inventory`,(case when (`boardgames`.`Inventory` = 0) then 'Out of Stock' when (`boardgames`.`Inventory` <= 5) then 'Low Stock' when (`boardgames`.`Inventory` <= 20) then 'Normal Stock' else 'High Stock' end) AS `StockStatus` from `boardgames` */;
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

-- Dump completed on 2025-08-13 15:09:08
