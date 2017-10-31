-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: barbershop
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `chatmessage`
--

DROP TABLE IF EXISTS `chatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'код сообщения',
  `temp` int(11) DEFAULT NULL COMMENT 'рандомный код от клиента',
  `utcSendTime` date DEFAULT NULL COMMENT 'время отправки сообщения клиентом',
  `utcApplyTime` date DEFAULT NULL COMMENT 'время получения сообщения на сервер',
  `utcReceiveTime` date DEFAULT NULL COMMENT 'время отправки сообщения получателю',
  `customerId` int(11) DEFAULT NULL COMMENT 'код парикмахера',
  `clientId` int(11) DEFAULT NULL COMMENT 'код клиента',
  `direction` int(11) DEFAULT NULL COMMENT 'направление сообщения (от клиента парикмахеру, от парикмахера клиенту)',
  `message` varchar(500) DEFAULT NULL COMMENT 'текстовое сообщение',
  `msgType` int(11) DEFAULT NULL COMMENT 'тип сообщения',
  `msgBody` varchar(1024) DEFAULT NULL COMMENT 'структурированное тело запроса / ответа',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatmessage`
--

LOCK TABLES `chatmessage` WRITE;
/*!40000 ALTER TABLE `chatmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_city2region_idx` (`regionId`),
  CONSTRAINT `FK_city2region` FOREIGN KEY (`regionId`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citytitle`
--

DROP TABLE IF EXISTS `citytitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citytitle` (
  `pid` int(11) NOT NULL,
  `lcid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `basic` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`,`lcid`),
  CONSTRAINT `cityTitle` FOREIGN KEY (`pid`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citytitle`
--

LOCK TABLES `citytitle` WRITE;
/*!40000 ALTER TABLE `citytitle` DISABLE KEYS */;
INSERT INTO `citytitle` VALUES (1,1033,'Petropavlovsk',' the capital of the North Kazakhstan Region',0),(1,1049,'Петропавловск','Областной центр',1),(2,1033,'Mamlyutka','administrative center of Mamlyut District, North Kazakhstan Region',0),(2,1049,'Мамлютка','административный центр Мамлютского района Северо-Казахстанской области.',1);
/*!40000 ALTER TABLE `citytitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1),(2);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrytitle`
--

DROP TABLE IF EXISTS `countrytitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countrytitle` (
  `pid` int(11) NOT NULL,
  `lcid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `basic` int(11) DEFAULT NULL,
  PRIMARY KEY (`lcid`,`pid`),
  KEY `countryTitle_idx` (`pid`),
  CONSTRAINT `countryTitle` FOREIGN KEY (`pid`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrytitle`
--

LOCK TABLES `countrytitle` WRITE;
/*!40000 ALTER TABLE `countrytitle` DISABLE KEYS */;
INSERT INTO `countrytitle` VALUES (1,1033,'Qazaqstan',NULL,0),(2,1033,'Russia',NULL,0),(1,1049,'Казахстан',NULL,1),(2,1049,'Россия',NULL,1);
/*!40000 ALTER TABLE `countrytitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_freelancers2users_idx` (`userId`),
  CONSTRAINT `FK_freelancers2users` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerservices`
--

DROP TABLE IF EXISTS `customerservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerservices` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'код услуги',
  `customerId` int(11) NOT NULL COMMENT 'парикмахер',
  `guid` varchar(32) NOT NULL COMMENT 'уникальный код синхронизации',
  `title` varchar(50) DEFAULT NULL COMMENT 'наименование',
  `description` varchar(200) DEFAULT NULL COMMENT 'описание',
  `price` varchar(100) DEFAULT NULL COMMENT 'свободное описание цены',
  `isActive` tinyint(1) DEFAULT NULL COMMENT 'является активным',
  `isFieldwork` tinyint(1) DEFAULT NULL COMMENT 'признак выездной услуги',
  `defDuration` tinyint(3) DEFAULT NULL COMMENT 'длительность в минутах',
  `derivedFrom` varchar(32) DEFAULT NULL COMMENT 'услуга происходит от ...',
  `dateStart` int(11) DEFAULT NULL COMMENT 'Дата активации',
  `dateDisable` int(11) DEFAULT NULL COMMENT 'Дата прекращения',
  PRIMARY KEY (`id`),
  KEY `FK_TO_CUSTOMER_idx` (`customerId`),
  CONSTRAINT `FK_TO_CUSTOMER` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerservices`
--

LOCK TABLES `customerservices` WRITE;
/*!40000 ALTER TABLE `customerservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custormerclients`
--

DROP TABLE IF EXISTS `custormerclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custormerclients` (
  `customerId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  PRIMARY KEY (`customerId`,`clientId`),
  KEY `FK_freelancerClients_userid_idx` (`clientId`),
  KEY `FK_freelancerClients2freelancer_idx` (`customerId`),
  CONSTRAINT `FK_freelancerClients2freelancer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_freelancerClients2userid` FOREIGN KEY (`clientId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custormerclients`
--

LOCK TABLES `custormerclients` WRITE;
/*!40000 ALTER TABLE `custormerclients` DISABLE KEYS */;
/*!40000 ALTER TABLE `custormerclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `pid` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`serviceId`),
  KEY `FK_orderList2service_idx` (`serviceId`),
  CONSTRAINT `FK_orderList2order` FOREIGN KEY (`pid`) REFERENCES `taskorder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderList2service` FOREIGN KEY (`serviceId`) REFERENCES `customerservices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_region_idx` (`countryId`),
  CONSTRAINT `FK_region` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiontitle`
--

DROP TABLE IF EXISTS `regiontitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regiontitle` (
  `pid` int(11) NOT NULL,
  `lcid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `basic` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`,`lcid`),
  CONSTRAINT `FK_regionTitle` FOREIGN KEY (`pid`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiontitle`
--

LOCK TABLES `regiontitle` WRITE;
/*!40000 ALTER TABLE `regiontitle` DISABLE KEYS */;
INSERT INTO `regiontitle` VALUES (1,1033,'North Qazaqstan region','Desk North Qazaqstan region',0),(1,1049,'Северо-Казахстанская область','Desk Северо-Казахстанская область',1),(2,1033,'Aqmola region','Desk Aqmola region',0),(2,1049,'Акмолинская область','Desk Акмолинская область',1);
/*!40000 ALTER TABLE `regiontitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `workplaceId` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL COMMENT 'Индекс месяца, где Январь 2017 = 0, Февраль = 1 и т. д.\n',
  `day` int(11) DEFAULT NULL COMMENT 'День в месяце 1 - 31',
  `begintime` int(11) DEFAULT NULL COMMENT 'время начала блока расписания, час*60 + минута',
  `endtime` int(11) DEFAULT NULL COMMENT 'время завершения блока расписания, час*60 + минута',
  `period` int(11) DEFAULT NULL COMMENT 'продолжительность нарезки сегментов в блоке, количество минут',
  PRIMARY KEY (`id`),
  KEY `FK_schedule2freelanser_idx` (`customerId`),
  KEY `FK_schedule2workplace_idx` (`workplaceId`),
  CONSTRAINT `FK_schedule2freelanser` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `accessToken` varchar(500) DEFAULT NULL COMMENT 'Токен клиента соцсети',
  `serverAccessToken` varchar(500) DEFAULT NULL COMMENT 'Токен сервера клиента соцсети',
  `endpoint` varchar(50) DEFAULT NULL COMMENT 'IP клиента',
  `agentInfo` varchar(500) DEFAULT NULL COMMENT 'Устройство клиента',
  `lastActionTime` datetime DEFAULT NULL COMMENT 'Время последнего обращения',
  `sessionKey` varchar(32) DEFAULT NULL COMMENT 'Ключ сессии GUID',
  PRIMARY KEY (`id`),
  KEY `FK_SESSION_2_USERS_idx` (`userId`),
  KEY `IDX_SES_KEY` (`sessionKey`),
  CONSTRAINT `FK_SESSION_2_USERS` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,NULL,NULL,NULL,NULL,'2017-10-20 16:21:14','testsessionkey');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subway`
--

DROP TABLE IF EXISTS `subway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_subway2city_idx` (`cityId`),
  CONSTRAINT `FK_subway2city` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subway`
--

LOCK TABLES `subway` WRITE;
/*!40000 ALTER TABLE `subway` DISABLE KEYS */;
INSERT INTO `subway` VALUES (1,1),(2,1),(3,2),(4,2);
/*!40000 ALTER TABLE `subway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subwaytitle`
--

DROP TABLE IF EXISTS `subwaytitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subwaytitle` (
  `pid` int(11) NOT NULL,
  `lcid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `basic` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`,`lcid`),
  CONSTRAINT `FK_subwayTitle` FOREIGN KEY (`pid`) REFERENCES `subway` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subwaytitle`
--

LOCK TABLES `subwaytitle` WRITE;
/*!40000 ALTER TABLE `subwaytitle` DISABLE KEYS */;
INSERT INTO `subwaytitle` VALUES (1,1033,'test Petr station north',0),(1,1049,'test Петропавловск станция северная',1),(2,1033,'test Petr station south',0),(2,1049,'test Петропавловск станция южная',1),(3,1033,'test Maml station west',0),(3,1049,'test Мамлютка станция западная',1),(4,1033,'test Maml station east',0),(4,1049,'test Мамлютка станция восточная',1);
/*!40000 ALTER TABLE `subwaytitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskorder`
--

DROP TABLE IF EXISTS `taskorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `scheduleId` int(11) NOT NULL,
  `booktime` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `bookstate` int(11) NOT NULL,
  `chatMsgId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slot2schedule_idx` (`scheduleId`),
  KEY `clientId_idx` (`clientId`),
  KEY `FK_order2chat_idx` (`chatMsgId`),
  CONSTRAINT `FK_order2chat` FOREIGN KEY (`chatMsgId`) REFERENCES `chatmessage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clientId` FOREIGN KEY (`clientId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `slot2schedule` FOREIGN KEY (`scheduleId`) REFERENCES `schedule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskorder`
--

LOCK TABLES `taskorder` WRITE;
/*!40000 ALTER TABLE `taskorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `givenName` varchar(45) DEFAULT NULL COMMENT 'Имя',
  `familyName` varchar(45) DEFAULT NULL COMMENT 'Фамилия',
  `nickName` varchar(45) DEFAULT NULL COMMENT 'Ник',
  `imageURI` varchar(500) DEFAULT NULL COMMENT 'Ссылка на большую фотку из соцсети',
  `avatar` longtext COMMENT 'Аватар соцсети base64 image ',
  `socialNet` varchar(2) DEFAULT NULL COMMENT 'Код соцсети, fb,vk,g+,bs',
  `socialId` varchar(200) DEFAULT NULL COMMENT 'Постоянный ID пользователя',
  `email` varchar(200) DEFAULT NULL COMMENT 'Электронная почта',
  `phone` varchar(200) DEFAULT NULL COMMENT 'Телефон',
  `sex` varchar(1) DEFAULT NULL COMMENT 'Пол m,w,u',
  `password` varchar(100) DEFAULT NULL COMMENT 'пароль для входа по email',
  `userType` varchar(10) DEFAULT NULL COMMENT 'Тип пользователя',
  `regdate` date DEFAULT NULL COMMENT 'Дата регистрации клиента',
  `role` varchar(45) DEFAULT NULL COMMENT 'Роли',
  `locked` varchar(200) DEFAULT NULL COMMENT 'Блокировка',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Azamat','Galiyev',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'user;admin;',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplace`
--

DROP TABLE IF EXISTS `workplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityId` int(11) DEFAULT NULL,
  `coords` point DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `subwayStationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workplace2city_idx` (`cityId`),
  KEY `workplace2user_creator_idx` (`customerId`),
  KEY `FK_workplace2subwatStation_idx` (`subwayStationId`),
  CONSTRAINT `FK_workplace2subwatStation` FOREIGN KEY (`subwayStationId`) REFERENCES `subway` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `workplace2city` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `workplace2user_creator` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplace`
--

LOCK TABLES `workplace` WRITE;
/*!40000 ALTER TABLE `workplace` DISABLE KEYS */;
INSERT INTO `workplace` VALUES (3,1,NULL,1,1),(4,1,NULL,1,2);
/*!40000 ALTER TABLE `workplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplacetitle`
--

DROP TABLE IF EXISTS `workplacetitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workplacetitle` (
  `pid` int(11) NOT NULL,
  `lcid` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `basic` int(11) DEFAULT NULL,
  `routeDetails` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pid`,`lcid`),
  CONSTRAINT `FK_workplacetitle2workplace` FOREIGN KEY (`pid`) REFERENCES `workplace` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplacetitle`
--

LOCK TABLES `workplacetitle` WRITE;
/*!40000 ALTER TABLE `workplacetitle` DISABLE KEYS */;
INSERT INTO `workplacetitle` VALUES (3,1033,'st. Street, 1','Saloon jorey',0,'54, 55 bus line'),(3,1049,'ул. Улица 1','Салун',1,'54, 55 автобусы'),(4,1033,'st. Avenue 3','Arena',0,'10, 88 bus line'),(4,1049,'ул. Проспект 3','Арена',1,'10, 88 автобусы');
/*!40000 ALTER TABLE `workplacetitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'barbershop'
--
/*!50003 DROP FUNCTION IF EXISTS `fGET_CITY_TEXT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGET_CITY_TEXT`(id int, localeId int) RETURNS varchar(600) CHARSET utf8
BEGIN
	declare t varchar(100);
    declare d varchar(500);
    declare b int;
    select title, description, basic
    into t, d, b
    from citytitle
    where pid = id and lcid = localeId;
    if isNull(d) then set d = ""; end if;
    -- test for exit
    if not isNull(t) then return CONCAT_WS('!@#', t, d); end if;
    -- get basic if not basic!
	if isNull(b) or b = 0 then
		select title, description
		into t, d
		from citytitle
		where pid = id and b = 1 limit 1;
        if isNull(d) then set d = ""; end if;
        -- test for exit
        if not isNull(t) then return CONCAT_WS('!@#', t, d); end if;
	end if;
    -- get any not empty value
    select title, description
    into t, d
    from citytitle
    where pid = id and title is not null limit 1;
    if isNull(t) then set t = ""; end if;
    if isNull(d) then set d = ""; end if;
    return CONCAT_WS('!@#', t, d);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fGET_COUNTRY_TEXT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGET_COUNTRY_TEXT`(id int, localeId int) RETURNS varchar(600) CHARSET utf8
BEGIN
	declare t varchar(100);
    declare d varchar(500);
    declare b int;
    select title, description, basic
    into t, d, b
    from countrytitle
    where pid = id and lcid = localeId;
    if isNull(d) then set d = ""; end if;
    -- test for exit
    if not isNull(t) then return CONCAT_WS('!@#', t, d); end if;
    -- get basic if not basic!
	if isNull(b) or b = 0 then
		select title, description
		into t, d
		from countrytitle
		where pid = id and basic = 1 limit 1;
        if isNull(d) then set d = ""; end if;
        if not isNull(t) then return CONCAT_WS('!@#', t, d); end if;
	end if;
    -- get any not empty value
    select title, description
    into t, d
    from countrytitle
    where pid = id and title is not null limit 1;
    if isNull(t) then set t = ""; end if;
    if isNull(d) then set d = ""; end if;
    return CONCAT_WS('!@#', t, d);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fGET_CUSTOMER_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGET_CUSTOMER_ID`(pSessionKey varchar(32)) RETURNS int(11)
BEGIN
    declare uID int;
    declare cID int;
    declare uLocked varchar(200);
    declare uUserType varchar(100);
    declare uRole varchar(45);
	-- using
    call spSET_ERROR_CODES();
	-- test session
    select userId into uID from `sessions` where sessionKey = pSessionKey limit 1;
    if isNull(uID) then
		return @ERROR_USER_NO_SESSION;
    end if;
    -- user info
    select id, locked, userType, role
    into uID, uLocked, uUserType, uRole
    from users where id = uID limit 1;
    if isNull(uID) then
		return @ERROR_USER_NO_USER;
    end if;
    -- test user locked // not locked if no reason to lock!
    if not (isNull(uLocked) or uLocked = '') then
		return @ERROR_USER_LOCKED;
    end if;
    -- TODO !!! SOME ACTIONS WITH uUserType, uRole
    select id into cID from customer where userId = uID limit 1;
    if isNull(cID) then
		return @ERROR_USER_NO_CUSTOMER;
    end if;
    return cID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fGET_REGION_TEXT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGET_REGION_TEXT`(id int, localeId int) RETURNS varchar(600) CHARSET utf8
BEGIN
	declare t varchar(100);
    declare d varchar(500);
    declare b int;
    select title, description, basic
    into t, d, b
    from regiontitle
    where pid = id and lcid = localeId;
    if isNull(d) then set d = ""; end if;
    -- test for exit
    if not isNull(t) then return CONCAT_WS('!@#', t, d); end if;
    -- get basic
    if IsNull(b) or b = 0 then
		select title, description
		into t, d
		from regiontitle
		where pid = id and basic = 1 limit 1;
        if isNull(d) then set d = ""; end if;
		-- test for exit
		if not isNull(t) then return CONCAT_WS('!@#', t, d); end if;
	end if;
    -- get any not empty value
    select title, description
    into t, d
    from regiontitle
    where pid = id and title is not null limit 1;
    if isNull(t) then set t = ""; end if;
    if isNull(d) then set d = ""; end if;
    return CONCAT_WS('!@#', t, d);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fGET_SUBWAY_TEXT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGET_SUBWAY_TEXT`(id int, localeId int) RETURNS varchar(100) CHARSET utf8
BEGIN
	declare t varchar(100);
    declare b int;
    select title, basic into t, b from subwaytitle
    where pid = id and lcid = localeId limit 1;
    -- test for exit
    if not isNull(t) then return t; end if;
    -- get basic if not basic!
	if isNull(b) or b = 0 then
		select title into t from subwaytitle
		where pid = id and basic = 1 limit 1;
        if not isNull(t) then return t; end if;
	end if;
    -- get any not empty value
    select title into t from subwaytitle
    where pid = id and title is not null limit 1;
    if isNull(t) then set t = ""; end if;
    return t;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fGET_TODAY_TIME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGET_TODAY_TIME`() RETURNS int(11)
BEGIN
	return unix_timestamp(utc_timestamp());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fGET_USER_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGET_USER_ID`(pSessionKey varchar(32)) RETURNS int(11)
BEGIN
	declare uID int;
    select userId into uID from `sessions` where sessionKey = pSessionKey;
    set uID = IFNULL(uID, -1);
    return uID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fGET_WORKPLACE_TEXT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGET_WORKPLACE_TEXT`(id int, localeId int) RETURNS varchar(700) CHARSET utf8
BEGIN
	declare t varchar(100);
    declare a varchar(100);
    declare rd varchar(500);
    declare b int;
    select title, address, routeDetails, basic
    into t, a, rd, b
    from workplacetitle
    where pid = id and lcid = localeId limit 1;
    if isNull(a) then set a = ""; end if;
    if isNull(rd) then set rd = ""; end if;
    -- test for exit
    if not isNull(t) then return CONCAT_WS('!@#', t, a, rd); end if;
    -- get basic if not basic!
	if isNull(b) or b = 0 then
		select title, address, routeDetails
		into t, a, rd
		from workplacetitle
		where pid = id and basic = 1 limit 1;
        if isNull(a) then set a = ""; end if;
		if isNull(rd) then set rd = ""; end if;
        if not isNull(t) then return CONCAT_WS('!@#', t, a, rd); end if;
	end if;
    -- get any not empty value
    select title, address, routeDetails
    into t, a, rd
    from workplacetitle
    where pid = id and title is not null limit 1;
    if isNull(t) then set t = ""; end if;
    if isNull(a) then set a = ""; end if;
    if isNull(rd) then set rd = ""; end if;
    return CONCAT_WS('!@#', t, a, rd);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fIS_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fIS_ADMIN`(pSessionKey varchar(32)) RETURNS tinyint(1)
BEGIN
	declare roles varchar(45);
    set roles := (select users.role from users, sessions where users.id = sessions.userId and sessionKey = pSessionKey);
    if locate("admin;", roles) <> 0 then
		return true;
	else
		return false;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fIS_EMAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fIS_EMAIL`(txt varchar(200)) RETURNS int(11)
BEGIN
	if isnull(txt) then
		return 0;
    end if;
    if char_length(trim(txt)) = 0 then
		return 1;
    end if;
    set txt = trim(txt);
	RETURN txt REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fIS_PHONE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fIS_PHONE`(txt varchar(200)) RETURNS int(11)
BEGIN
	if not isnull(pPhone) and char_length(trim(pPhone)) = 0 then
		return 0;
    end if;
	RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fSPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fSPLIT_STR`(
  x VARCHAR(2048),
  pos INT
) RETURNS varchar(2048) CHARSET utf8
begin
	RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, '!@#', pos),
       CHAR_LENGTH(SUBSTRING_INDEX(x, '!@#', pos -1)) + 1),
       '!@#', '');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET utf8
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCITY_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCITY_ADD`(pSessionKey varchar(32), 
	pRegionId int, pLocaleId int, pTitle varchar(100), pDescription varchar(500), pBasic int, 
    out cityId int, out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        set cityId = -1;
        leave proc;
    end if;
	-- insert region
    insert into city (regionId) values (pRegionId);
    if row_count() = 0 then
		set resultCode = @ERROR_INSERT_ERROR;
        set cityId = -1;
		leave proc;
    end if;
    set cityId = last_insert_id();
    -- insert locale text
    insert into citytitle (`pid`, `lcid`, `title`, `description`, `basic`)
    values (cityId, pLocaleId, pTitle, pDescription, pBasic);
    if row_count() = 0 then
		set resultCode = @ERROR_INSERT_ERROR;
        leave proc;
	end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCITY_INFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCITY_INFO`(pCityId int, pLocaleId int)
BEGIN
	select id, fSPLIT_STR(txt, 1) as title, fSPLIT_STR(txt, 2) as description from (
		select id, fGET_CITY_TEXT(id, pLocaleId) as txt from city where id = pCityId
	) as T;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCITY_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCITY_LIST`(pRegionId int, localeId int)
BEGIN
	select id, fSPLIT_STR(txt, 1) as title, fSPLIT_STR(txt, 2) as description from (
		select id, fGET_CITY_TEXT(id, localeId) as txt from city where regionId = pRegionId
	) as T;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCITY_REMOVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCITY_REMOVE`(
	pSessionKey varchar(32), 
    pCityId int, out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test -
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- test relation --
    -- subway
    if exists(select * from subway where cityId = pCityId limit 1) then
		set resultCode = @ERROR_LINKS_HAS_RELATION;
        leave proc;
    end if;
    -- workplaces
    if exists(select * from workplace where cityId = pCityId limit 1) then
		set resultCode = @ERROR_LINKS_HAS_RELATION;
        leave proc;
    end if;
    -- action!
    delete from city where id = pCityId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
	else
		set resultCode = @NO_ERROR;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCITY_REMOVE_LOCALE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCITY_REMOVE_LOCALE`(pSessionKey varchar(32), 
    pCityId int, pLocaleId int, out resultCode int)
proc: BEGIN
	-- using
	call spSET_ERROR_CODES();
    -- admin test
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- delete
    delete from citytitle where pid = pCityId and lcid = pLocaleId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCITY_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCITY_UPDATE`(pSessionKey varchar(32), 
    pCityId int, pLocaleId int, pTitle varchar(100), pDescription varchar(500), pBasic int, 
    out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- test exists city
    if not exists(select * from city where id = pCityId) then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    -- if basic set all locales to 0
    if pBasic then
		update citytitle set basic = 0 where pid = pCityId;
    end if;
    -- update locale localetext
    update citytitle set
		title = pTitle,
        description = pDescription,
        basic = pBasic
	where pid = pCityId and lcid = pLocaleId;
    -- insert if not exists
    if row_count() = 0 then
		INSERT INTO citytitle
			(`pid`,`lcid`,`title`,`description`,`basic`)
		VALUES
			(pCityId, pLocaleId, pTitle, pDescription, pBasic);
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCOUNTRY_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCOUNTRY_ADD`(
	pSessionKey varchar(32), 
    pLocaleId int, pTitle varchar(100), pDescription varchar(500), pBasic int, 
    out countryId int, out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        set countryId = -1;
        leave proc;
    end if;
    -- insert country --
	insert into country () values ();
    set countryId = last_insert_id();
    -- insert caption --
    INSERT INTO `countrytitle` (`pid`, `lcid`, `title`, `description`, `basic`)
	VALUES (countryId, pLocaleId, pTitle, pDescription, pBasic);
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
	else
		set resultCode = @NO_ERROR;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCOUNTRY_INFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCOUNTRY_INFO`(pCountryId int, pLocaleId int)
BEGIN
	select id, fSPLIT_STR(txt,  1) as title, fSPLIT_STR(txt, 2) as description from (
		select id, fGET_COUNTRY_TEXT(id, pLocaleId) as txt from country where id = pCountryId
    ) as T;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCOUNTRY_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCOUNTRY_LIST`(pLocaleId integer)
BEGIN
	select id, fSPLIT_STR(txt,  1) as title, fSPLIT_STR(txt, 2) as description from (
		select id, fGET_COUNTRY_TEXT(id, pLocaleId) as txt from country
    ) as T;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCOUNTRY_REMOVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCOUNTRY_REMOVE`(
	pSessionKey varchar(32), 
    pCountryId int, out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test -
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- test relation --
    if exists(select * from region where countryId = pCountryId limit 1) then
		set resultCode = @ERROR_LINKS_HAS_RELATION;
        leave proc;
    end if;
    -- action!
    delete from country where id = pCountryId;
    
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
	else
		set resultCode = @NO_ERROR;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCOUNTRY_REMOVE_LOCALE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCOUNTRY_REMOVE_LOCALE`(pSessionKey varchar(32), 
    pCountryId int, pLocaleId int, out resultCode int)
proc: BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test -
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- delete
    delete from countrytitle where pid = pCountryId and lcid = pLocaleId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCOUNTRY_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCOUNTRY_UPDATE`(pSessionKey varchar(32), 
    pCountryId int, pLocaleId int, pTitle varchar(100), pDescription varchar(500), pBasic int, 
    out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- test exists country
    if not exists(select * from country where id = pCountryId) then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    -- if basic clear all
    if pBasic then
		update citytytle set basic = 0 where pid = pCountryId;
    end if;
    -- update locale localetext
    update citytitle set
		title = pTitle,
        description = pDescription,
        basic = pBasic
	where pid = pCountryId and lcid = pLocaleId;
    -- insert if not exists
    if row_count() = 0 then
		INSERT INTO countrytitle
			(`pid`,`lcid`,`title`,`description`,`basic`)
		VALUES
			(pCountryId, pLocaleId, pTitle, pDescription, pBasic);
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCUSTOMER_SERVICE_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCUSTOMER_SERVICE_ADD`(
	pSessionKey varchar(32), 
	pTitle varchar(50), pDescription varchar(200), pPrice varchar(100),
    pIsActive tinyint(1), pIsFieldwork tinyint(1),
    pDefDuration tinyint(3),
    pDerivedFrom varchar(32),
    pDateStart int, pDateDisable int,
    out pId int, out pGuid varchar(32), out resultCode int)
proc: BEGIN
	declare cID int;
    call spSET_ERROR_CODES();
    -- test customer --
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set resultCode = cID;
        set pId = -1;
        set pGuid = null;
        leave proc;
    end if;
    -- create GUID
    set pGuid = replace(uuid(),'-','');
    -- insert
    INSERT INTO `customerservices`
	(`customerId`,`guid`,
	`title`,`description`,`price`,
	`isActive`,`isFieldwork`,
	`defDuration`, `derivedFrom`,
	`dateStart`, `dateDisable`)
	VALUES
	(cID, pGuid,
    pTitle, pDescription, pPrice,
    pIsActive, pIsFieldwork,
	pDefDuration, pDerivedFrom,
    pDateStart, pDateDisable);
    if row_count() = 0 then
		set resultCode = @ERROR_SERVICE_INSERT_ERROR;
        set pId = -1;
        set pGuid = null;
        leave proc;
    end if;
    set pId = last_insert_id();
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCUSTOMER_SERVICE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCUSTOMER_SERVICE_LIST`(pSessionKey varchar(32), out resultCode int)
proc: BEGIN
	declare cID int;
    call spSET_ERROR_CODES();
    -- test customer --
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set resultCode = cID;
        leave proc;
    end if;
    -- list
    SELECT `id`, `guid`, `title`, `description`, `price`, 
        `isActive`, `isFieldwork`, `defDuration`, 
        `derivedFrom`, `dateStart`, `dateDisable`
	FROM customerservices
    where customerId = cID;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCUSTOMER_SERVICE_LIST_FOR_CLIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCUSTOMER_SERVICE_LIST_FOR_CLIENT`(pCustomerId int, out resultCode int)
proc: BEGIN
	call spSET_ERROR_CODES();
	if not exists(select id from customer where id = pCustomerId) then
		set resultCode = @ERROR_CUSTOMER_SERVICES_NOT_CUSTOMER;
        leave proc;
    end if;
    -- select active --
    select `id`, `customerId`, `guid`, 
		`title`, `description`, `price`, 
		`isActive`, `isFieldwork`, `defDuration`, 
        `derivedFrom`, `dateStart`, `dateDisable` 
	from customerservices
    where `customerId` = pCustomerId and `isActive` = 1 and `dateDisable` > fGET_TODAY_TIME();
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCUSTOMER_SERVICE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCUSTOMER_SERVICE_UPDATE`(
	pSessionKey varchar(32), pId int,
	pTitle varchar(50), pDescription varchar(200), pPrice varchar(100),
    pIsActive tinyint(1), pIsFieldwork tinyint(1),
    pDefDuration tinyint(3),
    pDateStart int, pDateDisable int,
    out pNewId int, out pNewGuid varchar(32), out resultCode int)
proc: BEGIN
	declare currTime int;
	declare cID int;
    declare tempCustomerID int;
    declare tempGuid varchar(32);
    declare tempTitle varchar(50);
    declare tempDescription varchar(200);
    declare tempPrice varchar(100);
    declare tempIsActive tinyint(1);
    declare tempIsFieldwork tinyint(1);
    declare tempDefDuration tinyint(3);
    declare tempDateStart int;
    declare tempDateDisable int;
    
    call spSET_ERROR_CODES();
    call spPROTOCOL_CODES();
    --
    set resultCode = @NO_ERROR;
    set pNewId = -1;
	set pNewGuid = '';
    -- test customer --
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set resultCode = cID;
        leave proc;
    end if;
    -- read service info
    select customerId, guid,
		title, description, price, 
		isActive, isFieldwork, defDuration, 
        dateStart, dateDisable
    into tempCustomerID, tempGuid, 
		tempTitle, tempDescription, tempPrice,
		tempIsActive, tempIsFieldwork, tempDefDuration,
        tempDateStart, tempDateDisable
    from customerservices where id = pId;
    --
    if isnull(tempCustomerID) then
		set resultCode = @ERROR_CUSTOMER_SERVICES_NOT_EXISTS;
		leave proc;
    end if;
    if tempCustomerID <> cID then
		set resultCode = @ERROR_CUSTOMER_SERVICES_NON_CUSTOMER_SERVICE;
		leave proc;
    end if;
    -- copy null values
    set pTitle = ifnull(pTitle, tempTitle);
    set pDescription = ifnull(pDescription, tempDescription);
    set pPrice = ifnull(pPrice, tempPrice);
    set pIsActive = ifnull(pIsActive, tempIsActive);
    set pIsFieldwork = ifnull(pIsFieldwork, tempIsFieldwork);
    set pDefDuration = ifnull(pDefDuration, tempDefDuration);
    set pDateStart = ifnull(pDateStart, tempDateStart);
    set pDateDisable = ifnull(pDateDisable, tempDateDisable);
    -- set currTime = fGET_TODAY_TIME();
    if exists(select pid from orderlist where serviceId = pServiceId) then
		-- has orders | deny old offer (isActive = 0) | create new service
        update customerservices set isActive = 0 where id = pId;
        -- new guid
        set pNewGuid = replace(uuid(),'-','');
        insert into `customerservices` (
			`customerId`,`guid`,
			`title`,`description`,`price`,
			`isActive`,`isFieldwork`,`defDuration`,
			`derivedFrom`,`dateStart`,`dateDisable`
		) values (
			cID, pNewGuid,
            pTitle, pDescription, pPrice,
            pIsActive, pIsFieldwork, pDefDuration,
            tempGuid, pDateStart, pDateDisable
		);
        set pNewId = last_insert_id();
        leave proc;
    end if;
	-- no orders | update record
	update `customerservices` set 
		`title` = pTitle,
		`description` = pDescription,
		`price` = pPrice,
		`isActive` = pIsActive,
		`isFieldwork` = pIsFieldwork,
		`defDuration` = pDefDuration,
		`dateStart` = pDateStart,
		`dateDisable` = pDateDisable
	where id = pId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spIS_LOGGED_ON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spIS_LOGGED_ON`(
	pSessionKey varchar(32), 
    out pUserId int, 
    out pAccessToken varchar(500), 
    out pServerAccessToken varchar(500), 
    out pResultCode int)
proc: BEGIN
	declare lastActionTime datetime;
	set pResultCode = 0;
	-- get session variables
	select userid, accessToken, serverAccessToken, lastActionTime 
	into pUserId, pAccessToken, pServerAccessToken, lastActionTime
	from sessions where sessionKey = pSessionKey;
	-- has session?
	if isNull(id) then 
		leave proc;
	end if;
	-- is social id data
	if not isNull(pAccessToken) or not isNull(pServerAccessToken) then 
		set pResultCode = 2;
		leave proc;
	end if;
	-- is expired 24 hour x 60 minutes = 1440 minutes
	if TIMESTAMPDIFF(MINUTE, lastActionTime, NOW()) > 1440 then 
		leave proc;
	end if;
	set pResultCode = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPROTOCOL_CODES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPROTOCOL_CODES`()
BEGIN
	set @BOOKSTATE_NEW = 0;
    set @BOOKSTATE_EXECUTED = 1;
    set @BOOKSTATE_CANCELLED = 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spREGION_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spREGION_ADD`(pSessionKey varchar(32), 
	pCountryId int, pLocaleId int, pTitle varchar(100), pDescription varchar(500), pBasic int, 
    out regionId int, out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        set regionId = -1;
        leave proc;
    end if;
	-- insert region
    insert into region (countryId) values (pCountryId);
    if row_count() = 0 then
		set resultCode = @ERROR_INSERT_ERROR;
        set regionId = -1;
		leave proc;
    end if;
    set regionId = last_insert_id();
    -- insert locale text
    insert into regiontitle (`pid`, `lcid`, `title`, `description`, `basic`)
    values (regionId, pLocaleId, pTitle, pDescription, pBasic);
    if row_count() = 0 then
		set resultCode = @ERROR_INSERT_ERROR;
        leave proc;
	end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spREGION_INFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spREGION_INFO`(pRegionId int, localeId int)
BEGIN
	select id, fSPLIT_STR(txt, 1) as title, fSPLIT_STR(txt, 2) as description from (
		select id, fGET_REGION_TEXT(id, localeId) as txt from region where id = pRegionId
	) as T;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spREGION_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spREGION_LIST`(pCountryId int, localeId int)
BEGIN
	select id, fSPLIT_STR(txt, 1) as title, fSPLIT_STR(txt, 2) as description from (
		select id, fGET_REGION_TEXT(id, localeId) as txt from region where countryId = pCountryId
	) as T;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spREGION_REMOVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spREGION_REMOVE`(
	pSessionKey varchar(32), 
    pRegionId int, out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test -
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- test relation --
    if exists(select * from city where regionId = pRegionId limit 1) then
		set resultCode = @ERROR_LINKS_HAS_RELATION;
        leave proc;
    end if;
    -- action!
    delete from region where id = pRegionId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
	else
		set resultCode = @NO_ERROR;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spREGION_REMOVE_LOCALE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spREGION_REMOVE_LOCALE`(pSessionKey varchar(32), 
    pRegionId int, pLocaleId int, out resultCode int)
proc: BEGIN
	-- using
	call spSET_ERROR_CODES();
    -- admin test
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- delete
    delete from regiontitle where pid = pRegionId and lcid = pLocaleId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spREGION_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spREGION_UPDATE`(pSessionKey varchar(32), 
    pRegionId int, pLocaleId int, pTitle varchar(100), pDescription varchar(500), pBasic int, 
    out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- test exists region
    if not exists(select * from region where id = pRegionId) then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    -- if basic set all locales to 0
    if pBasic then
		update regiontitle set basic = 0 where pid = pRegionId;
    end if;
    -- update locale localetext
    update regiontitle set
		title = pTitle,
        description = pDescription,
        basic = pBasic
	where pid = pRegionId and lcid = pLocaleId;
    -- insert if not exists
    if row_count() = 0 then
		INSERT INTO regiontitle
			(`pid`,`lcid`,`title`,`description`,`basic`)
		VALUES
			(pRegionId, pLocaleId, pTitle, pDescription, pBasic);
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSCHEDULE_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSCHEDULE_ADD`(
	pSessionKey varchar(32), pWorkplaceId int, 
    pMonth int, pDay int, 
    pBeginTime int, pEndTime int, pPeriod int, 
    out pScheduleId int, out resultCode int)
proc: BEGIN
	declare cID int;
	-- using
    call spSET_ERROR_CODES();
	-- test session
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set pScheduleId = -1;
        set resultCode = cID;
        leave proc;
    end if;
    --
    INSERT INTO `barbershop`.`schedule`
	(`month`, `day`, 
     `begintime`,  `endtime`, `period`,
	 `customerId`, `workplaceId`)
	VALUES
	(pMonth, pDay,
     pBeginTime, pEndTime, pPeriod,
     cID, pWorkplaceId);
	if row_count() = 0 then
		set pScheduleId = -1;
        set resultCode = @ERROR_INSERT_ERROR;
        leave proc;
	end if;
    set pScheduleId = last_insert_id();
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSCHEDULE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSCHEDULE_UPDATE`(
	pSessionKey varchar(32), 
    pScheduleId int,
    pWorkplaceId int, 
    pMonth int, pDay int, 
    pBeginTime int, pEndTime int, pPeriod int, 
    out resultCode int)
proc:BEGIN
	declare cID int;
    declare tempScheduleId int;
    declare tempCustomerId int;
    declare tempWorkplaceId int;
    declare tempMonth int;
    declare tempDay int;
    declare tempBeginTime int;
    declare tempEndTime int;
    declare tempPeriod int;
	-- using
    call spSET_ERROR_CODES();
	-- test session
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
        set resultCode = cID;
        leave proc;
    end if;
    -- read schedule data
    select `id`, `month`, `day`, `begintime`, `endtime`, `period`, `customerId`, `workplaceId`
    into tempScheduleId, tempMonth, tempDay, tempBeginTime, tempEndTime, tempPeriod, tempCustomerId, tempWorkplaceId 
    from `schedule` where id = pScheduleId limit 1;
    if isNull(tempScheduleId) then
		set resultCode = @ERROR_SCHEDULE_NO_SCHEDULE;
        leave proc;
    end if;
    if tempCustomerId <> cID then
		set resultCode = @ERROR_SCHEDULE_NON_CUSTOMER_SCHEDULE;
		leave proc;
    end if;
    -- TODO ! SCHEDULE TASKS TEST
    -- update
    set pWorkplaceId = ifnull(pWorkplaceId, tempWorkplaceId);
    set pMonth = ifnull(pMonth, tempMonth);
    set pDay = ifnull(pDay, tempDay);
    set pBeginTime = ifnull(pBeginTime, tempBeginTime);
    set pEndTime = ifnull(pEndTime, tempEndTime);
    set pPeriod = ifnull(pPeriod, tempPeriod);
    -- update schedule
    update `schedule` set
		`month` = pMonth,
        `day` = pDay,
        `begintime` = pBeginTime,
        `endtime` = pEndTime,
        `workPlaceId` = pWorkplaceId
	where id = pScheduleId;
    if row_count() = 0 then
		set resultCode = @ERROR_SCHEDULE_UPDATE_ERROR;
        leave proc;
	end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSET_ERROR_CODES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSET_ERROR_CODES`()
BEGIN
	set @NO_ERROR = 0;
	--
	set @ERROR_ACCESS = 1000;
	set @ERROR_ACCESS_DENIED = @ERROR_ACCESS + 1;
	--
    set @ERROR_LINKS = 2000;
    set @ERROR_LINKS_HAS_RELATION = @ERROR_LINKS + 1;
    --
    set @ERROR_DATA = 3000;
    set @ERROR_ROW_NOT_EXISTS = @ERROR_DATA + 1;
    set @ERROR_INSERT_ERROR = @ERROR_DATA + 2;
    set @ERROR_EMPTY_PARAMS = @ERROR_DATA + 3;
    --
    set @ERROR_USER = -1000;
    set @ERROR_USER_NO_SESSION = @ERROR_USER - 1;
    set @ERROR_USER_NO_USER = @ERROR_USER - 2;
    set @ERROR_USER_LOCKED = @ERROR_USER - 3;
    set @ERROR_USER_NO_CUSTOMER = @ERROR_USER - 4;
    
    set @ERROR_USER_EMAIL_ALREADY_USED = @ERROR_USER + 5;
    set @ERROR_USER_PHONE_ALREADY_USED = @ERROR_USER + 6;
    
    set @ERROR_SCHEDULE = 4000;
    set @ERROR_SCHEDULE_NO_SCHEDULE = @ERROR_SCHEDULE + 1;
    set @ERROR_SCHEDULE_NON_CUSTOMER_SCHEDULE = @ERROR_SCHEDULE + 2;
    set @ERROR_SCHEDULE_UPDATE_ERROR = @ERROR_SCHEDULE + 3;
    
    set @ERROR_SERVICE = 5000;
    set @ERROR_SERVICE_INSERT_ERROR = @ERROR_SERVICE + 1;
    
    set @ERROR_CUSTOMER_SERVICES = 6000;
    set @ERROR_CUSTOMER_SERVICES_NOT_CUSTOMER = @ERROR_CUSTOMER_SERVICES + 1;
    set @ERROR_CUSTOMER_SERVICES_NOT_EXISTS = @ERROR_CUSTOMER_SERVICES + 2;
    set @ERROR_CUSTOMER_SERVICES_NON_CUSTOMER_SERVICE = @ERROR_CUSTOMER_SERVICES + 3;
    
    set @ERROR_TASK = 7000;
    set @ERROR_TASK_NO_SCHEDULE = @ERROR_TASK + 1;
    set @ERROR_TASK_NON_CUSTOMER_SCHEDULE = @ERROR_TASK + 2;
    set @ERROR_TASK_TOO_MANY_IDS = @ERROR_TASK + 3;
    set @ERROR_TASK_BAD_UID_SIZE = @ERROR_TASK + 4;
    set @ERROR_TASK_SERVICE_NOT_EXISTS = @ERROR_TASK + 5;
    set @ERROR_TASK_NON_CUSTOMER_SERVICE = @ERROR_TASK + 6;
    
    set @ERROR_WORKPLACE = 8000;
    set @ERROR_WORKPLACE_NON_CUSTOMER_WORKPLACE = @ERROR_WORKPLACE + 1;
    set @TEST_TO_COMMIT = 12312311123;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSUBWAY_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSUBWAY_ADD`(pSessionKey varchar(32), 
	pCityId int, pLocaleId int, pTitle varchar(100), pBasic int, 
    out subwayId int, out resultCode int)
proc:BEGIN
	set subwayId = -1;
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
	-- insert region
    insert into subway (cityId) values (pCityId);
    if row_count() = 0 then
		set resultCode = @ERROR_INSERT_ERROR;
		leave proc;
    end if;
    set subwayId = last_insert_id();
    -- insert locale text
    insert into subwaytitle (`pid`, `lcid`, `title`, `basic`)
    values (subwayId, pLocaleId, pTitle, pBasic);
    if row_count() = 0 then
		set resultCode = @ERROR_INSERT_ERROR;
        leave proc;
	end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSUBWAY_INFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSUBWAY_INFO`(pSubwayId int, pLocaleId int)
BEGIN
	select id, fGET_SUBWAY_TEXT(id, pLocaleId) as txt from subway where id = pSubwayId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSUBWAY_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSUBWAY_LIST`(pCityId int, pLocaleId int)
BEGIN
	select id, fGET_SUBWAY_TEXT(id, pLocaleId) as txt from subway where cityId = pCityId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSUBWAY_REMOVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSUBWAY_REMOVE`(
	pSessionKey varchar(32), 
    pSubwayId int, out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test -
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- test relation --
    if exists(select * from workplace where subwayStationId = pSubwayId limit 1) then
		set resultCode = @ERROR_LINKS_HAS_RELATION;
        leave proc;
    end if;
    -- action!
    delete from subway where id = pSubwayId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
	else
		set resultCode = @NO_ERROR;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSUBWAY_REMOVE_LOCALE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSUBWAY_REMOVE_LOCALE`(pSessionKey varchar(32), 
    pSubwayId int, pLocaleId int, out resultCode int)
proc: BEGIN
	-- using
	call spSET_ERROR_CODES();
    -- admin test
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- delete
    delete from subwaytitle where pid = pSubwayId and lcid = pLocaleId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSUBWAY_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSUBWAY_UPDATE`(pSessionKey varchar(32), 
    pSubwayId int, pLocaleId int, pTitle varchar(100), pBasic int, 
    out resultCode int)
proc:BEGIN
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    -- test exists city
    if not exists(select * from subway where id = pSubwayId) then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    -- if basic set all locales to 0
    if pBasic then
		update subwaytitle set basic = 0 where pid = pSubwayId;
    end if;
    -- update locale localetext
    update subwaytitle set
		title = pTitle,
        basic = pBasic
	where pid = pSubwayId and lcid = pLocaleId;
    -- insert if not exists
    if row_count() = 0 then
		INSERT INTO subwaytitle
			(`pid`,`lcid`,`title`,`description`,`basic`)
		VALUES
			(pSubwayId, pLocaleId, pTitle, pDescription, pBasic);
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spTASK_ORDER_CREATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spTASK_ORDER_CREATE`(
	pSessionKey varchar(32),
    pClientId int, 
    pScheduleId int, pBookTime int, 
    pDuration int, pChatMessage int, pServicesUIDS varchar(1024), out pTaskId int, out resultCode int)
proc: BEGIN
	declare cID int;
    declare sID int;
    declare csID int;
    declare tempServices varchar(1024);
    declare dbg int;
    declare pos int;
    declare tempSUID varchar(32);
    declare serviceIds varchar(1024);
    declare tempServiceId int;
    declare serviceIdText varchar(12);
    declare serviceCustomerId int;
    
    call spSET_ERROR_CODES();
    call spPROTOCOL_CODES();
    -- test customer --
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set resultCode = cID;
        leave proc;
    end if;
    -- test schedule
    select id, customerId into sID, csID from `schedule` where id = pScheduleID limit 1;
    if isnull(sID) then
		set resultCode = @ERROR_TASK_NO_SCHEDULE;
        leave proc;
    end if;
    if csID <> cID then
		set resultCode = @ERROR_TASK_NON_CUSTOMER_SCHEDULE;
        leave proc;
    end if;
    --
    if right(pServicesUIDS, 1) <> ';' then
		set pServicesUIDS = concat(pServicesUIDS,';');
    end if;
    set tempServices = pServicesUIDS;
    set serviceIds = '';
    set pos = locate(';', tempServices);
    set dbg = 30;
    crc0: while pos > 0 do
		-- accident exit!
        set dbg = dbg - 1;
        if dbg = 0 then 
			set resultCode = @ERROR_TASK_TOO_MANY_IDS;
			leave proc; 
		end if;
        set tempSUID = left(tempServices, pos - 1);
        -- test SUID length
        if length(tempSUID) <> 32 then
			set resultCode = @ERROR_TASK_BAD_UID_SIZE;
			leave proc;
        end if;
        -- get serviceID
        select id, customerId into tempServiceId, serviceCustomerId from customerservices where guid = tempSUID limit 1;
        if isnull(tempServiceId) then
			set resultCode = @ERROR_TASK_SERVICE_NOT_EXISTS;
            leave proc;
        end if;
        if serviceCustomerId <> cID then
			set resultCode = @ERROR_TASK_NON_CUSTOMER_SERVICE;
            leave proc;
        end if;
        -- join service ids
        set serviceIds = concat(serviceIds, tempServiceId, ';');
        -- prepare next iteration
        set tempServices = substr(tempServices, pos + 1);
		set pos = locate(';', tempServices);
    end while;
    -- add task
    insert into taskorder (clientId, scheduleId, booktime, duration, bookstate, chatMsgId)
    values (pClientId, pScheduleId, pBookTime, pDuration, @BOOKSTATE_NEW, pChatMessage);
    set pTaskId = last_insert_id();
	-- add services
    set pos = locate(';', serviceIds);
    set dbg = 30;
    crc1:while pos > 0 do
		-- accident exit!
        set dbg = dbg - 1;
        if dbg = 0 then 
			set resultCode = @ERROR_TASK_TOO_MANY_IDS;
			leave proc; 
		end if;
        set serviceIdText = left(serviceIds, pos - 1);
        set tempServiceId = cast(serviceIdText as signed);
        -- insert row
        insert into orderlist (pid, serviceId) values (pTaskId, tempServiceId);
        -- prepare next iteration
        set serviceIds= substr(serviceIds, pos + 1);
		set pos = locate(';', serviceIds);
    end while;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sptest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sptest`(x varchar(1024))
BEGIN
	/*
	declare x int;
    select unix_timestamp() into x from dual;
    select x from dual;
	if -1 then
		select 1 from dual;
	else
		select 0 from dual;
	end if;
    
    if 0 then
		select 1 from dual;
	else
		select 0 from dual;
	end if;

	if 1 then
		select 1 from dual;
	else
		select 0 from dual;
	end if;
    
    if 2 then
		select 1 from dual;
	else
		select 0 from dual;
	end if;
    */
    declare pos int;
    declare sx varchar(100);
    declare dbg int;
    set dbg = 100;
    set pos = locate(';', x);
    crc: while pos > 1 do
		set dbg = dbg - 1;
        if dbg = 0 then 
			select 'dbg = 0' from dual;
			leave crc; 
		end if;
        set sx = left(x, pos - 1);
        select sx from dual;
        set x = substr(x, pos + 1);
		set pos = locate(';', x);
    end while;
    if length(x) > 1 then
		select x from dual;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUSER_ADD_SIMPLE_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUSER_ADD_SIMPLE_USER`(
	pEmail varchar(200), pPhone varchar(200),
    out userId int, out resultCode int)
proc:BEGIN
	declare isemail int;
    declare isphone int;
    call spSET_ERROR_CODES();
    set isemail = fIS_EMAIL(pEmail);
    set isphone = fIS_PHONE(pPhone);
	set userId = -1;
    if isemail + isphone = 0 then
		set resultCode = @ERROR_EMPTY_PARAMS;
        leave proc;
    end if;
    -- exist email
    if isemail = 1 then
		if exists(select id from users where email = pEmail limit 1) then
			set resultCode = @ERROR_USER_EMAIL_ALREADY_USED;
			leave proc;
		end if;
    end if;
    -- exists phone
    if isphone = 1 then
		if exists(select id from users where phone = pPhone limit 1) then
			set resultCode = @ERROR_USER_PHONE_ALREADY_USED;
			leave proc;
		end if;
    end if;
    -- insert ---
    insert into `users` (email, phone, regdate) values (pEmail, pPhone, UTC_TIMESTAMP());
    set resultCode = @NO_ERROR;
    set userId = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUSER_ADD_SOCIAL_ACCOUNT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUSER_ADD_SOCIAL_ACCOUNT`(
	pSocialNet varchar(2), pSocialId varchar(200),
    pGivenName varchar(45), pFamilyName varchar(45), pNickName varchar(45),
    pImageURI varchar(500), pAvatar longtext,
    pEmail varchar(200), 
    pSex varchar(1),
    out userId int, out resultCode int)
