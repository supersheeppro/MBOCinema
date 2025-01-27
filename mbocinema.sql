-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mbo_cinema
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add coming soon release',1,'add_comingsoonrelease'),(2,'Can change coming soon release',1,'change_comingsoonrelease'),(3,'Can delete coming soon release',1,'delete_comingsoonrelease'),(4,'Can view coming soon release',1,'view_comingsoonrelease'),(5,'Can add feature',2,'add_feature'),(6,'Can change feature',2,'change_feature'),(7,'Can delete feature',2,'delete_feature'),(8,'Can view feature',2,'view_feature'),(9,'Can add movie',3,'add_movie'),(10,'Can change movie',3,'change_movie'),(11,'Can delete movie',3,'delete_movie'),(12,'Can view movie',3,'view_movie'),(13,'Can add watchlist',4,'add_watchlist'),(14,'Can change watchlist',4,'change_watchlist'),(15,'Can delete watchlist',4,'delete_watchlist'),(16,'Can view watchlist',4,'view_watchlist'),(17,'Can add user profile',5,'add_userprofile'),(18,'Can change user profile',5,'change_userprofile'),(19,'Can delete user profile',5,'delete_userprofile'),(20,'Can view user profile',5,'view_userprofile'),(21,'Can add ticket',6,'add_ticket'),(22,'Can change ticket',6,'change_ticket'),(23,'Can delete ticket',6,'delete_ticket'),(24,'Can view ticket',6,'view_ticket'),(25,'Can add show time',7,'add_showtime'),(26,'Can change show time',7,'change_showtime'),(27,'Can delete show time',7,'delete_showtime'),(28,'Can view show time',7,'view_showtime'),(29,'Can add new release',8,'add_newrelease'),(30,'Can change new release',8,'change_newrelease'),(31,'Can delete new release',8,'delete_newrelease'),(32,'Can view new release',8,'view_newrelease'),(33,'Can add event',9,'add_event'),(34,'Can change event',9,'change_event'),(35,'Can delete event',9,'delete_event'),(36,'Can view event',9,'view_event'),(37,'Can add log entry',10,'add_logentry'),(38,'Can change log entry',10,'change_logentry'),(39,'Can delete log entry',10,'delete_logentry'),(40,'Can view log entry',10,'view_logentry'),(41,'Can add permission',11,'add_permission'),(42,'Can change permission',11,'change_permission'),(43,'Can delete permission',11,'delete_permission'),(44,'Can view permission',11,'view_permission'),(45,'Can add group',12,'add_group'),(46,'Can change group',12,'change_group'),(47,'Can delete group',12,'delete_group'),(48,'Can view group',12,'view_group'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add content type',14,'add_contenttype'),(54,'Can change content type',14,'change_contenttype'),(55,'Can delete content type',14,'delete_contenttype'),(56,'Can view content type',14,'view_contenttype'),(57,'Can add session',15,'add_session'),(58,'Can change session',15,'change_session'),(59,'Can delete session',15,'delete_session'),(60,'Can view session',15,'view_session'),(61,'Can add standard event list',16,'add_standardeventlist'),(62,'Can change standard event list',16,'change_standardeventlist'),(63,'Can delete standard event list',16,'delete_standardeventlist'),(64,'Can view standard event list',16,'view_standardeventlist'),(65,'Can add zaal',17,'add_zaal'),(66,'Can change zaal',17,'change_zaal'),(67,'Can delete zaal',17,'delete_zaal'),(68,'Can view zaal',17,'view_zaal'),(69,'Can add info',18,'add_info'),(70,'Can change info',18,'change_info'),(71,'Can delete info',18,'delete_info'),(72,'Can view info',18,'view_info'),(73,'Can add location',19,'add_location'),(74,'Can change location',19,'change_location'),(75,'Can delete location',19,'delete_location'),(76,'Can view location',19,'view_location'),(77,'Can add row',20,'add_row'),(78,'Can change row',20,'change_row'),(79,'Can delete row',20,'delete_row'),(80,'Can view row',20,'view_row'),(81,'Can add seat',21,'add_seat'),(82,'Can change seat',21,'change_seat'),(83,'Can delete seat',21,'delete_seat'),(84,'Can view seat',21,'view_seat'),(85,'Can add reservation',22,'add_reservation'),(86,'Can change reservation',22,'change_reservation'),(87,'Can delete reservation',22,'delete_reservation'),(88,'Can view reservation',22,'view_reservation');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$353KYV4zA41ZJIPK30mfH5$2fEKOmQyJ8x+rUz89EV6nkDfGi75PoWrqw7+X2xxzeg=','2025-01-26 21:57:35.280878',1,'deviv','Devi','Riet','devivanriet@gmail.com',1,1,'2025-01-17 12:49:51.000000'),(5,'pbkdf2_sha256$600000$pCh2iSe92yORcP2g8v9kES$nd7SQ1MnOhF0eKgOlRY1cFb6W6eALZaKgwWAj0n1JhE=','2025-01-19 20:50:14.804975',0,'barttt','bart','jan','bart@gmail.com',0,1,'2025-01-19 20:50:14.492265'),(6,'pbkdf2_sha256$600000$4Eg7ordzoZEoCPXo6Y6Gwl$8pM3Q8JjY/pRPh5zd4PuzjACf2RratBck1ujWyUNJOQ=','2025-01-19 20:51:18.243245',0,'jan','janweillum','willum','jan@gmail.com',0,1,'2025-01-19 20:51:17.913898'),(7,'pbkdf2_sha256$600000$kQmuE45VsZNMKif59K8mgI$yPZbWuaBmHCon3dpPuKWQDXkmGox5+6KtSW4ij7vOio=','2025-01-19 20:52:43.761070',0,'wad','devi','awdad','adadad@gmail.com',0,1,'2025-01-19 20:52:43.436203'),(8,'pbkdf2_sha256$600000$zJSAJjDOe9mGz30IorfXyI$lSrMHbr3gOR6/g4uBtSAhgG6Nl5VbSAXUxBCeoW47+I=','2025-01-19 20:53:23.679474',0,'wadwa','adada','adswdad','asdadASD@gmail.com',0,1,'2025-01-19 20:53:23.370635'),(10,'pbkdf2_sha256$600000$LKaM3Yy02OfHQwqwl59Rwr$+gkytpSWhKQTifbDnkBFzFB7cljJPeF6pX86o3O/2MI=','2025-01-19 21:09:36.165148',0,'adadwda','janweillum','henk','adscadfcew@gmail.com',0,1,'2025-01-19 21:09:35.849118'),(11,'pbkdf2_sha256$600000$IUIofc3OQsbK31v6zOmOjB$v/a24oqAjHScssLYpzCNl3qH8r1kQGChLEPDyHcSjtI=','2025-01-19 21:19:42.146964',0,'adsdcsef','bart','jan','devivanriet@gmail.com',0,1,'2025-01-19 21:19:41.805347'),(12,'pbkdf2_sha256$600000$3X3u3FxcVYj2t2Uofw2pif$WI8fUPMcMFzCeadaYQXGxctOnTGsh7Uzb+//773Wz0c=','2025-01-19 21:23:56.398093',0,'awwwwwww','bart','jan','devivanriet@gmail.com',0,1,'2025-01-19 21:23:10.280464');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_comingsoonrelease`
--

DROP TABLE IF EXISTS `cinemaapp_comingsoonrelease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_comingsoonrelease` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `description` longtext,
  `release_date` date DEFAULT NULL,
  `poster` varchar(100) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_comingsoonrelease`
--

LOCK TABLES `cinemaapp_comingsoonrelease` WRITE;
/*!40000 ALTER TABLE `cinemaapp_comingsoonrelease` DISABLE KEYS */;
INSERT INTO `cinemaapp_comingsoonrelease` VALUES (1,'BabyGirl','Babygirl is een erotische thriller over de succesvolle CEO Romy (Nicole Kidman), die haar carrière en familie op het spel zet als ze een affaire begint met een jonge stagiair (Harris Dickinson). De film is geschreven en geregisseerd door Halina Reijn voor het toonaangevende Amerikaanse productiebedrijf A24. Romy (Nicole Kidman) is zakelijk succesvol, heeft een liefhebbende man (Antonio Banderas) en is een goede moeder. Haar zorgvuldig gestructureerde bestaan raakt uit balans als ze de brutale stagiair Samuel (Harris Dickinson) ontmoet. Terwijl ze de macht langzaam uit handen geeft, ontdekt Romy steeds meer over zichzelf en haar eigen intieme verlangens. Maar hoeveel controle is ze bereid op te geven? Halina Reijn wilde een film maken over zelfliefde en hoe je van alle lagen van jezelf kunt houden, “inclusief de donkere kanten.” Babygirl ging in wereldpremière op het Filmfestival van Venetië, waar Nicole Kidman werd bekroond met de prijs voor Beste Actrice','2025-01-17','coming_soon_posters/thumb_9zWu3AL.png',0),(3,'Den of Thieves 2: Pantera','Compromisloze en keiharde agent ‘Big Nick’ en beroepscrimineel Donnie Wilson keren terug in een adembenemend kat-en-muis-spel. Na de gebeurtenissen van ‘Den of Thieves (2018) zit Big Nick Donnie op de hielen in Europa, waar Donnie zich begeeft in de wereld van de diamanthandel. Samen met een bende gevaarlijke criminelen beraamt Donnie een grootschalige overval op de best beveiligde diamantbeurs ter wereld. Tegelijkertijd worden ze opgejaagd door de beruchte Pantera-maffia.','2025-01-27','coming_soon_posters/denofthieves.jpg',0),(4,'Paddington in Peru (Originele versie)','Paddington in Peru (Originele versie)\r\n           \r\n 56 stemmen van Vue bezoekers\r\nPaddington ontvangt een brief dat zijn tante Lucy – die in een tehuis voor bejaarde beren in Peru woont – hem heel erg mist. Hij besluit haar zo snel mogelijk te bezoeken en samen met de familie Brown vertrekt hij op een epische reis die geen van hen snel zal vergeten.\r\n\r\nIn Peru ontmoeten ze nieuwe vrienden, zoals de gitaar spelende Moeder Overste die het tehuis runt en de onstuimige rivierbootkapitein Hunter. Wanneer ze met die laatste op pad gaan, brengt dit Paddington en de Browns tot diep in het Amazone regenwoud en naar de toppen van het Andesgebergte. Onderweg komen ze onverwachte uitdagingen tegen en ontdekt Paddington verrassende geheimen over zijn verleden.','2025-01-27','coming_soon_posters/padington.jpg',0),(5,'Mufasa: The Lion King (Originele versie)','In Mufasa: The Lion King vertelt Rafiki de legende van Mufasa aan de jonge leeuwenwelp Kiara, dochter van Simba en Nala. Hierbij wordt hij op eigenzinnige wijze ondersteund door Timon en Pumbaa. Het verhaal wordt verteld in flashbacks en introduceert Mufasa als een wees. Hij is verloren, eenzaam en alleen... totdat hij een sympathieke leeuw genaamd Taka ontmoet, de erfgenaam van een koninklijke bloedlijn. Deze toevallige ontmoeting zet een een groot avontuur in gang van twee buitenbeentjes die opzoek gaan naar hun lotsbestemming. Hun vriendschap wordt op de proef gesteld wanneer ze moeten samenwerken om een dreigende en dodelijke vijand te verslaan.','2025-01-27','coming_soon_posters/mufasa.jpg',0);
/*!40000 ALTER TABLE `cinemaapp_comingsoonrelease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_event`
--

DROP TABLE IF EXISTS `cinemaapp_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `poster` varchar(100) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `movie_id` bigint NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `zaal_id` bigint DEFAULT NULL,
  `genre` varchar(50) NOT NULL,
  `pegi_rating` varchar(2) NOT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemaapp_event_movie_id_b7a35728_fk_Cinemaapp_movie_id` (`movie_id`),
  KEY `Cinemaapp_event_zaal_id_4682978a_fk_Cinemaapp_zaal_id` (`zaal_id`),
  CONSTRAINT `Cinemaapp_event_movie_id_b7a35728_fk_Cinemaapp_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `cinemaapp_movie` (`id`),
  CONSTRAINT `Cinemaapp_event_zaal_id_4682978a_fk_Cinemaapp_zaal_id` FOREIGN KEY (`zaal_id`) REFERENCES `cinemaapp_zaal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_event`
