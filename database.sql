-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurant
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add customer',8,'add_customer'),(30,'Can change customer',8,'change_customer'),(31,'Can delete customer',8,'delete_customer'),(32,'Can view customer',8,'view_customer'),(33,'Can add order',9,'add_order'),(34,'Can change order',9,'change_order'),(35,'Can delete order',9,'delete_order'),(36,'Can view order',9,'view_order'),(37,'Can add product',10,'add_product'),(38,'Can change product',10,'change_product'),(39,'Can delete product',10,'delete_product'),(40,'Can view product',10,'view_product'),(41,'Can add order item',11,'add_orderitem'),(42,'Can change order item',11,'change_orderitem'),(43,'Can delete order item',11,'delete_orderitem'),(44,'Can view order item',11,'view_orderitem'),(45,'Can add info booking',12,'add_infobooking'),(46,'Can change info booking',12,'change_infobooking'),(47,'Can delete info booking',12,'delete_infobooking'),(48,'Can view info booking',12,'view_infobooking'),(49,'Can add bill',13,'add_bill'),(50,'Can change bill',13,'change_bill'),(51,'Can delete bill',13,'delete_bill'),(52,'Can view bill',13,'view_bill'),(53,'Can add table',14,'add_table'),(54,'Can change table',14,'change_table'),(55,'Can delete table',14,'delete_table'),(56,'Can view table',14,'view_table'),(57,'Can add account',8,'add_account'),(58,'Can change account',8,'change_account'),(59,'Can delete account',8,'delete_account'),(60,'Can view account',8,'view_account'),(61,'Can add detail bill',15,'add_detailbill'),(62,'Can change detail bill',15,'change_detailbill'),(63,'Can delete detail bill',15,'delete_detailbill'),(64,'Can view detail bill',15,'view_detailbill');
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
  `password` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$OkrBqGz5KaduAtaEsGkfYw$gNlfa5gYDV3uceTzm5R0SevLhcl2djVtOfw1w/MZWT8=','2024-01-04 11:29:37.133797',1,'admin','','','hoainguyen20022001@gmail.com',1,1,'2023-06-19 10:45:18.000000'),(4,'pbkdf2_sha256$600000$ojW1MeKpRyc4B1xAkTPcQO$g6mev9pmtCyCekugJy9ePTDx5DV0rXaO3s9xaNZ+v+8=','2024-01-06 13:54:29.306173',0,'nguyenngoc','Nguyễn Ngọc','','nguyenngoc@gmail.com',0,1,'2023-07-01 08:10:28.619132'),(5,'pbkdf2_sha256$600000$pd2oDtQAqLHN1heU3Pk1zp$6/fKKEEgkDp4RtkC0e1ymQ8zlmthRyDsxRpD99UWTjQ=','2024-01-06 13:51:12.284176',0,'lengocngan','Lê Ngọc Ngân','','ngocngan98@gmail.com',0,1,'2023-07-01 12:12:50.499740'),(7,'pbkdf2_sha256$600000$TDwNXRk4lXHcv3QQurgY05$k0WVg2qnkbej9wVe/soCyp8RxgRpyvk5cmW2/DZ+mFo=','2023-12-28 11:11:02.955289',0,'hoaian','Hoài Ân','','hoaian3@gmail.com',0,1,'2023-07-01 22:51:28.391499'),(14,'pbkdf2_sha256$600000$CPCVGEGnrDdNgoGxqFIJFU$HAqQ+E19ttlsYaWJFo8y3rEvCujgXu+DB7b6dvB50NA=',NULL,0,'namanh','Nam Anh','','namanh4@gmail.com',0,1,'2023-07-01 23:18:56.485305'),(19,'pbkdf2_sha256$600000$Szf01EpZPfMkZTP3F2SH4Q$SL7zM4IUuNQl76aEJtR6zSwn/kxrRpPJdgV9NrrP5mA=',NULL,0,'vannguyen','Nguyễn Văn','','nguyenvan03@gmail.com',0,1,'2023-12-26 11:07:15.582915'),(21,'pbkdf2_sha256$600000$bHvzSVkMFveJpYGQJnJvVw$vjTdJO2xoLOYes8llPv++HxWbNZjiwSk0ocJGKZMy5o=',NULL,0,'namnguyen','Nguyễn Nam','','namnguyen97@gmail.com',0,1,'2023-12-26 11:40:36.479565'),(22,'pbkdf2_sha256$600000$vK8nzIDfzoQ1plOtXGztcu$juTfwvYgKsLLeA7Zk90guifagVcOA01Wqb90oyE+wng=',NULL,0,'lieuthi','Nguyễn Thị Liễu','','lieunguyen98@gmail.com',0,1,'2023-12-26 11:48:45.494997'),(23,'pbkdf2_sha256$600000$yZi0JTw9HbIrRu4Y30EKIp$eQTBiKcsEJJAVOgUI9kHZI1izu24CVu5uJDHjFL3doA=',NULL,0,'vanlam','Văn Lâm','','vanlam01@gmail.com',0,1,'2023-12-26 13:01:52.005967'),(24,'pbkdf2_sha256$600000$pEHcywv6WvQhhOTSxyRjsP$g2jcgOiuspINQYttEY2vGN/SxpyptaM1MzfUIjywy/w=',NULL,0,'kimoanh','Nguyễn Kim Oanh','','kimoanh20@gmail.com',0,1,'2023-12-27 13:34:20.289117'),(25,'pbkdf2_sha256$600000$z0HcfD8mP1eoYpoeYaHQ5l$Jw+nGWIyabv52Ki/Uo8fWFPUygs+q49bawoYV1Tb38c=',NULL,0,'vanminh','Đặng Văn Minh','','dvminh01@gmail.com',0,1,'2023-12-27 13:37:15.595537'),(26,'pbkdf2_sha256$600000$6j0ukHQootOBqN1ivaN6Jt$Nv2bXY6MrfWQQkywpSwAR9JFOaztHR2TSV2p3iLeQg0=',NULL,0,'thidang','Đặng Thị Nguyên Thi','','thidang03@gmail.com',0,1,'2023-12-28 06:33:34.000000'),(27,'pbkdf2_sha256$600000$wPSKolmZBBfoI1GA7Kqmg8$flYBaBN5IdPNE5yvsYzHz5QcvReP9TcZpI2PGO4K15o=',NULL,0,'oanhkim','Nguyễn Kim Oanh','','oanhkim03@gmail.com',0,1,'2023-12-28 06:37:13.000000'),(28,'pbkdf2_sha256$600000$FZ8WIWaAZ7JjCchT6iS9nU$1JJl53bDhmpaBuvCh2Nj6VvugDWNXPcPdLt3EmgYyjg=',NULL,0,'nguyentuyet','Nguyễn Thị Ánh Tuyết','','tuyetnguyen88@gmail.com',0,1,'2023-12-28 06:38:14.000000'),(29,'pbkdf2_sha256$600000$YTyVE8QD4Btm0Cv61aHN8e$HdeehyhmeTsI1entKbI+uAh+b+Cr6LQwRpHi52REPY0=',NULL,0,'thanhnhan','Lê Thanh Nhân','','nhanle@gmail.com',0,1,'2023-12-28 06:38:58.000000'),(30,'pbkdf2_sha256$600000$6I0yGNdfD3rIVOGns15IoG$K+Z1w4P5KyzA8tN87DDlRMoHKjgRYWwTWu8NCfS2Aik=',NULL,0,'vule','Vũ Lê','','vule12@gmail.com',0,1,'2023-12-28 06:52:27.611552'),(31,'pbkdf2_sha256$600000$lInH65VBDUyZadGdbztAwY$KvTd5I3ZgmYKvHn6D8ahPtRoqWkH4DlaqM9qSKTWVo4=',NULL,0,'honglinh98','Lê Thị Hồng Linh','','honglinh98@gmail.com',0,1,'2023-12-28 06:54:05.828706'),(32,'pbkdf2_sha256$600000$FwkBEv1ucQUGB8FVeIp5T7$eH17rVKWoQehYy412iHGyH9LZiMRneCPSh5nu8qVqCo=',NULL,0,'anhquan','Hồ Anh Quân','','anhquan02@gmail.com',0,1,'2023-12-28 06:55:51.185249'),(33,'pbkdf2_sha256$600000$AGz7YYyGLsNZ0dJrhP6QQY$5bYWIJr8/3H2/TUu/nyCi43VxQ6rGkgXEEV6Aem2K38=',NULL,0,'minhanh','Trần Phạm Minh Anh','','minhanh01@gmail.com',0,1,'2023-12-28 06:58:25.212444'),(34,'pbkdf2_sha256$600000$ACvs1c2oAqBqpcW9ih1DDB$TIchFVSzy6njACc6fhFWmW+pGz4obFQhsCizwyFt8Eo=',NULL,0,'dieuthuong','Lê Thị Diệu Thương','','dieuthuong01@gmail.com',0,1,'2023-12-28 07:00:07.249520'),(35,'pbkdf2_sha256$600000$eozg6NxHbFltVKNTyC6rtX$xgAmFmOPA6TLYOO7BdYVgmzOizUhDJytNNzh2+LfO+c=',NULL,0,'mongdiem','Đoàn Thị Mộng Diễm','','mongdiem96@gmail.com',0,1,'2023-12-28 07:02:12.242990'),(36,'pbkdf2_sha256$600000$Ymie66bdLvb9vXiE2gDjyE$4WzHLYhTjXw5llTZB+YzwXDn87uXWsBuF2CwNGIAL8c=',NULL,0,'kimlong','Nguyễn Kim Long','','nklong00@gmail.com',0,1,'2023-12-29 12:20:59.921576');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb3_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-19 11:04:45.666456','1','1',1,'[{\"added\": {}}]',7,1),(2,'2023-06-19 11:04:53.713641','2','2',1,'[{\"added\": {}}]',7,1),(3,'2023-06-19 11:05:07.076893','3','3',1,'[{\"added\": {}}]',7,1),(4,'2023-06-19 11:05:20.423225','4','4',1,'[{\"added\": {}}]',7,1),(5,'2023-06-19 11:05:29.299709','5','5',1,'[{\"added\": {}}]',7,1),(6,'2023-06-19 11:05:34.456342','6','6',1,'[{\"added\": {}}]',7,1),(7,'2023-06-19 11:07:00.292773','1','admin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(8,'2023-06-19 11:11:27.253562','1','1',1,'[{\"added\": {}}]',10,1),(9,'2023-06-19 11:12:40.367863','2','2',1,'[{\"added\": {}}]',10,1),(10,'2023-06-19 11:13:00.108639','3','3',1,'[{\"added\": {}}]',10,1),(11,'2023-06-19 11:14:11.289570','4','4',1,'[{\"added\": {}}]',10,1),(12,'2023-06-19 11:14:54.899731','5','5',1,'[{\"added\": {}}]',10,1),(13,'2023-06-19 11:15:24.856503','6','6',1,'[{\"added\": {}}]',10,1),(14,'2023-06-19 11:16:24.336520','7','7',1,'[{\"added\": {}}]',10,1),(15,'2023-06-19 11:16:46.853935','8','8',1,'[{\"added\": {}}]',10,1),(16,'2023-06-30 11:48:05.425140','9','9',1,'[{\"added\": {}}]',10,1),(17,'2023-06-30 11:48:35.074928','10','10',1,'[{\"added\": {}}]',10,1),(18,'2023-07-01 06:55:14.215775','2','user1',3,'',4,1),(19,'2023-07-01 06:55:14.220685','3','user2',3,'',4,1),(20,'2023-07-01 11:33:55.981258','1','1',1,'[{\"added\": {}}]',8,1),(21,'2023-07-01 11:34:40.866007','1','1',1,'[{\"added\": {}}]',9,1),(22,'2023-07-01 11:34:53.500107','1','OrderItem object (1)',1,'[{\"added\": {}}]',11,1),(23,'2023-07-01 11:35:01.755781','2','OrderItem object (2)',1,'[{\"added\": {}}]',11,1),(24,'2023-07-01 12:14:32.269012','2','2',1,'[{\"added\": {}}]',8,1),(25,'2023-07-01 22:51:00.068404','6','user3',3,'',4,1),(26,'2023-12-11 11:13:00.493397','1','Table object (1)',1,'[{\"added\": {}}]',14,1),(27,'2023-12-11 11:16:08.032234','2','Table object (2)',1,'[{\"added\": {}}]',14,1),(28,'2023-12-11 11:16:15.716260','3','Table object (3)',1,'[{\"added\": {}}]',14,1),(29,'2023-12-11 11:16:35.725396','4','Table object (4)',1,'[{\"added\": {}}]',14,1),(30,'2023-12-11 11:16:51.991355','5','Table object (5)',1,'[{\"added\": {}}]',14,1),(31,'2023-12-11 11:16:57.953958','6','Table object (6)',1,'[{\"added\": {}}]',14,1),(32,'2023-12-11 11:17:08.036410','7','Table object (7)',1,'[{\"added\": {}}]',14,1),(33,'2023-12-11 11:17:13.875334','8','Table object (8)',1,'[{\"added\": {}}]',14,1),(34,'2023-12-11 11:17:21.869765','9','Table object (9)',1,'[{\"added\": {}}]',14,1),(35,'2023-12-11 11:18:03.157417','10','Table object (10)',1,'[{\"added\": {}}]',14,1),(36,'2023-12-11 11:18:18.696327','11','Table object (11)',1,'[{\"added\": {}}]',14,1),(37,'2023-12-11 11:18:22.968407','12','Table object (12)',1,'[{\"added\": {}}]',14,1),(38,'2023-12-11 11:18:27.408183','13','Table object (13)',1,'[{\"added\": {}}]',14,1),(39,'2023-12-11 11:18:32.223736','14','Table object (14)',1,'[{\"added\": {}}]',14,1),(40,'2023-12-11 11:18:37.445260','15','Table object (15)',1,'[{\"added\": {}}]',14,1),(41,'2023-12-11 11:18:43.459166','16','Table object (16)',1,'[{\"added\": {}}]',14,1),(42,'2023-12-11 11:18:49.733659','17','Table object (17)',1,'[{\"added\": {}}]',14,1),(43,'2023-12-11 11:18:53.579912','18','Table object (18)',1,'[{\"added\": {}}]',14,1),(44,'2023-12-11 11:18:59.046275','19','Table object (19)',1,'[{\"added\": {}}]',14,1),(45,'2023-12-11 11:19:05.143184','20','Table object (20)',1,'[{\"added\": {}}]',14,1),(46,'2023-12-12 08:57:59.572551','1','Bill object (1)',1,'[{\"added\": {}}]',13,1),(47,'2023-12-12 08:59:30.926409','1','Bill object (1)',2,'[{\"changed\": {\"fields\": [\"Account\", \"Id table\"]}}]',13,1),(48,'2023-12-12 09:37:40.560376','1','DetailBill object (1)',1,'[{\"added\": {}}]',15,1),(49,'2023-12-12 09:38:47.767185','2','Bill object (2)',3,'',13,1),(50,'2023-12-12 13:13:15.414187','1','1',2,'[]',15,1),(51,'2023-12-12 13:13:22.829126','2','2',1,'[{\"added\": {}}]',15,1),(52,'2023-12-12 13:20:42.772543','3','3',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(53,'2023-12-12 13:20:47.585228','4','4',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(54,'2023-12-12 13:20:56.106805','5','5',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(55,'2023-12-12 13:21:21.816515','6','6',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(56,'2023-12-12 13:21:25.268886','7','7',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(57,'2023-12-12 13:21:29.334384','8','8',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(58,'2023-12-12 13:21:33.247708','8','8',2,'[]',13,1),(59,'2023-12-12 13:21:37.987594','9','9',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(60,'2023-12-12 13:21:42.054927','10','10',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(61,'2023-12-12 13:21:45.785650','11','11',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(62,'2023-12-12 13:21:49.854958','12','12',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(63,'2023-12-12 13:21:53.002273','10','10',2,'[]',13,1),(64,'2023-12-12 13:21:56.001572','11','11',2,'[]',13,1),(65,'2023-12-12 13:21:59.330485','13','13',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(66,'2023-12-12 13:22:01.925911','14','14',2,'[]',13,1),(67,'2023-12-12 13:22:49.690022','1','1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(68,'2023-12-12 13:25:32.284008','15','15',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(69,'2023-12-12 13:25:37.739710','1','1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(70,'2023-12-14 08:26:33.618488','1','1',2,'[]',14,1),(71,'2023-12-14 08:26:37.834094','1','1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(72,'2023-12-14 10:38:08.394089','4','4',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(73,'2023-12-14 14:04:23.012034','2','2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(74,'2023-12-14 14:04:40.078889','2','2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(75,'2023-12-14 14:05:26.744717','2','2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(76,'2023-12-14 14:09:22.412204','2','2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(77,'2023-12-14 15:41:50.577564','3','3',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(78,'2023-12-14 15:42:05.751173','2','2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(79,'2023-12-14 15:42:19.512297','5','5',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(80,'2023-12-15 14:35:20.013553','15','15',2,'[{\"changed\": {\"fields\": [\"Id table\", \"Status\"]}}]',13,1),(81,'2023-12-15 14:35:39.820048','1','1',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(82,'2023-12-15 14:35:50.882237','3','3',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(83,'2023-12-15 14:36:00.229554','4','4',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(84,'2023-12-15 14:36:05.637802','5','5',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(85,'2023-12-15 14:36:10.206540','6','6',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(86,'2023-12-15 14:36:15.163344','7','7',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(87,'2023-12-15 14:36:19.319406','8','8',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(88,'2023-12-15 14:36:25.736250','9','9',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(89,'2023-12-15 14:36:32.269453','10','10',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(90,'2023-12-15 14:36:38.560361','11','11',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(91,'2023-12-15 14:36:45.859373','12','12',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(92,'2023-12-15 14:36:53.082121','13','13',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(93,'2023-12-15 14:36:58.392008','14','14',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(94,'2023-12-15 14:37:04.248883','15','15',2,'[]',13,1),(95,'2023-12-15 14:37:09.668148','16','16',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(96,'2023-12-15 14:37:17.245299','17','17',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(97,'2023-12-15 14:37:22.262542','16','16',2,'[]',13,1),(98,'2023-12-15 14:37:27.237985','18','18',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(99,'2023-12-15 14:37:31.603485','19','19',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(100,'2023-12-15 14:42:40.597127','17','17',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(101,'2023-12-15 15:21:19.339508','20','20',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(102,'2023-12-15 15:21:28.617870','6','6',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(103,'2023-12-15 15:22:01.667489','1','1',2,'[{\"changed\": {\"fields\": [\"Id table\"]}}]',13,1),(104,'2023-12-21 14:47:09.146668','7','7',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(105,'2023-12-21 14:51:17.821018','21','21',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(106,'2023-12-23 07:36:45.451309','11','Gỏi củ hủ dừa',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(107,'2023-12-23 07:45:59.389504','12','Gỏi Ngó Sen',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(108,'2023-12-23 07:46:13.116161','11','Gỏi Củ Hủ Dừa',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(109,'2023-12-23 07:54:52.705004','13','Gỏi Bò Mè Bóp Thấu',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(110,'2023-12-23 07:55:56.963925','13','Gỏi Bò Bóp Thấu',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(111,'2023-12-23 07:58:20.611678','14','Gỏi Bưởi Tô Mực',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',10,1),(112,'2023-12-24 11:16:24.459668','1','1',2,'[]',13,1),(113,'2023-12-26 11:17:40.292059','20','huunguyen',3,'',4,1),(114,'2023-12-26 11:17:40.300793','18','namnguyen',3,'',4,1),(115,'2023-12-26 11:17:40.303094','15','user11',3,'',4,1),(116,'2023-12-26 11:17:40.305703','16','user12',3,'',4,1),(117,'2023-12-26 11:17:40.306703','17','user13',3,'',4,1),(118,'2023-12-26 11:17:40.310216','8','user4',3,'',4,1),(119,'2023-12-26 11:17:40.310788','9','user5',3,'',4,1),(120,'2023-12-26 11:17:40.316324','10','user6',3,'',4,1),(121,'2023-12-26 11:17:40.318680','11','user7',3,'',4,1),(122,'2023-12-26 11:17:40.320742','12','user8',3,'',4,1),(123,'2023-12-26 11:17:40.322736','13','user9',3,'',4,1),(124,'2023-12-28 06:33:34.394312','26','thidang',1,'[{\"added\": {}}]',4,1),(125,'2023-12-28 06:34:10.687790','26','thidang',2,'[{\"changed\": {\"fields\": [\"First name\", \"Email address\"]}}]',4,1),(126,'2023-12-28 06:37:14.130168','27','oanhkim',1,'[{\"added\": {}}]',4,1),(127,'2023-12-28 06:37:41.842364','27','oanhkim',2,'[{\"changed\": {\"fields\": [\"First name\", \"Email address\"]}}]',4,1),(128,'2023-12-28 06:38:15.181460','28','nguyentuyet',1,'[{\"added\": {}}]',4,1),(129,'2023-12-28 06:38:48.397355','28','nguyentuyet',2,'[{\"changed\": {\"fields\": [\"First name\", \"Email address\"]}}]',4,1),(130,'2023-12-28 06:38:58.919147','29','thanhnhan',1,'[{\"added\": {}}]',4,1),(131,'2023-12-28 06:39:38.536680','29','thanhnhan',2,'[{\"changed\": {\"fields\": [\"First name\", \"Email address\"]}}]',4,1);
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
  `app_label` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'webrestaurant','account'),(13,'webrestaurant','bill'),(7,'webrestaurant','category'),(15,'webrestaurant','detailbill'),(12,'webrestaurant','infobooking'),(9,'webrestaurant','order'),(11,'webrestaurant','orderitem'),(10,'webrestaurant','product'),(14,'webrestaurant','table');
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
  `app` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-19 10:41:04.153361'),(2,'auth','0001_initial','2023-06-19 10:41:04.846781'),(3,'admin','0001_initial','2023-06-19 10:41:04.947512'),(4,'admin','0002_logentry_remove_auto_add','2023-06-19 10:41:04.962473'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-19 10:41:04.974441'),(6,'contenttypes','0002_remove_content_type_name','2023-06-19 10:41:05.038699'),(7,'auth','0002_alter_permission_name_max_length','2023-06-19 10:41:05.078497'),(8,'auth','0003_alter_user_email_max_length','2023-06-19 10:41:05.128450'),(9,'auth','0004_alter_user_username_opts','2023-06-19 10:41:05.149363'),(10,'auth','0005_alter_user_last_login_null','2023-06-19 10:41:05.214239'),(11,'auth','0006_require_contenttypes_0002','2023-06-19 10:41:05.218199'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-19 10:41:05.232192'),(13,'auth','0008_alter_user_username_max_length','2023-06-19 10:41:05.301001'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-19 10:41:05.351240'),(15,'auth','0010_alter_group_name_max_length','2023-06-19 10:41:05.399112'),(16,'auth','0011_update_proxy_permissions','2023-06-19 10:41:05.412077'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-19 10:41:05.464935'),(18,'sessions','0001_initial','2023-06-19 10:41:05.497848'),(19,'webrestaurant','0001_initial','2023-06-19 10:41:05.756490'),(20,'webrestaurant','0002_product_image','2023-06-19 10:49:05.500019'),(21,'webrestaurant','0003_product_date_added','2023-07-01 07:12:13.086309'),(22,'webrestaurant','0004_remove_order_status_order_complete','2023-07-01 11:31:29.883491'),(23,'webrestaurant','0005_infobooking','2023-07-02 01:08:08.020442'),(24,'webrestaurant','0006_bill_table_rename_customer_order_account_and_more','2023-12-11 11:05:07.445652'),(25,'webrestaurant','0007_alter_bill_date_checkout_alter_bill_total_price','2023-12-12 08:41:50.336194'),(26,'webrestaurant','0008_alter_bill_date_checkout_alter_bill_total_price','2023-12-12 08:57:38.287258'),(27,'webrestaurant','0009_remove_bill_id_table_bill_id_table','2023-12-15 14:29:06.215465'),(28,'webrestaurant','0010_category_active','2023-12-23 08:44:43.266433'),(29,'webrestaurant','0011_alter_bill_date_checkout','2023-12-24 11:40:12.168341'),(30,'webrestaurant','0012_alter_bill_date_checkout','2023-12-24 11:40:12.242714'),(31,'webrestaurant','0013_alter_bill_date_checkout','2023-12-24 11:40:12.255578'),(32,'webrestaurant','0014_user','2023-12-25 14:55:37.743520'),(33,'webrestaurant','0015_account_type_delete_user','2023-12-25 14:55:37.892470'),(34,'webrestaurant','0016_rename_category_product_category','2023-12-26 02:52:13.572644'),(35,'webrestaurant','0017_alter_account_type','2023-12-26 05:08:00.977853'),(36,'webrestaurant','0018_alter_infobooking_status','2023-12-27 07:47:01.523770'),(37,'webrestaurant','0019_remove_infobooking_user_infobooking_account','2023-12-27 07:56:15.422790'),(38,'webrestaurant','0020_alter_infobooking_account','2023-12-27 11:06:12.576579'),(39,'webrestaurant','0021_alter_infobooking_name','2023-12-27 11:17:24.429575'),(40,'webrestaurant','0022_alter_table_status','2023-12-29 13:46:27.314951'),(41,'webrestaurant','0023_infobooking_paytype','2024-01-04 11:41:13.694193');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb3_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01fjt1rbd7ys7lbrsjnz07tyvq2nef75','.eJxVjMEOwiAQRP-FsyEgsGw9evcbyC5spGpoUtqT8d9tkx70Mod5b-atEq1LTWuXOY1FXZRXp9-OKT-l7aA8qN0nnae2zCPrXdEH7fo2FXldD_fvoFKv21piYDlLsYAWOTuhjLDF4GIAhgA2shtcMBQRQ3ToDQNz9FiKAU_q8wXpNjeH:1rM789:ei05O3k6_3ohcHcpR9EigPTCziLVLOzZwgh7C0F4JDw','2024-01-20 13:54:29.314154'),('1esspydum40w3qzpilo65k0d6fs5uil7','.eJxVjMEOwiAQRP-FsyEgsGw9evcbyC5spGpoUtqT8d9tkx70Mod5b-atEq1LTWuXOY1FXZRXp9-OKT-l7aA8qN0nnae2zCPrXdEH7fo2FXldD_fvoFKv21piYDlLsYAWOTuhjLDF4GIAhgA2shtcMBQRQ3ToDQNz9FiKAU_q8wXpNjeH:1rM3iK:Hoph1haROSyKCQUCERm_wcHUDvBZKsA1ATicUWuBokg','2024-01-20 10:15:36.383273'),('7fbv1g87c6045mft3u1sj7r1z5zrodu8','.eJxVjEEOwiAQRe_C2hBgQMCl-56BwMxUqoYmpV0Z765NutDtf-_9l0h5W2vaOi9pInERWpx-t5LxwW0HdM_tNkuc27pMRe6KPGiXw0z8vB7u30HNvX5rB8biWJxWMHoAAuuiZa_OWhU26L0PHpFtLogYQ1CGoo0lMhoGQ0a8P8s3N6c:1qG9Mu:Pl6nn9x9CSlIngAEOGZ5Celgo5c1Koo_ljcRaXuQgkg','2023-07-17 02:32:48.179254'),('9lcuao5v5jikze18dji6gdq1iaq9wrpx','.eJxVjEEOwiAQRe_C2hBgQMCl-56BwMxUqoYmpV0Z765NutDtf-_9l0h5W2vaOi9pInERWpx-t5LxwW0HdM_tNkuc27pMRe6KPGiXw0z8vB7u30HNvX5rB8biWJxWMHoAAuuiZa_OWhU26L0PHpFtLogYQ1CGoo0lMhoGQ0a8P8s3N6c:1qG9Nu:FICGC7CtbzraxyUe7KPd8RAbZUuqRGfddvAoOU1sCAc','2023-07-17 02:33:50.020253'),('aqcqra9k6z2qlepj92ojype6ox6atlig','e30:1rHzc9:UqtYfYXHSzwHQ2U82bVFMA3-30ZuDwozUZkv-8xcusU','2024-01-09 05:04:25.116015'),('lcd9rjg4lopgeafvjkchdczm1i9bxwl1','.eJxVjEEOwiAQRe_C2hBgQMCl-56BwMxUqoYmpV0Z765NutDtf-_9l0h5W2vaOi9pInERWpx-t5LxwW0HdM_tNkuc27pMRe6KPGiXw0z8vB7u30HNvX5rB8biWJxWMHoAAuuiZa_OWhU26L0PHpFtLogYQ1CGoo0lMhoGQ0a8P8s3N6c:1qFjfE:kI_XSW0g2vvHKp0JRdHGFGYumfayUh14diU1rOpSSk0','2023-07-15 23:06:00.299583'),('lhe1bykzqyusv9j5omob8va025z4tln4','e30:1rHzdL:3BUAmx7GZHNBZO8MLcxkWw5U2YV9QWdPdEFKBinEBf0','2024-01-09 05:05:39.747319'),('mdm61j24v6nd89orokm07cno1yr0je5f','.eJxVjEEOwiAQRe_C2hBgQMCl-56BwMxUqoYmpV0Z765NutDtf-_9l0h5W2vaOi9pInERWpx-t5LxwW0HdM_tNkuc27pMRe6KPGiXw0z8vB7u30HNvX5rB8biWJxWMHoAAuuiZa_OWhU26L0PHpFtLogYQ1CGoo0lMhoGQ0a8P8s3N6c:1rLLur:bIMw1-Q2Y9QTk2zXgvs5hBGMPEbR0wDe3ACX8QVQrew','2024-01-18 11:29:37.257772'),('rle9gsen02g65ox9643zgfh69zew9i6e','e30:1rHzbI:wz9_C3UkRtMABko27CGv70D1S192GnMERuqYEhFleJM','2024-01-09 05:03:32.113989'),('y2xc3z4n2ec463kuuwfji5kxucp31puv','.eJxVjMEOwiAQRP-FsyEgsGw9evcbyC5spGpoUtqT8d9tkx70Mod5b-atEq1LTWuXOY1FXZRXp9-OKT-l7aA8qN0nnae2zCPrXdEH7fo2FXldD_fvoFKv21piYDlLsYAWOTuhjLDF4GIAhgA2shtcMBQRQ3ToDQNz9FiKAU_q8wXpNjeH:1rM6iJ:4REDLVM6ewvwC_8AMXWz3i48RcrQXFuMKnkA4EBnGwU','2024-01-20 13:27:47.157800');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_account`
--

DROP TABLE IF EXISTS `webrestaurant_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `webrestaurant_customer_user_id_dbe07172_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_account`
--

LOCK TABLES `webrestaurant_account` WRITE;
/*!40000 ALTER TABLE `webrestaurant_account` DISABLE KEYS */;
INSERT INTO `webrestaurant_account` VALUES (1,'Nguyễn Ngọc','0124578954','nguyenngoc@gmail.com','An Khê-Gia Lai',4,'ADMIN'),(2,'Lê Ngọc Ngân','0385453014','ngocngan98@gmail.com','225-Ngô Quyền-Hải châu-Đà Nẵng',5,'EMPLOYEE'),(3,'Hoài Ân','0333457851','hoaian3@gmail.com','Xuân Quang-Điện Bàn-Quảng Nam',7,'CUSTOMER'),(4,'Đặng Thị Nguyên Thi','0335478458','thidang03@gmail.com','127-Nam An-Núi Thành-Quảng Nam',26,'CUSTOMER'),(6,'Nguyễn Kim Oanh','0975426358','oanhkim03@gmail.com','23-Lê Lai-Ngô Mây-Sa Huỳnh-Quảng Ngãi',27,'CUSTOMER'),(7,'Nguyễn Thị Ánh Tuyết','0325412569','tuyetnguyen88@gmail.com','55-Lê Lai-Hoàng Hoa Thám-Hà Tĩnh',28,'CUSTOMER'),(8,'Lê Thanh Nhân','0214578569','nhanle@gmail.com','21-Đông Khê-Chư Sê-Gia Lai',29,'CUSTOMER'),(10,'Nam Anh','0213478563','namanh4@gmail.com','51-Hàm Nghi-Xuân Hải-Nghi Lộc-Huế',14,'CUSTOMER'),(16,'Nguyễn Thị Liễu','0975455325','lieunguyen98@gmail.com','75-Phùng Hưng-Hòa Minh-Liên Chiểu-Đà Nẵng',22,'EMPLOYEE'),(17,'Văn Lâm','0235478459','vanlam01@gmail.com','54-Lê Lai-Đống Đa-Hà Nội',23,'EMPLOYEE'),(18,'Nguyễn Kim Oanh','0357878914','kimoanh20@gmail.com','Gia Lai',24,'EMPLOYEE'),(19,'Đặng Văn Minh','0123456972','dvminh01@gmail.com','Huế',25,'CUSTOMER'),(20,'Vũ Lê','0913458751','vule12@gmail.com','54-Lê Lợi-An Nhơn-Bình Định',30,'EMPLOYEE'),(21,'Lê Thị Hồng Linh','0975774175','honglinh98@gmail.com','36-Hùng Vương-Yên Thế-Gia Lai',31,'EMPLOYEE'),(22,'Hồ Anh Quân','0373547153','anhquan02@gmail.com','125-Ngô Quyền-Thanh Khê-Đà Nẵng',32,'EMPLOYEE'),(23,'Trần Phạm Minh Anh','0338459875','minhanh01@gmail.com','45-Hoàng Diệu-Liên Chiểu-Đà Nẵng',33,'CUSTOMER'),(24,'Lê Thị Diệu Thương','0385630904','dieuthuong01@gmail.com','55-Đống Đa-Hải Châu-Đà Nẵng',34,'CUSTOMER'),(25,'Đoàn Thị Mộng Diễm','0725145236','mongdiem96@gmail.com','03-Nam Đàn-Ngũ Hành Sơn_Đà Nẵng',35,'CUSTOMER'),(26,'Nguyễn Kim Long','0214256324','nklong00@gmail.com','22-Tôn Đản-Hoài Nhơn-Bình Định',36,'CUSTOMER');
/*!40000 ALTER TABLE `webrestaurant_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_bill`
--

DROP TABLE IF EXISTS `webrestaurant_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `date_checkout` longtext COLLATE utf8mb3_unicode_ci,
  `total_price` decimal(10,1) NOT NULL,
  `status` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `account_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webrestaurant_bill_account_id_a863e94d_fk_webrestau` (`account_id`),
  CONSTRAINT `webrestaurant_bill_account_id_a863e94d_fk_webrestau` FOREIGN KEY (`account_id`) REFERENCES `webrestaurant_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_bill`
--

LOCK TABLES `webrestaurant_bill` WRITE;
/*!40000 ALTER TABLE `webrestaurant_bill` DISABLE KEYS */;
INSERT INTO `webrestaurant_bill` VALUES (1,'2023-05-12 08:57:59.571587','2023-05-12 09:50:00.000000',86200000.0,'paid',2),(3,'2023-06-14 21:09:33.754588','2023-09-12 21:37:00.000000',55430000.0,'paid',2),(4,'2023-07-12 12:43:45.806176','2023-07-12 15:47:00.000000',42750000.0,'paid',2),(5,'2023-02-12 12:43:47.080950','2023-02-12 15:27:00.000000',120750000.0,'paid',2),(6,'2023-12-14 17:58:23.445662','2023-12-24 16:03:41.889732',234000.0,'paid',16),(7,'2023-12-21 21:49:45.687347','2023-12-24 16:57:51.301201',17000.0,'paid',2),(8,'2023-03-21 21:51:52.255365','2023-03-12 22:27:00.000000',75000000.0,'paid',17),(9,'2023-04-12 13:14:32.875059','2023-04-12 15:07:00.000000',53120000.0,'paid',18),(10,'2023-09-12 13:14:33.551026','2023-09-12 15:27:00.000000',35000000.0,'paid',18),(11,'2023-10-12 13:14:34.449631','2023-10-12 13:24:00.000000',35000000.0,'paid',17),(12,'2023-01-12 13:14:35.028085','2023-01-12 15:27:00.000000',65000000.0,'paid',16),(13,'2023-10-12 13:14:36.274481','2023-10-12 13:50:00.000000',312000.0,'paid',20),(14,'2023-10-12 13:18:50.597494','2023-10-12 14:27:00.000000',750000.0,'paid',20),(15,'2023-12-24 17:14:33.835148','2023-12-24 17:15:12.028725',1200000.0,'paid',21),(16,'2023-11-12 13:26:22.729218','2023-11-12 15:27:00.000000',250000.0,'paid',22),(17,'2023-11-24 17:24:27.043153','2023-11-24 16:10:00.000000',1780000.0,'paid',16),(18,'2023-11-12 13:27:21.490686','2023-11-12 14:27:00.000000',17050000.0,'paid',17),(19,'2023-11-12 13:27:25.720836','2023-11-12 13:58:00.000000',17000000.0,'paid',17),(20,'2023-12-22 07:16:11.164846','2023-12-22 09:26:11.164846',9500000.0,'paid',16),(21,'2023-11-21 21:00:04.940975','2023-11-21 22:00:00.000000',1000000.0,'paid',22),(22,'2023-12-18 01:32:51.174018','2023-12-18 04:32:51.174018',8150000.0,'paid',23),(23,'2023-12-23 01:34:34.082649','2023-12-23 05:34:34.082649',11570000.0,'paid',24),(24,'2023-12-25 01:51:12.031277','2023-12-25 09:51:12.031277',4500000.0,'paid',25),(25,'2023-12-22 02:05:40.995630',NULL,0.0,'paid',NULL),(26,'2023-12-22 02:08:48.687360',NULL,0.0,'paid',NULL),(27,'2023-12-22 09:34:52.027798',NULL,0.0,'paid',NULL),(28,'2023-03-22 10:12:58.007987','2023-03-24 13:13',1500000.0,'paid',25),(29,'2023-10-24 15:49:47.841369','2023-10-24 16:15',20368000.0,'paid',24),(30,'2023-09-22 03:30:10.810039','2023-09-24 16:15',1125000.0,'paid',23),(31,'2023-08-22 03:32:08.246432','2023-12-26 20:50:25.408380',32000.0,'paid',22),(32,'2023-08-24 13:12:12.340128','2023-08-24 16:15',7600000.0,'paid',21),(33,'2023-08-24 13:14:29.554604','2023-08-24 19:07',40700000.0,'paid',20),(34,'2023-12-21 16:08:26.082453','2023-12-21 16:08:48.467728',8500000.0,'paid',25),(35,'2023-12-20 13:13:19.733805','2023-12-20 15:34',9405000.0,'paid',24),(36,'2023-12-26 20:48:19.033767',NULL,0.0,'paid',NULL),(37,'2023-12-24 06:15:30.685488',NULL,0.0,'paid',NULL),(38,'2023-12-24 08:50:14.946040',NULL,0.0,'paid',NULL),(39,'2023-12-24 09:03:53.724002','2023-12-27 13:58:05.900642',0.0,'paid',NULL),(40,'2023-12-19 17:06:11.967372','2023-12-19 17:06:51.683259',7800000.0,'paid',18),(41,'2023-12-27 09:00:35.971732','2023-12-27 20:39:56.577446',255000.0,'paid',16),(42,'2023-12-26 14:30:57.792150','2023-12-26 14:31:42.230895',1850000.0,'paid',17),(43,'2023-12-24 17:22:54.298371','2023-12-24 17:23:08.691405',7500000.0,'paid',18),(44,'2023-12-24 10:23:08.789698',NULL,0.0,'unpaid',NULL),(45,'2023-12-26 14:19:45.257007','2023-12-26 14:24:48.876413',895000.0,'paid',22),(46,'2023-12-26 07:24:49.023341',NULL,0.0,'unpaid',NULL),(47,'2023-12-26 20:47:18.004864',NULL,0.0,'paid',NULL),(48,'2023-12-26 08:20:37.244324',NULL,0.0,'unpaid',NULL),(49,'2023-12-26 15:20:40.685450','2023-12-26 15:24:15.122812',1550000.0,'paid',21),(50,'2023-12-26 08:24:15.236263',NULL,0.0,'unpaid',NULL),(51,'2024-01-04 15:08:48.826149','2024-01-04 15:09:16.525658',1260000.0,'paid',2),(52,'2024-01-04 14:56:19.102292','2024-01-04 14:59:41.141473',1350000.0,'paid',20),(53,'2023-12-27 02:00:06.552328','2023-12-27 09:07:45.443728',3410000.0,'paid',20),(54,'2023-12-27 02:00:24.798954',NULL,0.0,'unpaid',NULL),(55,'2023-12-27 02:00:27.154604',NULL,0.0,'unpaid',NULL),(56,'2023-12-27 10:26:31.619734',NULL,0.0,'paid',NULL),(57,'2023-12-27 02:51:39.963296','2023-12-27 10:19:53.195673',2890000.0,'paid',23),(58,'2023-12-27 09:56:31.932739','2023-12-27 10:27:29.050934',1570000.0,'paid',24),(59,'2023-12-27 10:29:13.285179','2023-12-27 10:32:05.211633',1720000.0,'paid',23),(60,'2023-12-27 03:19:53.295189',NULL,0.0,'paid',NULL),(61,'2023-12-27 10:25:42.268327',NULL,0.0,'paid',NULL),(62,'2023-12-27 03:27:29.159710',NULL,0.0,'paid',NULL),(63,'2023-12-27 03:27:54.197784',NULL,0.0,'paid',NULL),(64,'2023-12-27 03:27:55.609179','2023-12-27 11:14:09.565986',90000.0,'paid',22),(65,'2023-12-27 03:27:57.148885',NULL,0.0,'paid',NULL),(66,'2023-12-27 03:27:58.244078',NULL,0.0,'paid',NULL),(67,'2023-12-27 03:32:05.299659',NULL,0.0,'unpaid',NULL),(68,'2023-12-27 10:37:44.386133',NULL,0.0,'paid',NULL),(69,'2023-12-27 03:51:41.331698',NULL,0.0,'paid',NULL),(70,'2023-12-27 03:51:42.570757',NULL,0.0,'paid',NULL),(71,'2023-12-27 03:52:32.707706','2023-12-27 10:56:28.868860',0.0,'paid',18),(72,'2023-12-27 03:52:42.339072',NULL,0.0,'paid',NULL),(73,'2023-12-27 03:55:49.503181',NULL,0.0,'paid',NULL),(74,'2023-12-27 03:56:09.224439','2023-12-27 10:56:19.217632',0.0,'paid',17),(75,'2023-12-27 03:56:19.325110',NULL,0.0,'paid',NULL),(76,'2023-12-27 03:56:28.971061',NULL,0.0,'paid',NULL),(77,'2023-12-27 03:57:00.956444','2023-12-27 10:57:21.842333',0.0,'paid',17),(78,'2023-12-27 03:57:21.924766',NULL,0.0,'paid',NULL),(79,'2023-12-27 03:57:31.910445','2023-12-27 10:57:35.993056',0.0,'paid',17),(80,'2023-12-27 03:57:36.092572',NULL,0.0,'paid',NULL),(81,'2023-12-27 03:58:17.551845',NULL,0.0,'paid',NULL),(82,'2023-12-27 04:03:58.732711',NULL,0.0,'paid',NULL),(83,'2023-12-27 04:08:29.428524',NULL,0.0,'paid',NULL),(84,'2023-12-27 04:14:09.650572',NULL,0.0,'paid',NULL),(85,'2023-12-27 04:14:16.563344','2023-12-27 13:30:53.938455',45000.0,'paid',25),(86,'2023-12-27 11:18:25.713939',NULL,45000.0,'paid',26),(87,'2023-12-27 04:14:23.192607',NULL,0.0,'paid',NULL),(88,'2023-12-27 04:14:24.293399','2023-12-27 13:27:25.485124',15000.0,'paid',17),(89,'2023-12-27 04:26:45.059916','2023-12-27 11:27:46.231257',0.0,'paid',NULL),(90,'2023-12-27 04:27:46.322013',NULL,0.0,'paid',NULL),(91,'2023-12-27 04:30:30.423529','2023-12-27 11:30:38.426147',0.0,'paid',NULL),(92,'2023-12-27 11:30:43.658218','2023-12-27 11:33:09.307781',60000.0,'paid',18),(93,'2023-12-27 04:31:10.261751','2023-12-27 11:33:03.561771',0.0,'paid',NULL),(94,'2023-12-27 04:33:03.660226',NULL,0.0,'paid',NULL),(95,'2023-12-27 11:33:13.149908',NULL,0.0,'paid',NULL),(96,'2023-12-27 06:24:35.953625','2023-12-27 13:25:24.054536',0.0,'paid',25),(97,'2023-12-27 06:25:24.170485',NULL,0.0,'paid',NULL),(98,'2023-12-27 06:27:06.788811','2023-12-27 13:27:18.302293',0.0,'paid',25),(99,'2023-12-27 06:27:18.402074',NULL,0.0,'paid',NULL),(100,'2023-12-27 13:27:35.680123',NULL,0.0,'paid',NULL),(101,'2023-12-27 06:27:49.996814',NULL,0.0,'paid',NULL),(102,'2023-12-27 06:28:09.576817',NULL,0.0,'paid',NULL),(103,'2023-12-27 13:31:02.660430',NULL,0.0,'paid',NULL),(104,'2023-12-27 13:31:11.147101',NULL,0.0,'paid',NULL),(105,'2023-12-27 06:42:19.552955','2023-12-27 13:56:19.375317',410000.0,'paid',22),(106,'2023-12-27 06:42:54.555182',NULL,0.0,'paid',NULL),(107,'2023-12-27 06:43:00.809959',NULL,0.0,'paid',NULL),(108,'2023-12-27 13:56:37.723813',NULL,0.0,'paid',NULL),(109,'2023-12-27 06:56:22.756245',NULL,0.0,'paid',NULL),(110,'2023-12-27 13:56:42.900879',NULL,105000.0,'paid',21),(111,'2023-12-27 06:57:20.342904',NULL,0.0,'paid',NULL),(112,'2023-12-27 06:57:28.649178','2023-12-27 13:57:52.538641',0.0,'paid',20),(113,'2023-12-27 06:57:29.341423','2023-12-27 13:57:57.319216',0.0,'paid',26),(114,'2023-12-27 06:57:30.546575','2023-12-27 13:58:01.409129',0.0,'paid',26),(115,'2023-12-27 13:59:33.634122',NULL,0.0,'paid',NULL),(116,'2023-12-27 13:59:28.268196',NULL,0.0,'paid',NULL),(117,'2023-12-27 06:58:01.502837',NULL,0.0,'paid',NULL),(118,'2023-12-27 06:58:05.984531',NULL,0.0,'unpaid',NULL),(119,'2023-12-27 06:59:52.771183',NULL,0.0,'paid',NULL),(120,'2023-12-27 07:00:12.700533','2023-12-27 14:00:51.123596',190000.0,'paid',23),(121,'2023-12-27 07:00:44.412529',NULL,0.0,'unpaid',NULL),(122,'2023-12-27 20:39:28.301913',NULL,0.0,'paid',NULL),(123,'2023-12-27 14:03:10.760742',NULL,0.0,'paid',NULL),(124,'2023-12-28 20:38:55.203737','2023-12-28 19:40:23.227120',756000.0,'paid',24),(125,'2023-12-27 13:39:42.567666',NULL,0.0,'unpaid',NULL),(126,'2023-12-27 13:39:56.749570',NULL,0.0,'unpaid',NULL),(127,'2023-12-28 19:42:54.903033','2023-12-28 19:43:12.497964',5400000.0,'paid',21),(128,'2023-12-29 19:43:23.422167','2023-12-29 19:43:57.610801',3815000.0,'paid',21),(129,'2024-01-03 20:51:40.219596','2024-01-03 22:30:40.219596',8950000.0,'paid',22),(130,'2024-01-04 07:59:41.232487',NULL,0.0,'unpaid',NULL),(131,'2024-01-04 08:09:16.630767',NULL,0.0,'unpaid',NULL),(132,'2024-01-05 13:52:10.913022','2024-01-05 16:20:10.913022',6400000.0,'paid',18),(133,'2024-01-06 20:52:37.226626','2024-01-06 20:53:23.848071',4520000.0,'paid',2),(134,'2024-01-06 13:53:23.977753',NULL,0.0,'unpaid',NULL),(135,'2024-01-08 10:30:37.226626','2024-01-08 12:53:23.848071',4590000.0,'paid',2),(136,'2024-01-09 10:30:37.226626','2024-01-09 12:50:37.226626',7480000.0,'paid',16),(137,'2024-01-10 10:30:37.226626','2024-01-10 16:30:37.226626',7350000.0,'paid',17),(138,'2024-01-11 12:30:37.226626','2024-01-11 17:30:37.226626',9120000.0,'paid',20),(139,'2024-01-07 10:30:37.226626','2024-01-07 10:30:37.226626',5630000.0,'paid',18);
/*!40000 ALTER TABLE `webrestaurant_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_bill_id_table`
--

DROP TABLE IF EXISTS `webrestaurant_bill_id_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_bill_id_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bill_id` bigint NOT NULL,
  `table_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webrestaurant_bill_id_table_bill_id_table_id_6e98b1d5_uniq` (`bill_id`,`table_id`),
  KEY `webrestaurant_bill_i_table_id_59cefa68_fk_webrestau` (`table_id`),
  CONSTRAINT `webrestaurant_bill_i_bill_id_fcfcf07f_fk_webrestau` FOREIGN KEY (`bill_id`) REFERENCES `webrestaurant_bill` (`id`),
  CONSTRAINT `webrestaurant_bill_i_table_id_59cefa68_fk_webrestau` FOREIGN KEY (`table_id`) REFERENCES `webrestaurant_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_bill_id_table`
--

LOCK TABLES `webrestaurant_bill_id_table` WRITE;
/*!40000 ALTER TABLE `webrestaurant_bill_id_table` DISABLE KEYS */;
INSERT INTO `webrestaurant_bill_id_table` VALUES (2,1,1),(24,1,2),(27,1,3),(20,1,20),(3,3,3),(4,4,4),(5,5,5),(28,6,6),(33,6,8),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(1,15,15),(15,16,16),(19,17,17),(17,18,18),(18,19,19),(21,21,2),(25,22,1),(26,23,20),(29,24,6),(30,25,6),(31,26,8),(32,27,8),(34,28,4),(35,28,9),(36,29,4),(37,30,9),(38,31,9),(39,32,1),(40,33,5),(41,34,1),(42,35,2),(58,36,1),(43,36,2),(44,37,5),(45,38,4),(46,39,6),(47,40,1),(48,41,7),(49,42,1),(50,43,15),(51,44,15),(52,45,17),(53,46,17),(54,47,1),(55,48,8),(56,49,14),(57,50,14),(59,51,10),(60,52,9),(61,53,3),(64,53,4),(62,54,11),(63,55,13),(65,56,4),(67,57,1),(66,57,3),(71,58,1),(68,58,2),(73,58,3),(74,58,4),(75,58,5),(81,59,1),(69,59,12),(70,60,1),(72,61,3),(76,62,1),(85,63,1),(77,63,3),(110,64,1),(111,64,2),(112,64,3),(113,64,4),(78,64,5),(86,65,1),(79,65,4),(84,66,1),(80,66,2),(82,67,12),(83,68,1),(89,69,1),(87,69,2),(91,70,1),(88,70,3),(90,71,4),(104,72,1),(92,72,2),(93,73,3),(94,74,1),(95,75,1),(107,76,1),(108,76,2),(109,76,3),(96,76,4),(97,77,3),(105,78,1),(106,78,2),(98,78,3),(99,79,1),(100,80,1),(101,81,1),(102,82,1),(103,83,1),(114,84,5),(148,85,1),(149,85,2),(150,85,3),(115,85,4),(120,86,3),(117,87,2),(132,88,1),(137,88,3),(134,88,4),(121,89,2),(122,90,2),(124,91,1),(125,92,1),(127,92,3),(128,93,2),(129,94,2),(130,95,1),(131,95,2),(135,96,3),(136,97,3),(138,98,2),(139,99,2),(144,100,1),(141,100,2),(143,101,1),(146,102,1),(147,102,2),(145,102,3),(151,103,1),(153,104,1),(152,104,2),(155,105,1),(156,105,2),(158,105,4),(157,106,4),(159,107,3),(160,108,1),(162,108,2),(163,108,3),(161,109,2),(165,110,1),(166,110,2),(167,110,3),(168,110,6),(169,111,4),(170,112,2),(171,113,1),(172,114,3),(180,115,2),(178,115,3),(181,115,4),(174,116,1),(175,117,3),(176,118,6),(179,119,2),(182,120,1),(183,120,2),(184,120,3),(186,120,5),(187,121,4),(188,122,3),(189,123,1),(191,124,1),(190,124,2),(192,125,3),(193,126,7),(194,127,1),(195,128,1),(196,129,1),(197,130,9),(198,131,10),(199,132,2),(200,133,1),(201,133,2),(202,134,2);
/*!40000 ALTER TABLE `webrestaurant_bill_id_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_category`
--

DROP TABLE IF EXISTS `webrestaurant_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_category`
--

LOCK TABLES `webrestaurant_category` WRITE;
/*!40000 ALTER TABLE `webrestaurant_category` DISABLE KEYS */;
INSERT INTO `webrestaurant_category` VALUES (1,'Đồ uống',1),(2,'Khai vị',1),(3,'Cơm - Mì',1),(4,'Món cá',1),(5,'Món bò',1),(6,'Món gà',1),(8,'Hải sản',1),(9,'Lẩu',0),(10,'Món mới',0),(11,'Món Tây Bắc',1),(12,'Ăn nhẹ',0);
/*!40000 ALTER TABLE `webrestaurant_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_detailbill`
--

DROP TABLE IF EXISTS `webrestaurant_detailbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_detailbill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `bill_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webrestaurant_detail_bill_id_15fc338e_fk_webrestau` (`bill_id`),
  KEY `webrestaurant_detail_product_id_1e30a085_fk_webrestau` (`product_id`),
  CONSTRAINT `webrestaurant_detail_bill_id_15fc338e_fk_webrestau` FOREIGN KEY (`bill_id`) REFERENCES `webrestaurant_bill` (`id`),
  CONSTRAINT `webrestaurant_detail_product_id_1e30a085_fk_webrestau` FOREIGN KEY (`product_id`) REFERENCES `webrestaurant_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_detailbill`
--

LOCK TABLES `webrestaurant_detailbill` WRITE;
/*!40000 ALTER TABLE `webrestaurant_detailbill` DISABLE KEYS */;
INSERT INTO `webrestaurant_detailbill` VALUES (2,1,1,8),(4,1,5,2),(8,2,6,10),(9,1,1,4),(22,3,1,9),(31,1,7,10),(33,1,1,6),(34,1,6,7),(36,5,30,2),(37,1,1,15),(41,1,32,5),(42,5,35,2),(47,10,33,2),(48,1,33,14),(51,4,29,10),(53,1,34,11),(56,302,34,28),(57,10,34,2),(59,1,40,12),(60,1,40,14),(66,16,15,2),(68,1,17,13),(72,5,45,1),(73,1,45,11),(74,1,45,4),(75,1,45,7),(76,100,45,8),(77,100,42,2),(78,2,42,13),(79,2,42,4),(80,2,42,5),(81,1,42,7),(82,1,42,8),(83,30,49,2),(84,1,49,13),(85,1,49,4),(86,1,49,5),(87,1,49,7),(88,22,58,1),(89,2,58,12),(90,1,57,1),(91,1,57,13),(92,1,31,1),(93,1,31,10),(94,48,53,2),(95,2,53,11),(96,2,53,12),(97,2,53,13),(98,2,53,4),(99,1,53,15),(100,2,53,6),(101,2,53,16),(102,6,53,1),(103,39,57,2),(104,5,57,4),(105,1,57,3),(106,1,57,9),(107,1,57,10),(108,3,57,1),(109,12,61,1),(110,2,56,1),(111,2,58,4),(112,2,58,8),(113,30,59,9),(114,2,59,4),(115,2,59,6),(116,1,59,8),(117,1,59,7),(118,6,64,1),(119,3,86,1),(120,4,92,1),(121,1,88,1),(122,3,85,1),(123,7,103,1),(124,1,105,11),(125,2,105,2),(126,209,105,27),(127,3,108,1),(128,2,110,1),(129,3,110,2),(130,4,116,1),(131,4,120,1),(132,1,120,13),(133,5,123,1),(134,1,124,13),(135,1,124,5),(136,26,124,4),(137,1,124,7),(138,2,124,1),(139,295,124,29),(140,1,124,10),(141,1,41,1),(142,2,41,11),(143,1,124,14),(144,18,127,4),(145,15,128,2),(146,11,128,4),(147,10,128,9),(148,10,52,1),(149,10,52,2),(150,1,52,13),(151,1,52,4),(152,1,52,5),(153,1,52,6),(154,1,52,8),(155,10,51,2),(156,2,51,13),(157,2,51,4),(158,1,51,6),(159,1,133,6),(160,1,133,7),(161,1,133,8),(162,1,133,2),(163,1,133,3);
/*!40000 ALTER TABLE `webrestaurant_detailbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_infobooking`
--

DROP TABLE IF EXISTS `webrestaurant_infobooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_infobooking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `numpeople` int DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_booking` datetime(6) NOT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci,
  `status` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `paytype` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webrestaurant_infobo_order_id_3244d0ce_fk_webrestau` (`order_id`),
  KEY `webrestaurant_infobooking_account_id_d55c96f1` (`account_id`),
  CONSTRAINT `webrestaurant_infobo_account_id_d55c96f1_fk_webrestau` FOREIGN KEY (`account_id`) REFERENCES `webrestaurant_account` (`id`),
  CONSTRAINT `webrestaurant_infobo_order_id_3244d0ce_fk_webrestau` FOREIGN KEY (`order_id`) REFERENCES `webrestaurant_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_infobooking`
--

LOCK TABLES `webrestaurant_infobooking` WRITE;
/*!40000 ALTER TABLE `webrestaurant_infobooking` DISABLE KEYS */;
INSERT INTO `webrestaurant_infobooking` VALUES (1,'Ngoc','0242523134','user2@gmail.com',5,'2023-12-27 07:57:44.405160','2023-12-28 19:39:00.000000','Hát mừng sinh nhật','COMPLETE',2,2,'COD'),(6,'Ngoc','0242523134','user2@gmail.com',3,'2023-12-27 11:13:57.467175','2023-12-29 19:00:00.000000','','WAIT',9,2,'COD'),(7,'Ngoc','0242523134','user2@gmail.com',4,'2023-12-27 13:43:02.628290','2023-12-30 08:30:00.000000','Nhạc mừng sinh nhật','WAIT',10,2,'COD'),(8,'Hoài Ân','0333457851','hoaian3@gmail.com',10,'2023-12-28 11:11:28.441187','2023-12-30 19:00:00.000000','','WAIT',12,3,'COD'),(9,'Lê Ngọc Ngân','0385453014','ngocngan98@gmail.com',3,'2024-01-05 13:51:04.516145','2024-01-09 10:52:00.000000','','WAIT',11,2,'COD'),(11,'Lê Ngọc Ngân','0385453014','ngocngan98@gmail.com',10,'2024-01-05 14:09:41.041573','2024-01-05 22:09:00.000000','','COMPLETE',14,2,'PAYONLINE'),(12,'Nguyễn Ngọc hoài','0124578954','nguyenngoc@gmail.com',5,'2024-01-06 13:48:25.681137','2024-01-08 22:00:00.000000','Hát','WAIT',1,1,'PAYONLINE');
/*!40000 ALTER TABLE `webrestaurant_infobooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_order`
--

DROP TABLE IF EXISTS `webrestaurant_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_order` datetime(6) NOT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci,
  `transaction_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webrestaurant_order_account_id_138cc5db_fk_webrestau` (`account_id`),
  CONSTRAINT `webrestaurant_order_account_id_138cc5db_fk_webrestau` FOREIGN KEY (`account_id`) REFERENCES `webrestaurant_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_order`
--

LOCK TABLES `webrestaurant_order` WRITE;
/*!40000 ALTER TABLE `webrestaurant_order` DISABLE KEYS */;
INSERT INTO `webrestaurant_order` VALUES (1,'2023-07-01 11:34:40.864008','','0001',1,1),(2,'2023-07-01 12:14:57.971484',NULL,NULL,2,1),(3,'2023-07-01 22:55:51.571887',NULL,NULL,4,0),(4,'2023-07-01 23:03:06.383512',NULL,NULL,NULL,0),(5,'2023-07-01 23:17:29.753841',NULL,NULL,8,0),(6,'2023-07-01 23:18:18.845252',NULL,NULL,NULL,0),(7,'2023-07-01 23:32:59.932646',NULL,NULL,NULL,0),(8,'2023-07-01 23:41:05.279330',NULL,NULL,NULL,0),(9,'2023-12-27 07:57:44.457553',NULL,NULL,2,1),(10,'2023-12-27 11:13:57.496745',NULL,NULL,2,1),(11,'2023-12-27 13:43:02.706484',NULL,NULL,2,1),(12,'2023-12-28 07:15:33.366752',NULL,NULL,3,1),(13,'2023-12-28 11:11:28.519878',NULL,NULL,3,0),(14,'2024-01-05 13:51:04.650960',NULL,NULL,2,1),(15,'2024-01-05 14:10:41.849602',NULL,NULL,2,0),(16,'2024-01-06 13:50:10.174967',NULL,NULL,1,0);
/*!40000 ALTER TABLE `webrestaurant_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_orderitem`
--

DROP TABLE IF EXISTS `webrestaurant_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webrestaurant_orderi_order_id_f50e02c2_fk_webrestau` (`order_id`),
  KEY `webrestaurant_orderi_product_id_5d54a4e7_fk_webrestau` (`product_id`),
  CONSTRAINT `webrestaurant_orderi_order_id_f50e02c2_fk_webrestau` FOREIGN KEY (`order_id`) REFERENCES `webrestaurant_order` (`id`),
  CONSTRAINT `webrestaurant_orderi_product_id_5d54a4e7_fk_webrestau` FOREIGN KEY (`product_id`) REFERENCES `webrestaurant_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_orderitem`
--

LOCK TABLES `webrestaurant_orderitem` WRITE;
/*!40000 ALTER TABLE `webrestaurant_orderitem` DISABLE KEYS */;
INSERT INTO `webrestaurant_orderitem` VALUES (4,10,'2023-07-01 22:07:30.995184',1,6),(5,10,'2023-07-02 01:48:49.315653',2,1),(6,1,'2023-07-02 01:49:04.908127',2,5),(7,3,'2023-07-02 02:21:28.288072',2,7),(11,1,'2023-12-26 08:11:50.826175',1,11),(13,1,'2023-12-26 08:12:11.859606',1,15),(14,2,'2023-12-26 08:12:24.608042',1,8),(16,2,'2023-12-26 08:12:30.020522',1,13),(17,16,'2023-12-27 11:00:50.507086',9,2),(18,1,'2023-12-27 11:03:56.641038',9,4),(19,1,'2023-12-27 11:03:59.882185',9,13),(20,1,'2023-12-27 11:04:01.596627',9,8),(21,1,'2023-12-27 13:41:48.083865',10,4),(22,1,'2023-12-27 13:41:52.690614',10,1),(24,13,'2023-12-28 07:15:40.928167',12,2),(25,1,'2023-12-28 07:15:53.547972',12,12),(26,1,'2023-12-28 07:15:55.077650',12,13),(27,1,'2023-12-28 07:15:57.434565',12,5),(28,1,'2023-12-28 07:15:58.362779',12,6),(29,1,'2023-12-28 07:16:00.250580',12,7),(30,1,'2023-12-28 07:16:02.258173',12,8),(31,24,'2023-12-29 09:14:58.470190',11,2),(32,1,'2023-12-29 09:15:17.690803',11,11),(33,1,'2023-12-29 09:15:20.693914',11,12),(34,1,'2023-12-29 09:15:22.908285',11,4),(35,1,'2023-12-29 09:15:25.003943',11,5),(36,1,'2023-12-29 09:15:27.122844',11,7),(38,25,'2024-01-05 14:08:39.812914',14,1),(39,2,'2024-01-05 14:08:46.033032',14,4),(40,2,'2024-01-05 14:08:47.464306',14,13),(41,2,'2024-01-05 14:08:48.378080',14,11),(42,2,'2024-01-05 14:08:55.320057',14,6),(43,2,'2024-01-05 14:08:58.508541',14,8),(45,1,'2024-01-06 13:46:58.797702',1,7),(46,1,'2024-01-06 13:47:01.641353',1,10);
/*!40000 ALTER TABLE `webrestaurant_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_product`
--

DROP TABLE IF EXISTS `webrestaurant_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci,
  `active` tinyint(1) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `webrestaurant_produc_category_id_3a668c8a_fk_webrestau` (`category_id`),
  CONSTRAINT `webrestaurant_produc_category_id_3a668c8a_fk_webrestau` FOREIGN KEY (`category_id`) REFERENCES `webrestaurant_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_product`
--

LOCK TABLES `webrestaurant_product` WRITE;
/*!40000 ALTER TABLE `webrestaurant_product` DISABLE KEYS */;
INSERT INTO `webrestaurant_product` VALUES (1,'Bia Larue Smooth',15000.00,'',1,1,'mon1.jpg','2023-07-01 07:12:12.856122'),(2,'Bia Heniken',25000.00,'',1,1,'mon2.jpg','2023-07-01 07:12:12.856122'),(3,'Bia Larue',14000.00,'',1,1,'mon3.jpg','2023-07-01 07:12:12.856122'),(4,'Bia Sài Gòn',14000.00,'',1,1,'mon9_EirobcL.jpg','2023-07-01 07:12:12.856122'),(5,'Bia Sài Gòn Chill',17000.00,'',1,1,'mon10_hTQNw0l.jpg','2023-07-01 07:12:12.856122'),(6,'Bia Budweiser',20000.00,'',1,1,'mon20.png','2023-07-01 07:12:12.856122'),(7,'Rượu Đinh Lăng',300000.00,'',1,1,'mon19.png','2023-07-01 07:12:12.856122'),(8,'Đậu hủ non chà bông',100000.00,'',1,2,'mon35.png','2023-07-01 07:12:12.856122'),(9,'Đậu chiên trứng muối',80000.00,'',1,2,'mon51.jpg','2023-07-01 07:12:12.856122'),(10,'Chả ram tôm đất',120000.00,'',1,2,'mon50.jpg','2023-07-01 07:12:12.856122'),(11,'Gỏi Củ Hủ Dừa',120000.00,'',1,2,'mon11.jpg','2023-12-23 07:29:49.828064'),(12,'Gỏi Ngó Sen',120000.00,'',1,2,'mon12.jpg','2023-12-23 07:43:28.285333'),(13,'Gỏi Bò Bóp Thấu',130000.00,'',1,2,'mon13.jpg','2023-12-23 07:51:23.557521'),(14,'Gỏi Bưởi Tô Mực',100000.00,'',1,2,'mon14.jpg','2023-12-23 07:57:01.901570'),(15,'Miến Trộn Tôm Thịt',80000.00,'',1,2,'mon15.jpg','2023-12-23 07:57:52.466822'),(16,'Cơm chiên trứng',100000.00,'',1,3,'mon33.png','2023-12-26 13:54:09.026130'),(17,'Cơm chiên hải sản',150000.00,'',1,3,'mon32.png','2023-12-27 13:32:14.832065'),(18,'Cơm chiên Dương Châu',130000.00,'',1,3,'mon34.png','2024-01-06 13:01:15.451992'),(19,'Mì xào bò',130000.00,'',1,3,'mon31.png','2024-01-06 13:01:48.684244'),(20,'Mì xào hải sản',130000.00,'',1,3,'mon31.jpg','2024-01-06 13:02:21.666453'),(21,'Cá lóc chiên xù',170000.00,'',1,4,'mon6_nRQo1DX.jpg','2024-01-06 13:04:21.410424'),(22,'Cá hấp bầu',200000.00,'',1,4,'mon5_7zqA6Is.jpg','2024-01-06 13:04:52.535081'),(23,'Cá lóc nướng',170000.00,'',1,4,'mon21.png','2024-01-06 13:05:58.793750'),(24,'Cá lóc kho tộ',170000.00,'',1,4,'mon23.png','2024-01-06 13:06:33.377623'),(25,'Cá chép om dưa',200000.00,'',1,4,'mon24.png','2024-01-06 13:07:04.039562'),(26,'Cá diêu hồng chiên',150000.00,'',1,4,'mon22_0bgFtun.png','2024-01-06 13:08:12.541440'),(27,'Cá mú sashimi',300000.00,'',1,4,'mon26.png','2024-01-06 13:09:24.482721'),(28,'Cá mú sốt ớt',350000.00,'',1,4,'mon25.png','2024-01-06 13:09:47.932556'),(29,'Bò nướng cục',150000.00,'',1,5,'mon28.png','2024-01-06 13:11:03.272817'),(30,'Bò nhúng giấm',200000.00,'',1,5,'mon7_ZNhlxYV.jpg','2024-01-06 13:11:34.916012'),(31,'Bò nhúng ớt',200000.00,'',1,5,'mon27.png','2024-01-06 13:12:01.223823'),(32,'Gà hấp lá chanh',350000.00,'',1,6,'mon29.png','2024-01-06 13:12:45.112411'),(33,'Gà hấp hành',300000.00,'',1,6,'mon30.png','2024-01-06 13:13:07.527567'),(34,'Gà rau răm',320000.00,'',1,6,'mon18.png','2024-01-06 13:13:53.134062'),(35,'Gà chiên mắm',200000.00,'',1,6,'mon52.png','2024-01-06 13:16:48.521782'),(36,'Bạch tuộc nướng',200000.00,'',1,8,'mon43.png','2024-01-06 13:18:17.498542'),(37,'Tôm nướng',200000.00,'',1,8,'mon42.jpg','2024-01-06 13:18:35.008205'),(38,'Tôm ram me',230000.00,'',1,8,'mon45.jpg','2024-01-06 13:19:00.430803'),(39,'Mực chiên tỏi',250000.00,'',1,8,'mon46.jpg','2024-01-06 13:19:19.519657'),(40,'Mực hấp ngũ quả',250000.00,'',1,8,'mon47.png','2024-01-06 13:19:44.173641'),(41,'Lẩu gà lá giang',350000.00,'',1,9,'mon36.png','2024-01-06 13:20:41.995291'),(42,'Lẩu gà ớt hiểm',360000.00,'',1,9,'mon37.png','2024-01-06 13:21:08.713894'),(43,'Lẩu hải sản',300000.00,'',1,9,'mon38.png','2024-01-06 13:21:43.932167'),(44,'Lẩu thập cẩm',320000.00,'',1,9,'mon39.png','2024-01-06 13:22:03.112758'),(45,'Lẩu thái',320000.00,'',1,9,'mon40.jpg','2024-01-06 13:22:40.640775'),(46,'Lẩu cá bớp',370000.00,'',1,9,'mon49.jpg','2024-01-06 13:22:59.042219'),(47,'Lẩu cá thác lác',200000.00,'',1,9,'mon8_D43HU4H.jpg','2024-01-06 13:23:38.738574'),(48,'Nghêu hấp thái',100000.00,'',1,10,'mon48.jpg','2024-01-06 13:24:40.913982'),(49,'Bẹ sữa nướng',150000.00,'',1,10,'mon41.jpg','2024-01-06 13:24:59.704503'),(50,'Trâu gác bếp',400000.00,'',1,11,'mon109.png','2024-01-06 13:26:15.345734'),(51,'Món mới',150000.00,'Món gỏi mới',1,12,'mon15_AeEQPRl_AmjujHg.jpg','2024-01-06 13:56:02.160085');
/*!40000 ALTER TABLE `webrestaurant_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webrestaurant_table`
--

DROP TABLE IF EXISTS `webrestaurant_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webrestaurant_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webrestaurant_table`
--

LOCK TABLES `webrestaurant_table` WRITE;
/*!40000 ALTER TABLE `webrestaurant_table` DISABLE KEYS */;
INSERT INTO `webrestaurant_table` VALUES (1,'Bàn 1','empty'),(2,'Bàn 2','empty'),(3,'Bàn 3','empty'),(4,'Bàn 4','empty'),(5,'Bàn 5','empty'),(6,'Bàn 6','empty'),(7,'Bàn 7','empty'),(8,'Bàn 8','empty'),(9,'Bàn 9','empty'),(10,'Bàn 10','empty'),(11,'Bàn 11','empty'),(12,'Bàn 12','empty'),(13,'Bàn 13','empty'),(14,'Bàn 14','empty'),(15,'Bàn 15','empty'),(16,'Bàn 16','empty'),(17,'Bàn 17','empty'),(18,'Bàn 18','empty'),(19,'Bàn 19','empty'),(20,'Bàn 20','empty');
/*!40000 ALTER TABLE `webrestaurant_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-10 20:06:13