BEGIN
	call spSET_ERROR_CODES();
    insert into `users` (`socialNet`,`socialId`,
		`givenName`,`familyName`,`nickName`,`imageURI`,`avatar`,
        `email`, `sex`, `userType`, `role`)
	values (pSocialNet, pSocialId,
		pGivenName, pFamilyName, pNickName, pImageURI, pAvatar,
		pEmail, pSex, '', '');
	set resultCode = @NO_ERROR;
    set userId = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spWORKPLACE_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spWORKPLACE_ADD`(pSessionKey varchar(32), 
	pCityId int, pCoords varchar(30), pSubwayStationId int,  
    pLocaleId int, pTitle varchar(100), pAddress varchar(100), pRouteDetails varchar(500), pBasic int, 
    out workplaceId int, out resultCode int)
proc:BEGIN
	declare cID int;
	set workplaceId = -1;
	-- using --
	call spSET_ERROR_CODES();
    -- admin test --
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set resultCode = cID;
        leave proc;
    end if;
	/*
    if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    */
	-- insert workplace
    if isnull(pCoords) then
		insert into workplace (cityId, customerId, subwayStationId) values (pCityId, cID, pSubwayStationId);
    else
		insert into workplace (cityId, coords, customerId, subwayStationId) values (pCityId, st_geomfromtext(pCoords), cID, pSubwayStationId);
	end if;
    if row_count() = 0 then
		set resultCode = @ERROR_INSERT_ERROR;
		leave proc;
    end if;
    set workplaceId = last_insert_id();
    -- insert locale text
    insert into workplacetitle (`pid`, `lcid`, `title`, `address`, `routeDetails`, `basic`)
    values (workplaceId, pLocaleId, pTitle, pAddress, pRouteDetails, pBasic);
    if row_count() = 0 then
		set resultCode = @ERROR_INSERT_ERROR;
        leave proc;
	end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spWORKPLACE_INFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spWORKPLACE_INFO`(pWorkplaceId int, pLocaleId int)