--

LOCK TABLES `cinemaapp_event` WRITE;
/*!40000 ALTER TABLE `cinemaapp_event` DISABLE KEYS */;
INSERT INTO `cinemaapp_event` VALUES (1,'K3 en het lied van de zeemeermin','K3 en het lied van de zeemeermin (Meet the Cast)\r\nK3 en het lied van de zeemeermin\r\nOntmoet Julia en Hanne uit K3 in Vue Kerkrade op 1 februari! Je ziet ze voorafgaand aan de voorstelling van 10:15 uur.\r\n\r\nHanne, Marthe en Julia hebben in het kustdorpje Porto Sirento de vakantie van hun leven. Zon, zee, strand, samen plezier maken, dansen en liedjes zingen. Maar hun vakantie komt plots helemaal op zijn kop te staan, wanneer de meisjes door een mysterieuze betovering te pas en te onpas veranderen in prachtige zeemeerminnen! Als de meisjes niet willen opvallen, zullen ze water moeten vermijden en dat is natuurlijk makkelijker gezegd dan gedaan. Er loert overal gevaar. In het kustdorpje waar de meisjes van hun vakantie genieten, zien de inwoners zeemeerminnen om de één of andere reden als monsters. Wanneer de meisjes ontdekken dat ze na drie dagen voorgoed zeemeermin zullen blijven, start een race tegen de klok om de betovering te verbreken. Als het hen niet op tijd lukt, zullen Hanne, Marthe en Julia voor altijd zeemeerminnen zijn, en nooit meer K3…','2025-01-17 12:56:29.000000','events/maxresdefault.jpg','fsfsfsef',2,'event_thumbnails/meetthecastk3.jpg',1,'Action','3',NULL,10.00),(2,'MBOCinema Opera','Speciaal in het leven geroepen voor onze operaliefhebbers! Bekijk het beste wat The Royal Opera House uit Londen te bieden heeft. Beleef het alsof je op de eerste rang zit: laat je meeslepen door grandioze arias en librettos in een spectaculair en tijdloos verhaal. Natuurlijk vanuit de beste stoelen én met het beste geluid!','2025-01-17 12:57:07.000000','events/opera.jpg','qwcfeasfc',1,'event_thumbnails/Schermafbeelding_2025-01-27_030048.png',NULL,'Action','3',NULL,10.00),(3,'Woezel & Pip op Avontuur in de Tovertuin','Woezel en Pip beleven een nieuw filmavontuur! Samen met Sam en haar familie gaan de twee hondjes op vakantie. Alles lijkt perfect te gaan, tot ze onderweg hun knuffels kwijtraken. Tegelijkertijd verdwijnt in de Tovertuin Pip’s hartenbandje. Lukt het de allerbeste vriendjes om elkaar én het hartje terug te vinden?','2025-01-17 12:57:45.000000','events/maxresdefault_1.jpg','addad',1,'event_thumbnails/woezelenpip.jpg',NULL,'Action','3',NULL,10.00),(7,'Dalej Jazda','A humorous and emotional story of a family as unpredictable as a tornado, which you love at first sight. Their everyday life gains momentum when the energetic Józek (Marian Opania) and the charming Elżbieta (Małgorzata Rożniatowska) decide to set off on another joint journey through Poland... And if it\'s a journey, then only in their favorite car from their youth. This opportunity arises, because the perfect Nysa appears in the son\'s (Mariusz Drężek) second-hand shop. However, the son and daughter-in-law (Anita Sokołowska) oppose the journey, so the seniors have no choice but to steal a car. The grandparents\' crazy plan is supported by their granddaughter (Julia Wieniawa) and a spiteful neighbor (Wiktor Zborowski). Finally, Józek and Elżbieta travel on their own terms: they laugh, take risks, and love as if they were 20 years old. When the characters reach their destination, they will understand that the place in the world they occupy is the right one. No one could have predicted that a crazy and distant trip of grandparents would bring the whole family closer together.','2025-01-27 02:05:31.000000','events/download.jpg','Alphen',5,'event_thumbnails/pools.jpg',1,'Action','3',5.0,10.00),(8,'Becoming Led Zeppelin','Becoming Led Zeppelin toont het ontstaan van de legendarische rockband, die tegen alle verwachtingen in een bliksemsnelle opmars maakte. Met indrukwekkende, psychedelische en nooit eerder vertoonde beelden, optredens en muziekfragmenten, neemt regisseur Bernard MacMahon je mee op een meeslepende en filmische reis door het persoonlijke verhaal van Led Zeppelin. De bandleden vertellen in hun eigen woorden over hun creatieve en muzikale reis en is daarmee de eerste officiële documentaire over de band.','2025-01-27 02:08:23.000000','events/download_1.jpg','Alphen',1,'event_thumbnails/becomingled.jpg',1,'Action','3',5.0,10.00);
/*!40000 ALTER TABLE `cinemaapp_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_feature`
--

DROP TABLE IF EXISTS `cinemaapp_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_feature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_feature`
--

LOCK TABLES `cinemaapp_feature` WRITE;
/*!40000 ALTER TABLE `cinemaapp_feature` DISABLE KEYS */;
INSERT INTO `cinemaapp_feature` VALUES (1,'Scary'),(2,'Sexual Content');
/*!40000 ALTER TABLE `cinemaapp_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_info`
--

DROP TABLE IF EXISTS `cinemaapp_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `info` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_info`
--

LOCK TABLES `cinemaapp_info` WRITE;
/*!40000 ALTER TABLE `cinemaapp_info` DISABLE KEYS */;
INSERT INTO `cinemaapp_info` VALUES (1,'Over ons','Welkom bij mboCinemas &#x1F3AC;<br>\r\nJouw ultieme bioscoopervaring, speciaal ontworpen door en voor mbo-studenten! Bij mboCinemas draait alles om een unieke filmervaring. Met een breed aanbod van de nieuwste blockbusters, tijdloze klassiekers en inspirerende documentaires is er voor iedereen iets te beleven. Wat maakt mboCinemas speciaal? Betaalbaar: Speciaal geprijsde tickets voor studenten. Innovatief: Een platform dat je makkelijk toegang geeft tot films, trailers en evenementen. Gemeenschap: Geniet samen met vrienden of ontmoet andere filmliefhebbers tijdens speciale thema-avonden. Laat je meeslepen door adembenemende beelden en ontdek waarom mboCinemas dé plek is voor iedere filmliefhebber. &#x1F4C5; Mis niets! Bekijk nu de nieuwste releases en plan jouw filmavond. Pas dit aan naar wens! &#x1F60A;','images/mbocinemas_standaartcover_aJLpYPD.jpg');
/*!40000 ALTER TABLE `cinemaapp_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_location`
--

DROP TABLE IF EXISTS `cinemaapp_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `photo` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_location`
--

LOCK TABLES `cinemaapp_location` WRITE;
/*!40000 ALTER TABLE `cinemaapp_location` DISABLE KEYS */;
INSERT INTO `cinemaapp_location` VALUES (1,'Lammenschans','Lammenschans Cinema is een moderne bioscoop in het hart van Lammenschans, waar filmfans kunnen genieten van een breed aanbod van films, van de nieuwste blockbusters tot tijdloze klassiekers. De bioscoop beschikt over comfortabele zalen met de laatste technologie voor de ultieme filmervaring. Of je nu komt voor een avondje uit met vrienden of familie, of voor een speciale filmvertoning, Lammenschans Cinema biedt voor elk wat wils. Met een gezellige sfeer, een café voor een hapje en een drankje, en een centrale ligging die makkelijk bereikbaar is met zowel de auto als het openbaar vervoer, is Lammenschans Cinema de perfecte bestemming voor een filmavond.','location_photos/mbocinemas1.jpg','lammenschans 2356GH'),(2,'Alphen aan den Rijn','MBOCinemas Alphen aan den Rijn is een moderne bioscoop gelegen in het centrum van Alphen aan den Rijn. De bioscoop biedt een breed scala aan films, van de nieuwste blockbusters tot klassiekers, allemaal in comfortabele zalen met de nieuwste technologie. Met verschillende films en speciale evenementen, is het de ideale plek voor een gezellige filmavond met vrienden of familie. MBOCinemas biedt niet alleen films, maar ook een gezellige sfeer met een café en een centrale locatie, goed bereikbaar met zowel de auto als het openbaar vervoer.','location_photos/mbocinemas2.jpg','Alphen aan den Rijn 2567GG');
/*!40000 ALTER TABLE `cinemaapp_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_movie`
--

DROP TABLE IF EXISTS `cinemaapp_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `release_date` date NOT NULL,
  `duration` int unsigned NOT NULL,
  `poster` varchar(100) NOT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `genre` varchar(50) NOT NULL,
  `pegi_rating` varchar(2) NOT NULL,
  `zaal_id` bigint DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemaapp_movie_zaal_id_5e1d5a47_fk_Cinemaapp_zaal_id` (`zaal_id`),
  CONSTRAINT `Cinemaapp_movie_zaal_id_5e1d5a47_fk_Cinemaapp_zaal_id` FOREIGN KEY (`zaal_id`) REFERENCES `cinemaapp_zaal` (`id`),
  CONSTRAINT `cinemaapp_movie_chk_1` CHECK ((`duration` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_movie`
--

LOCK TABLES `cinemaapp_movie` WRITE;
/*!40000 ALTER TABLE `cinemaapp_movie` DISABLE KEYS */;
INSERT INTO `cinemaapp_movie` VALUES (1,'Babygirl','Babygirl is een erotische thriller over de succesvolle CEO Romy (Nicole Kidman), die haar carrière en familie op het spel zet als ze een affaire begint met een jonge stagiair (Harris Dickinson). De film is geschreven en geregisseerd door Halina Reijn voor het toonaangevende Amerikaanse productiebedrijf A24. Romy (Nicole Kidman) is zakelijk succesvol, heeft een liefhebbende man (Antonio Banderas) en is een goede moeder. Haar zorgvuldig gestructureerde bestaan raakt uit balans als ze de brutale stagiair Samuel (Harris Dickinson) ontmoet. Terwijl ze de macht langzaam uit handen geeft, ontdekt Romy steeds meer over zichzelf en haar eigen intieme verlangens. Maar hoeveel controle is ze bereid op te geven? Halina Reijn wilde een film maken over zelfliefde en hoe je van alle lagen van jezelf kunt houden, “inclusief de donkere kanten.” Babygirl ging in wereldpremière op het Filmfestival van Venetië, waar Nicole Kidman werd bekroond met de prijs voor Beste Actrice','2025-01-20',120,'posters/thumb_hrIAeoN.png',5.0,'Action','16',1,'movies/Babygirl__Official_Trailer_HD__A24.mp4',10.00),(2,'Wicked','In Wicked maken we kennis met het nog onbekende verhaal van de Witches of Oz. Emmy-, Grammy- en Tony-winnares Cynthia Erivo (Harriet, de Broadway-versie van The Color Purple) is te zien als Elphaba, een jonge vrouw die zich onzeker voelt vanwege haar ongebruikelijke groene huid en die haar ware kracht nog moet ontdekken. \r\n\r\nGrammy-winnares en wereldwijde superster Ariana Grande speelt Glinda, een populaire, geprivilegieerde en ambitieuze jonge vrouw die er nog achter moet komen wie ze zelf echt is. De twee leren elkaar kennen als studenten aan de Shiz Universiteit in het magische Land van Oz en sluiten een onwaarschijnlijke maar innige vriendschap. \r\n\r\nNa een ontmoeting met de Wizard of Oz wordt hun vriendschap op de proef gesteld en zullen ze heel verschillende paden bewandelen. Door Glinda’s verlangen naar populariteit zal ze bezwijken voor de verleidingen van de macht. Elphaba is juist vastberaden om trouw te blijven aan zichzelf en aan de mensen om haar heen, wat onverwachte en schokkende gevolgen zal hebben voor haar toekomst. Na hun bijzondere avonturen in Oz zullen ze uiteindelijk bekend komen te staan als Glinda de Good Witch en Wicked Witch of the West. \r\n\r\nLet op: tickets zijn exclusief 3D bril.','2025-01-17',120,'posters/wicked-thumbnail.jpg',8.0,'Action','3',4,'movies/The_Woman_In_The_Yard__Official_Trailer_wX6zTKV.mp4',10.00),(3,'Den of Thieves 2: Pantera','Compromisloze en keiharde agent ‘Big Nick’ en beroepscrimineel Donnie Wilson keren terug in een adembenemend kat-en-muis-spel. Na de gebeurtenissen van ‘Den of Thieves (2018) zit Big Nick Donnie op de hielen in Europa, waar Donnie zich begeeft in de wereld van de diamanthandel. Samen met een bende gevaarlijke criminelen beraamt Donnie een grootschalige overval op de best beveiligde diamantbeurs ter wereld. Tegelijkertijd worden ze opgejaagd door de beruchte Pantera-maffia.','2025-01-22',120,'posters/denofthieves.jpg',5.0,'Action','18',1,'movies/The_Woman_In_The_Yard__Official_Trailer_qMVB6G6.mp4',10.00),(4,'Mufasa: The Lion King (Originele versie)','In Mufasa: The Lion King vertelt Rafiki de legende van Mufasa aan de jonge leeuwenwelp Kiara, dochter van Simba en Nala. Hierbij wordt hij op eigenzinnige wijze ondersteund door Timon en Pumbaa. Het verhaal wordt verteld in flashbacks en introduceert Mufasa als een wees. Hij is verloren, eenzaam en alleen... totdat hij een sympathieke leeuw genaamd Taka ontmoet, de erfgenaam van een koninklijke bloedlijn. Deze toevallige ontmoeting zet een een groot avontuur in gang van twee buitenbeentjes die opzoek gaan naar hun lotsbestemming. Hun vriendschap wordt op de proef gesteld wanneer ze moeten samenwerken om een dreigende en dodelijke vijand te verslaan.','2025-01-22',120,'posters/mufasa.jpg',4.0,'Action','16',1,'movies/The_Book_of_Quotes_icon.ico',10.00),(5,'Paddington in Peru (Originele versie)','Paddington ontvangt een brief dat zijn tante Lucy – die in een tehuis voor bejaarde beren in Peru woont – hem heel erg mist. Hij besluit haar zo snel mogelijk te bezoeken en samen met de familie Brown vertrekt hij op een epische reis die geen van hen snel zal vergeten.\r\n\r\nIn Peru ontmoeten ze nieuwe vrienden, zoals de gitaar spelende Moeder Overste die het tehuis runt en de onstuimige rivierbootkapitein Hunter. Wanneer ze met die laatste op pad gaan, brengt dit Paddington en de Browns tot diep in het Amazone regenwoud en naar de toppen van het Andesgebergte. Onderweg komen ze onverwachte uitdagingen tegen en ontdekt Paddington verrassende geheimen over zijn verleden.','2025-01-22',100,'posters/padington.jpg',4.0,'Drama','12',1,'movies/The_Woman_In_The_Yard__Official_Trailer_FaSNA1B.mp4',10.00);
/*!40000 ALTER TABLE `cinemaapp_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_movie_features`
--

DROP TABLE IF EXISTS `cinemaapp_movie_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_movie_features` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL,
  `feature_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cinemaapp_movie_features_movie_id_feature_id_3e9ea2cf_uniq` (`movie_id`,`feature_id`),
  KEY `Cinemaapp_movie_feat_feature_id_f9c1d19e_fk_Cinemaapp` (`feature_id`),
  CONSTRAINT `Cinemaapp_movie_feat_feature_id_f9c1d19e_fk_Cinemaapp` FOREIGN KEY (`feature_id`) REFERENCES `cinemaapp_feature` (`id`),
  CONSTRAINT `Cinemaapp_movie_features_movie_id_5686b826_fk_Cinemaapp_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `cinemaapp_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_movie_features`
--

LOCK TABLES `cinemaapp_movie_features` WRITE;
/*!40000 ALTER TABLE `cinemaapp_movie_features` DISABLE KEYS */;
INSERT INTO `cinemaapp_movie_features` VALUES (1,1,1),(2,2,1),(3,2,2),(4,3,1),(5,3,2),(6,4,1),(7,4,2),(8,5,2);
/*!40000 ALTER TABLE `cinemaapp_movie_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_movie_locations`
--

DROP TABLE IF EXISTS `cinemaapp_movie_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_movie_locations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cinemaapp_movie_locations_movie_id_location_id_520c24e9_uniq` (`movie_id`,`location_id`),
  KEY `Cinemaapp_movie_loca_location_id_c3930c12_fk_Cinemaapp` (`location_id`),
  CONSTRAINT `Cinemaapp_movie_loca_location_id_c3930c12_fk_Cinemaapp` FOREIGN KEY (`location_id`) REFERENCES `cinemaapp_location` (`id`),
  CONSTRAINT `Cinemaapp_movie_loca_movie_id_732524d6_fk_Cinemaapp` FOREIGN KEY (`movie_id`) REFERENCES `cinemaapp_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_movie_locations`
--

LOCK TABLES `cinemaapp_movie_locations` WRITE;
/*!40000 ALTER TABLE `cinemaapp_movie_locations` DISABLE KEYS */;
INSERT INTO `cinemaapp_movie_locations` VALUES (1,1,2),(2,2,1),(3,2,2),(4,3,2),(5,4,2),(6,5,1);
/*!40000 ALTER TABLE `cinemaapp_movie_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_newrelease`
--

DROP TABLE IF EXISTS `cinemaapp_newrelease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_newrelease` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `release_date` date NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `movie_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemaapp_newrelease_movie_id_f456e31e_fk_Cinemaapp_movie_id` (`movie_id`),
  CONSTRAINT `Cinemaapp_newrelease_movie_id_f456e31e_fk_Cinemaapp_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `cinemaapp_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_newrelease`
--

LOCK TABLES `cinemaapp_newrelease` WRITE;
/*!40000 ALTER TABLE `cinemaapp_newrelease` DISABLE KEYS */;
INSERT INTO `cinemaapp_newrelease` VALUES (1,'2025-01-17',1,4),(2,'2025-01-17',0,3),(3,'2025-01-17',0,5),(4,'2025-01-17',0,1);
/*!40000 ALTER TABLE `cinemaapp_newrelease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_reservation`
--

DROP TABLE IF EXISTS `cinemaapp_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reserved_on` datetime(6) NOT NULL,
  `seat` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `event_id` bigint DEFAULT NULL,
  `film_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `row` varchar(100) DEFAULT NULL,
  `showtime_id` bigint DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `vip` tinyint(1) NOT NULL,
  `zaal_id` bigint DEFAULT NULL,
  `guest_email` varchar(254) DEFAULT NULL,
  `guest_name` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemaapp_reservation_event_id_89f38b37_fk_Cinemaapp_event_id` (`event_id`),
  KEY `Cinemaapp_reservation_film_id_eaa1adda_fk_Cinemaapp_movie_id` (`film_id`),
  KEY `Cinemaapp_reservation_user_id_5fdaeeea_fk_auth_user_id` (`user_id`),
  KEY `Cinemaapp_reservatio_showtime_id_47ef3253_fk_Cinemaapp` (`showtime_id`),
  KEY `Cinemaapp_reservation_zaal_id_c827f14f_fk_Cinemaapp_zaal_id` (`zaal_id`),
  CONSTRAINT `Cinemaapp_reservatio_showtime_id_47ef3253_fk_Cinemaapp` FOREIGN KEY (`showtime_id`) REFERENCES `cinemaapp_showtime` (`id`),
  CONSTRAINT `Cinemaapp_reservation_event_id_89f38b37_fk_Cinemaapp_event_id` FOREIGN KEY (`event_id`) REFERENCES `cinemaapp_event` (`id`),
  CONSTRAINT `Cinemaapp_reservation_film_id_eaa1adda_fk_Cinemaapp_movie_id` FOREIGN KEY (`film_id`) REFERENCES `cinemaapp_movie` (`id`),
  CONSTRAINT `Cinemaapp_reservation_user_id_5fdaeeea_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `Cinemaapp_reservation_zaal_id_c827f14f_fk_Cinemaapp_zaal_id` FOREIGN KEY (`zaal_id`) REFERENCES `cinemaapp_zaal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_reservation`
--

LOCK TABLES `cinemaapp_reservation` WRITE;
/*!40000 ALTER TABLE `cinemaapp_reservation` DISABLE KEYS */;
INSERT INTO `cinemaapp_reservation` VALUES (116,'2025-01-26 17:37:53.556749','2',11.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'h733c99gaujjl0wuivf7bbgyvl7666vf'),(117,'2025-01-26 18:03:23.989603','2',11.99,0,NULL,1,NULL,'1',1,'teen',1,1,'devivanriet@gmail.com','devi riet','1061f3ewex9uojrmkzefi9qfh5by12q9'),(118,'2025-01-26 18:03:23.994602','3',7.99,0,NULL,1,NULL,'1',1,'child',1,1,'devivanriet@gmail.com','devi riet','1061f3ewex9uojrmkzefi9qfh5by12q9'),(119,'2025-01-26 18:04:28.369942','3',7.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'xrp0gp3xsfgwwb3av31zgh4bfnxeglik'),(122,'2025-01-26 20:16:07.610178','2',11.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(123,'2025-01-26 20:16:07.614193','3',7.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(124,'2025-01-26 20:16:07.618179','2',11.99,0,NULL,2,1,'1',2,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(125,'2025-01-26 20:16:07.622194','3',7.99,0,NULL,2,1,'1',2,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(126,'2025-01-26 20:16:07.627195','2',11.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(127,'2025-01-26 20:16:07.631181','3',7.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(128,'2025-01-26 20:16:07.635194','2',11.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(129,'2025-01-26 20:16:07.638177','3',7.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(130,'2025-01-26 20:16:07.643177','2',11.99,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(131,'2025-01-26 20:16:50.306315','',10.00,0,1,NULL,1,NULL,NULL,'adult',0,1,NULL,NULL,'9oxx7rw36o01p8tz8vut8uc7de0x8twv'),(132,'2025-01-26 20:20:11.752374','2',11.99,0,NULL,1,NULL,'1',1,'teen',1,1,'devivanriet@gmail.com','devi riet','25erne545uh5eq6j5zf1hx50yzsirev2'),(135,'2025-01-26 20:21:27.022022','',10.00,0,1,NULL,NULL,NULL,NULL,'adult',0,1,NULL,'None None','3j9zzycis5bht4k8xve2zbxmspcfzcpi'),(136,'2025-01-26 20:34:36.397664','2',10.00,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'682zai76d6y4tr0bkc0v6jz88tqharno'),(137,'2025-01-26 20:34:36.401681','3',10.00,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'682zai76d6y4tr0bkc0v6jz88tqharno'),(138,'2025-01-26 20:34:36.404664','4',10.00,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'682zai76d6y4tr0bkc0v6jz88tqharno'),(139,'2025-01-26 20:34:36.409680','5',10.00,0,NULL,1,1,'1',1,'adult',1,1,NULL,NULL,'682zai76d6y4tr0bkc0v6jz88tqharno'),(140,'2025-01-26 20:48:00.046013','2',7.99,0,NULL,1,NULL,'1',1,'child',1,1,'devivanriet@gmail.com','devi riet','3oarbx4wv7wumkhxuqi0shng6mpmcmja'),(141,'2025-01-26 20:48:00.050024','4',11.99,0,NULL,1,NULL,'1',1,'teen',1,1,'devivanriet@gmail.com','devi riet','3oarbx4wv7wumkhxuqi0shng6mpmcmja');
/*!40000 ALTER TABLE `cinemaapp_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_row`
--

DROP TABLE IF EXISTS `cinemaapp_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_row` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `row_number` int unsigned NOT NULL,
  `is_vip` tinyint(1) NOT NULL,
  `zaal_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemaapp_row_zaal_id_b6ae1b53_fk_Cinemaapp_zaal_id` (`zaal_id`),
  CONSTRAINT `Cinemaapp_row_zaal_id_b6ae1b53_fk_Cinemaapp_zaal_id` FOREIGN KEY (`zaal_id`) REFERENCES `cinemaapp_zaal` (`id`),
  CONSTRAINT `cinemaapp_row_chk_1` CHECK ((`row_number` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_row`
--

LOCK TABLES `cinemaapp_row` WRITE;
/*!40000 ALTER TABLE `cinemaapp_row` DISABLE KEYS */;
INSERT INTO `cinemaapp_row` VALUES (6,1,1,1),(7,2,0,1);
/*!40000 ALTER TABLE `cinemaapp_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_seat`
--

DROP TABLE IF EXISTS `cinemaapp_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_seat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `seat_number` int unsigned NOT NULL,
  `is_reserved` tinyint(1) NOT NULL,
  `row_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemaapp_seat_row_id_1f9e16ce_fk_Cinemaapp_row_id` (`row_id`),
  CONSTRAINT `Cinemaapp_seat_row_id_1f9e16ce_fk_Cinemaapp_row_id` FOREIGN KEY (`row_id`) REFERENCES `cinemaapp_row` (`id`),
  CONSTRAINT `cinemaapp_seat_chk_1` CHECK ((`seat_number` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_seat`
--

LOCK TABLES `cinemaapp_seat` WRITE;
/*!40000 ALTER TABLE `cinemaapp_seat` DISABLE KEYS */;
INSERT INTO `cinemaapp_seat` VALUES (1,1,1,6),(2,2,0,6),(3,3,0,6),(4,4,0,6),(5,5,0,6),(6,6,0,6),(7,7,0,6),(8,8,0,6),(9,9,0,6),(10,10,0,6),(11,1,0,7),(12,2,0,7),(13,3,0,7),(14,4,0,7),(15,5,0,7);
/*!40000 ALTER TABLE `cinemaapp_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_showtime`
--

DROP TABLE IF EXISTS `cinemaapp_showtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_showtime` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `date` date NOT NULL,
  `movie_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemaapp_showtime_movie_id_891374c1_fk_Cinemaapp_movie_id` (`movie_id`),
  CONSTRAINT `Cinemaapp_showtime_movie_id_891374c1_fk_Cinemaapp_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `cinemaapp_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_showtime`
--

LOCK TABLES `cinemaapp_showtime` WRITE;
/*!40000 ALTER TABLE `cinemaapp_showtime` DISABLE KEYS */;
INSERT INTO `cinemaapp_showtime` VALUES (1,'12:51:52.000000','12:51:53.000000','2025-01-20',1),(2,'12:55:42.000000','12:55:44.000000','2025-01-17',2),(3,'12:55:47.000000','12:55:48.000000','2025-01-17',2),(4,'19:40:49.000000','19:40:49.000000','2025-01-21',1),(5,'22:20:50.000000','22:20:51.000000','2025-01-22',3),(6,'22:22:08.000000','22:22:09.000000','2025-01-22',4),(7,'22:23:01.000000','22:23:01.000000','2025-01-22',5);
/*!40000 ALTER TABLE `cinemaapp_showtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_standardeventlist`
--

DROP TABLE IF EXISTS `cinemaapp_standardeventlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_standardeventlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_standardeventlist`
--

LOCK TABLES `cinemaapp_standardeventlist` WRITE;
/*!40000 ALTER TABLE `cinemaapp_standardeventlist` DISABLE KEYS */;
INSERT INTO `cinemaapp_standardeventlist` VALUES (1,'Mini Mornings','Tijdens de Mini Mornings maken de allerkleinsten kennis met de wondere wereld van het witte doek. Elke zondagochtend zie je hier de leukste kinderfilms. Het licht is gedimd, het geluid staat zachter en je kunt altijd even de zaal verlaten. Na afloop ontvangen de kleintjes een speciaal filmdiploma. Je allereerste bioscoopfilm vergeet je nooit meer!','event_lists/Header_Mini_Moring_Bing_en_zijn_Vriendjes.jpg'),(2,'Meet The Cast','Sta oog in oog met jouw favoriete sterren tijdens Meet The Cast. Vraag jouw filmidool het hemd van het lijf, krijg een kijkje achter de schermen en geniet van de film met de acteurs die je net hebt ontmoet!','event_lists/meetthecast.png');
/*!40000 ALTER TABLE `cinemaapp_standardeventlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_standardeventlist_events`
--

DROP TABLE IF EXISTS `cinemaapp_standardeventlist_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_standardeventlist_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `standardeventlist_id` bigint NOT NULL,
  `event_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cinemaapp_standardeventl_standardeventlist_id_eve_b1c74640_uniq` (`standardeventlist_id`,`event_id`),
  KEY `Cinemaapp_standardev_event_id_c5785b1d_fk_Cinemaapp` (`event_id`),
  CONSTRAINT `Cinemaapp_standardev_event_id_c5785b1d_fk_Cinemaapp` FOREIGN KEY (`event_id`) REFERENCES `cinemaapp_event` (`id`),
  CONSTRAINT `Cinemaapp_standardev_standardeventlist_id_440334af_fk_Cinemaapp` FOREIGN KEY (`standardeventlist_id`) REFERENCES `cinemaapp_standardeventlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_standardeventlist_events`
--

LOCK TABLES `cinemaapp_standardeventlist_events` WRITE;
/*!40000 ALTER TABLE `cinemaapp_standardeventlist_events` DISABLE KEYS */;
INSERT INTO `cinemaapp_standardeventlist_events` VALUES (11,1,3),(10,2,1);
/*!40000 ALTER TABLE `cinemaapp_standardeventlist_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_ticket`
--

DROP TABLE IF EXISTS `cinemaapp_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `purchased_on` datetime(6) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `film_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `seat` varchar(100) DEFAULT NULL,
  `event_id` bigint DEFAULT NULL,
  `row` varchar(100) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `vip` tinyint(1) NOT NULL,
  `showtime_id` bigint DEFAULT NULL,
  `zaal_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemaapp_ticket_event_id_9fd4e10c_fk_Cinemaapp_event_id` (`event_id`),
  KEY `Cinemaapp_ticket_film_id_54b11bab_fk_Cinemaapp_movie_id` (`film_id`),
  KEY `Cinemaapp_ticket_user_id_6ab2779a_fk_auth_user_id` (`user_id`),
  KEY `Cinemaapp_ticket_showtime_id_7f71b225_fk_Cinemaapp_showtime_id` (`showtime_id`),
  KEY `Cinemaapp_ticket_zaal_id_d0f6f7dc_fk_Cinemaapp_zaal_id` (`zaal_id`),
  CONSTRAINT `Cinemaapp_ticket_event_id_9fd4e10c_fk_Cinemaapp_event_id` FOREIGN KEY (`event_id`) REFERENCES `cinemaapp_event` (`id`),
  CONSTRAINT `Cinemaapp_ticket_film_id_54b11bab_fk_Cinemaapp_movie_id` FOREIGN KEY (`film_id`) REFERENCES `cinemaapp_movie` (`id`),
  CONSTRAINT `Cinemaapp_ticket_showtime_id_7f71b225_fk_Cinemaapp_showtime_id` FOREIGN KEY (`showtime_id`) REFERENCES `cinemaapp_showtime` (`id`),
  CONSTRAINT `Cinemaapp_ticket_user_id_6ab2779a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `Cinemaapp_ticket_zaal_id_d0f6f7dc_fk_Cinemaapp_zaal_id` FOREIGN KEY (`zaal_id`) REFERENCES `cinemaapp_zaal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_ticket`
--

LOCK TABLES `cinemaapp_ticket` WRITE;
/*!40000 ALTER TABLE `cinemaapp_ticket` DISABLE KEYS */;
INSERT INTO `cinemaapp_ticket` VALUES (99,'2025-01-26 20:34:49.399810',10.00,1,1,'4',NULL,'1','adult',1,1,1),(100,'2025-01-26 20:34:49.402405',10.00,1,1,'2',NULL,'1','adult',1,1,1),(101,'2025-01-26 20:58:18.045955',10.00,NULL,1,NULL,1,NULL,'adult',0,NULL,1);
/*!40000 ALTER TABLE `cinemaapp_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_userprofile`
--

DROP TABLE IF EXISTS `cinemaapp_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birthday` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `mail_subscribed` tinyint(1) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Cinemaapp_userprofile_user_id_4d66017d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_userprofile`
--

LOCK TABLES `cinemaapp_userprofile` WRITE;
/*!40000 ALTER TABLE `cinemaapp_userprofile` DISABLE KEYS */;
INSERT INTO `cinemaapp_userprofile` VALUES (1,'2008-06-16','0683905507',1,'M','2403VV',1),(7,NULL,NULL,0,NULL,NULL,5),(8,NULL,NULL,0,NULL,NULL,6),(9,NULL,NULL,0,NULL,NULL,7),(10,NULL,NULL,0,NULL,NULL,8),(12,'2025-01-08',NULL,1,NULL,'2406VF',10),(13,'2025-01-09','+31 123456789',1,'man','2406VF',11),(14,'2025-01-21','+31 123456789',1,'M','2222OK',12);
/*!40000 ALTER TABLE `cinemaapp_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_watchlist`
--

DROP TABLE IF EXISTS `cinemaapp_watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_watchlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Cinemaapp_watchlist_user_id_7b69fb57_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_watchlist`
--

LOCK TABLES `cinemaapp_watchlist` WRITE;
/*!40000 ALTER TABLE `cinemaapp_watchlist` DISABLE KEYS */;
INSERT INTO `cinemaapp_watchlist` VALUES (1,'2025-01-17 12:58:59.497460',1);
/*!40000 ALTER TABLE `cinemaapp_watchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_watchlist_movie`
--

DROP TABLE IF EXISTS `cinemaapp_watchlist_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_watchlist_movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `watchlist_id` bigint NOT NULL,
  `movie_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cinemaapp_watchlist_movie_watchlist_id_movie_id_48e6f174_uniq` (`watchlist_id`,`movie_id`),
  KEY `Cinemaapp_watchlist__movie_id_ebe238f5_fk_Cinemaapp` (`movie_id`),
  CONSTRAINT `Cinemaapp_watchlist__movie_id_ebe238f5_fk_Cinemaapp` FOREIGN KEY (`movie_id`) REFERENCES `cinemaapp_movie` (`id`),
  CONSTRAINT `Cinemaapp_watchlist__watchlist_id_7fcd70c4_fk_Cinemaapp` FOREIGN KEY (`watchlist_id`) REFERENCES `cinemaapp_watchlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_watchlist_movie`
--

LOCK TABLES `cinemaapp_watchlist_movie` WRITE;
/*!40000 ALTER TABLE `cinemaapp_watchlist_movie` DISABLE KEYS */;
INSERT INTO `cinemaapp_watchlist_movie` VALUES (15,1,1),(17,1,2);
/*!40000 ALTER TABLE `cinemaapp_watchlist_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_zaal`
--

DROP TABLE IF EXISTS `cinemaapp_zaal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_zaal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_zaal`
--

LOCK TABLES `cinemaapp_zaal` WRITE;
/*!40000 ALTER TABLE `cinemaapp_zaal` DISABLE KEYS */;
INSERT INTO `cinemaapp_zaal` VALUES (1,'zaal1'),(4,'zaal2');
/*!40000 ALTER TABLE `cinemaapp_zaal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_zaal_events`
--

DROP TABLE IF EXISTS `cinemaapp_zaal_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_zaal_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zaal_id` bigint NOT NULL,
  `event_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cinemaapp_zaal_events_zaal_id_event_id_25c43659_uniq` (`zaal_id`,`event_id`),
  KEY `Cinemaapp_zaal_events_event_id_b529debf_fk_Cinemaapp_event_id` (`event_id`),
  CONSTRAINT `Cinemaapp_zaal_events_event_id_b529debf_fk_Cinemaapp_event_id` FOREIGN KEY (`event_id`) REFERENCES `cinemaapp_event` (`id`),
  CONSTRAINT `Cinemaapp_zaal_events_zaal_id_03312d2d_fk_Cinemaapp_zaal_id` FOREIGN KEY (`zaal_id`) REFERENCES `cinemaapp_zaal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_zaal_events`
--

LOCK TABLES `cinemaapp_zaal_events` WRITE;
/*!40000 ALTER TABLE `cinemaapp_zaal_events` DISABLE KEYS */;
INSERT INTO `cinemaapp_zaal_events` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `cinemaapp_zaal_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemaapp_zaal_films`
--

DROP TABLE IF EXISTS `cinemaapp_zaal_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemaapp_zaal_films` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zaal_id` bigint NOT NULL,
  `movie_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cinemaapp_zaal_films_zaal_id_movie_id_526a13cc_uniq` (`zaal_id`,`movie_id`),
  KEY `Cinemaapp_zaal_films_movie_id_9c95f542_fk_Cinemaapp_movie_id` (`movie_id`),
  CONSTRAINT `Cinemaapp_zaal_films_movie_id_9c95f542_fk_Cinemaapp_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `cinemaapp_movie` (`id`),
  CONSTRAINT `Cinemaapp_zaal_films_zaal_id_9b187123_fk_Cinemaapp_zaal_id` FOREIGN KEY (`zaal_id`) REFERENCES `cinemaapp_zaal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemaapp_zaal_films`
--

LOCK TABLES `cinemaapp_zaal_films` WRITE;
/*!40000 ALTER TABLE `cinemaapp_zaal_films` DISABLE KEYS */;
INSERT INTO `cinemaapp_zaal_films` VALUES (1,1,1),(2,1,2),(3,4,2);
/*!40000 ALTER TABLE `cinemaapp_zaal_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-01-17 12:51:45.590740','1','Scary',1,'[{\"added\": {}}]',2,1),(2,'2025-01-17 12:51:58.673196','1','movie1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"show time\", \"object\": \"12:51:52 - 12:51:53\"}}]',3,1),(3,'2025-01-17 12:54:36.627597','1','Nieuwe Film: movie1 - 2025-01-17',1,'[{\"added\": {}}]',8,1),(4,'2025-01-17 12:54:56.315564','2','Nieuwe Film: movie1 - 2025-01-17',1,'[{\"added\": {}}]',8,1),(5,'2025-01-17 12:55:01.228152','3','Nieuwe Film: movie1 - 2025-01-17',1,'[{\"added\": {}}]',8,1),(6,'2025-01-17 12:55:07.899947','4','Nieuwe Film: movie1 - 2025-01-17',1,'[{\"added\": {}}]',8,1),(7,'2025-01-17 12:55:40.620855','2','Sexual Content',1,'[{\"added\": {}}]',2,1),(8,'2025-01-17 12:55:50.832244','2','movie 2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"show time\", \"object\": \"12:55:42 - 12:55:44\"}}, {\"added\": {\"name\": \"show time\", \"object\": \"12:55:47 - 12:55:48\"}}]',3,1),(9,'2025-01-17 12:56:41.727878','1','Evenement: event 1 - 2025-01-17 12:56:29+00:00',1,'[{\"added\": {}}]',9,1),(10,'2025-01-17 12:57:33.219320','2','Evenement: event 2 - 2025-01-17 12:57:07+00:00',1,'[{\"added\": {}}]',9,1),(11,'2025-01-17 12:57:55.046040','3','Evenement: event 3 - 2025-01-17 12:57:45+00:00',1,'[{\"added\": {}}]',9,1),(12,'2025-01-17 12:58:14.098564','4','Evenement: event 4 - 2025-01-17 12:58:04+00:00',1,'[{\"added\": {}}]',9,1),(13,'2025-01-17 12:58:35.362361','1','Coming Soon: coming soon1 - 2025-01-17',1,'[{\"added\": {}}]',1,1),(14,'2025-01-19 20:48:52.453148','2','bartv',3,'',13,1),(15,'2025-01-19 20:48:52.458673','4','jann',3,'',13,1),(16,'2025-01-19 20:48:52.461658','3','jannn',3,'',13,1),(17,'2025-01-19 20:59:51.653580','9','adad',2,'[{\"changed\": {\"name\": \"user profile\", \"object\": \"adad\", \"fields\": [\"Birthday\", \"Phone\", \"Gender\", \"Postcode\"]}}]',13,1),(18,'2025-01-19 21:38:32.878988','2','Coming Soon: Mini Mornings - 2025-01-19',1,'[{\"added\": {}}]',1,1),(19,'2025-01-19 21:39:33.694851','2','Coming Soon: Mini Mornings - 2025-01-19',3,'',1,1),(20,'2025-01-19 21:40:13.059669','1','Event List: Mini Mornings',1,'[{\"added\": {}}]',16,1),(21,'2025-01-19 22:27:45.886179','1','Event List: Mini Mornings',2,'[{\"changed\": {\"fields\": [\"Events\"]}}]',16,1),(22,'2025-01-19 22:28:57.076723','2','Event List: aasd',1,'[{\"added\": {}}]',16,1),(23,'2025-01-19 22:32:16.356520','1','Event List: Mini Mornings',2,'[{\"changed\": {\"fields\": [\"Events\"]}}, {\"changed\": {\"name\": \"standardeventlist-event relationship\", \"object\": \"StandardEventList_events object (2)\", \"fields\": [\"Event\"]}}]',16,1),(24,'2025-01-19 22:34:33.106242','1','Event List: Mini Mornings',2,'[{\"deleted\": {\"name\": \"standardeventlist-event relationship\", \"object\": \"StandardEventList_events object (None)\"}}]',16,1),(25,'2025-01-19 22:52:44.472941','1','Evenement: event 1 - 2025-01-17 12:56:29+00:00',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',9,1),(26,'2025-01-19 22:52:53.531951','2','Evenement: event 2 - 2025-01-17 12:57:07+00:00',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',9,1),(27,'2025-01-19 22:53:02.769751','3','Evenement: event 3 - 2025-01-17 12:57:45+00:00',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',9,1),(28,'2025-01-19 22:53:10.541165','4','Evenement: event 4 - 2025-01-17 12:58:04+00:00',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',9,1),(29,'2025-01-19 22:57:29.007280','5','Evenement: events 5 - 2025-01-19 22:57:11+00:00',1,'[{\"added\": {}}]',9,1),(30,'2025-01-19 23:20:00.816757','6','Evenement: event 6 - 2025-01-19 23:19:40+00:00',1,'[{\"added\": {}}]',9,1),(31,'2025-01-19 23:20:33.308379','1','Event List: Mini Mornings',2,'[{\"added\": {\"name\": \"standardeventlist-event relationship\", \"object\": \"StandardEventList_events object (7)\"}}]',16,1),(32,'2025-01-19 23:41:29.861090','1','Zaal: zaal1',1,'[{\"added\": {}}]',17,1),(33,'2025-01-19 23:42:00.108431','2','movie 2',2,'[{\"changed\": {\"fields\": [\"Zaal\"]}}]',3,1),(34,'2025-01-19 23:48:58.217756','1','Evenement: event 1 - 2025-01-17 12:56:29+00:00',2,'[{\"changed\": {\"fields\": [\"Zaal\"]}}]',9,1),(35,'2025-01-20 00:04:08.652878','1','movie1',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',3,1),(36,'2025-01-20 00:10:46.049251','1','Ticket voor movie1 - deviv',1,'[{\"added\": {}}]',6,1),(37,'2025-01-20 10:10:15.166982','9','adad',3,'',13,1),(38,'2025-01-20 10:38:47.078025','1','Over ons',1,'[{\"added\": {}}]',18,1),(39,'2025-01-20 10:50:52.609698','1','Over ons',2,'[{\"changed\": {\"fields\": [\"Info\"]}}]',18,1),(40,'2025-01-20 16:53:30.237080','1','Over ons',2,'[{\"changed\": {\"fields\": [\"Info\"]}}]',18,1),(41,'2025-01-20 17:01:21.779387','1','Lammenschans',1,'[{\"added\": {}}]',19,1),(42,'2025-01-20 17:06:34.695271','1','Lammenschans',2,'[{\"changed\": {\"fields\": [\"Address\"]}}]',19,1),(43,'2025-01-20 17:07:13.529929','2','Alphen aan den Rijn',1,'[{\"added\": {}}]',19,1),(44,'2025-01-20 17:15:12.296444','2','Alphen aan den Rijn',2,'[{\"added\": {\"name\": \"movie-location relationship\", \"object\": \"Movie_locations object (1)\"}}]',19,1),(45,'2025-01-20 17:24:24.100444','2','movie 2',2,'[{\"added\": {\"name\": \"movie-location relationship\", \"object\": \"Movie_locations object (2)\"}}]',3,1),(46,'2025-01-20 17:24:47.056666','2','movie 2',2,'[{\"added\": {\"name\": \"movie-location relationship\", \"object\": \"Movie_locations object (3)\"}}]',3,1),(47,'2025-01-20 18:51:39.158848','2','Alphen aan den Rijn',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',19,1),(48,'2025-01-20 18:53:04.337774','2','Alphen aan den Rijn',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',19,1),(49,'2025-01-20 18:53:36.793613','2','Alphen aan den Rijn',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',19,1),(50,'2025-01-20 19:39:40.925660','1','movie1',2,'[{\"changed\": {\"fields\": [\"Release date\"]}}]',3,1),(51,'2025-01-20 19:40:55.819543','1','movie1',2,'[{\"added\": {\"name\": \"show time\", \"object\": \"19:40:49 - 19:40:49\"}}, {\"changed\": {\"name\": \"show time\", \"object\": \"12:51:52 - 12:51:53\", \"fields\": [\"Date\"]}}]',3,1),(52,'2025-01-20 20:28:43.985535','1','movie1',2,'[{\"changed\": {\"fields\": [\"Rating\"]}}]',3,1),(53,'2025-01-20 22:09:43.845696','1','Ticket voor movie1 - deviv',2,'[]',6,1),(54,'2025-01-20 22:09:47.436337','1','Ticket voor movie1 - deviv',2,'[]',6,1),(55,'2025-01-20 22:10:09.597906','1','Ticket voor movie1 - deviv',2,'[]',6,1),(56,'2025-01-20 22:11:38.205642','3','Ticket voor barttt',1,'[{\"added\": {}}]',6,1),(57,'2025-01-21 23:47:22.994615','1','Ticket voor deviv',3,'',6,1),(58,'2025-01-21 23:47:59.227851','4','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(59,'2025-01-21 23:54:02.423424','4','Ticket voor deviv',2,'[]',6,1),(60,'2025-01-21 23:54:12.466303','5','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(61,'2025-01-22 00:20:52.723098','1','deviv',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}, {\"changed\": {\"name\": \"user profile\", \"object\": \"deviv\", \"fields\": [\"Phone\", \"Mail subscribed\", \"Gender\", \"Postcode\"]}}]',13,1),(62,'2025-01-22 00:40:04.268002','6','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(63,'2025-01-22 00:40:14.745220','7','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(64,'2025-01-22 00:40:25.787661','8','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(65,'2025-01-22 01:08:17.948763','1','movie1',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',3,1),(66,'2025-01-22 01:13:40.231308','2','movie 2',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',3,1),(67,'2025-01-22 22:21:00.809068','3','Movie 3',1,'[{\"added\": {}}, {\"added\": {\"name\": \"show time\", \"object\": \"22:20:50 - 22:20:51\"}}, {\"added\": {\"name\": \"movie-location relationship\", \"object\": \"Movie_locations object (4)\"}}]',3,1),(68,'2025-01-22 22:22:14.370376','4','Movie 4',1,'[{\"added\": {}}, {\"added\": {\"name\": \"show time\", \"object\": \"22:22:08 - 22:22:09\"}}, {\"added\": {\"name\": \"movie-location relationship\", \"object\": \"Movie_locations object (5)\"}}]',3,1),(69,'2025-01-22 22:23:08.193801','5','Movie 5',1,'[{\"added\": {}}, {\"added\": {\"name\": \"show time\", \"object\": \"22:23:01 - 22:23:01\"}}, {\"added\": {\"name\": \"movie-location relationship\", \"object\": \"Movie_locations object (6)\"}}]',3,1),(70,'2025-01-25 15:13:52.851640','1','deviv',2,'[]',13,1),(71,'2025-01-25 15:52:48.868573','1','Zaal: zaal1',2,'[{\"added\": {\"name\": \"row\", \"object\": \"Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"row\", \"object\": \"Rij 2 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"row\", \"object\": \"Rij 3 (Normaal) in zaal1\"}}]',17,1),(72,'2025-01-25 15:53:28.801667','1','movie1',2,'[{\"changed\": {\"fields\": [\"Zaal\"]}}]',3,1),(73,'2025-01-25 16:43:22.766039','1','zaal1',2,'[{\"deleted\": {\"name\": \"row\", \"object\": \"Rij 1 (VIP) in zaal1\"}}, {\"deleted\": {\"name\": \"row\", \"object\": \"Rij 2 (VIP) in zaal1\"}}, {\"deleted\": {\"name\": \"row\", \"object\": \"Rij 3 (Normaal) in zaal1\"}}]',17,1),(74,'2025-01-25 16:43:34.421275','3','Zaal 1',3,'',17,1),(75,'2025-01-25 16:43:34.423316','2','Zaal 1',3,'',17,1),(76,'2025-01-25 16:43:51.700525','1','zaal1',2,'[{\"added\": {\"name\": \"row\", \"object\": \"Rij 1 (VIP) in zaal1\"}}]',17,1),(77,'2025-01-25 16:44:03.013418','1','zaal1',2,'[{\"deleted\": {\"name\": \"row\", \"object\": \"Rij 1 (VIP) in zaal1\"}}]',17,1),(78,'2025-01-25 16:47:45.858266','6','Rij 1 (VIP) in zaal1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 1 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 2 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 3 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 4 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 5 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 6 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 7 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 8 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 9 in Rij 1 (VIP) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 10 in Rij 1 (VIP) in zaal1\"}}]',20,1),(79,'2025-01-25 16:48:33.291985','7','Rij 2 (Normaal) in zaal1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 1 in Rij 2 (Normaal) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 2 in Rij 2 (Normaal) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 3 in Rij 2 (Normaal) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 4 in Rij 2 (Normaal) in zaal1\"}}, {\"added\": {\"name\": \"seat\", \"object\": \"Stoel 5 in Rij 2 (Normaal) in zaal1\"}}]',20,1),(80,'2025-01-25 22:06:33.064063','1','Reservering voor deviv',1,'[{\"added\": {}}]',22,1),(81,'2025-01-26 00:14:34.697336','9','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(82,'2025-01-26 00:14:45.199927','10','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(83,'2025-01-26 00:14:55.095587','11','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(84,'2025-01-26 00:15:04.065077','12','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(85,'2025-01-26 00:17:26.251703','13','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(86,'2025-01-26 00:17:41.793519','14','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(87,'2025-01-26 00:17:52.243089','15','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(88,'2025-01-26 00:18:01.039736','16','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(89,'2025-01-26 00:18:09.329167','17','Ticket voor deviv',1,'[{\"added\": {}}]',6,1),(90,'2025-01-26 00:20:15.987286','2','Reservering voor deviv',1,'[{\"added\": {}}]',22,1),(91,'2025-01-26 00:20:27.457665','3','Reservering voor deviv',1,'[{\"added\": {}}]',22,1),(92,'2025-01-26 00:44:24.582342','6','Rij 1 (VIP) in zaal1',2,'[{\"changed\": {\"name\": \"seat\", \"object\": \"Stoel 1 in Rij 1 (VIP) in zaal1\", \"fields\": [\"Is reserved\"]}}]',20,1),(93,'2025-01-26 13:15:16.784525','15','Ticket voor deviv - Stoel 1-7',2,'[{\"changed\": {\"fields\": [\"Row\", \"Seat\", \"Vip\", \"Type\"]}}]',6,1),(94,'2025-01-26 13:18:03.359804','15','Ticket voor deviv - Stoel 1-7',2,'[{\"changed\": {\"fields\": [\"Showtime\"]}}]',6,1),(95,'2025-01-26 14:12:29.210110','19','Ticket voor deviv - Stoel 1-8',3,'',6,1),(96,'2025-01-26 14:12:29.213111','15','Ticket voor deviv - Stoel 1-7',3,'',6,1),(97,'2025-01-26 14:12:29.215111','14','Ticket voor deviv - Stoel None-1 3',3,'',6,1),(98,'2025-01-26 14:12:29.216142','13','Ticket voor deviv - Stoel None-1 3',3,'',6,1),(99,'2025-01-26 14:12:29.218147','3','Ticket voor barttt - Stoel None-1',3,'',6,1),(100,'2025-01-26 14:15:34.897060','20','Ticket voor deviv - Stoel 1-8',3,'',6,1),(101,'2025-01-26 14:18:33.049593','23','Ticket voor deviv - Stoel 1-6',3,'',6,1),(102,'2025-01-26 14:18:33.055482','22','Ticket voor deviv - Stoel 2-1',3,'',6,1),(103,'2025-01-26 14:18:33.059518','21','Ticket voor deviv - Stoel 1-8',3,'',6,1),(104,'2025-01-26 14:23:39.153267','38','Ticket voor deviv - Stoel 1-6',3,'',6,1),(105,'2025-01-26 14:23:39.158169','37','Ticket voor deviv - Stoel 2-1',3,'',6,1),(106,'2025-01-26 14:23:39.162172','36','Ticket voor deviv - Stoel 1-8',3,'',6,1),(107,'2025-01-26 14:23:39.164469','35','Ticket voor deviv - Stoel 1-6',3,'',6,1),(108,'2025-01-26 14:23:39.166542','34','Ticket voor deviv - Stoel 2-1',3,'',6,1),(109,'2025-01-26 14:23:39.168540','33','Ticket voor deviv - Stoel 1-8',3,'',6,1),(110,'2025-01-26 14:23:39.171868','32','Ticket voor deviv - Stoel 1-6',3,'',6,1),(111,'2025-01-26 14:23:39.174339','31','Ticket voor deviv - Stoel 2-1',3,'',6,1),(112,'2025-01-26 14:23:39.175348','30','Ticket voor deviv - Stoel 1-8',3,'',6,1),(113,'2025-01-26 14:23:39.178370','29','Ticket voor deviv - Stoel 1-6',3,'',6,1),(114,'2025-01-26 14:23:39.180377','28','Ticket voor deviv - Stoel 2-1',3,'',6,1),(115,'2025-01-26 14:23:39.182368','27','Ticket voor deviv - Stoel 1-8',3,'',6,1),(116,'2025-01-26 14:23:39.184379','26','Ticket voor deviv - Stoel 1-6',3,'',6,1),(117,'2025-01-26 14:23:39.186369','25','Ticket voor deviv - Stoel 2-1',3,'',6,1),(118,'2025-01-26 14:23:39.188748','24','Ticket voor deviv - Stoel 1-8',3,'',6,1),(119,'2025-01-26 17:36:10.413918','111','Reservering voor deviv',3,'',22,1),(120,'2025-01-26 17:36:10.419711','110','Reservering voor deviv',3,'',22,1),(121,'2025-01-26 17:36:10.423716','109','Reservering voor deviv',3,'',22,1),(122,'2025-01-26 17:36:10.425713','108','Reservering voor deviv',3,'',22,1),(123,'2025-01-26 17:36:10.427715','107','Reservering voor deviv',3,'',22,1),(124,'2025-01-26 17:36:10.429713','106','Reservering voor deviv',3,'',22,1),(125,'2025-01-26 17:36:10.431711','105','Reservering voor deviv',3,'',22,1),(126,'2025-01-26 17:36:10.433922','104','Reservering voor deviv',3,'',22,1),(127,'2025-01-26 17:36:10.436131','103','Reservering voor deviv',3,'',22,1),(128,'2025-01-26 17:36:10.437130','102','Reservering voor deviv',3,'',22,1),(129,'2025-01-26 17:36:10.439001','101','Reservering voor deviv',3,'',22,1),(130,'2025-01-26 17:36:10.440423','100','Reservering voor deviv',3,'',22,1),(131,'2025-01-26 17:36:10.443331','99','Reservering voor deviv',3,'',22,1),(132,'2025-01-26 17:36:10.443837','98','Reservering voor deviv',3,'',22,1),(133,'2025-01-26 17:36:10.444849','97','Reservering voor deviv',3,'',22,1),(134,'2025-01-26 17:36:10.445830','96','Reservering voor deviv',3,'',22,1),(135,'2025-01-26 17:36:10.447241','95','Reservering voor deviv',3,'',22,1),(136,'2025-01-26 17:36:10.448249','94','Reservering voor deviv',3,'',22,1),(137,'2025-01-26 17:36:10.449248','93','Reservering voor deviv',3,'',22,1),(138,'2025-01-26 17:36:10.450248','92','Reservering voor deviv',3,'',22,1),(139,'2025-01-26 17:36:10.450248','91','Reservering voor deviv',3,'',22,1),(140,'2025-01-26 17:36:10.451752','90','Reservering voor deviv',3,'',22,1),(141,'2025-01-26 17:36:10.452918','89','Reservering voor deviv',3,'',22,1),(142,'2025-01-26 17:36:10.452918','61','Reservering voor Gast',3,'',22,1),(143,'2025-01-26 17:36:10.453987','60','Reservering voor Gast',3,'',22,1),(144,'2025-01-26 17:36:10.455142','29','Reservering voor Gast',3,'',22,1),(145,'2025-01-26 17:36:10.456145','28','Reservering voor Gast',3,'',22,1),(146,'2025-01-26 17:36:10.456145','27','Reservering voor Gast',3,'',22,1),(147,'2025-01-26 17:36:10.457595','26','Reservering voor Gast',3,'',22,1),(148,'2025-01-26 17:36:10.458603','25','Reservering voor Gast',3,'',22,1),(149,'2025-01-26 17:36:10.458603','24','Reservering voor Gast',3,'',22,1),(150,'2025-01-26 17:36:10.459912','23','Reservering voor Gast',3,'',22,1),(151,'2025-01-26 17:36:10.460921','22','Reservering voor Gast',3,'',22,1),(152,'2025-01-26 17:36:10.461926','21','Reservering voor Gast',3,'',22,1),(153,'2025-01-26 17:36:10.463429','20','Reservering voor Gast',3,'',22,1),(154,'2025-01-26 17:36:10.463429','19','Reservering voor Gast',3,'',22,1),(155,'2025-01-26 17:36:10.465930','18','Reservering voor Gast',3,'',22,1),(156,'2025-01-26 17:36:10.469446','11','Reservering voor Gast',3,'',22,1),(157,'2025-01-26 17:36:10.472447','10','Reservering voor Gast',3,'',22,1),(158,'2025-01-27 01:41:48.679582','2','Wicked',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]',3,1),(159,'2025-01-27 01:42:42.551788','4','zaal2',1,'[{\"added\": {}}]',17,1),(160,'2025-01-27 01:43:18.827121','2','Wicked',2,'[{\"changed\": {\"fields\": [\"Poster\", \"Zaal\"]}}]',3,1),(161,'2025-01-27 01:44:40.088308','1','Babygirl',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]',3,1),(162,'2025-01-27 01:45:38.239902','5','Paddington in Peru (Originele versie)',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Poster\"]}}]',3,1),(163,'2025-01-27 01:46:52.936314','4','Mufasa: The Lion King (Originele versie)',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Poster\"]}}]',3,1),(164,'2025-01-27 01:47:43.534647','3','Den of Thieves 2: Pantera',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Poster\"]}}]',3,1),(165,'2025-01-27 01:49:58.558226','1','Coming Soon: BabyGirl - 2025-01-17',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]',1,1),(166,'2025-01-27 01:50:26.911582','3','Coming Soon: Den of Thieves 2: Pantera - 2025-01-27',1,'[{\"added\": {}}]',1,1),(167,'2025-01-27 01:51:08.481146','4','Coming Soon: Paddington in Peru (Originele versie) - 2025-01-27',1,'[{\"added\": {}}]',1,1),(168,'2025-01-27 01:51:40.722750','5','Coming Soon: Mufasa: The Lion King (Originele versie) - 2025-01-27',1,'[{\"added\": {}}]',1,1),(169,'2025-01-27 01:52:39.300278','3','Nieuwe Film: Wicked - 2025-01-17',2,'[{\"changed\": {\"fields\": [\"Movie\"]}}]',8,1),(170,'2025-01-27 01:52:42.748979','2','Nieuwe Film: Den of Thieves 2: Pantera - 2025-01-17',2,'[{\"changed\": {\"fields\": [\"Movie\"]}}]',8,1),(171,'2025-01-27 01:52:45.839282','1','Nieuwe Film: Mufasa: The Lion King (Originele versie) - 2025-01-17',2,'[{\"changed\": {\"fields\": [\"Movie\"]}}]',8,1),(172,'2025-01-27 01:53:10.494096','3','Nieuwe Film: Paddington in Peru (Originele versie) - 2025-01-17',2,'[{\"changed\": {\"fields\": [\"Movie\"]}}]',8,1),(173,'2025-01-27 01:54:41.453557','2','Event List: aasd',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(174,'2025-01-27 01:55:21.666198','2','Event List: Meet The Cast',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Events\"]}}]',16,1),(175,'2025-01-27 01:56:08.637008','4','Evenement: event 4 - 2025-01-17 12:58:04+00:00',3,'',9,1),(176,'2025-01-27 01:56:08.639992','5','Evenement: events 5 - 2025-01-19 22:57:11+00:00',3,'',9,1),(177,'2025-01-27 01:56:08.642992','6','Evenement: event 6 - 2025-01-19 23:19:40+00:00',3,'',9,1),(178,'2025-01-27 01:58:28.211542','1','Evenement: K3 en het lied van de zeemeermin - 2025-01-17 12:56:29+00:00',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Poster\", \"Thumbnail\"]}}]',9,1),(179,'2025-01-27 02:01:18.927658','2','Evenement: MBOCinema Opera - 2025-01-17 12:57:07+00:00',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Poster\", \"Thumbnail\"]}}]',9,1),(180,'2025-01-27 02:02:04.871778','2','Event List: Meet The Cast',2,'[{\"changed\": {\"fields\": [\"Events\"]}}]',16,1),(181,'2025-01-27 02:03:57.539346','3','Evenement: Woezel & Pip op Avontuur in de Tovertuin - 2025-01-17 12:57:45+00:00',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Poster\", \"Thumbnail\"]}}]',9,1),(182,'2025-01-27 02:04:04.105745','2','Event List: Meet The Cast',2,'[{\"changed\": {\"fields\": [\"Events\"]}}]',16,1),(183,'2025-01-27 02:04:09.435367','1','Event List: Mini Mornings',2,'[{\"changed\": {\"fields\": [\"Events\"]}}]',16,1),(184,'2025-01-27 02:06:37.979356','7','Evenement: Dalej Jazda - 2025-01-27 02:05:31+00:00',1,'[{\"added\": {}}]',9,1),(185,'2025-01-27 02:07:17.750643','7','Evenement: Dalej Jazda - 2025-01-27 02:05:31+00:00',2,'[{\"changed\": {\"fields\": [\"Poster\", \"Thumbnail\", \"Zaal\"]}}]',9,1),(186,'2025-01-27 02:09:26.751012','8','Evenement: Becoming Led Zeppelin - 2025-01-27 02:08:23+00:00',1,'[{\"added\": {}}]',9,1),(187,'2025-01-27 02:10:52.728623','1','Lammenschans',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',19,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'admin','logentry'),(12,'auth','group'),(11,'auth','permission'),(13,'auth','user'),(1,'Cinemaapp','comingsoonrelease'),(9,'Cinemaapp','event'),(2,'Cinemaapp','feature'),(18,'Cinemaapp','info'),(19,'Cinemaapp','location'),(3,'Cinemaapp','movie'),(8,'Cinemaapp','newrelease'),(22,'Cinemaapp','reservation'),(20,'Cinemaapp','row'),(21,'Cinemaapp','seat'),(7,'Cinemaapp','showtime'),(16,'Cinemaapp','standardeventlist'),(6,'Cinemaapp','ticket'),(5,'Cinemaapp','userprofile'),(4,'Cinemaapp','watchlist'),(17,'Cinemaapp','zaal'),(14,'contenttypes','contenttype'),(15,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-17 12:48:49.561341'),(2,'auth','0001_initial','2025-01-17 12:48:50.117621'),(3,'Cinemaapp','0001_initial','2025-01-17 12:48:51.120809'),(4,'admin','0001_initial','2025-01-17 12:48:51.288934'),(5,'admin','0002_logentry_remove_auto_add','2025-01-17 12:48:51.305423'),(6,'admin','0003_logentry_add_action_flag_choices','2025-01-17 12:48:51.320474'),(7,'contenttypes','0002_remove_content_type_name','2025-01-17 12:48:51.441176'),(8,'auth','0002_alter_permission_name_max_length','2025-01-17 12:48:51.525957'),(9,'auth','0003_alter_user_email_max_length','2025-01-17 12:48:51.571465'),(10,'auth','0004_alter_user_username_opts','2025-01-17 12:48:51.588905'),(11,'auth','0005_alter_user_last_login_null','2025-01-17 12:48:51.696257'),(12,'auth','0006_require_contenttypes_0002','2025-01-17 12:48:51.700688'),(13,'auth','0007_alter_validators_add_error_messages','2025-01-17 12:48:51.718288'),(14,'auth','0008_alter_user_username_max_length','2025-01-17 12:48:51.825535'),(15,'auth','0009_alter_user_last_name_max_length','2025-01-17 12:48:51.936162'),(16,'auth','0010_alter_group_name_max_length','2025-01-17 12:48:51.969922'),(17,'auth','0011_update_proxy_permissions','2025-01-17 12:48:51.992167'),(18,'auth','0012_alter_user_first_name_max_length','2025-01-17 12:48:52.087219'),(19,'sessions','0001_initial','2025-01-17 12:48:52.139677'),(20,'Cinemaapp','0002_standardeventlist','2025-01-19 21:29:55.245931'),(21,'Cinemaapp','0003_event_thumbnail','2025-01-19 22:52:05.804296'),(22,'Cinemaapp','0004_zaal_movie_zaal_standardeventlist_zaal','2025-01-19 23:40:27.553307'),(23,'Cinemaapp','0005_remove_standardeventlist_zaal_event_zaal','2025-01-19 23:48:17.995203'),(24,'Cinemaapp','0006_movie_video','2025-01-19 23:51:22.253401'),(25,'Cinemaapp','0007_info','2025-01-20 10:13:05.485741'),(26,'Cinemaapp','0008_alter_info_image','2025-01-20 10:22:25.000255'),(27,'Cinemaapp','0009_alter_info_title','2025-01-20 10:34:07.808017'),(28,'Cinemaapp','0010_alter_info_info_alter_info_title','2025-01-20 10:36:14.362484'),(29,'Cinemaapp','0011_location','2025-01-20 17:00:12.458784'),(30,'Cinemaapp','0012_location_address_movie_locations_and_more','2025-01-20 17:03:38.445615'),(31,'Cinemaapp','0013_alter_location_address','2025-01-20 17:06:13.338474'),(32,'Cinemaapp','0014_alter_movie_locations','2025-01-20 17:09:45.448320'),(33,'Cinemaapp','0015_alter_movie_locations','2025-01-20 17:17:52.509008'),(34,'Cinemaapp','0016_event_genre_event_pegi_rating_event_rating','2025-01-20 21:51:31.335375'),(35,'Cinemaapp','0017_ticket_chair_ticket_event','2025-01-20 22:07:02.943038'),(36,'Cinemaapp','0018_alter_ticket_event_alter_ticket_film','2025-01-20 22:09:31.224548'),(37,'Cinemaapp','0019_ticket_status_alter_ticket_user','2025-01-21 23:17:32.181629'),(38,'Cinemaapp','0020_row','2025-01-25 15:51:49.100986'),(39,'Cinemaapp','0021_remove_row_seats_seat','2025-01-25 16:38:11.564362'),(40,'Cinemaapp','0022_event_price_movie_price','2025-01-25 21:05:36.717024'),(41,'Cinemaapp','0023_reservation','2025-01-25 22:04:40.468717'),(42,'Cinemaapp','0024_remove_ticket_status','2025-01-25 22:13:36.091978'),(43,'Cinemaapp','0025_rename_chair_ticket_seat_remove_ticket_ticket_type_and_more','2025-01-26 13:14:25.791595'),(44,'Cinemaapp','0026_ticket_showtime','2025-01-26 13:17:30.247720'),(45,'Cinemaapp','0027_ticket_zaal','2025-01-26 14:09:05.592041'),(46,'Cinemaapp','0028_rename_chair_reservation_seat_and_more','2025-01-26 14:33:18.319261'),(47,'Cinemaapp','0029_reservation_guest_email_reservation_guest_name_and_more','2025-01-26 14:40:49.874670'),(48,'Cinemaapp','0030_alter_ticket_seat','2025-01-26 18:21:30.237340');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('75o570f63cbmhnzwl83zoauzmnornbrm','e30:1tc4oB:fmCl2vHittvJ6h9FTzl4xWgNSgIfT1XjDwWOL37uhZk','2025-02-09 15:44:23.715990'),('hl8nx188ja3vou6fdbaujsp69bl03gpp','e30:1tc4lP:a036s4CoyX9kTR6bDqZ3Uf1m1JqH0d4NdjIf1E0Csgg','2025-02-09 15:41:31.099443'),('nkte6goriv2rdrr1y5o5mgdgkopc2ats','.eJxVjEsOAiEQBe_C2hBgoAGX7j3DpKEbGTWQzGdlvLtOMgvdvqp6LzHittZxW3geJxJnocXpd0uYH9x2QHdsty5zb-s8Jbkr8qCLvHbi5-Vw_w4qLvVbB4CoPClwFAIMiQyHRKQxIxgwCpQNXntHYIfiCEuxMXNkjho1DizeH84VN-I:1tZcwr:do1lQ5gJShEuCF4x9tBG7h7KAycJdHwi-QoKExLJvlw','2025-02-02 21:35:13.372064'),('popvqv9sjfoesopiz2hvtdxsrperu2dl','e30:1tc4ls:f9Yy-xmnSkFXSefYZpQGA_RV6PU9H01XlPY8A0IkOug','2025-02-09 15:42:00.608212'),('q4ktbk8a60sgf59mipwdv2jcwx6tzd9c','.eJxVjDsOwjAQBe_iGln-xD9Kes5geb1rHEC2FCcV4u4QKQW0b2bei8W0rTVug5Y4IzszyU6_G6T8oLYDvKd26zz3ti4z8F3hBx382pGel8P9O6hp1G_tkZRUtogsSil2guwVOYHSBauNp2x8ET4JVDYgKA3GowlhElbLAMGx9wfjlzdb:1tcAdL:zDe2s_CbGR1ymG7Na0_pRXX5CqllfNyvgUSRBdXQDqw','2025-02-09 21:57:35.285907'),('rlqcfkpi5rtgakqu8h3m1ywhzp1p3o30','e30:1tc4ke:gQ4r72sQ5aul2n3st2N25Hm4YLBBv-zas7v4_EEjf4Q','2025-02-09 15:40:44.908727'),('uwbshhin2n3mqq1znvmiysxxvrjw5no6','e30:1tc4mZ:Q-OK09EnhvEYb93o5X3ZMZ-zyEGsCOZBO8U68GPBm_c','2025-02-09 15:42:43.794139'),('y4keiakof8jscpztqlzjqpk61fd019ij','e30:1tc4jb:yfHqHFiQ387rJBi1opAkMOdGdgWR5NziYjUfoKCLu64','2025-02-09 15:39:39.070943');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-27 11:23:03
