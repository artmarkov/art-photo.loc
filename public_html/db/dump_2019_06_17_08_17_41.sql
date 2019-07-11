-- MySQL dump 10.13  Distrib 5.6.35, for Linux (x86_64)
--
-- Host: localhost    Database: strav_evphoto
-- ------------------------------------------------------
-- Server version	5.7.21-20-beget-5.7.21-20-1-log

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
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_auth_user` (`user_id`),
  CONSTRAINT `fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `fk_user_id_auth_assignment_table` (`user_id`),
  CONSTRAINT `fk_item_name_auth_assignment_table` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id_auth_assignment_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('administrator',1,1560421175),('administrator',2,1558444463);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `auth_item_type` (`type`),
  KEY `fk_auth_item_table_rule_name` (`rule_name`),
  KEY `fk_auth_item_table_group_code` (`group_code`),
  CONSTRAINT `fk_auth_item_table_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_table_rule_name` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/admin',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/#mediafile',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/*',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/block/*',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/block/default/*',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/block/default/bulk-delete',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/block/default/create',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/block/default/delete',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/block/default/grid-page-size',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/block/default/grid-sort',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/block/default/index',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/block/default/update',3,NULL,NULL,NULL,NULL,1559209398,1559209398),('/admin/carousel/*',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/*',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/bulk-delete',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/create',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/delete',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/grid-page-size',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/grid-sort',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/index',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/update',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/carousel/default/view',3,NULL,NULL,NULL,NULL,1559742738,1559742738),('/admin/comment/*',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/*',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/bulk-activate',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/bulk-delete',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/bulk-spam',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/bulk-trash',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/create',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/delete',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/grid-page-size',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/grid-sort',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/index',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/update',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/comment/default/view',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/dbmanager/*',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/dbmanager/default/*',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/dbmanager/default/delete',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/dbmanager/default/delete-all',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/dbmanager/default/download',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/dbmanager/default/export',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/dbmanager/default/grid-page-size',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/dbmanager/default/import',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/dbmanager/default/index',3,NULL,NULL,NULL,NULL,1560244704,1560244704),('/admin/default/*',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/feedback/*',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/*',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/bulk-activate',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/bulk-delete',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/create',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/delete',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/grid-page-size',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/index',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/update',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/feedback/default/view',3,NULL,NULL,NULL,NULL,1559824424,1559824424),('/admin/media/*',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/*',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/bulk-delete',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/create',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/delete',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/grid-page-size',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/grid-sort',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/index',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/toggle-attribute',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/album/update',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/*',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/bulk-delete',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/create',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/delete',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/grid-page-size',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/grid-sort',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/index',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/toggle-attribute',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/category/update',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/default/*',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/default/index',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/default/settings',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/manage/delete',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/manage/index',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/manage/info',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/manage/resize',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/manage/update',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/manage/upload',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/media/manage/uploader',3,NULL,NULL,NULL,NULL,1557911765,1557911765),('/admin/mediamanager/*',3,NULL,NULL,NULL,NULL,1557911788,1557911788),('/admin/mediamanager/default/add-media',3,NULL,NULL,NULL,NULL,1557911788,1557911788),('/admin/mediamanager/default/remove-media',3,NULL,NULL,NULL,NULL,1557911788,1557911788),('/admin/mediamanager/default/sort-media',3,NULL,NULL,NULL,NULL,1557911788,1557911788),('/admin/menu/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/bulk-delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/create',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/grid-page-size',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/grid-sort',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/update',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/default/view',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/bulk-delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/create',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/grid-page-size',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/grid-sort',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/update',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/menu/link/view',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/page/*',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/*',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/bulk-activate',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/bulk-delete',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/create',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/delete',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/grid-page-size',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/grid-sort',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/index',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/update',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/page/default/view',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/parallax/*',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/*',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/bulk-activate',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/bulk-delete',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/create',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/delete',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/grid-page-size',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/grid-sort',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/index',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/update',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/parallax/default/view',3,NULL,NULL,NULL,NULL,1559812531,1559812531),('/admin/portfolio/*',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/*',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/bulk-activate',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/bulk-deactivate',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/bulk-delete',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/create',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/delete',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/grid-page-size',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/grid-sort',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/index',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/category/update',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/*',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/bulk-delete',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/create',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/delete',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/grid-page-size',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/grid-sort',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/index',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/paste-link',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/update',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/default/view',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/*',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/bulk-activate',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/bulk-deactivate',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/bulk-delete',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/create',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/delete',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/grid-page-size',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/grid-sort',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/index',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/portfolio/menu/update',3,NULL,NULL,NULL,NULL,1558684546,1558684546),('/admin/post/*',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/*',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/bulk-delete',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/create',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/delete',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/grid-page-size',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/grid-sort',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/index',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/toggle-attribute',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/category/update',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/*',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/bulk-activate',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/bulk-delete',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/create',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/delete',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/grid-page-size',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/grid-sort',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/index',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/update',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/default/view',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/*',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/bulk-delete',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/create',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/delete',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/grid-page-size',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/grid-sort',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/index',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/toggle-attribute',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/post/tag/update',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/seo/*',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/seo/default/*',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/seo/default/bulk-delete',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/seo/default/create',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/seo/default/delete',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/seo/default/grid-page-size',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/seo/default/grid-sort',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/seo/default/index',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/seo/default/update',3,NULL,NULL,NULL,NULL,1557911771,1557911771),('/admin/settings/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/settings/cache/flush',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/settings/default/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/settings/default/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/settings/reading/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/site/index',3,NULL,NULL,NULL,NULL,1557911763,1557911763),('/admin/slides/*',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/*',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/bulk-activate',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/bulk-delete',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/copy',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/create',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/delete',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/grid-page-size',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/grid-sort',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/index',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/update',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/default/view',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/slides-layers/*',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/slides-layers/create-layers',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/slides-layers/init-layers',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/slides-layers/remove',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/slides/slides-layers/update-layers',3,NULL,NULL,NULL,NULL,1559902227,1559902227),('/admin/translation/*',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/translation/default/*',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/translation/default/index',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/translation/source/*',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/translation/source/create',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/translation/source/delete',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/translation/source/update',3,NULL,NULL,NULL,NULL,1557911766,1557911766),('/admin/user/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/bulk-activate',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/bulk-delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/change-password',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/create',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/grid-page-size',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/grid-sort',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/default/update',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission-groups/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission-groups/bulk-delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission-groups/create',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission-groups/delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission-groups/grid-page-size',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission-groups/grid-sort',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission-groups/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission-groups/update',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/bulk-delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/create',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/grid-page-size',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/grid-sort',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/refresh-routes',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/set-child-permissions',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/set-child-routes',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/update',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/permission/view',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/bulk-delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/create',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/delete',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/grid-page-size',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/grid-sort',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/set-child-permissions',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/set-child-roles',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/update',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/role/view',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/user-permission/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/user-permission/set',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/user-permission/set-roles',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/visit-log/*',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/visit-log/grid-page-size',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/visit-log/grid-sort',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/visit-log/index',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('/admin/user/visit-log/view',3,NULL,NULL,NULL,NULL,1557911764,1557911764),('addMediaManager',2,'Add Media',NULL,'mediaManagement',NULL,1557911788,1557911788),('administrator',1,'Administrator',NULL,NULL,NULL,1557911763,1557911763),('assignRolesToUsers',2,'Assign Roles To Users',NULL,'userManagement',NULL,1557911764,1557911764),('author',1,'Author',NULL,NULL,NULL,1557911763,1557911763),('bindUserToIp',2,'Bind User To IP',NULL,'userManagement',NULL,1557911764,1557911764),('changeGeneralSettings',2,'Change General Settings',NULL,'settings',NULL,1557911764,1557911764),('changeOwnPassword',2,'Change Own Password',NULL,'userCommonPermissions',NULL,1557911763,1557911763),('changeReadingSettings',2,'Change Reading Settings',NULL,'settings',NULL,1557911764,1557911764),('changeUserPassword',2,'Change User Password',NULL,'userManagement',NULL,1557911764,1557911764),('commonPermission',2,'Common Permission',NULL,'userCommonPermissions',NULL,1557911763,1557911763),('createBlocks',2,'Create Blocks',NULL,'blockManagement',NULL,1559209398,1559209398),('createCarousels',2,'Create Carousels',NULL,'carouselManagement',NULL,1559742738,1559742738),('createComments',2,'Create Comments',NULL,'commentManagement',NULL,1557911765,1557911765),('createFeedbacks',2,'Create Feedbacks',NULL,'feedbackManagement',NULL,1559824424,1559824424),('createMediaAlbums',2,'Create Media Albums',NULL,'mediaManagement',NULL,1557911765,1557911765),('createMediaCategories',2,'Create Media Categories',NULL,'mediaManagement',NULL,1557911765,1557911765),('createMenuLinks',2,'Create Menu Links',NULL,'menuManagement',NULL,1557911764,1557911764),('createMenus',2,'Create Menus',NULL,'menuManagement',NULL,1557911764,1557911764),('createPages',2,'Create Pages',NULL,'pageManagement',NULL,1557911766,1557911766),('createParallaxes',2,'Create Parallaxes',NULL,'parallaxManagement',NULL,1559812531,1559812531),('createPortfolioCategories',2,'Create Portfolio Categories',NULL,'portfolioManagement',NULL,1558684546,1558684546),('createPortfolioMenu',2,'Create Portfolio Menu',NULL,'portfolioManagement',NULL,1558684546,1558684546),('createPortfolios',2,'Create Portfolios',NULL,'portfolioManagement',NULL,1558684546,1558684546),('createPostCategories',2,'Create Post Categories',NULL,'postManagement',NULL,1557911763,1557911763),('createPosts',2,'Create Posts',NULL,'postManagement',NULL,1557911763,1557911763),('createPostTags',2,'Create Post Tags',NULL,'postManagement',NULL,1557911763,1557911763),('createSeo',2,'Create SEO Records',NULL,'seoManagement',NULL,1557911771,1557911771),('createSlides',2,'Create Slides',NULL,'slidesManagement',NULL,1559902227,1559902227),('createSourceMessages',2,'Create Source Messages',NULL,'translations',NULL,1557911766,1557911766),('createUsers',2,'Create Users',NULL,'userManagement',NULL,1557911764,1557911764),('deleteBlocks',2,'Delete Blocks',NULL,'blockManagement',NULL,1559209398,1559209398),('deleteCarousels',2,'Delete Carousels',NULL,'carouselManagement',NULL,1559742738,1559742738),('deleteComments',2,'Delete Comments',NULL,'commentManagement',NULL,1557911765,1557911765),('deleteDb',2,'Delete Db',NULL,'dbManagement',NULL,1560244704,1560244704),('deleteFeedbacks',2,'Delete Feedbacks',NULL,'feedbackManagement',NULL,1559824424,1559824424),('deleteMedia',2,'Delete Media',NULL,'mediaManagement',NULL,1557911765,1557911765),('deleteMediaAlbums',2,'Delete Media Albums',NULL,'mediaManagement',NULL,1557911765,1557911765),('deleteMediaCategories',2,'Delete Media Categories',NULL,'mediaManagement',NULL,1557911765,1557911765),('deleteMenuLinks',2,'Delete Menu Links',NULL,'menuManagement',NULL,1557911764,1557911764),('deleteMenus',2,'Delete Menus',NULL,'menuManagement',NULL,1557911764,1557911764),('deletePages',2,'Delete Pages',NULL,'pageManagement',NULL,1557911766,1557911766),('deleteParallaxes',2,'Delete Parallaxes',NULL,'parallaxManagement',NULL,1559812531,1559812531),('deletePortfolioCategories',2,'Delete Portfolio Categories',NULL,'portfolioManagement',NULL,1558684546,1558684546),('deletePortfolioMenu',2,'Delete Portfolio Menu',NULL,'portfolioManagement',NULL,1558684546,1558684546),('deletePortfolios',2,'Delete Portfolios',NULL,'portfolioManagement',NULL,1558684546,1558684546),('deletePostCategories',2,'Delete Post Categories',NULL,'postManagement',NULL,1557911763,1557911763),('deletePosts',2,'Delete Posts',NULL,'postManagement',NULL,1557911763,1557911763),('deletePostTags',2,'Delete Post Tags',NULL,'postManagement',NULL,1557911763,1557911763),('deleteSeo',2,'Delete SEO Records',NULL,'seoManagement',NULL,1557911771,1557911771),('deleteSlides',2,'Delete Slides',NULL,'slidesManagement',NULL,1559902227,1559902227),('deleteSourceMessages',2,'Delete Source Messages',NULL,'translations',NULL,1557911766,1557911766),('deleteUsers',2,'Delete Users',NULL,'userManagement',NULL,1557911764,1557911764),('downloadDb',2,'Download Db',NULL,'dbManagement',NULL,1560244704,1560244704),('editBlocks',2,'Edit Blocks',NULL,'blockManagement',NULL,1559209398,1559209398),('editCarousels',2,'Edit Carousels',NULL,'carouselManagement',NULL,1559742738,1559742738),('editComments',2,'Edit Comments',NULL,'commentManagement',NULL,1557911765,1557911765),('editFeedbacks',2,'Edit Feedbacks',NULL,'feedbackManagement',NULL,1559824424,1559824424),('editMedia',2,'Edit Media',NULL,'mediaManagement',NULL,1557911765,1557911765),('editMediaAlbums',2,'Edit Media Albums',NULL,'mediaManagement',NULL,1557911765,1557911765),('editMediaCategories',2,'Edit Media Categories',NULL,'mediaManagement',NULL,1557911765,1557911765),('editMediaSettings',2,'Edit Media Settings',NULL,'mediaManagement',NULL,1557911765,1557911765),('editMenuLinks',2,'Edit Menu Links',NULL,'menuManagement',NULL,1557911764,1557911764),('editMenus',2,'Edit Menus',NULL,'menuManagement',NULL,1557911764,1557911764),('editPages',2,'Edit Pages',NULL,'pageManagement',NULL,1557911766,1557911766),('editParallaxes',2,'Edit Parallaxes',NULL,'parallaxManagement',NULL,1559812531,1559812531),('editPortfolioCategories',2,'Edit Portfolio Categories',NULL,'portfolioManagement',NULL,1558684546,1558684546),('editPortfolioMenu',2,'Edit Portfolio Menu',NULL,'portfolioManagement',NULL,1558684546,1558684546),('editPortfolios',2,'Edit Portfolios',NULL,'portfolioManagement',NULL,1558684546,1558684546),('editPostCategories',2,'Edit Post Categories',NULL,'postManagement',NULL,1557911763,1557911763),('editPosts',2,'Edit Posts',NULL,'postManagement',NULL,1557911763,1557911763),('editPostTags',2,'Edit Post Tags',NULL,'postManagement',NULL,1557911763,1557911763),('editSeo',2,'Edit SEO Records',NULL,'seoManagement',NULL,1557911771,1557911771),('editSlides',2,'Edit Slides',NULL,'slidesManagement',NULL,1559902227,1559902227),('editUserEmail',2,'Edit User Email',NULL,'userManagement',NULL,1557911764,1557911764),('editUsers',2,'Edit Users',NULL,'userManagement',NULL,1557911764,1557911764),('exportDb',2,'Export Db',NULL,'dbManagement',NULL,1560244704,1560244704),('flushCache',2,'Flush Cache',NULL,'settings',NULL,1557911764,1557911764),('fullBlockAccess',2,'Full Block Access',NULL,'blockManagement',NULL,1559209398,1559209398),('fullCarouselAccess',2,'Full Carousel Access',NULL,'carouselManagement',NULL,1559742738,1559742738),('fullFeedbackAccess',2,'Full Feedback Access',NULL,'feedbackManagement',NULL,1559824424,1559824424),('fullMediaAccess',2,'Full Media Access',NULL,'mediaManagement',NULL,1557911765,1557911765),('fullMediaAlbumAccess',2,'Full Media Albums Access',NULL,'mediaManagement',NULL,1557911765,1557911765),('fullMediaCategoryAccess',2,'Full Media Categories Access',NULL,'mediaManagement',NULL,1557911765,1557911765),('fullMenuAccess',2,'Full Menu Access',NULL,'menuManagement',NULL,1557911764,1557911764),('fullMenuLinkAccess',2,'Full Menu Links Access',NULL,'menuManagement',NULL,1557911764,1557911764),('fullPageAccess',2,'Full Page Access',NULL,'pageManagement',NULL,1557911766,1557911766),('fullParallaxAccess',2,'Full Parallax Access',NULL,'parallaxManagement',NULL,1559812531,1559812531),('fullPortfolioAccess',2,'Full Portfolio Access',NULL,'portfolioManagement',NULL,1558684546,1558684546),('fullPortfolioCategoryAccess',2,'Full Portfolio Categories Access',NULL,'portfolioManagement',NULL,1558684546,1558684546),('fullPortfolioMenuAccess',2,'Full Portfolio Menu Access',NULL,'portfolioManagement',NULL,1558684546,1558684546),('fullPostAccess',2,'Full Post Access',NULL,'postManagement',NULL,1557911763,1557911763),('fullPostCategoryAccess',2,'Full Post Categories Access',NULL,'postManagement',NULL,1557911763,1557911763),('fullPostTagAccess',2,'Full Post Tags Access',NULL,'postManagement',NULL,1557911763,1557911763),('fullSeoAccess',2,'Full SEO Records Access',NULL,'seoManagement',NULL,1557911771,1557911771),('fullSlidesAccess',2,'Full Slides Access',NULL,'slidesManagement',NULL,1559902227,1559902227),('importDb',2,'Import Db',NULL,'dbManagement',NULL,1560244704,1560244704),('manageRolesAndPermissions',2,'Manage Roles And Permissions',NULL,'userManagement',NULL,1557911764,1557911764),('moderator',1,'Moderator',NULL,NULL,NULL,1557911763,1557911763),('removeMediaManager',2,'Remove Media',NULL,'mediaManagement',NULL,1557911788,1557911788),('sortMediaManager',2,'Sort Media',NULL,'mediaManagement',NULL,1557911788,1557911788),('updateImmutableSourceMessages',2,'Update Immutable Source Messages',NULL,'translations',NULL,1557911766,1557911766),('updateSourceMessages',2,'Update Source Messages',NULL,'translations',NULL,1557911766,1557911766),('updateTranslations',2,'Update Message Translations',NULL,'translations',NULL,1557911766,1557911766),('uploadMedia',2,'Upload Media',NULL,'mediaManagement',NULL,1557911765,1557911765),('user',1,'User',NULL,NULL,NULL,1557911763,1557911763),('viewBlocks',2,'View Blocks',NULL,'blockManagement',NULL,1559209398,1559209398),('viewCarousels',2,'View Carousels',NULL,'carouselManagement',NULL,1559742738,1559742738),('viewComments',2,'View Comments',NULL,'commentManagement',NULL,1557911765,1557911765),('viewDashboard',2,'View Dashboard',NULL,'dashboard',NULL,1557911763,1557911763),('viewDb',2,'View Db',NULL,'dbManagement',NULL,1560244704,1560244704),('viewFeedbacks',2,'View Feedbacks',NULL,'feedbackManagement',NULL,1559824424,1559824424),('viewMedia',2,'View Media',NULL,'mediaManagement',NULL,1557911765,1557911765),('viewMediaAlbums',2,'View Media Albums',NULL,'mediaManagement',NULL,1557911765,1557911765),('viewMediaCategories',2,'View Media Categories',NULL,'mediaManagement',NULL,1557911765,1557911765),('viewMenuLinks',2,'View Menu Links',NULL,'menuManagement',NULL,1557911764,1557911764),('viewMenus',2,'View Menus',NULL,'menuManagement',NULL,1557911764,1557911764),('viewPages',2,'View Pages',NULL,'pageManagement',NULL,1557911766,1557911766),('viewParallaxes',2,'View Parallaxes',NULL,'parallaxManagement',NULL,1559812531,1559812531),('viewPortfolioCategories',2,'View Portfolios Categories',NULL,'portfolioManagement',NULL,1558684546,1558684546),('viewPortfolioMenu',2,'View Menu',NULL,'portfolioManagement',NULL,1558684546,1558684546),('viewPortfolios',2,'View Portfolios',NULL,'portfolioManagement',NULL,1558684546,1558684546),('viewPostCategories',2,'View Posts Categories',NULL,'postManagement',NULL,1557911763,1557911763),('viewPosts',2,'View Posts',NULL,'postManagement',NULL,1557911763,1557911763),('viewPostTags',2,'View Tags',NULL,'postManagement',NULL,1557911763,1557911763),('viewRegistrationIp',2,'View Registration IP',NULL,'userManagement',NULL,1557911764,1557911764),('viewRolesAndPermissions',2,'View Roles And Permissions',NULL,'userManagement',NULL,1557911764,1557911764),('viewSeo',2,'View SEO Records',NULL,'seoManagement',NULL,1557911771,1557911771),('viewSlides',2,'View Slides',NULL,'slidesManagement',NULL,1559902227,1559902227),('viewTranslations',2,'View Message Translations',NULL,'translations',NULL,1557911766,1557911766),('viewUserEmail',2,'View User Email',NULL,'userManagement',NULL,1557911764,1557911764),('viewUserRoles',2,'View User Roles',NULL,'userManagement',NULL,1557911764,1557911764),('viewUsers',2,'View Users',NULL,'userManagement',NULL,1557911764,1557911764),('viewVisitLog',2,'View Visit Logs',NULL,'userManagement',NULL,1557911764,1557911764);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `fk_child_auth_item_child_table` (`child`),
  CONSTRAINT `fk_child_auth_item_child_table` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_parent_auth_item_child_table` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('viewDashboard','/admin'),('viewMedia','/admin/#mediafile'),('deleteBlocks','/admin/block/default/bulk-delete'),('createBlocks','/admin/block/default/create'),('deleteBlocks','/admin/block/default/delete'),('viewBlocks','/admin/block/default/grid-page-size'),('viewBlocks','/admin/block/default/grid-sort'),('viewBlocks','/admin/block/default/index'),('editBlocks','/admin/block/default/update'),('deleteCarousels','/admin/carousel/default/bulk-delete'),('createCarousels','/admin/carousel/default/create'),('deleteCarousels','/admin/carousel/default/delete'),('viewCarousels','/admin/carousel/default/grid-page-size'),('viewCarousels','/admin/carousel/default/grid-sort'),('viewCarousels','/admin/carousel/default/index'),('editCarousels','/admin/carousel/default/update'),('viewCarousels','/admin/carousel/default/view'),('editComments','/admin/comment/default/bulk-activate'),('editComments','/admin/comment/default/bulk-deactivate'),('deleteComments','/admin/comment/default/bulk-delete'),('editComments','/admin/comment/default/bulk-spam'),('editComments','/admin/comment/default/bulk-trash'),('createComments','/admin/comment/default/create'),('deleteComments','/admin/comment/default/delete'),('viewComments','/admin/comment/default/grid-page-size'),('viewComments','/admin/comment/default/grid-sort'),('viewComments','/admin/comment/default/index'),('editComments','/admin/comment/default/toggle-attribute'),('editComments','/admin/comment/default/update'),('viewComments','/admin/comment/default/view'),('deleteDb','/admin/dbmanager/default/delete'),('deleteDb','/admin/dbmanager/default/delete-all'),('downloadDb','/admin/dbmanager/default/download'),('exportDb','/admin/dbmanager/default/export'),('viewDb','/admin/dbmanager/default/grid-page-size'),('importDb','/admin/dbmanager/default/import'),('viewDb','/admin/dbmanager/default/index'),('editFeedbacks','/admin/feedback/default/bulk-activate'),('editFeedbacks','/admin/feedback/default/bulk-deactivate'),('deleteFeedbacks','/admin/feedback/default/bulk-delete'),('createFeedbacks','/admin/feedback/default/create'),('deleteFeedbacks','/admin/feedback/default/delete'),('viewFeedbacks','/admin/feedback/default/grid-page-size'),('viewFeedbacks','/admin/feedback/default/index'),('editFeedbacks','/admin/feedback/default/update'),('viewFeedbacks','/admin/feedback/default/view'),('deleteMediaAlbums','/admin/media/album/bulk-delete'),('createMediaAlbums','/admin/media/album/create'),('deleteMediaAlbums','/admin/media/album/delete'),('viewMediaAlbums','/admin/media/album/grid-page-size'),('viewMediaAlbums','/admin/media/album/grid-sort'),('viewMediaAlbums','/admin/media/album/index'),('editMediaAlbums','/admin/media/album/toggle-attribute'),('editMediaAlbums','/admin/media/album/update'),('deleteMediaCategories','/admin/media/category/bulk-delete'),('createMediaCategories','/admin/media/category/create'),('deleteMediaCategories','/admin/media/category/delete'),('viewMediaCategories','/admin/media/category/grid-page-size'),('viewMediaCategories','/admin/media/category/grid-sort'),('viewMediaCategories','/admin/media/category/index'),('editMediaCategories','/admin/media/category/toggle-attribute'),('editMediaCategories','/admin/media/category/update'),('viewMedia','/admin/media/default/index'),('editMediaSettings','/admin/media/default/settings'),('deleteMedia','/admin/media/manage/delete'),('viewMedia','/admin/media/manage/index'),('viewMedia','/admin/media/manage/info'),('editMediaSettings','/admin/media/manage/resize'),('editMedia','/admin/media/manage/update'),('uploadMedia','/admin/media/manage/upload'),('uploadMedia','/admin/media/manage/uploader'),('addMediaManager','/admin/mediamanager/default/add-media'),('removeMediaManager','/admin/mediamanager/default/remove-media'),('sortMediaManager','/admin/mediamanager/default/sort-media'),('deleteMenus','/admin/menu/default/bulk-delete'),('createMenus','/admin/menu/default/create'),('deleteMenus','/admin/menu/default/delete'),('viewMenus','/admin/menu/default/grid-page-size'),('viewMenus','/admin/menu/default/grid-sort'),('viewMenus','/admin/menu/default/index'),('editMenus','/admin/menu/default/update'),('viewMenus','/admin/menu/default/view'),('deleteMenuLinks','/admin/menu/link/bulk-delete'),('createMenuLinks','/admin/menu/link/create'),('deleteMenuLinks','/admin/menu/link/delete'),('viewMenuLinks','/admin/menu/link/grid-page-size'),('viewMenuLinks','/admin/menu/link/grid-sort'),('viewMenuLinks','/admin/menu/link/index'),('editMenuLinks','/admin/menu/link/update'),('viewMenuLinks','/admin/menu/link/view'),('editPages','/admin/page/default/bulk-activate'),('editPages','/admin/page/default/bulk-deactivate'),('deletePages','/admin/page/default/bulk-delete'),('createPages','/admin/page/default/create'),('deletePages','/admin/page/default/delete'),('viewPages','/admin/page/default/grid-page-size'),('viewPages','/admin/page/default/grid-sort'),('viewPages','/admin/page/default/index'),('editPages','/admin/page/default/toggle-attribute'),('editPages','/admin/page/default/update'),('viewPages','/admin/page/default/view'),('editParallaxes','/admin/parallax/default/bulk-activate'),('editParallaxes','/admin/parallax/default/bulk-deactivate'),('deleteParallaxes','/admin/parallax/default/bulk-delete'),('createParallaxes','/admin/parallax/default/create'),('deleteParallaxes','/admin/parallax/default/delete'),('viewParallaxes','/admin/parallax/default/grid-page-size'),('viewParallaxes','/admin/parallax/default/grid-sort'),('viewParallaxes','/admin/parallax/default/index'),('editParallaxes','/admin/parallax/default/update'),('viewParallaxes','/admin/parallax/default/view'),('editPortfolioCategories','/admin/portfolio/category/bulk-activate'),('editPortfolioCategories','/admin/portfolio/category/bulk-deactivate'),('deletePortfolioCategories','/admin/portfolio/category/bulk-delete'),('createPortfolioCategories','/admin/portfolio/category/create'),('deletePortfolioCategories','/admin/portfolio/category/delete'),('viewPortfolioCategories','/admin/portfolio/category/grid-page-size'),('viewPortfolioCategories','/admin/portfolio/category/grid-sort'),('viewPortfolioCategories','/admin/portfolio/category/index'),('editPortfolioCategories','/admin/portfolio/category/update'),('deletePortfolios','/admin/portfolio/default/bulk-delete'),('createPortfolios','/admin/portfolio/default/create'),('deletePortfolios','/admin/portfolio/default/delete'),('viewPortfolios','/admin/portfolio/default/grid-page-size'),('viewPortfolios','/admin/portfolio/default/grid-sort'),('viewPortfolios','/admin/portfolio/default/index'),('editPortfolios','/admin/portfolio/default/paste-link'),('editPortfolios','/admin/portfolio/default/update'),('viewPortfolios','/admin/portfolio/default/view'),('editPortfolioMenu','/admin/portfolio/menu/bulk-activate'),('editPortfolioMenu','/admin/portfolio/menu/bulk-deactivate'),('deletePortfolioMenu','/admin/portfolio/menu/bulk-delete'),('createPortfolioMenu','/admin/portfolio/menu/create'),('deletePortfolioMenu','/admin/portfolio/menu/delete'),('viewPortfolioMenu','/admin/portfolio/menu/grid-page-size'),('viewPortfolioMenu','/admin/portfolio/menu/grid-sort'),('viewPortfolioMenu','/admin/portfolio/menu/index'),('editPortfolioMenu','/admin/portfolio/menu/update'),('deletePostCategories','/admin/post/category/bulk-delete'),('createPostCategories','/admin/post/category/create'),('deletePostCategories','/admin/post/category/delete'),('viewPostCategories','/admin/post/category/grid-page-size'),('viewPostCategories','/admin/post/category/grid-sort'),('viewPostCategories','/admin/post/category/index'),('editPostCategories','/admin/post/category/toggle-attribute'),('editPostCategories','/admin/post/category/update'),('editPosts','/admin/post/default/bulk-activate'),('editPosts','/admin/post/default/bulk-deactivate'),('deletePosts','/admin/post/default/bulk-delete'),('createPosts','/admin/post/default/create'),('deletePosts','/admin/post/default/delete'),('viewPosts','/admin/post/default/grid-page-size'),('viewPosts','/admin/post/default/grid-sort'),('viewPosts','/admin/post/default/index'),('editPosts','/admin/post/default/toggle-attribute'),('editPosts','/admin/post/default/update'),('viewPosts','/admin/post/default/view'),('deletePostTags','/admin/post/tag/bulk-delete'),('createPostTags','/admin/post/tag/create'),('deletePostTags','/admin/post/tag/delete'),('viewPostTags','/admin/post/tag/grid-page-size'),('viewPostTags','/admin/post/tag/grid-sort'),('viewPostTags','/admin/post/tag/index'),('editPostTags','/admin/post/tag/toggle-attribute'),('editPostTags','/admin/post/tag/update'),('deleteSeo','/admin/seo/default/bulk-delete'),('createSeo','/admin/seo/default/create'),('deleteSeo','/admin/seo/default/delete'),('viewSeo','/admin/seo/default/grid-page-size'),('viewSeo','/admin/seo/default/grid-sort'),('viewSeo','/admin/seo/default/index'),('editSeo','/admin/seo/default/update'),('flushCache','/admin/settings/cache/flush'),('changeGeneralSettings','/admin/settings/default/index'),('changeReadingSettings','/admin/settings/reading/index'),('viewDashboard','/admin/site/index'),('editSlides','/admin/slides/default/bulk-activate'),('editSlides','/admin/slides/default/bulk-deactivate'),('deleteSlides','/admin/slides/default/bulk-delete'),('createSlides','/admin/slides/default/copy'),('createSlides','/admin/slides/default/create'),('deleteSlides','/admin/slides/default/delete'),('viewSlides','/admin/slides/default/grid-page-size'),('viewSlides','/admin/slides/default/grid-sort'),('viewSlides','/admin/slides/default/index'),('editSlides','/admin/slides/default/update'),('viewSlides','/admin/slides/default/view'),('createSlides','/admin/slides/slides-layers/create-layers'),('createSlides','/admin/slides/slides-layers/init-layers'),('deleteSlides','/admin/slides/slides-layers/remove'),('editSlides','/admin/slides/slides-layers/update-layers'),('viewTranslations','/admin/translation/default/index'),('createSourceMessages','/admin/translation/source/create'),('deleteSourceMessages','/admin/translation/source/delete'),('updateSourceMessages','/admin/translation/source/update'),('editUsers','/admin/user/default/bulk-activate'),('editUsers','/admin/user/default/bulk-deactivate'),('deleteUsers','/admin/user/default/bulk-delete'),('changeUserPassword','/admin/user/default/change-password'),('createUsers','/admin/user/default/create'),('deleteUsers','/admin/user/default/delete'),('viewUsers','/admin/user/default/grid-page-size'),('viewUsers','/admin/user/default/grid-sort'),('viewUsers','/admin/user/default/index'),('editUsers','/admin/user/default/toggle-attribute'),('editUsers','/admin/user/default/update'),('manageRolesAndPermissions','/admin/user/permission-groups/bulk-delete'),('manageRolesAndPermissions','/admin/user/permission-groups/create'),('manageRolesAndPermissions','/admin/user/permission-groups/delete'),('viewRolesAndPermissions','/admin/user/permission-groups/grid-page-size'),('viewRolesAndPermissions','/admin/user/permission-groups/grid-sort'),('viewRolesAndPermissions','/admin/user/permission-groups/index'),('manageRolesAndPermissions','/admin/user/permission-groups/update'),('manageRolesAndPermissions','/admin/user/permission/bulk-delete'),('manageRolesAndPermissions','/admin/user/permission/create'),('manageRolesAndPermissions','/admin/user/permission/delete'),('viewRolesAndPermissions','/admin/user/permission/grid-page-size'),('viewRolesAndPermissions','/admin/user/permission/grid-sort'),('viewRolesAndPermissions','/admin/user/permission/index'),('manageRolesAndPermissions','/admin/user/permission/refresh-routes'),('manageRolesAndPermissions','/admin/user/permission/set-child-permissions'),('manageRolesAndPermissions','/admin/user/permission/set-child-routes'),('manageRolesAndPermissions','/admin/user/permission/update'),('manageRolesAndPermissions','/admin/user/permission/view'),('manageRolesAndPermissions','/admin/user/role/bulk-delete'),('manageRolesAndPermissions','/admin/user/role/create'),('manageRolesAndPermissions','/admin/user/role/delete'),('viewRolesAndPermissions','/admin/user/role/grid-page-size'),('viewRolesAndPermissions','/admin/user/role/grid-sort'),('viewRolesAndPermissions','/admin/user/role/index'),('manageRolesAndPermissions','/admin/user/role/set-child-permissions'),('manageRolesAndPermissions','/admin/user/role/set-child-roles'),('manageRolesAndPermissions','/admin/user/role/update'),('manageRolesAndPermissions','/admin/user/role/view'),('assignRolesToUsers','/admin/user/user-permission/set'),('assignRolesToUsers','/admin/user/user-permission/set-roles'),('viewVisitLog','/admin/user/visit-log/grid-page-size'),('viewVisitLog','/admin/user/visit-log/grid-sort'),('viewVisitLog','/admin/user/visit-log/index'),('viewVisitLog','/admin/user/visit-log/view'),('author','addMediaManager'),('administrator','assignRolesToUsers'),('administrator','author'),('moderator','author'),('administrator','bindUserToIp'),('administrator','changeGeneralSettings'),('user','changeOwnPassword'),('administrator','changeReadingSettings'),('administrator','changeUserPassword'),('user','commonPermission'),('administrator','createBlocks'),('author','createCarousels'),('moderator','createComments'),('author','createFeedbacks'),('author','createMediaAlbums'),('moderator','createMediaCategories'),('administrator','createMenuLinks'),('administrator','createMenus'),('administrator','createPages'),('author','createParallaxes'),('moderator','createPortfolioCategories'),('moderator','createPortfolioMenu'),('author','createPortfolios'),('moderator','createPostCategories'),('author','createPosts'),('moderator','createPostTags'),('administrator','createSeo'),('author','createSlides'),('administrator','createSourceMessages'),('administrator','createUsers'),('administrator','deleteBlocks'),('moderator','deleteCarousels'),('moderator','deleteComments'),('administrator','deleteDb'),('moderator','deleteFeedbacks'),('administrator','deleteMedia'),('administrator','deleteMediaAlbums'),('administrator','deleteMediaCategories'),('administrator','deleteMenuLinks'),('administrator','deleteMenus'),('administrator','deletePages'),('moderator','deleteParallaxes'),('administrator','deletePortfolioCategories'),('administrator','deletePortfolioMenu'),('moderator','deletePortfolios'),('administrator','deletePostCategories'),('moderator','deletePosts'),('administrator','deletePostTags'),('administrator','deleteSeo'),('moderator','deleteSlides'),('administrator','deleteSourceMessages'),('administrator','deleteUsers'),('administrator','downloadDb'),('administrator','editBlocks'),('author','editCarousels'),('moderator','editComments'),('author','editFeedbacks'),('uploadMedia','editMedia'),('moderator','editMediaAlbums'),('moderator','editMediaCategories'),('administrator','editMenuLinks'),('administrator','editMenus'),('administrator','editPages'),('author','editParallaxes'),('moderator','editPortfolioCategories'),('moderator','editPortfolioMenu'),('author','editPortfolios'),('moderator','editPostCategories'),('author','editPosts'),('moderator','editPostTags'),('administrator','editSeo'),('author','editSlides'),('administrator','editUserEmail'),('administrator','editUsers'),('manageRolesAndPermissions','editUsers'),('administrator','exportDb'),('administrator','flushCache'),('administrator','fullBlockAccess'),('moderator','fullCarouselAccess'),('moderator','fullFeedbackAccess'),('moderator','fullMediaAccess'),('moderator','fullMediaAlbumAccess'),('moderator','fullMediaCategoryAccess'),('administrator','fullMenuAccess'),('administrator','fullMenuLinkAccess'),('administrator','fullPageAccess'),('moderator','fullParallaxAccess'),('moderator','fullPortfolioAccess'),('moderator','fullPortfolioCategoryAccess'),('moderator','fullPortfolioMenuAccess'),('moderator','fullPostAccess'),('moderator','fullPostCategoryAccess'),('moderator','fullPostTagAccess'),('administrator','fullSeoAccess'),('moderator','fullSlidesAccess'),('administrator','importDb'),('administrator','manageRolesAndPermissions'),('administrator','moderator'),('moderator','removeMediaManager'),('addMediaManager','sortMediaManager'),('administrator','updateSourceMessages'),('createSourceMessages','updateSourceMessages'),('deleteSourceMessages','updateSourceMessages'),('updateImmutableSourceMessages','updateSourceMessages'),('administrator','updateTranslations'),('updateSourceMessages','updateTranslations'),('author','uploadMedia'),('administrator','user'),('author','user'),('moderator','user'),('administrator','viewBlocks'),('createBlocks','viewBlocks'),('deleteBlocks','viewBlocks'),('editBlocks','viewBlocks'),('author','viewCarousels'),('createCarousels','viewCarousels'),('deleteCarousels','viewCarousels'),('editCarousels','viewCarousels'),('createComments','viewComments'),('deleteComments','viewComments'),('editComments','viewComments'),('moderator','viewComments'),('author','viewDashboard'),('administrator','viewDb'),('deleteDb','viewDb'),('downloadDb','viewDb'),('exportDb','viewDb'),('importDb','viewDb'),('author','viewFeedbacks'),('createFeedbacks','viewFeedbacks'),('deleteFeedbacks','viewFeedbacks'),('editFeedbacks','viewFeedbacks'),('deleteMedia','viewMedia'),('editMedia','viewMedia'),('editMediaSettings','viewMedia'),('fullMediaAccess','viewMedia'),('uploadMedia','viewMedia'),('createMediaAlbums','viewMediaAlbums'),('deleteMediaAlbums','viewMediaAlbums'),('editMediaAlbums','viewMediaAlbums'),('createMediaCategories','viewMediaCategories'),('deleteMediaCategories','viewMediaCategories'),('editMediaCategories','viewMediaCategories'),('administrator','viewMenuLinks'),('createMenuLinks','viewMenuLinks'),('deleteMenuLinks','viewMenuLinks'),('editMenuLinks','viewMenuLinks'),('fullMenuLinkAccess','viewMenuLinks'),('administrator','viewMenus'),('createMenus','viewMenus'),('deleteMenus','viewMenus'),('editMenus','viewMenus'),('fullMenuAccess','viewMenus'),('viewMenuLinks','viewMenus'),('administrator','viewPages'),('createPages','viewPages'),('deletePages','viewPages'),('editPages','viewPages'),('author','viewParallaxes'),('createParallaxes','viewParallaxes'),('deleteParallaxes','viewParallaxes'),('editParallaxes','viewParallaxes'),('author','viewPortfolioCategories'),('author','viewPortfolioMenu'),('createPortfolioMenu','viewPortfolioMenu'),('deletePortfolioMenu','viewPortfolioMenu'),('editPortfolioMenu','viewPortfolioMenu'),('author','viewPortfolios'),('createPortfolioCategories','viewPortfolios'),('createPortfolios','viewPortfolios'),('deletePortfolioCategories','viewPortfolios'),('deletePortfolios','viewPortfolios'),('editPortfolioCategories','viewPortfolios'),('editPortfolios','viewPortfolios'),('viewPortfolioCategories','viewPortfolios'),('viewPortfolioMenu','viewPortfolios'),('author','viewPostCategories'),('author','viewPosts'),('createPostCategories','viewPosts'),('createPosts','viewPosts'),('deletePostCategories','viewPosts'),('deletePosts','viewPosts'),('editPostCategories','viewPosts'),('editPosts','viewPosts'),('viewPostCategories','viewPosts'),('viewPostTags','viewPosts'),('author','viewPostTags'),('createPostTags','viewPostTags'),('deletePostTags','viewPostTags'),('editPostTags','viewPostTags'),('administrator','viewRegistrationIp'),('administrator','viewRolesAndPermissions'),('manageRolesAndPermissions','viewRolesAndPermissions'),('administrator','viewSeo'),('createSeo','viewSeo'),('deleteSeo','viewSeo'),('editSeo','viewSeo'),('author','viewSlides'),('createSlides','viewSlides'),('deleteSlides','viewSlides'),('editSlides','viewSlides'),('administrator','viewTranslations'),('createSourceMessages','viewTranslations'),('deleteSourceMessages','viewTranslations'),('updateImmutableSourceMessages','viewTranslations'),('updateSourceMessages','viewTranslations'),('updateTranslations','viewTranslations'),('editUserEmail','viewUserEmail'),('moderator','viewUserEmail'),('administrator','viewUserRoles'),('assignRolesToUsers','viewUserRoles'),('viewRolesAndPermissions','viewUserRoles'),('assignRolesToUsers','viewUsers'),('changeUserPassword','viewUsers'),('createUsers','viewUsers'),('deleteUsers','viewUsers'),('editUsers','viewUsers'),('manageRolesAndPermissions','viewUsers'),('moderator','viewUsers'),('viewRolesAndPermissions','viewUsers'),('viewVisitLog','viewUsers'),('administrator','viewVisitLog');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_group`
--

DROP TABLE IF EXISTS `auth_item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_group`
--

LOCK TABLES `auth_item_group` WRITE;
/*!40000 ALTER TABLE `auth_item_group` DISABLE KEYS */;
INSERT INTO `auth_item_group` VALUES ('blockManagement','Block Management',1559209398,1559209398),('carouselManagement','Carousel Management',1559742738,1559742738),('commentManagement','Comment Management',1557911765,1557911765),('dashboard','Dashboard',1557911763,1557911763),('dbManagement','Db Management',1560244704,1560244704),('feedbackManagement','Feedback Management',1559824424,1559824424),('mediaManagement','Media Management',1557911765,1557911765),('menuManagement','Menu Management',1557911764,1557911764),('pageManagement','Page Management',1557911765,1557911765),('parallaxManagement','Parallax Management',1559812531,1559812531),('portfolioManagement','Portfolio Management',1558684546,1558684546),('postManagement','Post Management',1557911763,1557911763),('seoManagement','SEO Management',1557911771,1557911771),('settings','Settings',1557911764,1557911764),('slidesManagement','Slides Management',1559902227,1559902227),('translations','Translations',1557911766,1557911766),('userCommonPermissions','Common Permissions',1557911763,1557911763),('userManagement','User Management',1557911763,1557911763);
/*!40000 ALTER TABLE `auth_item_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `block_slug` (`slug`),
  KEY `fk_block_created_by` (`created_by`),
  KEY `fk_block_updated_by` (`updated_by`),
  CONSTRAINT `fk_block_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_block_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'welcome',1,1559209572,1559219124,1),(2,'dlya-kogo-my-rabotaem',1,1559210037,1559224131,1),(3,'format-raboty-fotostudii',1,1559210222,1559210222,1),(4,'individualnaya-semka',1,1559210372,1559210372,1),(5,'gruppovaya-semka',1,1559210485,1559210530,1),(6,'preimushchestva-nashey-raboty',1,1559210860,1559210860,1),(7,'chto-o-nas-govoryat',1,1559210955,1559211048,1),(8,'obo-mne',1,1559211343,1559224166,1),(9,'prays',1,1559222690,1559223195,1);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_lang`
--

DROP TABLE IF EXISTS `block_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `block_lang_post_id` (`block_id`),
  KEY `block_lang_language` (`language`),
  CONSTRAINT `fk_block_lang` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_lang`
--

LOCK TABLES `block_lang` WRITE;
/*!40000 ALTER TABLE `block_lang` DISABLE KEYS */;
INSERT INTO `block_lang` VALUES (1,1,'ru','Welcome','        <h1 class=\"text-center\">\r\n            <strong>Добро пожаловать</strong> в фотостудию Евгения Туйцына \"Крутые Перцы!\"\r\n        </h1>\r\n\r\n        <h2 class=\"text-center\"><span class=\"uppercase\">Заяви о себе прямо сейчас</span></h2>\r\n\r\n        <div class=\"divider styleColor\"><!-- divider -->\r\n            <i class=\"fa fa-leaf\"></i>\r\n        </div>\r\n\r\n        <p class=\"lead\">Фотостудия <a href=\"\">\"Крутые Перцы\"</a> запечатлит мгновения твоей жизни на высшем уровне!\r\n        </p>'),(2,2,'ru','Для кого мы работаем','<h2><strong class=\"styleColor\">Для кого </strong>мы работаем?</h2>\r\n<ul class=\"list-icon star-o color\">\r\n<li>Мы работаем на свадьбах и юбилеях</li>\r\n<li>Мы делаем выезные сессии по красивым местам</li>\r\n<li>Наши клиенты - наша гордость!</li>\r\n<li>Бла-бла-бла! Бла-бла-бла!</li>\r\n<li>Бла-бла-бла! Бла-бла-бла!</li>\r\n<li>Бла-бла-бла! Бла-бла-бла!</li>\r\n<li>Бла-бла-бла! Бла-бла-бла!</li>\r\n</ul>'),(3,3,'ru','Формат работы фотостудии','<h2>Формат работы фотостудии <strong>\"Крутые Перцы\"</strong></h2>\r\n\r\n                    <p class=\"lead\">Вы заказываете, мы снисаем. Бла-бла-бла! Бла-бла-бла! Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла! Бла-бла-бла! Бла-бла-бла!</p>\r\n                    '),(4,4,'ru','Индивидуальная съемка','<h3><strong>Индивидуальная</strong> съемка</h3>\r\n                            <p>Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! \r\n                            </p>\r\n                            <p>Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла!Бла-бла-бла!</p>\r\n                            <p>Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! </p>'),(5,5,'ru','Групповая  съемка','<h3>Групповая <strong>съемка</strong></h3>\r\n                            <p>Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла!Бла-бла-бла!</p>\r\n                            <p>Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! </p>\r\n                            <p>Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! </p>\r\n                            <p>Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла!Бла-бла-бла!</p>'),(6,6,'ru','Преимущества нашей работы','<h3>Преимущества нашей <strong>работы</strong>:</h3>\r\n                    <ul class=\"list-icon star-o color\">\r\n                        <li>Фотографируем днем и ночью.</li>\r\n                        <li>Бла-бла-бла! Бла-бла-бла!Бла-бла-бла! Бла-бла-бла! Бла-бла-бла!</li>\r\n                        <li>В разных позах</li>\r\n                        <li>Выезжаем к клиенту на его транспорте!</li>\r\n                        <li>Работаем без выходных.</li>\r\n                        <li>Создаем атмосферу праздника.</li>\r\n                        <li>Снимаем детей и животных</li>\r\n                    </ul>'),(7,7,'ru','Что о нас говорят','<h3>Что о нас говорят <strong>клиенты</strong>?</h3>\r\n<p></p>'),(8,8,'ru','Обо мне','<h2>ЗДРАВСТВУЙТЕ!</h2>\r\n<p>Меня зовут Евгений.</p>\r\n<p>Я профессиональный фотограф, с большим опытом работы. Приглашаю Вас ознакомиться с галереей моих работ.</p>\r\n<p>На данном сайте представлены мои работы, такие как: портретная, предметная, репортажная, постановочная, свадебная фотосъёмка а так же Love-Story, фотосьемка детей и семейное фото.</p>\r\n<p>Здесь вы подберёте наиболее подходящий для вас вид фотосъемок.</p>\r\n<p>Работал в таких глянцевых журналах как: In Style, Sanatate, Журнал Здоровье, ESCAPE. Обучался свадебной фотографии при Академии Искусств.</p>\r\n<p>Для меня очень важно делать работу качественно и при этом сохранять чувственность и душевность в каждой фотографии.</p>\r\n<p>Также хочется много...</p>'),(9,9,'ru','Прайс','  <h2><strong>Explore</strong> our pricing</h2>\r\n            <p class=\"lead\"><strong>Find the right solution</strong> - choose us! Consectetur adipisicing elit, ut labore et dolore magna aliqua. Praesent dapibus, neque id cursus faucibus, tortor neque egesaugue, eu vulputate magna eros eu erat.</p>\r\n            \r\n            <!-- FOUR COLUMNS -->\r\n            <div class=\"row pricetable-container\">\r\n\r\n                    <div class=\"col-md-3 price-table\">\r\n                            <h3>START</h3>\r\n                            <p>	\r\n                                    $3.9\r\n                                    <span>Per month</span>\r\n                            </p>\r\n\r\n                            <ul>\r\n                                    <li>12GB Bandwidth</li>\r\n                                    <li>750 MB Storage</li>\r\n                                    <li>3 Domains</li>\r\n                                    <li>Unlimited Subdomains</li>\r\n                                    <li>10 Databases</li>\r\n                                    <li>Free Setup</li>\r\n                            </ul>\r\n                            <a href=\"/site/contact\" class=\"btn btn-primary btn-sm\"><span class=\"uppercase\">записаться</span></a>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-3 price-table popular\">\r\n                            <h3>PREMIUM</h3>\r\n                            <p>	\r\n                                    $3.9\r\n                                    <span>Per month</span>\r\n                            </p>\r\n                            <ul>\r\n                                    <li>12GB Bandwidth</li>\r\n                                    <li>750 MB Storage</li>\r\n                                    <li>3 Domains</li>\r\n                                    <li>Unlimited Subdomains</li>\r\n                                    <li>10 Databases</li>\r\n                                    <li>Free Setup</li>\r\n                            </ul>\r\n                            <a href=\"/site/contact\" class=\"btn btn-primary btn-sm\"><span class=\"uppercase\">записаться</span></a>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-3 price-table\">\r\n                            <h3>PROFESSIONAL</h3>\r\n                            <p>	\r\n                                    $3.9\r\n                                    <span>Per month</span>\r\n                            </p>\r\n                            <ul class=\"pricetable-items\">\r\n                                    <li>12GB Bandwidth</li>\r\n                                    <li>750 MB Storage</li>\r\n                                    <li>3 Domains</li>\r\n                                    <li>Unlimited Subdomains</li>\r\n                                    <li>10 Databases</li>\r\n                                    <li>Free Setup</li>\r\n                            </ul>\r\n                            <a href=\"/site/contact\" class=\"btn btn-primary btn-sm\"><span class=\"uppercase\">записаться</span></a>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-3 price-table\">\r\n                            <h3>ULTIMATE</h3>\r\n                            <p>	\r\n                                    $3.9\r\n                                    <span>Per month</span>\r\n                            </p>\r\n                            <ul>\r\n                                    <li>12GB Bandwidth</li>\r\n                                    <li>750 MB Storage</li>\r\n                                    <li>3 Domains</li>\r\n                                    <li>Unlimited Subdomains</li>\r\n                                    <li>10 Databases</li>\r\n                                    <li>Free Setup</li>\r\n                            </ul>\r\n                            <a href=\"/site/contact\" class=\"btn btn-primary btn-sm\"><span class=\"uppercase\">записаться</span></a>\r\n                    </div>\r\n\r\n            </div>\r\n            <!-- /FOUR COLUMNS -->\r\n\r\n            <div class=\"divider\"><!-- divider -->\r\n                    <i class=\"fa fa-star\"></i>\r\n            </div>\r\n\r\n            <h3>We care about our customers</h3>\r\n            <p>Lorem elementum placerat mi, vel feugiat massa egestas in. Pellentesque id quam eget dolor tincidunt tempor. Sed pulvinar tortor sit amet tortor venenatis ut molestie lacus convallis. Phasellus vulputate congue posuere. Sed a placerat justo. Sed lacinia nulla at purus porta a placerat dui venenatis. Suspendisse sed lacus id urna faucibus pulvinar ut eu mi. Aliquam erat volutpat.</p>\r\n            <p>Praesent est laborum dolo rumes fugats untras. Etha rums ser quidem rerum facilis dolores nemis onis fugats vitaes nemo minima rerums unsers sadips amets.</p>\r\n\r\n            <div class=\"row\">\r\n                    <div class=\"col-md-6\">\r\n                            <ul class=\"list-icon check\">\r\n                                    <li>Nullam id dolor id</li>\r\n                                    <li>Duis mollis, est non commodo</li>\r\n                                    <li>Maecenas sed diam eget</li>\r\n                            </ul>\r\n                    </div>\r\n\r\n                    <div class=\"col-md-6\">\r\n                            <ul class=\"list-icon exclamation-circle color\">\r\n                                    <li>Nullam id dolor id</li>\r\n                                    <li>Duis mollis, est non commodo</li>\r\n                                    <li>Maecenas sed diam eget</li>\r\n                            </ul>\r\n                    </div>\r\n            </div>');
/*!40000 ALTER TABLE `block_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carousel`
--

DROP TABLE IF EXISTS `carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carousel` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL,
  `slug` varchar(127) DEFAULT NULL,
  `items` smallint(2) NOT NULL,
  `single_item` tinyint(1) NOT NULL,
  `navigation` tinyint(1) NOT NULL,
  `pagination` tinyint(1) NOT NULL,
  `transition_style` varchar(127) NOT NULL,
  `auto_play` varchar(127) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `carousel_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `carousel_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carousel`
--

LOCK TABLES `carousel` WRITE;
/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
INSERT INTO `carousel` VALUES (1,'Обо мне','karousel-about',1,1,1,1,'fade','9000',1,1558081697,1560522994,1,1),(2,'Карусель главная','carousel-main',1,1,1,1,'fadeUp','9000',1,1558081825,1559813431,1,1);
/*!40000 ALTER TABLE `carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL DEFAULT '',
  `model_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'null-is not a reply, int-replied comment id',
  `content` text,
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-pending,1-published,2-spam,3-deleted',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `user_ip` varchar(15) DEFAULT NULL,
  `super_parent_id` int(11) DEFAULT NULL COMMENT 'null-has no parent, int-1st level parent id',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_model` (`model`),
  KEY `comment_model_id` (`model`,`model_id`),
  KEY `comment_status` (`status`),
  KEY `comment_reply` (`parent_id`),
  KEY `comment_super_parent_id` (`super_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(127) NOT NULL,
  `business` varchar(127) NOT NULL,
  `content` mediumtext NOT NULL,
  `published_at` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `main_flag` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='отзывы посетителей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Питер Адамс','фотограф','<p>«<em>Выдающаяся фотография – это глубина чувств, а не глубина резкости</em>»</p>',1558051200,1,1,1558085091,1558085091,1,1),(2,'Карл Лагерфельд','фотограф','<p>«<em>Что мне нравится в фотографии, так это то, что в ней пойман момент, который ушел навсегда, который невозможно воспроизвести</em>»</p>',1558051200,1,1,1558085118,1558085118,1,1),(3,'Эллиотт Эрвитт','фотограф','<p>«<em>Ничего не происходит, когда вы сидите у себя дома. Я всегда ношу камеру с собой в любое время ... Я просто снимаю то, что меня интересует в текущий момент»</em></p>',1558051200,1,1,1558085148,1558085148,1,1);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `url` text,
  `size` varchar(127) DEFAULT NULL,
  `thumbs` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_album` (`album_id`),
  KEY `fk_media_created_by` (`created_by`),
  KEY `fk_media_updated_by` (`updated_by`),
  CONSTRAINT `fk_media_album` FOREIGN KEY (`album_id`) REFERENCES `media_album` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,2,'about-1.jpg','image/jpeg','/uploads/2019/05/about-1.jpg','150104','a:3:{s:5:\"small\";s:35:\"/uploads/2019/05/about-1-128x72.jpg\";s:6:\"square\";s:36:\"/uploads/2019/05/about-1-320x320.jpg\";s:6:\"medium\";s:36:\"/uploads/2019/05/about-1-720x480.jpg\";}',1558015517,1558363202,1,1),(2,1,'test-2.jpg','image/jpeg','/uploads/2019/05/test-2.jpg','650147','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-2-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-2-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-2-720x480.jpg\";}',1558015517,1558363202,1,1),(3,1,'test-3.jpg','image/jpeg','/uploads/2019/05/test-3.jpg','1135683','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-3-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-3-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-3-720x480.jpg\";}',1558015518,1558363204,1,1),(4,1,'test-4.jpg','image/jpeg','/uploads/2019/05/test-4.jpg','835757','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-4-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-4-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-4-720x480.jpg\";}',1558015519,1558363205,1,1),(5,1,'test-5.jpg','image/jpeg','/uploads/2019/05/test-5.jpg','348007','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-5-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-5-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-5-720x480.jpg\";}',1558015520,1558363206,1,1),(6,1,'test-1.jpg','image/jpeg','/uploads/2019/05/test-1.jpg','1118221','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-1-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-1-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-1-720x480.jpg\";}',1558015521,1558363207,1,1),(7,1,'test-6.jpg','image/jpeg','/uploads/2019/05/test-6.jpg','1178137','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-6-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-6-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-6-720x480.jpg\";}',1558015523,1558363209,1,1),(8,1,'test-7.jpg','image/jpeg','/uploads/2019/05/test-7.jpg','2499837','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-7-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-7-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-7-720x480.jpg\";}',1558015524,1558363211,1,1),(9,1,'test-8.jpg','image/jpeg','/uploads/2019/05/test-8.jpg','1488571','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-8-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-8-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-8-720x480.jpg\";}',1558015526,1558363212,1,1),(10,1,'test-9.jpg','image/jpeg','/uploads/2019/05/test-9.jpg','354515','a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/test-9-128x72.jpg\";s:6:\"square\";s:35:\"/uploads/2019/05/test-9-320x320.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/05/test-9-720x480.jpg\";}',1558015528,1558363213,1,1),(11,1,'test-10.jpg','image/jpeg','/uploads/2019/05/test-10.jpg','243564','a:3:{s:5:\"small\";s:35:\"/uploads/2019/05/test-10-128x72.jpg\";s:6:\"square\";s:36:\"/uploads/2019/05/test-10-320x320.jpg\";s:6:\"medium\";s:36:\"/uploads/2019/05/test-10-720x480.jpg\";}',1558015528,1558363213,1,1),(12,3,'fon-2.jpg','image/jpeg','/uploads/2019/05/fon-2.jpg','80240','a:3:{s:5:\"small\";s:33:\"/uploads/2019/05/fon-2-128x72.jpg\";s:6:\"square\";s:34:\"/uploads/2019/05/fon-2-320x320.jpg\";s:6:\"medium\";s:34:\"/uploads/2019/05/fon-2-720x480.jpg\";}',1558082522,1558363214,1,1),(13,3,'fon-3.jpg','image/jpeg','/uploads/2019/05/fon-3.jpg','315747','a:3:{s:5:\"small\";s:33:\"/uploads/2019/05/fon-3-128x72.jpg\";s:6:\"square\";s:34:\"/uploads/2019/05/fon-3-320x320.jpg\";s:6:\"medium\";s:34:\"/uploads/2019/05/fon-3-720x480.jpg\";}',1558082524,1558363215,1,1),(14,3,'fon-1.jpg','image/jpeg','/uploads/2019/05/fon-1.jpg','111641','a:3:{s:5:\"small\";s:33:\"/uploads/2019/05/fon-1-128x72.jpg\";s:6:\"square\";s:34:\"/uploads/2019/05/fon-1-320x320.jpg\";s:6:\"medium\";s:34:\"/uploads/2019/05/fon-1-720x480.jpg\";}',1558082525,1558363216,1,1),(15,NULL,'parallax-1.jpg','image/jpeg','/uploads/2019/05/parallax-1.jpg','181856','a:3:{s:5:\"small\";s:38:\"/uploads/2019/05/parallax-1-128x72.jpg\";s:6:\"square\";s:39:\"/uploads/2019/05/parallax-1-320x320.jpg\";s:6:\"medium\";s:39:\"/uploads/2019/05/parallax-1-720x480.jpg\";}',1558084102,1558363217,1,1),(17,NULL,'apparat.png','image/png','/uploads/2019/05/apparat.png','474672','a:3:{s:5:\"small\";s:35:\"/uploads/2019/05/apparat-128x72.png\";s:6:\"square\";s:36:\"/uploads/2019/05/apparat-320x320.png\";s:6:\"medium\";s:36:\"/uploads/2019/05/apparat-720x480.png\";}',1558100769,1558363217,1,1);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_album`
--

DROP TABLE IF EXISTS `media_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_album_slug` (`slug`),
  KEY `media_album_visible` (`visible`),
  KEY `fk_album_category` (`category_id`),
  KEY `fk_media_album_created_by` (`created_by`),
  KEY `fk_media_album_updated_by` (`updated_by`),
  CONSTRAINT `fk_album_category` FOREIGN KEY (`category_id`) REFERENCES `media_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_album_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_album_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_album`
--

LOCK TABLES `media_album` WRITE;
/*!40000 ALTER TABLE `media_album` DISABLE KEYS */;
INSERT INTO `media_album` VALUES (1,1,'Свадебные','wedding','',1,1558015756,1558016607,1,1),(2,2,'Обо мне','about','',1,1558016735,1558016739,1,1),(3,4,'Суперслайдер','superslayder','',1,1558082484,1558448816,1,1);
/*!40000 ALTER TABLE `media_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_album_lang`
--

DROP TABLE IF EXISTS `media_album_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_album_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_album_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_album_lang_language` (`language`),
  KEY `fk_media_album_lang` (`media_album_id`),
  CONSTRAINT `fk_media_album_lang` FOREIGN KEY (`media_album_id`) REFERENCES `media_album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_album_lang`
--

LOCK TABLES `media_album_lang` WRITE;
/*!40000 ALTER TABLE `media_album_lang` DISABLE KEYS */;
INSERT INTO `media_album_lang` VALUES (1,1,'ru','Свадебные',''),(2,2,'ru','Обо мне',''),(3,3,'ru','Суперслайдер','');
/*!40000 ALTER TABLE `media_album_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_category`
--

DROP TABLE IF EXISTS `media_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_category_slug` (`slug`),
  KEY `media_category_visible` (`visible`),
  KEY `fk_media_category_created_by` (`created_by`),
  KEY `fk_media_category_updated_by` (`updated_by`),
  CONSTRAINT `fk_media_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_category`
--

LOCK TABLES `media_category` WRITE;
/*!40000 ALTER TABLE `media_category` DISABLE KEYS */;
INSERT INTO `media_category` VALUES (1,'portfolio','Портфолио','',1,1558015624,1558016424,1,1),(2,'about','Личные фото','',1,1558016479,1558016500,1,1),(3,'photo_main','Фото на главной','',1,1558016567,1558016572,1,1),(4,'fon','Фоны для сайта','',1,1558082093,1558082093,1,1);
/*!40000 ALTER TABLE `media_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_category_lang`
--

DROP TABLE IF EXISTS `media_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_category_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_category_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_category_lang_language` (`language`),
  KEY `fk_media_category_lang` (`media_category_id`),
  CONSTRAINT `fk_media_category_lang` FOREIGN KEY (`media_category_id`) REFERENCES `media_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_category_lang`
--

LOCK TABLES `media_category_lang` WRITE;
/*!40000 ALTER TABLE `media_category_lang` DISABLE KEYS */;
INSERT INTO `media_category_lang` VALUES (1,1,'ru','Портфолио',''),(2,2,'ru','Личные фото',''),(3,3,'ru','Фото на главной',''),(4,4,'ru','Фоны для сайта','');
/*!40000 ALTER TABLE `media_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_lang`
--

DROP TABLE IF EXISTS `media_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_lang_language` (`language`),
  KEY `fk_media_lang` (`media_id`),
  CONSTRAINT `fk_media_lang` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_lang`
--

LOCK TABLES `media_lang` WRITE;
/*!40000 ALTER TABLE `media_lang` DISABLE KEYS */;
INSERT INTO `media_lang` VALUES (1,1,'ru','about-1.jpg','about-1.jpg',''),(2,2,'ru','test-2.jpg','test-2.jpg',''),(3,3,'ru','test-3.jpg','test-3.jpg',''),(4,4,'ru','test-4.jpg','test-4.jpg',''),(5,5,'ru','test-5.jpg','test-5.jpg',''),(6,6,'ru','test-1.jpg','test-1.jpg',''),(7,7,'ru','test-6.jpg','test-6.jpg',''),(8,8,'ru','test-7.jpg','test-7.jpg',''),(9,9,'ru','test-8.jpg','test-8.jpg',''),(10,10,'ru','test-9.jpg','test-9.jpg',''),(11,11,'ru','test-10.jpg','test-10.jpg',''),(12,12,'ru','fon-2.jpg','fon-2.jpg',''),(13,13,'ru','fon-3.jpg','fon-3.jpg',''),(14,14,'ru','fon-1.jpg','fon-1.jpg',''),(15,15,'ru','parallax-1.jpg','parallax-1.jpg',NULL),(17,17,'ru','apparat.png','apparat.png',NULL);
/*!40000 ALTER TABLE `media_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_manager`
--

DROP TABLE IF EXISTS `media_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  `sort` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `media_manager_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_manager`
--

LOCK TABLES `media_manager` WRITE;
/*!40000 ALTER TABLE `media_manager` DISABLE KEYS */;
INSERT INTO `media_manager` VALUES (3,'artsoft\\carousel\\models\\Carousel',2,2,0),(4,'artsoft\\carousel\\models\\Carousel',2,3,1),(6,'artsoft\\carousel\\models\\Carousel',1,2,2),(7,'artsoft\\carousel\\models\\Carousel',1,3,0),(8,'artsoft\\carousel\\models\\Carousel',1,11,1),(9,'artsoft\\carousel\\models\\Carousel',1,7,3);
/*!40000 ALTER TABLE `media_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_upload`
--

DROP TABLE IF EXISTS `media_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `owner_class` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_upload_owner_class` (`owner_class`),
  KEY `media_upload_owner_id` (`owner_id`),
  KEY `fk_media_upload_media_id` (`media_id`),
  CONSTRAINT `fk_media_upload_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_upload`
--

LOCK TABLES `media_upload` WRITE;
/*!40000 ALTER TABLE `media_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_created_by` (`created_by`),
  KEY `fk_menu_updated_by` (`updated_by`),
  CONSTRAINT `fk_menu_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('admin-menu',NULL,NULL,1,NULL),('main-menu',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_lang`
--

DROP TABLE IF EXISTS `menu_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(64) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  PRIMARY KEY (`id`),
  KEY `menu_lang_post_id` (`menu_id`),
  KEY `menu_lang_language` (`language`),
  CONSTRAINT `fk_menu_lang` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_lang`
--

LOCK TABLES `menu_lang` WRITE;
/*!40000 ALTER TABLE `menu_lang` DISABLE KEYS */;
INSERT INTO `menu_lang` VALUES (1,'admin-menu','en-US','Control Panel Menu'),(2,'main-menu','en-US','Main Menu'),(3,'main-menu','ru','Главное Меню'),(4,'admin-menu','ru','Меню Панели Управления');
/*!40000 ALTER TABLE `menu_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_link`
--

DROP TABLE IF EXISTS `menu_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_link` (
  `id` varchar(64) NOT NULL,
  `menu_id` varchar(64) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `parent_id` varchar(64) DEFAULT '',
  `image` varchar(24) DEFAULT NULL,
  `alwaysVisible` int(1) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_menu_id` (`menu_id`),
  KEY `link_parent_id` (`parent_id`),
  KEY `fk_menu_link_created_by` (`created_by`),
  KEY `fk_menu_link_updated_by` (`updated_by`),
  CONSTRAINT `fk_menu_link` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_menu_link_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_link_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_link`
--

LOCK TABLES `menu_link` WRITE;
/*!40000 ALTER TABLE `menu_link` DISABLE KEYS */;
INSERT INTO `menu_link` VALUES ('about','main-menu','/site/about','','',1,1,NULL,1557993742,1,1),('block','admin-menu','/block/default/index','content_management','',0,15,NULL,1559211527,1,1),('carousel','admin-menu','/carousel/default/index','content_management','',0,16,NULL,1559743060,1,1),('comment','admin-menu','/comment/default/index','','comment',0,20,NULL,NULL,1,NULL),('contact','main-menu','/site/contact','',NULL,1,3,NULL,NULL,1,NULL),('content_management','admin-menu','','','sun-o',0,14,1558080425,1558080425,1,1),('dashboard','admin-menu','/site/index','','th',0,0,NULL,1558967667,1,1),('dbmanager','admin-menu','/dbmanager/default/index','settings','',0,34,1560155622,1560155679,1,1),('feedback','admin-menu','/feedback/default/index','content_management','',0,19,1558080577,1559822603,1,1),('home','main-menu','/site/index','',NULL,1,0,NULL,NULL,1,NULL),('image-settings','admin-menu','/media/default/settings','settings',NULL,0,32,NULL,NULL,1,NULL),('media','admin-menu',NULL,'','image',0,6,NULL,NULL,1,NULL),('media-album','admin-menu','/media/album/index','media',NULL,0,8,NULL,NULL,1,NULL),('media-category','admin-menu','/media/category/index','media',NULL,0,9,NULL,NULL,1,NULL),('media-media','admin-menu','/media/default/index','media',NULL,0,7,NULL,NULL,1,NULL),('menu','admin-menu','/menu/default/index','','align-justify',0,21,NULL,NULL,1,NULL),('page','admin-menu','/page/default/index','','file',0,1,NULL,NULL,1,NULL),('paralax','admin-menu','/parallax/default/index','content_management','',0,18,1558080529,1559810545,1,1),('portfolio','admin-menu',NULL,'','film',0,10,NULL,NULL,1,NULL),('portfolio-category','admin-menu','/portfolio/category/index','portfolio',NULL,0,12,NULL,NULL,1,NULL),('portfolio-menu','admin-menu','/portfolio/menu/index','portfolio',NULL,0,13,NULL,NULL,1,NULL),('portfolio-portfolio','admin-menu','/portfolio/default/index','portfolio',NULL,0,11,NULL,NULL,1,NULL),('portfolio_site','main-menu','/site/portfolio','','',1,2,1558941661,1558941661,1,1),('post','admin-menu',NULL,'','pencil',0,2,NULL,NULL,1,NULL),('post-category','admin-menu','/post/category/index','post',NULL,0,4,NULL,NULL,1,NULL),('post-post','admin-menu','/post/default/index','post',NULL,0,3,NULL,NULL,1,NULL),('post-tag','admin-menu','/post/tag/index','post',NULL,0,5,NULL,NULL,1,NULL),('revolution-sliders','admin-menu','/slides/default/index','content_management','',0,17,1558080497,1559895467,1,1),('seo','admin-menu','/seo/default/index','','line-chart',0,28,NULL,NULL,1,NULL),('settings','admin-menu',NULL,'','cog',0,29,NULL,NULL,1,NULL),('settings-cache','admin-menu','/settings/cache/flush','settings',NULL,0,35,NULL,NULL,1,NULL),('settings-general','admin-menu','/settings/default/index','settings',NULL,0,30,NULL,NULL,1,NULL),('settings-reading','admin-menu','/settings/reading/index','settings',NULL,0,31,NULL,NULL,1,NULL),('settings-translations','admin-menu','/translation/default/index','settings',NULL,0,33,NULL,NULL,1,NULL),('user','admin-menu',NULL,'','user',0,22,NULL,NULL,1,NULL),('user-groups','admin-menu','/user/permission-groups/index','user',NULL,0,26,NULL,NULL,1,NULL),('user-log','admin-menu','/user/visit-log/index','user',NULL,0,27,NULL,NULL,1,NULL),('user-permission','admin-menu','/user/permission/index','user',NULL,0,25,NULL,NULL,1,NULL),('user-role','admin-menu','/user/role/index','user',NULL,0,24,NULL,NULL,1,NULL),('user-user','admin-menu','/user/default/index','user',NULL,0,23,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `menu_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_link_lang`
--

DROP TABLE IF EXISTS `menu_link_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_link_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` varchar(64) NOT NULL,
  `language` varchar(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_link_lang_link_id` (`link_id`),
  KEY `menu_link_lang_language` (`language`),
  CONSTRAINT `fk_menu_link_lang` FOREIGN KEY (`link_id`) REFERENCES `menu_link` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_link_lang`
--

LOCK TABLES `menu_link_lang` WRITE;
/*!40000 ALTER TABLE `menu_link_lang` DISABLE KEYS */;
INSERT INTO `menu_link_lang` VALUES (1,'dashboard','en-US','Dashboard'),(2,'settings','en-US','Settings'),(3,'settings-general','en-US','General Settings'),(4,'settings-reading','en-US','Reading Settings'),(5,'settings-cache','en-US','Flush Cache'),(6,'menu','en-US','Menus'),(7,'comment','en-US','Comments'),(8,'user','en-US','Users'),(9,'user-groups','en-US','Permission groups'),(10,'user-log','en-US','Visit log'),(11,'user-permission','en-US','Permissions'),(12,'user-role','en-US','Roles'),(13,'user-user','en-US','Users'),(14,'post','en-US','Posts'),(15,'post-post','en-US','Posts'),(16,'post-category','en-US','Categories'),(17,'media','en-US','Media'),(18,'media-media','en-US','Media'),(19,'media-album','en-US','Albums'),(20,'media-category','en-US','Categories'),(21,'image-settings','en-US','Image Settings'),(22,'page','en-US','Pages'),(23,'settings-translations','en-US','Message Translation'),(24,'seo','en-US','SEO'),(25,'post-tag','en-US','Tags'),(26,'home','en-US','Home'),(27,'about','en-US','About'),(29,'contact','en-US','Contact'),(30,'home','ru','Главная'),(31,'about','ru','Обо мне'),(33,'contact','ru','Контакты'),(34,'comment','ru','Комментарии'),(35,'dashboard','ru','Главная'),(36,'media','ru','Медиа'),(37,'media-media','ru','Медиа'),(38,'media-album','ru','Альбомы'),(39,'media-category','ru','Категории'),(40,'image-settings','ru','Настройки Изображений'),(41,'menu','ru','Меню'),(42,'page','ru','Страницы'),(43,'post','ru','Записи'),(44,'post-post','ru','Записи'),(45,'post-tag','ru','Тэги'),(46,'post-category','ru','Категории'),(47,'settings','ru','Настройки'),(48,'settings-general','ru','Общие Настройки'),(49,'settings-reading','ru','Настройки Чтения'),(50,'settings-cache','ru','Очистить Кэш'),(51,'settings-translations','ru','Перевод Сообщений'),(52,'user','ru','Пользователи'),(53,'user-groups','ru','Группы Прав Доступа'),(54,'user-log','ru','Лог Посещений'),(55,'user-permission','ru','Права Доступа'),(56,'user-role','ru','Роли Пользователей'),(57,'user-user','ru','Пользователи'),(58,'seo','ru','SEO'),(70,'content_management','ru','Управление контентом'),(72,'revolution-sliders','ru','Суперслайдер'),(73,'paralax','ru','УТП Параллакс'),(75,'feedback','ru','Отзывы клиентов'),(80,'portfolio','en-US','Portfolio'),(81,'portfolio-portfolio','en-US','Portfolio Items'),(82,'portfolio-category','en-US','Portfolio Categories'),(83,'portfolio-menu','en-US','Portfolio Menu'),(84,'portfolio','ru','Портфолио'),(85,'portfolio-portfolio','ru','Портфолио содержание'),(86,'portfolio-category','ru','Категории портфолио'),(87,'portfolio-menu','ru','Меню портфолио'),(88,'portfolio_site','ru','Портфолио'),(89,'block','en-US','HTML Blocks'),(90,'block','ru','HTML Блоки'),(91,'carousel','en-US','Carousel'),(92,'carousel','ru','Карусель'),(94,'feedback','ru','Отзывы клиентов'),(96,'dbmanager','ru','Db менеджер');
/*!40000 ALTER TABLE `menu_link_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `language` varchar(16) NOT NULL,
  `translation` text,
  PRIMARY KEY (`id`),
  KEY `message_index` (`source_id`,`language`),
  CONSTRAINT `fk_message_source_message` FOREIGN KEY (`source_id`) REFERENCES `message_source` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,'ru','--- С выбранным ---'),(2,2,'ru','Активировать'),(3,3,'ru','Активные'),(4,4,'ru','Добавить'),(5,5,'ru','Все'),(6,6,'ru','Всегда Видимый'),(7,7,'ru','Произошла неизвестная ошибка.'),(8,128,'ru','Версия Art CMS'),(9,129,'ru','Версия Ядра Art'),(10,8,'ru','Подтверждено'),(11,9,'ru','Автор'),(12,10,'ru','Заблокирован'),(13,11,'ru','Привязка к IP'),(14,12,'ru','День рождения'),(15,13,'ru','Месяц рождения'),(16,14,'ru','Год рождения'),(17,15,'ru','Выбрать'),(18,16,'ru','Браузер'),(19,18,'ru','Отменить'),(20,19,'ru','Категория'),(21,17,'ru','Кэш был сброшен.'),(22,20,'ru','Очистить Фильтры'),(23,21,'ru','Закрыто'),(24,22,'ru','Код'),(25,23,'ru','Статус Комментариев'),(26,24,'ru','Активность Комментариев'),(27,25,'ru','Подтвердить'),(28,26,'ru','Код Подтверждения'),(29,27,'ru','Содержание'),(30,28,'ru','Панель Управления'),(31,29,'ru','Создать {item}'),(32,30,'ru','Создать'),(33,31,'ru','Создал'),(34,32,'ru','Создано'),(35,33,'ru','Панель Управления'),(36,34,'ru','Данные'),(37,35,'ru','Деактивировать'),(38,36,'ru','Язык по умолчанию'),(39,37,'ru','Значение по умолчанию'),(40,38,'ru','Удалить'),(41,39,'ru','Описание'),(42,40,'ru','E-mail подтвержден'),(43,41,'ru','E-mail'),(44,42,'ru','Редактировать'),(45,43,'ru','Ошибка'),(46,44,'ru','Не удалось очистить кэш.'),(47,45,'ru','Женщина'),(48,46,'ru','Имя'),(49,47,'ru','Например'),(50,48,'ru','Пол'),(51,49,'ru','Группа'),(52,50,'ru','ID'),(53,51,'ru','IP'),(54,52,'ru','Иконка'),(55,53,'ru','Неактивные'),(56,54,'ru','Вставить'),(57,55,'ru','Неверные настройки для виджетов панели управления'),(58,56,'ru','Ключ'),(59,57,'ru','Надпись'),(60,58,'ru','Язык'),(61,59,'ru','Фамилия'),(62,60,'ru','ID ссылки может содержать только строчные буквы, цифры, подчеркивание и тире.'),(63,61,'ru','Ссылка'),(64,62,'ru','Логин'),(65,63,'ru','Выйти {username}'),(66,66,'ru','Мужчина'),(67,64,'ru','ID меню может содержать только строчные буквы, цифры, подчеркивание и тире.'),(68,65,'ru','Меню'),(69,67,'ru','Отчество'),(70,68,'ru','Название'),(71,69,'ru','Нет Родительского Элемента'),(72,70,'ru','Комментарии не найдены.'),(73,71,'ru','Не Выбрано'),(74,72,'ru','OK'),(75,73,'ru','ОС'),(76,74,'ru','Открыто'),(77,75,'ru','Порядок'),(78,76,'ru','Версия PHP'),(79,77,'ru','Родительская Ссылка'),(80,78,'ru','Пароль'),(81,79,'ru','Не опубликовано'),(82,80,'ru','Телефон'),(83,81,'ru','Обработка данных'),(84,82,'ru','Опубликовать'),(85,83,'ru','Опубликовано'),(86,84,'ru','Читать дальше'),(87,85,'ru','Последние комментарии'),(88,86,'ru','Записей на странице'),(89,87,'ru','IP Регистрации'),(90,88,'ru','Повторите пароль'),(91,89,'ru','Обязательный'),(92,90,'ru','Ревизия'),(93,91,'ru','Роль'),(94,92,'ru','Роли'),(95,93,'ru','Правило'),(96,94,'ru','Сохранить Все'),(97,95,'ru','Сохранить'),(98,96,'ru','Сохранено'),(99,97,'ru','Настройки'),(100,98,'ru','Краткая информация'),(101,99,'ru','Размер'),(102,101,'ru','Skype'),(103,100,'ru','Ссылка'),(104,102,'ru','Спам'),(105,103,'ru','Старт'),(106,104,'ru','Статус'),(107,105,'ru','Суперадмин'),(108,106,'ru','Подробности Системы'),(109,107,'ru','Изменения были успешно сохранены.'),(110,108,'ru','Этот e-mail уже занят'),(111,109,'ru','Заголовок'),(112,110,'ru','Токен'),(113,111,'ru','Корзина'),(114,112,'ru','Тип'),(115,113,'ru','URL'),(116,114,'ru','Отменить Публикацию'),(117,115,'ru','Обновить \"{item}\"'),(118,116,'ru','Обновить'),(119,117,'ru','Обновил'),(120,118,'ru','Обновлено'),(121,119,'ru','Загружено'),(122,120,'ru','Данные Устройства'),(123,121,'ru','Пользователь'),(124,122,'ru','Имя Пользователя'),(125,123,'ru','Значение'),(126,124,'ru','Просмотр'),(127,125,'ru','Видимый'),(128,126,'ru','Время Посещения'),(129,127,'ru','Неправильный формат. Введите действительные IP-адреса через запятую'),(130,130,'ru','Версия Yii Framework'),(131,131,'ru','Запись успешно обновлена.'),(132,132,'ru','Запись успешно создана.'),(133,133,'ru','Запись успешно удалена.'),(134,134,'ru','Добавить Источник Сообщения'),(135,135,'ru','Категория'),(136,136,'ru','Создать Сообщение'),(137,137,'ru','Создать Новую Категори'),(138,138,'ru','Неизменный'),(139,139,'ru','Перевод Сообщений'),(140,140,'ru','Название Новой Категории'),(141,141,'ru','Выберите группу сообщений и язык для отображения переводов...'),(142,142,'ru','Сообщение'),(143,143,'ru','Обновить Сообщение'),(144,144,'ru','{n, plural, =1{1 запись} other{# записей}}'),(145,145,'ru','Добавить файлы'),(146,146,'ru','Альбом'),(147,147,'ru','Альбомы'),(148,148,'ru','Все Медиа Файлы'),(149,149,'ru','Alt Текст'),(150,150,'ru','Вернуться к файловому менеджеру'),(151,151,'ru','Отменить загрузку'),(152,152,'ru','Категории'),(153,153,'ru','Категория'),(154,154,'ru','Изменения были сохранены.'),(155,155,'ru','Изменения не были сохранены.'),(156,156,'ru','Создать Категорию'),(157,157,'ru','Текущие размеры миниатюр'),(158,158,'ru','Размер'),(159,159,'ru','Перестроить изображения'),(160,160,'ru','Размер файла'),(161,161,'ru','Название файла'),(162,162,'ru','Если вы измените размеры миниатюр, настоятельно рекомендуется перестроить их.'),(163,163,'ru','Настройка изображений'),(164,164,'ru','Большой размер'),(165,165,'ru','Управление альбомами'),(166,166,'ru','Управление Категориями'),(167,167,'ru','Активность Медиа'),(168,168,'ru','Детали'),(169,169,'ru','Медиа'),(170,170,'ru','Средний размер'),(171,171,'ru','Изображения не найдены.'),(172,172,'ru','Оригинал'),(173,173,'ru','Пожалуйста, выберите файл для просмотра деталей.'),(174,174,'ru','Выберите размер файла'),(175,175,'ru','Малый размер'),(176,176,'ru','Извините, [{filetype}] тип файла не разрешен!'),(177,177,'ru','Начать загрузку'),(178,178,'ru','Настройка миниатюр'),(179,179,'ru','Миниатюры успешно сохранены'),(180,180,'ru','Миниатюры'),(181,181,'ru','Обновить Категорию'),(182,182,'ru','Обновил'),(183,183,'ru','Загрузить файл'),(184,184,'ru','Загрузил'),(185,185,'ru','Меню'),(186,186,'ru','Меню'),(187,187,'ru','ID ссылки может содержать только строчные буквы, цифры, подчеркивание и тире.'),(188,188,'ru','Родительская Ссылка'),(189,189,'ru','Всегда Видимый'),(190,190,'ru','Нет Родительской Ссылка'),(191,191,'ru','Создать Ссылку'),(192,192,'ru','Обновить Ссылка'),(193,193,'ru','Ссылки'),(194,194,'ru','Добавить Меню'),(195,195,'ru','Добавить Ссылку'),(196,196,'ru','Ошибка при сохранении меню!'),(197,197,'ru','Изменения были успешно сохранены.'),(198,198,'ru','Пожалуйста, выберите меню для просмотра списка ссылок...'),(199,199,'ru','Выбранное меню не содержит ни одной ссылки. Нажмите кнопку \"Добавить Ссылку\", чтобы создать новую ссылку для этого меню.'),(200,200,'ru','Страница'),(201,201,'ru','Страницы'),(202,202,'ru','Cоздать Страницу'),(203,203,'ru','Категории'),(204,204,'ru','Создать Категорию'),(205,205,'ru','Обновить Категорию'),(206,206,'ru','Создать Тег'),(207,207,'ru','Обновить Тег'),(208,208,'ru','Записи не найдены.'),(209,209,'ru','Публикация'),(210,210,'ru','Опубликовано в'),(211,211,'ru','Активность Записей'),(212,212,'ru','Публикации'),(213,213,'ru','Тег'),(214,214,'ru','Теги'),(215,328,'ru','Создать SEO запись'),(216,329,'ru','Следовать ссылке'),(217,330,'ru','Индексировать'),(218,331,'ru','Ключевые слова'),(219,332,'ru','SEO'),(220,333,'ru','Поисковая оптимизация'),(221,334,'ru','Обновить SEO запись'),(222,215,'ru','Общие Настройки'),(223,216,'ru','Настройки Чтения'),(224,217,'ru','Название Сайта'),(225,218,'ru','Описание Сайта'),(226,219,'ru','E-mail Администратора'),(227,220,'ru','Часовой Пояс'),(228,221,'ru','Формат Даты'),(229,222,'ru','Формат Времени'),(230,223,'ru','Записей на странице'),(231,224,'ru','Телефон Администратора'),(232,225,'ru','Facebook Администратора'),(233,226,'ru','Instagram Администратора'),(234,227,'ru','Маска Телефона'),(235,228,'ru','Маска Даты'),(236,229,'ru','Маска Времени'),(237,230,'ru','Маска Даты и Времени'),(238,231,'ru','Настройки сохранены.'),(239,232,'ru','Включенные права доступа'),(240,233,'ru','Включенные роли'),(241,234,'ru','Создать Группу Прав Доступа'),(242,235,'ru','Создать Право Доступа'),(243,236,'ru','Создать Роль'),(244,237,'ru','Создать Пользователя'),(245,238,'ru','Посещение №{id}'),(246,239,'ru','Пользователей не найдено.'),(247,240,'ru','Пароль'),(248,241,'ru','Группы Прав Доступа'),(249,242,'ru','Прав Доступа'),(250,243,'ru','Права доступа для роли \"{role}\"'),(251,244,'ru','Права доступа'),(252,245,'ru','Обновить пути'),(253,246,'ru','Дата регистрации'),(254,247,'ru','Роль'),(255,248,'ru','Роли и Права доступа для \"{user}\"'),(256,249,'ru','Роли'),(257,250,'ru','Маршруты'),(258,251,'ru','Поиск маршрутов'),(259,252,'ru','Показать все'),(260,253,'ru','Показать только избранные'),(261,254,'ru','Посещение сайта'),(262,255,'ru','Обновить Группу прав доступа'),(263,256,'ru','Обновить право доступа'),(264,257,'ru','Обновить Роль'),(265,258,'ru','Обновить Пароль для \"{user}\"'),(266,259,'ru','Обновить пользователя'),(267,260,'ru','Пользователь не найден'),(268,261,'ru','Пользователь'),(269,262,'ru','Пользователи'),(270,263,'ru','Браузеры пользователей'),(271,264,'ru','Лог Посещения'),(272,265,'ru','Вы не можете изменить собственные права доступа'),(273,266,'ru','Вы не можете изменить собственные права доступа!'),(274,267,'ru','Настройки прав доступа \"{permission}\"'),(275,268,'ru','Настройки роли \"{permission}\"'),(276,269,'ru','Вы уверены, что хотите удалить фотографию?'),(277,270,'ru','Вы уверены, что хотите отменить это разрешение?'),(278,271,'ru','Произошла ошибка аутентификации.'),(279,272,'ru','Авторизация'),(280,273,'ru','Услуги Авторизации'),(281,274,'ru','Captcha'),(282,275,'ru','Изменить изображение профиля'),(283,276,'ru','Проверьте свою электронную почту для получения дальнейших инструкций'),(284,277,'ru','Проверьте свой e-mail {email} для получения инструкций по активации аккаунта'),(285,278,'ru','Нажмите, чтобы подключиться к службе'),(286,279,'ru','Нажмите, чтобы отключить службу'),(287,280,'ru','Подтвердите E-mail'),(288,281,'ru','Подтвердите'),(289,282,'ru','Не удалось отправить подтверждение по электронной почте'),(290,283,'ru','Текущий пароль'),(291,284,'ru','E-mail подтверждение для'),(292,285,'ru','E-mail подтвержден'),(293,286,'ru','E-mail недействителен'),(294,287,'ru','E-mail со ссылкой активации был отправлен на < b>{email}< / b>. Срок действия этой ссылки истекает через {minutes} мин.'),(295,288,'ru','E-mail'),(296,289,'ru','Забыли пароль?'),(297,290,'ru','Перейдите по ссылке ниже, чтобы подтвердить свой E-mail:'),(298,291,'ru','Следуйте ссылке ниже, чтобы сбросить пароль:'),(299,292,'ru','Перейдите по этой ссылке, чтобы подтвердить свой E-mail и активировать аккаунт:'),(300,293,'ru','Здравствуйте, {username}.'),(301,294,'ru','Здравствуйте, вы были зарегистрированы на {host}.'),(302,295,'ru','Неверное имя пользователя или пароль'),(303,296,'ru','Логин был использован'),(304,297,'ru','Вход'),(305,298,'ru','Выход'),(306,299,'ru','Авторизация не доступна'),(307,300,'ru','Пароль был обновлен'),(308,301,'ru','Восстановление пароля'),(309,302,'ru','Сброс пароля для'),(310,303,'ru','Пароль'),(311,304,'ru','Регистрация - подтвердите ваш e-mail'),(312,305,'ru','Регистрация'),(313,306,'ru','Запомнить меня'),(314,307,'ru','Удалить изображение профиля'),(315,308,'ru','Повторить пароль'),(316,309,'ru','Сбросить пароль'),(317,310,'ru','Сбросить'),(318,311,'ru','Сохранить профиль'),(319,312,'ru','Сохранить изображение профиля'),(320,313,'ru','Заполнить пароль'),(321,314,'ru','Заполнить Имя пользователя'),(322,315,'ru','Регистрация'),(323,316,'ru','Этот E-mail уже существует'),(324,317,'ru','Токен не найден. Возможно он истек'),(325,318,'ru','Токен не найден. Срок его действия может истечь. Попробуйте сбросить пароль еще раз'),(326,319,'ru','Слишком много попыток'),(327,320,'ru','Невозможно отправить сообщение по электронной почте'),(328,321,'ru','Обновить пароль'),(329,322,'ru','Профиль Пользователя'),(330,323,'ru','Пользователь с той же электронной почтой, что и в учетной записи {client}, уже существует, но не связан с ней. Войти с помощью электронной почты, чтобы связать его.'),(331,324,'ru','Имя пользователя должно содержать только латинские буквы, цифры и следующие символы: \"_\".'),(332,325,'ru','Имя пользователя содержит недопустимые символы или слова.'),(333,326,'ru','Неверный пароль'),(334,327,'ru','Вы не можете войти с этого IP'),(335,335,'ru','Сохранить порядок'),(336,336,'ru','Фото не найдено.'),(337,337,'ru','Ваша фотография успешно удалена.'),(338,338,'ru','Порядок сохранен.'),(345,345,'ru','Ссылка на действие'),(346,346,'ru','Категория портфолио'),(347,347,'ru','Портфолио'),(348,348,'ru','Меню портфолио'),(349,349,'ru','Выберите Категории...'),(350,350,'ru','Миниатюра'),(351,351,'ru','HTML Блок'),(352,352,'ru','HTML Блоки'),(353,353,'ru','Авто'),(354,354,'ru','Карусель'),(355,355,'ru','Слайдов в окне'),(356,356,'ru','Ед.элемент'),(357,357,'ru','Переход'),(358,358,'ru','Навигация'),(359,359,'ru','Пагинация'),(360,360,'ru','Фон'),(361,361,'ru','Фон.изображение'),(362,362,'ru','Иконка кнопки'),(363,363,'ru','Класс кнопки'),(364,364,'ru','Название кнопки'),(365,365,'ru','Изображение контента'),(366,366,'ru','Обратный отчет'),(367,367,'ru','Сообщение счетчика'),(368,368,'ru','Параллаксы'),(369,369,'ru','Класс параллакса'),(370,370,'ru','Разрешение фона'),(371,371,'ru','Старт события'),(372,372,'ru','Url кнопки'),(373,373,'ru','Деятельность'),(374,374,'ru','Отзывы'),(375,375,'ru','На главной'),(376,376,'ru','Вкл'),(377,377,'ru','Выкл'),(378,378,'ru',''),(379,379,'ru',''),(380,380,'ru',''),(381,381,'ru',''),(382,382,'ru',''),(383,383,'ru',''),(384,384,'ru',''),(385,385,'ru',''),(386,386,'ru',''),(387,387,'ru',''),(388,388,'ru',''),(389,389,'ru',''),(390,390,'ru',''),(391,391,'ru',''),(392,392,'ru',''),(393,393,'ru',''),(394,394,'ru',''),(395,395,'ru',''),(396,396,'ru',''),(397,397,'ru',''),(398,398,'ru',''),(399,399,'ru',''),(400,400,'ru',''),(401,401,'ru',''),(402,402,'ru',''),(403,403,'ru',''),(404,404,'ru',''),(405,405,'ru',''),(406,406,'ru',''),(407,407,'ru',''),(408,408,'ru',''),(409,409,'ru',''),(410,410,'ru',''),(411,411,'ru',''),(412,412,'ru',''),(413,413,'ru',''),(414,414,'ru','Слайды'),(415,415,'ru','Копировать'),(416,416,'ru','Элемент будет скопирован. Вы уверены?'),(417,417,'ru','Добавить слой'),(418,418,'ru','Менеджер БД'),(419,419,'ru','Создать Дамп'),(420,420,'ru','Время создания'),(421,421,'ru','Загрузить'),(422,422,'ru','Размер'),(423,423,'ru','Импорт'),(424,424,'ru','Удалить Все Дампы'),(425,425,'ru','Дирректория не доступна для записи.'),(426,426,'ru','Нет подключения к базе данных.'),(427,427,'ru','Указанный путь не существует.'),(428,428,'ru','Путь должен быть папкой.'),(429,429,'ru','Дамп БД удален.'),(430,430,'ru','Все записи базы данных будут удалены. Вы уверены?'),(431,431,'ru','Все записи базы данных будут перезаписаны. Вы уверены?'),(432,432,'ru','Дамп базы данных будет удален. Вы уверены?'),(433,433,'ru','Дамп {path} успешно импортирован.'),(434,434,'ru','Экспорт успешно завершен. Файл {fileName} в папке {path}.');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_source`
--

DROP TABLE IF EXISTS `message_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL,
  `message` text,
  `immutable` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_source`
--

LOCK TABLES `message_source` WRITE;
/*!40000 ALTER TABLE `message_source` DISABLE KEYS */;
INSERT INTO `message_source` VALUES (1,'art','--- With selected ---',1),(2,'art','Activate',1),(3,'art','Active',1),(4,'art','Add New',1),(5,'art','All',1),(6,'art','Always Visible',1),(7,'art','An unknown error occurred.',1),(8,'art','Approved',1),(9,'art','Author',1),(10,'art','Banned',1),(11,'art','Bind to IP',1),(12,'art','Birthday',1),(13,'art','Birth month',1),(14,'art','Birth year',1),(15,'art','Browse',1),(16,'art','Browser',1),(17,'art','Cache has been flushed.',1),(18,'art','Cancel',1),(19,'art','Category',1),(20,'art','Clear filters',1),(21,'art','Closed',1),(22,'art','Code',1),(23,'art','Comment Status',1),(24,'art','Comments Activity',1),(25,'art','Confirm',1),(26,'art','Confirmation Token',1),(27,'art','Content',1),(28,'art','Control Panel',1),(29,'art','Create {item}',1),(30,'art','Create',1),(31,'art','Created By',1),(32,'art','Created',1),(33,'art','Dashboard',1),(34,'art','Data',1),(35,'art','Deactivate',1),(36,'art','Default Language',1),(37,'art','Default Value',1),(38,'art','Delete',1),(39,'art','Description',1),(40,'art','E-mail confirmed',1),(41,'art','E-mail',1),(42,'art','Edit',1),(43,'art','Error',1),(44,'art','Failed to flush cache.',1),(45,'art','Female',1),(46,'art','First Name',1),(47,'art','For example',1),(48,'art','Gender',1),(49,'art','Group',1),(50,'art','ID',1),(51,'art','IP',1),(52,'art','Icon',1),(53,'art','Inactive',1),(54,'art','Insert',1),(55,'art','Invalid settings for dashboard widgets',1),(56,'art','Key',1),(57,'art','Label',1),(58,'art','Language',1),(59,'art','Last Name',1),(60,'art','Link ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(61,'art','Link',1),(62,'art','Login',1),(63,'art','Logout {username}',1),(64,'art','Menu ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(65,'art','Menu',1),(66,'art','Male',1),(67,'art','Middle Name',1),(68,'art','Name',1),(69,'art','No Parent',1),(70,'art','No comments found.',1),(71,'art','Not Selected',1),(72,'art','OK',1),(73,'art','OS',1),(74,'art','Open',1),(75,'art','Order',1),(76,'art','PHP Version',1),(77,'art','Parent Link',1),(78,'art','Password',1),(79,'art','Pending',1),(80,'art','Phone',1),(81,'art','Processing',1),(82,'art','Publish',1),(83,'art','Published',1),(84,'art','Read more',1),(85,'art','Recent Comments',1),(86,'art','Records per page',1),(87,'art','Registration IP',1),(88,'art','Repeat password',1),(89,'art','Required',1),(90,'art','Revision',1),(91,'art','Role',1),(92,'art','Roles',1),(93,'art','Rule',1),(94,'art','Save All',1),(95,'art','Save',1),(96,'art','Saved',1),(97,'art','Settings',1),(98,'art','Short Info',1),(99,'art','Size',1),(100,'art','Slug',1),(101,'art','Skype',1),(102,'art','Spam',1),(103,'art','Start',1),(104,'art','Status',1),(105,'art','Superadmin',1),(106,'art','System Info',1),(107,'art','The changes have been saved.',1),(108,'art','This e-mail already exists',1),(109,'art','Title',1),(110,'art','Token',1),(111,'art','Trash',1),(112,'art','Type',1),(113,'art','URL',1),(114,'art','Unpublish',1),(115,'art','Update \"{item}\"',1),(116,'art','Update',1),(117,'art','Updated By',1),(118,'art','Updated',1),(119,'art','Uploaded',1),(120,'art','User agent',1),(121,'art','User',1),(122,'art','Username',1),(123,'art','Value',1),(124,'art','View',1),(125,'art','Visible',1),(126,'art','Visit Time',1),(127,'art','Wrong format. Enter valid IPs separated by comma',1),(128,'art','Art CMS Version',1),(129,'art','Art Core Version',1),(130,'art','Yii Framework Version',1),(131,'art','Your item has been updated.',1),(132,'art','Your item has been created.',1),(133,'art','Your item has been deleted.',1),(134,'art/translation','Add New Source Message',1),(135,'art/translation','Category',1),(136,'art/translation','Create Message Source',1),(137,'art/translation','Create New Category',1),(138,'art/translation','Immutable',1),(139,'art/translation','Message Translation',1),(140,'art/translation','New Category Name',1),(141,'art/translation','Please, select message group and language to view translations...',1),(142,'art/translation','Source Message',1),(143,'art/translation','Update Message Source',1),(144,'art/translation','{n, plural, =1{1 message} other{# messages}}',1),(145,'art/media','Add files',1),(146,'art/media','Album',1),(147,'art/media','Albums',1),(148,'art/media','All Media Items',1),(149,'art/media','Alt Text',1),(150,'art/media','Back to file manager',1),(151,'art/media','Cancel upload',1),(152,'art/media','Categories',1),(153,'art/media','Category',1),(154,'art/media','Changes have been saved.',1),(155,'art/media','Changes haven\'t been saved.',1),(156,'art/media','Create Category',1),(157,'art/media','Current thumbnail sizes',1),(158,'art/media','Dimensions',1),(159,'art/media','Do resize thumbnails',1),(160,'art/media','File Size',1),(161,'art/media','Filename',1),(162,'art/media','If you change the thumbnails sizes, it is strongly recommended resize image thumbnails.',1),(163,'art/media','Image Settings',1),(164,'art/media','Large size',1),(165,'art/media','Manage Albums',1),(166,'art/media','Manage Categories',1),(167,'art/media','Media Activity',1),(168,'art/media','Media Details',1),(169,'art/media','Media',1),(170,'art/media','Medium size',1),(171,'art/media','No images found.',1),(172,'art/media','Original',1),(173,'art/media','Please, select file to view details.',1),(174,'art/media','Select image size',1),(175,'art/media','Small size',1),(176,'art/media','Sorry, [{filetype}] file type is not permitted!',1),(177,'art/media','Start upload',1),(178,'art/media','Thumbnails settings',1),(179,'art/media','Thumbnails sizes has been resized successfully!',1),(180,'art/media','Thumbnails',1),(181,'art/media','Update Category',1),(182,'art/media','Updated By',1),(183,'art/media','Upload New File',1),(184,'art/media','Uploaded By',1),(185,'art/menu','Menu',1),(186,'art/menu','Menus',1),(187,'art/menu','Link ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(188,'art/menu','Parent Link',1),(189,'art/menu','Always Visible',1),(190,'art/menu','No Parent',1),(191,'art/menu','Create Menu Link',1),(192,'art/menu','Update Menu Link',1),(193,'art/menu','Menu Links',1),(194,'art/menu','Add New Menu',1),(195,'art/menu','Add New Link',1),(196,'art/menu','An error occurred during saving menu!',1),(197,'art/menu','The changes have been saved.',1),(198,'art/menu','Please, select menu to view menu links...',1),(199,'art/menu','Selected menu doesn\'t contain any link. Click \"Add New Link\" to create a link for this menu.',1),(200,'art/page','Page',1),(201,'art/page','Pages',1),(202,'art/page','Create Page',1),(203,'art/post','Categories',1),(204,'art/post','Create Category',1),(205,'art/post','Update Category',1),(206,'art/post','Create Tag',1),(207,'art/post','Update Tag',1),(208,'art/post','No posts found.',1),(209,'art/post','Post',1),(210,'art/post','Posted in',1),(211,'art/post','Posts Activity',1),(212,'art/post','Posts',1),(213,'art/post','Tag',1),(214,'art/post','Tags',1),(215,'art/settings','General Settings',1),(216,'art/settings','Reading Settings',1),(217,'art/settings','Site Title',1),(218,'art/settings','Site Description',1),(219,'art/settings','Admin Email',1),(220,'art/settings','Timezone',1),(221,'art/settings','Date Format',1),(222,'art/settings','Time Format',1),(223,'art/settings','Page Size',1),(224,'art/settings','Admin Phone',1),(225,'art/settings','Admin Facebook',1),(226,'art/settings','Admin Instagram',1),(227,'art/settings','Phone Mask',1),(228,'art/settings','Date Mask',1),(229,'art/settings','Time Mask',1),(230,'art/settings','Date & Time Mask',1),(231,'art/settings','Your settings have been saved.',1),(232,'art/user','Child permissions',1),(233,'art/user','Child roles',1),(234,'art/user','Create Permission Group',1),(235,'art/user','Create Permission',1),(236,'art/user','Create Role',1),(237,'art/user','Create User',1),(238,'art/user','Log №{id}',1),(239,'art/user','No users found.',1),(240,'art/user','Password',1),(241,'art/user','Permission Groups',1),(242,'art/user','Permission',1),(243,'art/user','Permissions for \"{role}\" role',1),(244,'art/user','Permissions',1),(245,'art/user','Refresh routes',1),(246,'art/user','Registration date',1),(247,'art/user','Role',1),(248,'art/user','Roles and Permissions for \"{user}\"',1),(249,'art/user','Roles',1),(250,'art/user','Routes',1),(251,'art/user','Search route',1),(252,'art/user','Show all',1),(253,'art/user','Show only selected',1),(254,'art/user','Site Visits',1),(255,'art/user','Update Permission Group',1),(256,'art/user','Update Permission',1),(257,'art/user','Update Role',1),(258,'art/user','Update Password for \"{user}\"',1),(259,'art/user','Update User',1),(260,'art/user','User not found',1),(261,'art/user','User',1),(262,'art/user','Users',1),(263,'art/user','Users Browser',1),(264,'art/user','Visit Log',1),(265,'art/user','You can not change own permissions',1),(266,'art/user','You can\'t update own permissions!',1),(267,'art/user','{permission} Permission Settings',1),(268,'art/user','{permission} Role Settings',1),(269,'art/auth','Are you sure you want to delete your profile picture?',1),(270,'art/auth','Are you sure you want to unlink this authorization?',1),(271,'art/auth','Authentication error occurred.',1),(272,'art/auth','Authorization',1),(273,'art/auth','Authorized Services',1),(274,'art/auth','Captcha',1),(275,'art/auth','Change profile picture',1),(276,'art/auth','Check your E-mail for further instructions',1),(277,'art/auth','Check your e-mail {email} for instructions to activate account',1),(278,'art/auth','Click to connect with service',1),(279,'art/auth','Click to unlink service',1),(280,'art/auth','Confirm E-mail',1),(281,'art/auth','Confirm',1),(282,'art/auth','Could not send confirmation email',1),(283,'art/auth','Current password',1),(284,'art/auth','E-mail confirmation for',1),(285,'art/auth','E-mail confirmed',1),(286,'art/auth','E-mail is invalid',1),(287,'art/auth','E-mail with activation link has been sent to <b>{email}</b>. This link will expire in {minutes} min.',1),(288,'art/auth','E-mail',1),(289,'art/auth','Forgot password?',1),(290,'art/auth','Follow the link below to confirm your email:',1),(291,'art/auth','Follow the link below to reset your password:',1),(292,'art/auth','Follow this link to confirm your E-mail and activate account:',1),(293,'art/auth','Hello, {username}.',1),(294,'art/auth','Hello, you have been registered on {host}.',1),(295,'art/auth','Incorrect username or password',1),(296,'art/auth','Login has been taken',1),(297,'art/auth','Login',1),(298,'art/auth','Logout',1),(299,'art/auth','Non Authorized Services',1),(300,'art/auth','Password has been updated',1),(301,'art/auth','Password recovery',1),(302,'art/auth','Password reset for',1),(303,'art/auth','Password',1),(304,'art/auth','Registration - confirm your e-mail',1),(305,'art/auth','Registration',1),(306,'art/auth','Remember me',1),(307,'art/auth','Remove profile picture',1),(308,'art/auth','Repeat password',1),(309,'art/auth','Reset Password',1),(310,'art/auth','Reset',1),(311,'art/auth','Save Profile',1),(312,'art/auth','Save profile picture',1),(313,'art/auth','Set Password',1),(314,'art/auth','Set Username',1),(315,'art/auth','Signup',1),(316,'art/auth','This E-mail already exists',1),(317,'art/auth','Token not found. It may be expired',1),(318,'art/auth','Token not found. It may be expired. Try reset password once more',1),(319,'art/auth','Too many attempts',1),(320,'art/auth','Unable to send message for email provided',1),(321,'art/auth','Update Password',1),(322,'art/auth','User Profile',1),(323,'art/auth','User with the same email as in {client} account already exists but isn\'t linked to it. Login using email first to link it.',1),(324,'art/auth','The username should contain only Latin letters, numbers and the following characters: \"_\".',1),(325,'art/auth','Username contains not allowed characters or words.',1),(326,'art/auth','Wrong password',1),(327,'art/auth','You could not login from this IP',1),(328,'art/seo','Create SEO Record',1),(329,'art/seo','Follow',1),(330,'art/seo','Index',1),(331,'art/seo','Keywords',1),(332,'art/seo','SEO',1),(333,'art/seo','Search Engine Optimization',1),(334,'art/seo','Update SEO Record',1),(335,'art/media','To keep order',1),(336,'art/media','Photo not found.',1),(337,'art/media','Your photo has been removed.',1),(338,'art/media','Sort data saved.',1),(345,'art/portfolio','Link Href',1),(346,'art/portfolio','Portfolio Category',1),(347,'art/portfolio','Portfolio Items',1),(348,'art/portfolio','Portfolio Menu',1),(349,'art/portfolio','Select Categories...',1),(350,'art/portfolio','Thumbnail',1),(351,'art/block','HTML Block',1),(352,'art/block','HTML Blocks',1),(353,'art/carousel','Auto Play',1),(354,'art/carousel','Carousel',1),(355,'art/carousel','Items Qty',1),(356,'art/carousel','Single Item',1),(357,'art/carousel','Transition Style',1),(358,'art/carousel','Navigation',1),(359,'art/carousel','Pagination',1),(360,'art/parallax','Bg Color',1),(361,'art/parallax','Bg Image',1),(362,'art/parallax','Btn Icon',1),(363,'art/parallax','Btn Class',1),(364,'art/parallax','Btn Name',1),(365,'art/parallax','Content Image',1),(366,'art/parallax','Countdown',1),(367,'art/parallax','Countdown Prompt',1),(368,'art/parallax','Parallaxes',1),(369,'art/parallax','Parallax Class',1),(370,'art/parallax','Background Ratio',1),(371,'art/parallax','Start Time',1),(372,'art/parallax','Url',1),(373,'art/feedback','Business',1),(374,'art/feedback','Feedback',1),(375,'art/feedback','Main On',1),(376,'art/feedback','On',1),(377,'art/feedback','Off',1),(378,'art/slides','Data Transition',1),(379,'art/slides','Data Slotamount',1),(380,'art/slides','Data Masterspeed',1),(381,'art/slides','Data Delay',1),(382,'art/slides','Img Src',1),(383,'art/slides','Img Alt',1),(384,'art/slides','Data Lazyload',1),(385,'art/slides','Data Fullwidthcentering',1),(386,'art/slides','Data Bgfit',1),(387,'art/slides','Data Bgposition',1),(388,'art/slides','Data Bgrepeat',1),(389,'art/slides','Slides ID',1),(390,'art/slides','Class',1),(391,'art/slides','Data X',1),(392,'art/slides','Data Y',1),(393,'art/slides','Data Customin',1),(394,'art/slides','Data Customout',1),(395,'art/slides','Data Hoffset',1),(396,'art/slides','Data Voffset',1),(397,'art/slides','Data Speed',1),(398,'art/slides','Data Start',1),(399,'art/slides','Data Easing',1),(400,'art/slides','Data Splitin',1),(401,'art/slides','Data Splitout',1),(402,'art/slides','Data Elementdelay',1),(403,'art/slides','Data Endelementdelay',1),(404,'art/slides','Data End',1),(405,'art/slides','Data Endspeed',1),(406,'art/slides','Data Endeasing',1),(407,'art/slides','Data Captionhidden',1),(408,'art/slides','Style',1),(409,'art/slides','Btn Flag',1),(410,'art/slides','Url',1),(411,'art/slides','Btn Icon',1),(412,'art/slides','Btn Name',1),(413,'art/slides','Btn Class',1),(414,'art/slides','Slides',1),(415,'art/slides','Copy',1),(416,'art/slides','The item will be copied. Are you sure?',1),(417,'art/slides','Add Layers',1),(418,'art/dbmanager','DB Manager',1),(419,'art/dbmanager','Create Dump',1),(420,'art/dbmanager','Create time',1),(421,'art/dbmanager','Download',1),(422,'art/dbmanager','Size',1),(423,'art/dbmanager','Import',1),(424,'art/dbmanager','Delete All Dump',1),(425,'art/dbmanager','Directory is not writable.',1),(426,'art/dbmanager','No database connection.',1),(427,'art/dbmanager','The specified path does not exist.',1),(428,'art/dbmanager','The path must be a folder.',1),(429,'art/dbmanager','The database dump removed.',1),(430,'art/dbmanager','All database entries will be deleted. Are you sure?',1),(431,'art/dbmanager','All database entries will be overwritten. Are you sure?',1),(432,'art/dbmanager','The database dump will be deleted. Are you sure?',1),(433,'art/dbmanager','Dump {path} successfully imported.',1),(434,'art/dbmanager','Export completed successfully. File {fileName} in the {path} folder.',1);
/*!40000 ALTER TABLE `message_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `alias` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base','@app/migrations',1557911705),('m130524_201442_init','@app/migrations',1557911708),('m150319_150657_alter_user_table','@artsoft/yii2-art-core/migrations/',1557911708),('m150319_155941_init_art_core','@artsoft/yii2-art-core/migrations/',1557911714),('m150319_184824_init_settings','@artsoft/yii2-art-core/migrations/',1557911715),('m150319_194321_init_menus','@artsoft/yii2-art-core/migrations/',1557911724),('m150320_102452_init_translations','@artsoft/yii2-art-translation/migrations/',1557911725),('m150628_124401_create_media_table','@artsoft/yii2-art-media/migrations/',1557911742),('m150630_121101_create_post_table','@artsoft/yii2-art-post/migrations/',1557911754),('m150703_182055_create_auth_table','@artsoft/yii2-art-auth/migrations/',1557911756),('m150706_175101_create_comment_table','@artsoft/yii2-comments/migrations/',1557911757),('m150719_154955_add_setting_menu_links','@artsoft/yii2-art-settings/migrations/',1557911758),('m150719_182533_add_menu_and_links','@artsoft/yii2-art-menu/migrations/',1557911758),('m150727_175300_add_comments_menu_links','@artsoft/yii2-art-comment/migrations/',1557911758),('m150729_121634_add_user_menu_links','@artsoft/yii2-art-user/migrations/',1557911759),('m150729_122614_add_post_menu_links','@artsoft/yii2-art-post/migrations/',1557911759),('m150729_131014_add_media_menu_links','@artsoft/yii2-art-media/migrations/',1557911759),('m150731_150101_create_page_table','@artsoft/yii2-art-page/migrations/',1557911762),('m150731_150644_add_page_menu_links','@artsoft/yii2-art-page/migrations/',1557911763),('m150821_140141_add_core_permissions','@artsoft/yii2-art-core/migrations/',1557911763),('m150825_202231_add_post_permissions','@artsoft/yii2-art-post/migrations/',1557911763),('m150825_205531_add_user_permissions','@artsoft/yii2-art-user/migrations/',1557911764),('m150825_211322_add_menu_permissions','@artsoft/yii2-art-menu/migrations/',1557911764),('m150825_212310_add_settings_permissions','@artsoft/yii2-art-settings/migrations/',1557911765),('m150825_212941_add_comments_permissions','@artsoft/yii2-art-comment/migrations/',1557911765),('m150825_213610_add_media_permissions','@artsoft/yii2-art-media/migrations/',1557911765),('m150825_220620_add_page_permissions','@artsoft/yii2-art-page/migrations/',1557911766),('m151116_212614_add_translations_menu_links','@artsoft/yii2-art-translation/migrations/',1557911766),('m151121_091144_i18n_art_source','@artsoft/yii2-art-core/migrations/',1557911766),('m151121_131210_add_translation_permissions','@artsoft/yii2-art-translation/migrations/',1557911767),('m151121_184634_i18n_art_translation_source','@artsoft/yii2-art-translation/migrations/',1557911767),('m151121_225504_i18n_art_media_source','@artsoft/yii2-art-media/migrations/',1557911767),('m151121_232115_i18n_art_menu_source','@artsoft/yii2-art-menu/migrations/',1557911767),('m151121_233615_i18n_art_page_source','@artsoft/yii2-art-page/migrations/',1557911767),('m151121_233715_i18n_art_post_source','@artsoft/yii2-art-post/migrations/',1557911767),('m151121_235015_i18n_art_settings_source','@artsoft/yii2-art-settings/migrations/',1557911768),('m151121_235512_i18n_art_user_source','@artsoft/yii2-art-user/migrations/',1557911768),('m151126_061233_i18n_art_auth_source','@artsoft/yii2-art-auth/migrations/',1557911768),('m151226_230101_create_seo_table','@artsoft/yii2-art-seo/migrations/',1557911770),('m151226_231101_add_seo_menu_links','@artsoft/yii2-art-seo/migrations/',1557911771),('m151226_233401_add_seo_permissions','@artsoft/yii2-art-seo/migrations/',1557911771),('m151226_234401_i18n_art_seo_source','@artsoft/yii2-art-seo/migrations/',1557911771),('m160207_123123_add_super_parent_id','@artsoft/yii2-comments/migrations/',1557911771),('m160414_212551_add_view_page','@artsoft/yii2-art-page/migrations/',1557911772),('m160414_212558_add_view_post','@artsoft/yii2-art-post/migrations/',1557911772),('m160418_150101_create_block_table','@vendor/artsoft/yii2-art-block/migrations/',1559209397),('m160418_150644_add_block_menu_links','@vendor/artsoft/yii2-art-block/migrations/',1559209398),('m160418_220620_add_block_permissions','@vendor/artsoft/yii2-art-block/migrations/',1559209398),('m160418_233615_i18n_art_block_source','@vendor/artsoft/yii2-art-block/migrations/',1559209398),('m160419_092310_i18n_ru_art','@vendor/artsoft/art-i18n/ru/',1557911845),('m160419_122314_i18n_ru_init_demo','@vendor/artsoft/art-i18n/ru/',1557911845),('m160419_143242_i18n_ru_menu_comments','@vendor/artsoft/art-i18n/ru/',1557911845),('m160419_143310_i18n_ru_menu_core','@vendor/artsoft/art-i18n/ru/',1557911846),('m160419_143742_i18n_ru_menu_media','@vendor/artsoft/art-i18n/ru/',1557911846),('m160419_143915_i18n_ru_menu_menu','@vendor/artsoft/art-i18n/ru/',1557911846),('m160419_144310_i18n_ru_menu_page','@vendor/artsoft/art-i18n/ru/',1557911846),('m160419_144654_i18n_ru_menu_post','@vendor/artsoft/art-i18n/ru/',1557911846),('m160419_144710_i18n_ru_menu_setting','@vendor/artsoft/art-i18n/ru/',1557911846),('m160419_145050_i18n_ru_menu_translations','@vendor/artsoft/art-i18n/ru/',1557911847),('m160419_145301_i18n_ru_menu_user','@vendor/artsoft/art-i18n/ru/',1557911847),('m160419_210059_i18n_ru_art_translation','@vendor/artsoft/art-i18n/ru/',1557911847),('m160419_225904_i18n_ru_art_media','@vendor/artsoft/art-i18n/ru/',1557911847),('m160419_232223_i18n_ru_art_menu','@vendor/artsoft/art-i18n/ru/',1557911847),('m160419_233713_i18n_ru_art_page','@vendor/artsoft/art-i18n/ru/',1557911848),('m160419_233813_i18n_ru_art_post','@vendor/artsoft/art-i18n/ru/',1557911848),('m160419_234401_i18n_ru_art_seo','@vendor/artsoft/art-i18n/ru/',1557911848),('m160419_235120_i18n_ru_art_settings','@vendor/artsoft/art-i18n/ru/',1557911848),('m160419_235601_i18n_ru_menu_seo','@vendor/artsoft/art-i18n/ru/',1557911848),('m160419_235643_i18n_ru_art_user','@vendor/artsoft/art-i18n/ru/',1557911848),('m160426_122854_create_uploader_images_table','@artsoft/yii2-art-media/migrations/',1557911773),('m160530_224510_add_url_field','@artsoft/yii2-comments/migrations/',1557911774),('m160605_214907_create_tag_table','@artsoft/yii2-art-post/migrations/',1557911781),('m160605_215105_init_tag_settings','@artsoft/yii2-art-post/migrations/',1557911781),('m160610_120101_init_demo','@app/migrations',1557911782),('m160903_113810_update_auth_foreign_key','@artsoft/yii2-art-auth/migrations/',1557911784),('m190323_191315_i18n_ru_art_auth','@vendor/artsoft/art-i18n/ru/',1557911849),('m190323_212612_alter_user_table','@artsoft/yii2-art-core/migrations/',1557911785),('m190416_081103_create_table_media_manager','@artsoft/yii2-art-mediamanager/migrations/',1557911787),('m190416_083559_i18n_art_media_source','@artsoft/yii2-art-mediamanager/migrations/',1557911787),('m190416_083740_i18n_ru_art_media','@vendor/artsoft/art-i18n/ru/',1557911849),('m190418_223710_add_media_permissions','@artsoft/yii2-art-mediamanager/migrations/',1557911788),('m190522_143911_create_portfolio_table','@backend/modules/portfolio/migrations/',1558684546),('m190522_144015_add_portfolio_menu_links','@backend/modules/portfolio/migrations/',1558684546),('m190522_144530_add_portfolio_permissions','@backend/modules/portfolio/migrations/',1558684546),('m190522_145020_i18n_art_portfolio_source','@backend/modules/portfolio/migrations/',1558684547),('m190522_151030_i18n_ru_art_portfolio','@backend/modules/portfolio/migrations/i18n/ru',1558684565),('m190524_105210_i18n_ru_menu_portfolio','@backend/modules/portfolio/migrations/i18n/ru',1558684565),('m190530_114330_i18n_ru_art_block','@vendor/artsoft/yii2-art-block/migrations/i18n/ru',1559209415),('m190530_114510_i18n_ru_menu_block','@vendor/artsoft/yii2-art-block/migrations/i18n/ru',1559209415),('m190605_130505_add_carousel_menu_links','@vendor/artsoft/yii2-art-carousel/migrations/',1559742738),('m190605_131015_add_carousel_permissions','@vendor/artsoft/yii2-art-carousel/migrations/',1559742738),('m190605_131516_i18n_art_carousel_source','@vendor/artsoft/yii2-art-carousel/migrations/',1559742739),('m190605_132010_i18n_ru_menu_carousel','@vendor/artsoft/yii2-art-carousel/migrations/i18n/ru',1559742830),('m190605_132815_i18n_ru_art_carousel','@vendor/artsoft/yii2-art-carousel/migrations/i18n/ru',1559742831),('m190606_121432_add_feedback_permissions','@vendor/artsoft/yii2-art-feedback/migrations/',1559824424),('m190606_121612_i18n_art_feedback_source','@vendor/artsoft/yii2-art-feedback/migrations/',1559824424),('m190606_123015_i18n_ru_menu_feedback','@vendor/artsoft/yii2-art-feedback/migrations/i18n/ru',1559824447),('m190606_123245_i18n_ru_art_feedback','@vendor/artsoft/yii2-art-feedback/migrations/i18n/ru',1559824447),('m190606_131015_add_parallax_permissions','@vendor/artsoft/yii2-art-parallax/migrations/',1559812531),('m190606_131516_i18n_art_parallax_source','@vendor/artsoft/yii2-art-parallax/migrations/',1559812531),('m190606_132815_i18n_ru_art_parallax','@vendor/artsoft/yii2-art-parallax/migrations/i18n/ru',1559812641),('m190607_094056_add_slides_permissions','@vendor/artsoft/yii2-art-slides/migrations/',1559902228),('m190607_095843_i18n_art_slides_source','@vendor/artsoft/yii2-art-slides/migrations/',1559902228),('m190607_100425_i18n_ru_art_slides','@vendor/artsoft/yii2-art-slides/migrations/i18n/ru',1559902248),('m190611_121414_add_dbmanager_permissions','@vendor/artsoft/yii2-art-dbmanager/migrations/',1560244704),('m190611_121623_i18n_art_dbmanager_source','@vendor/artsoft/yii2-art-dbmanager/migrations/',1560247017),('m190611_124618_i18n_ru_art_dbmanager','@vendor/artsoft/yii2-art-dbmanager/migrations/',1560247018);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-published',
  `comment_status` int(1) NOT NULL DEFAULT '1' COMMENT '0-closed,1-open',
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `revision` int(1) NOT NULL DEFAULT '1',
  `view` varchar(255) NOT NULL DEFAULT 'page',
  `layout` varchar(255) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `page_slug` (`slug`),
  KEY `page_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_lang`
--

DROP TABLE IF EXISTS `page_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `page_lang_post_id` (`page_id`),
  KEY `page_lang_language` (`language`),
  CONSTRAINT `fk_page_lang` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_lang`
--

LOCK TABLES `page_lang` WRITE;
/*!40000 ALTER TABLE `page_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parallax`
--

DROP TABLE IF EXISTS `parallax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parallax` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL,
  `slug` varchar(127) NOT NULL,
  `bg_color` varchar(127) DEFAULT NULL,
  `bg_image` varchar(127) NOT NULL,
  `parallax_class` varchar(127) DEFAULT NULL,
  `background_ratio` varchar(127) DEFAULT NULL,
  `content_image` varchar(127) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `countdown` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Включить счетчик',
  `countdown_prompt` varchar(127) NOT NULL,
  `start_timestamp` int(11) DEFAULT NULL,
  `url` varchar(127) NOT NULL,
  `btn_icon` varchar(127) NOT NULL,
  `btn_name` varchar(127) NOT NULL,
  `btn_class` varchar(127) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `parallax_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `parallax_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parallax`
--

LOCK TABLES `parallax` WRITE;
/*!40000 ALTER TABLE `parallax` DISABLE KEYS */;
INSERT INTO `parallax` VALUES (1,'На главной','parallax-main','rgb(0, 0, 0)','/uploads/2019/05/parallax-1.jpg','parallax delayed','0.8','/uploads/2019/05/apparat.png','<h2>Остановите <strong>Мгновение!</strong></h2>\r\n<p class=\"lead\">Сделайте шаг навстречу к себе прямо сейчас!</p>\r\n<p>«Ничего не происходит, когда вы сидите у себя дома. <br />Я всегда ношу камеру с собой в любое время ... <br />Я просто снимаю то, что меня интересует в текущий момент»,</p>',1,'До начала акции осталось:',1559893800,'/site/contact','fa fa-chevron-circle-right','Записаться','btn btn-primary btn-lg',1,1558084745,1559813418,1,1);
/*!40000 ALTER TABLE `parallax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_category`
--

DROP TABLE IF EXISTS `portfolio_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_category` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `slug` varchar(127) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `description` mediumtext,
  `status` tinyint(1) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `portfolio_category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `portfolio_category_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_category`
--

LOCK TABLES `portfolio_category` WRITE;
/*!40000 ALTER TABLE `portfolio_category` DISABLE KEYS */;
INSERT INTO `portfolio_category` VALUES (1,'Свадьба фото','svadba-foto',0,'',1,1558103657,1558103657,1,1),(2,'Свадьба видео','svadba-video',1,'',1,1558103685,1558103685,1,1),(3,'Портреты свадебные фото','portrety-svadebnye-foto',0,'',1,1558103731,1558103836,1,1);
/*!40000 ALTER TABLE `portfolio_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_items`
--

DROP TABLE IF EXISTS `portfolio_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_items` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `category_id` int(8) NOT NULL,
  `thumbnail` varchar(127) NOT NULL,
  `img_alt` varchar(127) DEFAULT NULL,
  `link_href` varchar(127) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `portfolio_items_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `portfolio_items_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_items`
--

LOCK TABLES `portfolio_items` WRITE;
/*!40000 ALTER TABLE `portfolio_items` DISABLE KEYS */;
INSERT INTO `portfolio_items` VALUES (1,1,'/uploads/2019/05/test-9-320x320.jpg',NULL,'/uploads/2019/05/test-9.jpg',1,1,1558104812,1558339998,1,1),(2,1,'/uploads/2019/05/test-10-320x320.jpg',NULL,'/uploads/2019/05/test-10.jpg',1,2,1558105004,1558340021,1,1),(3,3,'/uploads/2019/05/test-4-320x320.jpg',NULL,'/uploads/2019/05/test-4.jpg',1,4,1558346035,1558346035,1,1),(4,3,'/uploads/2019/05/test-2-320x320.jpg',NULL,'/uploads/2019/05/test-2.jpg',1,3,1558346087,1558346087,1,1),(5,1,'/uploads/2019/05/test-6-320x320.jpg',NULL,'/uploads/2019/05/test-6.jpg',1,5,1558347008,1558965319,1,1);
/*!40000 ALTER TABLE `portfolio_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_menu`
--

DROP TABLE IF EXISTS `portfolio_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_menu` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` mediumtext,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `sortOrder` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `portfolio_menu_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `portfolio_menu_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_menu`
--

LOCK TABLES `portfolio_menu` WRITE;
/*!40000 ALTER TABLE `portfolio_menu` DISABLE KEYS */;
INSERT INTO `portfolio_menu` VALUES (1,'Свадьба','',1,1558103770,1558103881,1,1,3),(2,'Видео','',1,1558103809,1558103809,1,1,2),(3,'Портреты','',1,1558103860,1558103860,1,1,1);
/*!40000 ALTER TABLE `portfolio_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_menu_category`
--

DROP TABLE IF EXISTS `portfolio_menu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_menu_category` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `menu_id` int(8) NOT NULL,
  `category_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_menu_category`
--

LOCK TABLES `portfolio_menu_category` WRITE;
/*!40000 ALTER TABLE `portfolio_menu_category` DISABLE KEYS */;
INSERT INTO `portfolio_menu_category` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,3),(5,1,3);
/*!40000 ALTER TABLE `portfolio_menu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-published',
  `comment_status` int(1) NOT NULL DEFAULT '1' COMMENT '0-closed,1-open',
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `revision` int(1) NOT NULL DEFAULT '1',
  `view` varchar(255) NOT NULL DEFAULT 'post',
  `layout` varchar(255) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `post_slug` (`slug`),
  KEY `post_category_id` (`category_id`),
  KEY `post_status` (`status`),
  KEY `fk_page_created_by` (`created_by`),
  KEY `fk_page_updated_by` (`updated_by`),
  CONSTRAINT `fk_page_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_page_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_category_slug` (`slug`),
  KEY `post_category_visible` (`visible`),
  KEY `fk_post_category_created_by` (`created_by`),
  KEY `fk_post_category_updated_by` (`updated_by`),
  CONSTRAINT `fk_post_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,'first-category',1,1557911781,1557911781,1,1,1);
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category_lang`
--

DROP TABLE IF EXISTS `post_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_category_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_category_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `post_category_lang_id` (`post_category_id`),
  KEY `post_category_lang_language` (`language`),
  CONSTRAINT `fk_post_category_lang` FOREIGN KEY (`post_category_id`) REFERENCES `post_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category_lang`
--

LOCK TABLES `post_category_lang` WRITE;
/*!40000 ALTER TABLE `post_category_lang` DISABLE KEYS */;
INSERT INTO `post_category_lang` VALUES (1,1,'en-US','First Category',NULL);
/*!40000 ALTER TABLE `post_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_lang`
--

DROP TABLE IF EXISTS `post_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `post_lang_post_id` (`post_id`),
  KEY `post_lang_language` (`language`),
  CONSTRAINT `fk_post_lang` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_lang`
--

LOCK TABLES `post_lang` WRITE;
/*!40000 ALTER TABLE `post_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_slug` (`slug`),
  KEY `fk_post_tag_created_by` (`created_by`),
  KEY `fk_post_tag_updated_by` (`updated_by`),
  CONSTRAINT `fk_post_tag_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tag_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,'art-cms',1557911782,1557911782,1,1),(2,'yii2',1557911782,1557911782,1,1);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag_lang`
--

DROP TABLE IF EXISTS `post_tag_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_tag_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_lang_id` (`post_tag_id`),
  KEY `post_tag_lang_language` (`language`),
  CONSTRAINT `fk_post_tag_lang` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag_lang`
--

LOCK TABLES `post_tag_lang` WRITE;
/*!40000 ALTER TABLE `post_tag_lang` DISABLE KEYS */;
INSERT INTO `post_tag_lang` VALUES (1,1,'en-US','ArtCMS'),(2,2,'en-US','Yii2');
/*!40000 ALTER TABLE `post_tag_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag_post`
--

DROP TABLE IF EXISTS `post_tag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_tag_post_id` (`post_id`),
  KEY `fk_post_tag_tag_id` (`tag_id`),
  CONSTRAINT `fk_post_tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `post_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag_post`
--

LOCK TABLES `post_tag_post` WRITE;
/*!40000 ALTER TABLE `post_tag_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_tag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo`
--

DROP TABLE IF EXISTS `seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(127) NOT NULL DEFAULT '',
  `keywords` text,
  `description` text,
  `index` smallint(6) NOT NULL DEFAULT '1',
  `follow` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `seo_url` (`url`),
  KEY `seo_created_by` (`created_by`),
  KEY `seo_author` (`created_by`),
  KEY `fk_seo_updated_by` (`updated_by`),
  CONSTRAINT `fk_seo_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_seo_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo`
--

LOCK TABLES `seo` WRITE;
/*!40000 ALTER TABLE `seo` DISABLE KEYS */;
INSERT INTO `seo` VALUES (1,'/','Портфолио','Фотограф Евгений туйцын','фото, фотография, фотоназаказ','Фотография',1,1,1557911782,1558942470,1,1),(2,'/portfolio','Портфолио','Фотограф Евгений туйцын','фото, фотография, фотоназаказ','Фотография',1,1,1558942541,1558942541,1,1);
/*!40000 ALTER TABLE `seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(64) DEFAULT 'general',
  `key` varchar(64) NOT NULL,
  `language` varchar(6) DEFAULT NULL,
  `value` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `setting_group_lang` (`group`,`key`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'reading','phone_mask',NULL,'+7 (999) 999 99 99',NULL),(2,'reading','date_mask',NULL,'99.99.9999',NULL),(3,'reading','time_mask',NULL,'99:99',NULL),(4,'reading','date_time_mask',NULL,'99.99.9999 99:99',NULL),(5,'general','title','en-US',NULL,NULL),(6,'general','title','ru','evphoto.ru',NULL),(7,'general','description','en-US','',NULL),(8,'general','description','ru','',NULL),(9,'general','email',NULL,'tj-dj@mail.ru',NULL),(10,'general','phone',NULL,'+7 (926) 947 41 90',NULL),(11,'general','timezone',NULL,'Europe/Moscow',NULL),(12,'general','dateformat',NULL,'dd.MM.yyyy',NULL),(13,'general','timeformat',NULL,'HH:mm',NULL),(14,'general','facebook',NULL,'https://www.facebook.com/deejay.dew',NULL),(15,'general','instagram',NULL,'https://www.instagram.com/art_photo_msk/',NULL),(16,'reading','page_size',NULL,'10',NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `data_transition` varchar(32) DEFAULT NULL,
  `data_slotamount` mediumint(3) DEFAULT NULL,
  `data_masterspeed` mediumint(3) DEFAULT NULL,
  `data_delay` varchar(127) DEFAULT NULL,
  `img_src` varchar(127) DEFAULT NULL,
  `img_alt` varchar(127) DEFAULT NULL,
  `data_lazyload` varchar(127) DEFAULT NULL,
  `data_fullwidthcentering` varchar(127) DEFAULT NULL,
  `data_bgfit` varchar(32) DEFAULT NULL,
  `data_bgposition` varchar(32) DEFAULT NULL,
  `data_bgrepeat` varchar(32) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` int(8) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `slides_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `slides_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (1,'Слайд 1','fade',7,300,'','',NULL,'/uploads/2019/05/fon-1.jpg','on','','','',1,1,1558082814,1559902468,1,2),(2,'Слайд 2','fade',7,300,'','',NULL,'/uploads/2019/05/fon-2.jpg','on','','','',1,2,1558083574,1558353450,1,1),(3,'Слайд 3','fade',7,300,'','',NULL,'/uploads/2019/05/fon-3.jpg','on','','','',1,3,1558083627,1559895743,1,1);
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides_layers`
--

DROP TABLE IF EXISTS `slides_layers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides_layers` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `slides_id` int(8) NOT NULL,
  `content` mediumtext NOT NULL,
  `class` varchar(127) DEFAULT NULL,
  `data_x` varchar(127) DEFAULT NULL,
  `data_y` varchar(127) DEFAULT NULL,
  `data_customin` varchar(512) DEFAULT NULL,
  `data_customout` varchar(512) DEFAULT NULL,
  `data_hoffset` smallint(3) DEFAULT NULL,
  `data_voffset` smallint(3) DEFAULT NULL,
  `data_speed` smallint(3) DEFAULT NULL,
  `data_start` smallint(3) DEFAULT NULL,
  `data_easing` varchar(127) DEFAULT NULL,
  `data_splitin` varchar(127) DEFAULT NULL,
  `data_splitout` varchar(127) DEFAULT NULL,
  `data_elementdelay` varchar(127) DEFAULT NULL,
  `data_endelementdelay` varchar(127) DEFAULT NULL,
  `data_end` varchar(127) DEFAULT NULL,
  `data_endspeed` smallint(3) DEFAULT NULL,
  `data_endeasing` varchar(127) DEFAULT NULL,
  `data_captionhidden` varchar(32) DEFAULT NULL,
  `style` varchar(127) DEFAULT NULL,
  `btn_flag` tinyint(1) NOT NULL DEFAULT '0',
  `btn_url` varchar(127) DEFAULT NULL,
  `btn_icon` varchar(127) DEFAULT NULL,
  `btn_name` varchar(127) DEFAULT NULL,
  `btn_class` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slides_id` (`slides_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides_layers`
--

LOCK TABLES `slides_layers` WRITE;
/*!40000 ALTER TABLE `slides_layers` DISABLE KEYS */;
INSERT INTO `slides_layers` VALUES (1,1,'Фотография - это искусство...','tp-caption medium_text lft','90','180','','',NULL,NULL,300,500,'easeOutExpo','','','','','',NULL,'','','',0,'','','',''),(2,1,'Для меня фотография – это искусство наблюдения.','tp-caption large_text lfb','90','222','','',NULL,NULL,300,800,'easeOutExpo','','','','','',NULL,'','','',0,'','','',''),(3,1,'Кнопка','tp-caption lfb','90','330','','',NULL,NULL,300,1100,'easeOutExpo','','','','','',NULL,'','','',1,'/site/contact','fa fa-chevron-circle-right','Sign up for me','btn btn-default btn-lg'),(4,2,'Фотография - это искусство...','tp-caption medium_text lft','90','180','','',NULL,NULL,300,500,'easeOutExpo','','','','','',NULL,'','','',0,'','','',''),(5,2,'Для меня фотография – это искусство наблюдения.','tp-caption large_text lfb','90','222','','',NULL,NULL,300,800,'easeOutExpo','','','','','',NULL,'','','',0,'','','',''),(6,2,'Кнопка','tp-caption lfb','90','330','','',NULL,NULL,300,1100,'easeOutExpo','','','','','',NULL,'','','',1,'/site/contact','fa fa-chevron-circle-right','Sign up for me','btn btn-default btn-lg'),(7,3,'Фотография - это искусство...','tp-caption medium_text lft','90','180','','',NULL,NULL,300,500,'easeOutExpo','','','','','',NULL,'','','',0,'','','',''),(8,3,'Для меня фотография – это искусство наблюдения.','tp-caption large_text lfb','90','222','','',NULL,NULL,300,800,'easeOutExpo','','','','','',NULL,'','','',0,'','','',''),(9,3,'Кнопка','tp-caption lfb','90','330','','',NULL,NULL,300,1100,'easeOutExpo','','','','','',NULL,'','','',1,'/site/contact','fa fa-chevron-circle-right','Sign up for me','btn btn-default btn-lg'),(12,4,'Фотография - это искусство...','tp-caption medium_text lft','90','180','','',NULL,NULL,300,500,'easeOutExpo','','','','','',NULL,'','','',0,'','','',''),(13,4,'Для меня фотография – это искусство наблюдения.','tp-caption large_text lfb','90','222','','',NULL,NULL,300,800,'easeOutExpo','','','','','',NULL,'','','',0,'','','',''),(14,4,'Кнопка','tp-caption lfb','90','330','','',NULL,NULL,300,1100,'easeOutExpo','','','','','',NULL,'','','',1,'/site/contact','fa fa-chevron-circle-right','Sign up for me','btn btn-default btn-lg');
/*!40000 ALTER TABLE `slides_layers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `superadmin` int(6) DEFAULT '0',
  `registration_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bind_to_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_confirmed` int(1) DEFAULT '0',
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` text COLLATE utf8_unicode_ci,
  `first_name` varchar(124) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(124) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(124) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_day` int(2) DEFAULT NULL,
  `birth_month` int(2) DEFAULT NULL,
  `birth_year` int(4) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','','$2y$13$Zca50y5hGlz.tzNJoKkv0.1Sw6xSWqSaEBPcoa6PWeV3mOxymfkxC',NULL,'artmarkov@mail.ru',10,1558443053,1560421261,1,'37.190.61.236',NULL,1,NULL,NULL,'Артур','Марков','Владимирович',1,4,1971,1,NULL,NULL,NULL),(2,'dew','','$2y$13$wqhU4rFd182J0MkIgImiYuMA9PeS16u.eNLWKNCf1lIc/zHNKZ1Y.',NULL,'tj-dj@mail.ru',10,1558443053,1560422154,0,'37.190.61.236','',1,NULL,NULL,'Евгений','Туйцын','Викторович',20,5,1984,1,'','','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `user_setting_user_key` (`user_id`,`key`),
  CONSTRAINT `fk_user_id_user_setting_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_setting`
--

LOCK TABLES `user_setting` WRITE;
/*!40000 ALTER TABLE `user_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_visit_log`
--

DROP TABLE IF EXISTS `user_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` varchar(5) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `browser` varchar(30) NOT NULL,
  `os` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `visit_log_user_id` (`user_id`),
  CONSTRAINT `fk_user_id_user_visit_log_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_visit_log`
--

LOCK TABLES `user_visit_log` WRITE;
/*!40000 ALTER TABLE `user_visit_log` DISABLE KEYS */;
INSERT INTO `user_visit_log` VALUES (80,'5d02282a17fde','37.190.61.236','ru','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0','Firefox','Windows',1,1560422442),(81,'5d023859e895e','37.190.61.236','ru','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','Chrome','Windows',1,1560426585),(82,'5d0238a7264e1','37.190.61.236','ru','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 YaBrowser/19.6.0.1574 Yowser/2.5 Safari/537.36','Yandex Browser','Windows',1,1560426663),(83,'5d0238f801091','37.190.61.236','ru','Mozilla/5.0 (iPad; CPU OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.0 Mobile/14G60 Safari/602.1','iPad','iPad',1,1560426744),(84,'5d025d135be51','37.190.61.236','ru','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','Chrome','Windows',1,1560435987),(85,'5d03566336642','37.190.61.236','ru','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','Chrome','Windows',1,1560499811),(86,'5d03a27a9f860','37.190.61.236','ru','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','Chrome','Windows',1,1560519290),(87,'5d03a65d9edaf','37.190.61.236','ru','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','Chrome','Windows',1,1560520285),(88,'5d03e887e14ed','91.205.147.33','ru','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36','Chrome','mac',1,1560537223),(89,'5d04171a8d176','91.205.147.33','ru','Mozilla/5.0 (iPad; CPU OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.0 Mobile/14G60 Safari/602.1','iPad','iPad',1,1560549146),(90,'5d04d5595aa93','91.205.147.33','ru','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36','Chrome','mac',1,1560597849),(91,'5d0656b862c6b','91.205.147.33','ru','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36','Chrome','mac',1,1560696504),(92,'5d07223949cd1','91.205.147.33','ru','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36','Chrome','mac',1,1560748601);
/*!40000 ALTER TABLE `user_visit_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-17  8:17:41