BEGIN
	select id, cityId, coords, customerId, fSPLIT_STR(txt, 1) as title, fSPLIT_STR(txt, 2) as address, fSPLIT_STR(txt, 3) as routeDetails, subwayStationId as ssid from (
		select id, cityId, coords, customerId, subwayStationId, fGET_WORKPLACE_TEXT(id, pLocaleId) as txt from workplace where id = pWorkplaceId
	) as T;
    select subwayStationId as ssid, fGET_SUBWAY_TEXT(subwayStationId, pLocaleId) as title from workplace where id = pWorkplaceId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spWORKPLACE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spWORKPLACE_LIST`(pCityId int, pLocaleId int)
BEGIN
	select id, fSPLIT_STR(txt, 1) as title, fSPLIT_STR(txt, 2) as address, fSPLIT_STR(txt, 3) as routeDetails, subwayStationId as ssid from (
		select id, fGET_WORKPLACE_TEXT(id, pLocaleId) as txt, subwayStationId from workplace where cityId = pCityId
	) as T;
    select subwayStationId as ssid, fGET_SUBWAY_TEXT(subwayStationId, pLocaleId) as title from workplace where cityId = pCityId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spWORKPLACE_REMOVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spWORKPLACE_REMOVE`(
	pSessionKey varchar(32), 
    pWorkplaceId int, out resultCode int)
proc:BEGIN
	declare cId int;
    declare tempCustomerId int;
	-- using --
	call spSET_ERROR_CODES();
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set resultCode = @ERROR_WORKPLACE_NON_CUSTOMER_WORKPLACE;
        leave proc;
    end if;
    
    select customerId into tempCustomerId from workplace where id = pWorkplaceId;
    if isnull(tempCustomerId) then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    --
    if cID <> tempCustomerId then
		set resultCode = @ERROR_WORKPLACE_NON_CUSTOMER_WORKPLACE;
        leave proc;
    end if;
    -- admin test --
	/*if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    */
    -- test relation --
    if exists(select * from `schedule` where workplaceId = pWorkplaceId limit 1) then
		set resultCode = @ERROR_LINKS_HAS_RELATION;
        leave proc;
    end if;
    -- action!
    delete from workplace where id = pWorkplaceId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
	else
		set resultCode = @NO_ERROR;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spWORKPLACE_REMOVE_LOCALE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spWORKPLACE_REMOVE_LOCALE`(pSessionKey varchar(32), 
    pWorkplaceId int, pLocaleId int, out resultCode int)
proc: BEGIN
	declare cId int;
    declare tempCustomerId int;
	-- using --
	call spSET_ERROR_CODES();
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set resultCode = @ERROR_WORKPLACE_NON_CUSTOMER_WORKPLACE;
        leave proc;
    end if;
    -- read info
    select customerId into tempCustomerId from workplace where id = pWorkplaceId;
    if isnull(tempCustomerId) then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    --
    if cID <> tempCustomerId then
		set resultCode = @ERROR_WORKPLACE_NON_CUSTOMER_WORKPLACE;
        leave proc;
    end if;
    -- admin test
    /*
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    */
    -- delete
    delete from workplacetitle where pid = pWorkplaceId and lcid = pLocaleId;
    if row_count() = 0 then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spWORKPLACE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spWORKPLACE_UPDATE`(pSessionKey varchar(32), 
    pWorkplaceId int, pCityId int, pCoords varchar(50), pSubwayStationId int, 
    pLocaleId int, pTitle varchar(100), pAddress varchar(500), pRouteDetails varchar(500), pBasic int, 
    out resultCode int)
proc:BEGIN
	declare cID int;
	declare tempId int;
	declare tempCityId int;
    declare tempCoords varchar(50);
    declare tempCustomerId int;
    declare tempSubwayStationId int;

	-- using --
	call spSET_ERROR_CODES();
    set cID = fGET_CUSTOMER_ID(pSessionKey);
    if cID < 0 then
		set resultCode = cID;
		leave proc;
    end if;
    -- admin test --
    /*
	if (not fIS_ADMIN(pSessionKey)) then
		set resultCode = @ERROR_ACCESS_DENIED;
        leave proc;
    end if;
    */
    -- get prev values
    select id, cityId, customerId, astext(coords), subwayStationId 
    into tempId, tempCityId, tempCustomerId, tempCoords, tempSubwayStationId
    from workplace where id = pWorkplaceId;
    if isNull(id) then
		set resultCode = @ERROR_ROW_NOT_EXISTS;
        leave proc;
    end if;
    -- test for owner
    if cID <> tempCustomerId then
		set resultCode = @ERROR_WORKPLACE_NON_CUSTOMER_WORKPLACE;
        leave proc;
    end if;
    -- change main info, if not (all empty)
    if not (isNull(pCityId) and isNull(pCoords) and isNull(pSubwayStationId)) then
		set pCityId = ifnull(pCityId, tempCityId);
		set pCoords = ifnull(pCoords, tempCoords);
		set pSubwayStationId = ifnull(pSubwayStationId, tempSubwayStationId);
        if isnull(pCoords) then
			update workplace set
				cityId = pCityId,
				coords = st_geomfromtext(pCoords),
				subwayStationId = pSubwayStationId
			where id = pWorkplaceId;
		else
			update workplace set
				cityId = pCityId,
				subwayStationId = pSubwayStationId
			where id = pWorkplaceId;
        end if;
	end if;
    -- change locale text
    if not (isNull(pTitle) and isNull(pAddress) and isNull(pRouteDetail)) then
		-- if basic set all locales to 0
		if pBasic then
			update workplacetitle set basic = 0 where pid = pWorkplaceId;
		end if;
		-- update locale localetext
		update workplacetitle set
			title = pTitle,
			address = pAddress,
			routeDetails = pRouteDetails,
			basic = pBasic
		where pid = pCityId and lcid = pLocaleId;
		-- insert if not exists
		if row_count() = 0 then
			INSERT INTO workplacetitle
				(`pid`,`lcid`,`title`,`address`,`routeDetails`)
			VALUES
				(pWorkplaceId, pLocaleId, pTitle, pAddress, pRouteDetails);
		end if;
	end if;
    set resultCode = @NO_ERROR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UPDATE_LAST_ACTIVE_TIME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UPDATE_LAST_ACTIVE_TIME`(pSessionKey varchar(32), out pResultCode int)
BEGIN
	UPDATE sessions SET lastActionTime = now() where sessionKey = pSessionKey;
    SELECT ROW_COUNT() INTO pResultCode;
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

-- Dump completed on 2017-11-01  3:16:38
