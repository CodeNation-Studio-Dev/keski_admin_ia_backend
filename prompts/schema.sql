/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: soysuajam_db
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_email_address_id_5b7f8c58_fk` (`email_address_id`),
  CONSTRAINT `account_emailconfirmation_email_address_id_5b7f8c58_fk` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address_business`
--

DROP TABLE IF EXISTS `address_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(200) NOT NULL,
  `int_number` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `ext_number` varchar(50) DEFAULT NULL,
  `suburb` varchar(300) DEFAULT NULL,
  `street_between` varchar(35) DEFAULT NULL,
  `map_lat` varchar(300) DEFAULT NULL,
  `map_lon` varchar(300) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `reference` varchar(500) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `default` tinyint(1) NOT NULL,
  `is_shipping_address` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_business_branch_id_9732fd62_fk_branch_id` (`branch_id`),
  KEY `address_business_business_id_d435ccc2_fk_business_id` (`business_id`),
  KEY `address_business_client_id_9495480c_fk_im_client_id` (`client_id`),
  KEY `address_business_supplier_id_58228e2f_fk_im_supplier_id` (`supplier_id`),
  CONSTRAINT `address_business_branch_id_9732fd62_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `address_business_business_id_d435ccc2_fk_business_id` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
  CONSTRAINT `address_business_client_id_9495480c_fk_im_client_id` FOREIGN KEY (`client_id`) REFERENCES `im_client` (`id`),
  CONSTRAINT `address_business_supplier_id_58228e2f_fk_im_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `im_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address_users`
--

DROP TABLE IF EXISTS `address_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(200) NOT NULL,
  `int_number` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `ext_number` varchar(50) DEFAULT NULL,
  `suburb` varchar(300) DEFAULT NULL,
  `street_between` varchar(35) DEFAULT NULL,
  `map_lat` varchar(300) DEFAULT NULL,
  `map_lon` varchar(300) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `reference` varchar(500) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `recipient_first_name` varchar(255) DEFAULT NULL,
  `recipient_last_name` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_users_user_id_2079d2e7_fk_auth_user_id` (`user_id`),
  CONSTRAINT `address_users_user_id_2079d2e7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_groups_allowed`
--

DROP TABLE IF EXISTS `auth_groups_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_groups_allowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_user_id_2f9b6447_fk_auth_user_id` (`user_id`),
  KEY `branch_warehouse_id_c972f4dc_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `branch_user_id_2f9b6447_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `branch_warehouse_id_c972f4dc_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `turn_business` varchar(250) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `business_name` varchar(250) DEFAULT NULL,
  `rfc` varchar(50) DEFAULT NULL,
  `instagram` varchar(250) DEFAULT NULL,
  `youtube` varchar(250) DEFAULT NULL,
  `whatsapp` varchar(250) DEFAULT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  `terms_conditions` varchar(5000) DEFAULT NULL,
  `notice_privacy` varchar(5000) DEFAULT NULL,
  `logo_rect_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `email_notify` varchar(100) DEFAULT NULL,
  `email_host` varchar(100) DEFAULT NULL,
  `email_port` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `is_email_active` tinyint(1) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `favicon_id` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `linkedin` varchar(250) DEFAULT NULL,
  `logo_sqr_id` int(11) DEFAULT NULL,
  `tiktok` varchar(250) DEFAULT NULL,
  `membership` smallint(5) unsigned NOT NULL CHECK (`membership` >= 0),
  `type` smallint(5) unsigned NOT NULL CHECK (`type` >= 0),
  PRIMARY KEY (`id`),
  KEY `business_warehouse_id_f88bdb6c_fk_ic_warehouse_id` (`warehouse_id`),
  KEY `business_favicon_id_270d4365` (`favicon_id`),
  KEY `business_logo_rect_id_8fe98e42` (`logo_rect_id`),
  KEY `business_logo_sqr_id_0b34c71b` (`logo_sqr_id`),
  CONSTRAINT `business_favicon_id_270d4365_fk_business_image_id` FOREIGN KEY (`favicon_id`) REFERENCES `business_image` (`id`),
  CONSTRAINT `business_logo_rect_id_8fe98e42_fk_business_image_id` FOREIGN KEY (`logo_rect_id`) REFERENCES `business_image` (`id`),
  CONSTRAINT `business_logo_sqr_id_0b34c71b_fk_business_image_id` FOREIGN KEY (`logo_sqr_id`) REFERENCES `business_image` (`id`),
  CONSTRAINT `business_warehouse_id_f88bdb6c_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_image`
--

DROP TABLE IF EXISTS `business_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_keyword`
--

DROP TABLE IF EXISTS `business_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `business_keyword_business_id_0783a004_fk_business_id` (`business_id`),
  CONSTRAINT `business_keyword_business_id_0783a004_fk_business_id` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) DEFAULT NULL,
  `color_primary` varchar(10) DEFAULT NULL,
  `color_secondary` varchar(10) DEFAULT NULL,
  `typography` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_category`
--

DROP TABLE IF EXISTS `cat_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `display_on_store` tinyint(1) DEFAULT NULL,
  `display_on_pos` tinyint(1) DEFAULT NULL,
  `display_on_catalog` tinyint(1) DEFAULT NULL,
  `group_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_category_group_category_id_7990daf5_fk_cat_group_category_id` (`group_category_id`),
  CONSTRAINT `cat_category_group_category_id_7990daf5_fk_cat_group_category_id` FOREIGN KEY (`group_category_id`) REFERENCES `cat_group_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_filter`
--

DROP TABLE IF EXISTS `cat_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_group_category`
--

DROP TABLE IF EXISTS `cat_group_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_group_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_image`
--

DROP TABLE IF EXISTS `cat_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_image_model_id_49b0a885_fk_cat_model_id` (`model_id`),
  CONSTRAINT `cat_image_model_id_49b0a885_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_label`
--

DROP TABLE IF EXISTS `cat_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_label_filter_id_d12bbeff_fk_cat_filter_id` (`filter_id`),
  CONSTRAINT `cat_label_filter_id_d12bbeff_fk_cat_filter_id` FOREIGN KEY (`filter_id`) REFERENCES `cat_filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_model`
--

DROP TABLE IF EXISTS `cat_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `discount` varchar(4) DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_model_product_id_f7c4708a_fk_cat_product_id` (`product_id`),
  CONSTRAINT `cat_model_product_id_f7c4708a_fk_cat_product_id` FOREIGN KEY (`product_id`) REFERENCES `cat_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_presentation`
--

DROP TABLE IF EXISTS `cat_presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_presentation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `model_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cat_presentation_barcode_74a2ecbb_uniq` (`barcode`),
  KEY `cat_presentation_model_id_19643b08_fk_cat_model_id` (`model_id`),
  KEY `cat_presentation_product_id_2f1dfe61_fk_cat_product_id` (`product_id`),
  CONSTRAINT `cat_presentation_model_id_19643b08_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `cat_presentation_product_id_2f1dfe61_fk_cat_product_id` FOREIGN KEY (`product_id`) REFERENCES `cat_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_product`
--

DROP TABLE IF EXISTS `cat_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `preparation_time` smallint(5) unsigned DEFAULT NULL,
  `is_preparation_time` tinyint(1) DEFAULT NULL,
  `main_model` varchar(50) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `display_on_store` tinyint(1) DEFAULT NULL,
  `display_on_pos` tinyint(1) DEFAULT NULL,
  `display_on_catalog` tinyint(1) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `outstanding` tinyint(1) DEFAULT NULL,
  `show_in_gallery` tinyint(1) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `discount_pos` tinyint(1) DEFAULT NULL,
  `discount_store` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_product_category_id_85602265_fk_cat_category_id` (`category_id`),
  KEY `cat_product_user_id_15e06de5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cat_product_category_id_85602265_fk_cat_category_id` FOREIGN KEY (`category_id`) REFERENCES `cat_category` (`id`),
  CONSTRAINT `cat_product_user_id_15e06de5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cat_product_preparation_time_8e01124f_check` CHECK (`preparation_time` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_product_filter`
--

DROP TABLE IF EXISTS `cat_product_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_product_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_product_filter_filter_id_624647b8_fk_cat_filter_id` (`filter_id`),
  KEY `cat_product_filter_label_id_73a5ea5c_fk_cat_label_id` (`label_id`),
  KEY `cat_product_filter_product_id_858cd663_fk_cat_product_id` (`product_id`),
  CONSTRAINT `cat_product_filter_filter_id_624647b8_fk_cat_filter_id` FOREIGN KEY (`filter_id`) REFERENCES `cat_filter` (`id`),
  CONSTRAINT `cat_product_filter_label_id_73a5ea5c_fk_cat_label_id` FOREIGN KEY (`label_id`) REFERENCES `cat_label` (`id`),
  CONSTRAINT `cat_product_filter_product_id_858cd663_fk_cat_product_id` FOREIGN KEY (`product_id`) REFERENCES `cat_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmn_customer`
--

DROP TABLE IF EXISTS `cmn_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmn_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmn_customer_user_id_817bb2db_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cmn_customer_user_id_817bb2db_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmn_notification`
--

DROP TABLE IF EXISTS `cmn_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmn_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(250) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `sale_order_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_client_id_a060839c_fk_im_client_id` (`client_id`),
  KEY `comments_purchase_order_id_757caecb_fk_im_purchase_order_id` (`purchase_order_id`),
  KEY `comments_sale_order_id_efc3c32c_fk_im_sales_order_id` (`sale_order_id`),
  KEY `comments_supplier_id_c42f9efe_fk_im_supplier_id` (`supplier_id`),
  CONSTRAINT `comments_client_id_a060839c_fk_im_client_id` FOREIGN KEY (`client_id`) REFERENCES `im_client` (`id`),
  CONSTRAINT `comments_purchase_order_id_757caecb_fk_im_purchase_order_id` FOREIGN KEY (`purchase_order_id`) REFERENCES `im_purchase_order` (`id`),
  CONSTRAINT `comments_sale_order_id_efc3c32c_fk_im_sales_order_id` FOREIGN KEY (`sale_order_id`) REFERENCES `im_sales_order` (`id`),
  CONSTRAINT `comments_supplier_id_c42f9efe_fk_im_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `im_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_client_id_468f0ab4_fk_im_client_id` (`client_id`),
  KEY `contact_supplier_id_ab7d70a8_fk_im_supplier_id` (`supplier_id`),
  CONSTRAINT `contact_client_id_468f0ab4_fk_im_client_id` FOREIGN KEY (`client_id`) REFERENCES `im_client` (`id`),
  CONSTRAINT `contact_supplier_id_ab7d70a8_fk_im_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `im_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_adjustment`
--

DROP TABLE IF EXISTS `ic_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) DEFAULT NULL,
  `current_quantity` decimal(10,3) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `adjustment_order_id` int(11) NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  `presentation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_adjustment_adjustment_order_id_91a655cb_fk_ic_adjust` (`adjustment_order_id`),
  KEY `ic_adjustment_model_id_22015f54_fk_cat_model_id` (`model_id`),
  KEY `ic_adjustment_presentation_id_8d4a69e0_fk_cat_presentation_id` (`presentation_id`),
  CONSTRAINT `ic_adjustment_adjustment_order_id_91a655cb_fk_ic_adjust` FOREIGN KEY (`adjustment_order_id`) REFERENCES `ic_adjustment_order` (`id`),
  CONSTRAINT `ic_adjustment_model_id_22015f54_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `ic_adjustment_presentation_id_8d4a69e0_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_adjustment_order`
--

DROP TABLE IF EXISTS `ic_adjustment_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_adjustment_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_adjustment_order_user_id_7e357372_fk_auth_user_id` (`user_id`),
  KEY `ic_adjustment_order_warehouse_id_421b98d1_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `ic_adjustment_order_user_id_7e357372_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `ic_adjustment_order_warehouse_id_421b98d1_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_available`
--

DROP TABLE IF EXISTS `ic_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_available` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) NOT NULL,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `location` smallint(6) NOT NULL,
  `model_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_available_model_id_69ff7387_fk_cat_model_id` (`model_id`),
  KEY `ic_available_presentation_id_68e63998_fk_cat_presentation_id` (`presentation_id`),
  KEY `ic_available_warehouse_id_ea4e278a_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `ic_available_model_id_69ff7387_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `ic_available_presentation_id_68e63998_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `ic_available_warehouse_id_ea4e278a_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_inventory_transaction`
--

DROP TABLE IF EXISTS `ic_inventory_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_inventory_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` decimal(10,3) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `adjustment_id` int(11) DEFAULT NULL,
  `available_id` int(11) DEFAULT NULL,
  `ordered_id` int(11) DEFAULT NULL,
  `pos_id` int(11) DEFAULT NULL,
  `production_id` int(11) DEFAULT NULL,
  `reserved_id` int(11) DEFAULT NULL,
  `scrap_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `req_mat_id` int(11) DEFAULT NULL,
  `cart_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_inventory_transac_adjustment_id_5222d3c3_fk_ic_adjust` (`adjustment_id`),
  KEY `ic_inventory_transac_available_id_1fc18432_fk_ic_availa` (`available_id`),
  KEY `ic_inventory_transaction_ordered_id_ddb40dd3_fk_ic_ordered_id` (`ordered_id`),
  KEY `ic_inventory_transaction_pos_id_9e9cfa45_fk_pos_order_item_id` (`pos_id`),
  KEY `ic_inventory_transac_production_id_1a485d17_fk_ic_produc` (`production_id`),
  KEY `ic_inventory_transaction_reserved_id_94826134_fk_ic_reserved_id` (`reserved_id`),
  KEY `ic_inventory_transaction_scrap_id_c8993259_fk_ic_scrap_id` (`scrap_id`),
  KEY `ic_inventory_transaction_transfer_id_9b592c9c_fk_ic_transfer_id` (`transfer_id`),
  KEY `ic_inventory_transaction_user_id_881609c4_fk_auth_user_id` (`user_id`),
  KEY `ic_inventory_transac_req_mat_id_efcc6916_fk_ic_req_ma` (`req_mat_id`),
  KEY `ic_inventory_transac_cart_item_id_0deaae4f_fk_str_cart_` (`cart_item_id`),
  CONSTRAINT `ic_inventory_transac_adjustment_id_5222d3c3_fk_ic_adjust` FOREIGN KEY (`adjustment_id`) REFERENCES `ic_adjustment` (`id`),
  CONSTRAINT `ic_inventory_transac_available_id_1fc18432_fk_ic_availa` FOREIGN KEY (`available_id`) REFERENCES `ic_available` (`id`),
  CONSTRAINT `ic_inventory_transac_cart_item_id_0deaae4f_fk_str_cart_` FOREIGN KEY (`cart_item_id`) REFERENCES `str_cart_item` (`id`),
  CONSTRAINT `ic_inventory_transac_production_id_1a485d17_fk_ic_produc` FOREIGN KEY (`production_id`) REFERENCES `ic_production` (`id`),
  CONSTRAINT `ic_inventory_transac_req_mat_id_efcc6916_fk_ic_req_ma` FOREIGN KEY (`req_mat_id`) REFERENCES `ic_req_material` (`id`),
  CONSTRAINT `ic_inventory_transaction_ordered_id_ddb40dd3_fk_ic_ordered_id` FOREIGN KEY (`ordered_id`) REFERENCES `ic_ordered` (`id`),
  CONSTRAINT `ic_inventory_transaction_pos_id_9e9cfa45_fk_pos_order_item_id` FOREIGN KEY (`pos_id`) REFERENCES `pos_order_item` (`id`),
  CONSTRAINT `ic_inventory_transaction_reserved_id_94826134_fk_ic_reserved_id` FOREIGN KEY (`reserved_id`) REFERENCES `ic_reserved` (`id`),
  CONSTRAINT `ic_inventory_transaction_scrap_id_c8993259_fk_ic_scrap_id` FOREIGN KEY (`scrap_id`) REFERENCES `ic_scrap` (`id`),
  CONSTRAINT `ic_inventory_transaction_transfer_id_9b592c9c_fk_ic_transfer_id` FOREIGN KEY (`transfer_id`) REFERENCES `ic_transfer` (`id`),
  CONSTRAINT `ic_inventory_transaction_user_id_881609c4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_ordered`
--

DROP TABLE IF EXISTS `ic_ordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_ordered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) DEFAULT NULL,
  `quantity_pending` decimal(10,3) DEFAULT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` smallint(6) NOT NULL,
  `date_received` datetime(6) DEFAULT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `model_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_ordered_model_id_79a8e486_fk_cat_model_id` (`model_id`),
  KEY `ic_ordered_presentation_id_08bd2e0d_fk_cat_presentation_id` (`presentation_id`),
  KEY `ic_ordered_purchase_id_7ea38e63_fk_im_purchase_order_id` (`purchase_id`),
  KEY `ic_ordered_warehouse_id_e8fab6dd_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `ic_ordered_model_id_79a8e486_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `ic_ordered_presentation_id_08bd2e0d_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `ic_ordered_purchase_id_7ea38e63_fk_im_purchase_order_id` FOREIGN KEY (`purchase_id`) REFERENCES `im_purchase_order` (`id`),
  CONSTRAINT `ic_ordered_warehouse_id_e8fab6dd_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_production`
--

DROP TABLE IF EXISTS `ic_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_production` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `quantity_pending` decimal(10,3) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  `production_order_id` int(11) NOT NULL,
  `production_order_recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_production_model_id_9f813fec_fk_cat_model_id` (`model_id`),
  KEY `ic_production_presentation_id_8e238b64_fk_cat_presentation_id` (`presentation_id`),
  KEY `ic_production_production_order_id_d3c7ca39_fk_im_produc` (`production_order_id`),
  KEY `ic_production_production_order_rec_fa888b80_fk_im_produc` (`production_order_recipe_id`),
  KEY `ic_production_user_id_3e54e952_fk_auth_user_id` (`user_id`),
  KEY `ic_production_warehouse_id_d282e15b_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `ic_production_model_id_9f813fec_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `ic_production_presentation_id_8e238b64_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `ic_production_production_order_id_d3c7ca39_fk_im_produc` FOREIGN KEY (`production_order_id`) REFERENCES `im_production_order` (`id`),
  CONSTRAINT `ic_production_production_order_rec_fa888b80_fk_im_produc` FOREIGN KEY (`production_order_recipe_id`) REFERENCES `im_production_order_recipe` (`id`),
  CONSTRAINT `ic_production_user_id_3e54e952_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `ic_production_warehouse_id_d282e15b_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_req_material`
--

DROP TABLE IF EXISTS `ic_req_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_req_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) DEFAULT NULL,
  `quantity_pending` decimal(10,3) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_delivered` datetime(6) DEFAULT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `presentation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_req_material_model_id_7aaac8ba_fk_cat_model_id` (`model_id`),
  KEY `ic_req_material_order_id_b866ef1f_fk_im_req_material_order_id` (`order_id`),
  KEY `ic_req_material_presentation_id_8f2d38f3_fk_cat_presentation_id` (`presentation_id`),
  CONSTRAINT `ic_req_material_model_id_7aaac8ba_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `ic_req_material_order_id_b866ef1f_fk_im_req_material_order_id` FOREIGN KEY (`order_id`) REFERENCES `im_req_material_order` (`id`),
  CONSTRAINT `ic_req_material_presentation_id_8f2d38f3_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_reserved`
--

DROP TABLE IF EXISTS `ic_reserved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_reserved` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) DEFAULT NULL,
  `quantity_pending` decimal(10,3) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_received` datetime(6) DEFAULT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_reserved_model_id_8804356d_fk_cat_model_id` (`model_id`),
  KEY `ic_reserved_presentation_id_2a2f5553_fk_cat_presentation_id` (`presentation_id`),
  KEY `ic_reserved_sale_id_f9442aa8_fk_im_sales_order_id` (`sale_id`),
  KEY `ic_reserved_warehouse_id_9bda11d9_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `ic_reserved_model_id_8804356d_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `ic_reserved_presentation_id_2a2f5553_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `ic_reserved_sale_id_f9442aa8_fk_im_sales_order_id` FOREIGN KEY (`sale_id`) REFERENCES `im_sales_order` (`id`),
  CONSTRAINT `ic_reserved_warehouse_id_9bda11d9_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_scrap`
--

DROP TABLE IF EXISTS `ic_scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_scrap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `presentation_id` int(11) DEFAULT NULL,
  `scrap_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_scrap_model_id_973e0d49_fk_cat_model_id` (`model_id`),
  KEY `ic_scrap_presentation_id_cd72b66c_fk_cat_presentation_id` (`presentation_id`),
  KEY `ic_scrap_scrap_order_id_f6dbf1c8_fk_ic_scrap_order_id` (`scrap_order_id`),
  CONSTRAINT `ic_scrap_model_id_973e0d49_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `ic_scrap_presentation_id_cd72b66c_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `ic_scrap_scrap_order_id_f6dbf1c8_fk_ic_scrap_order_id` FOREIGN KEY (`scrap_order_id`) REFERENCES `ic_scrap_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_scrap_order`
--

DROP TABLE IF EXISTS `ic_scrap_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_scrap_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `justification` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_scrap_order_user_id_7ae741a5_fk_auth_user_id` (`user_id`),
  KEY `ic_scrap_order_warehouse_id_b76fceb3_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `ic_scrap_order_user_id_7ae741a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `ic_scrap_order_warehouse_id_b76fceb3_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_settings`
--

DROP TABLE IF EXISTS `ic_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `is_iva` tinyint(1) NOT NULL,
  `iva` int(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_transfer`
--

DROP TABLE IF EXISTS `ic_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `quantity` decimal(10,3) NOT NULL,
  `pending_deliver` decimal(10,3) NOT NULL,
  `pending_receive` decimal(10,3) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `available_id` int(11) NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  `presentation_id` int(11) DEFAULT NULL,
  `transfer_order_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_transfer_available_id_c6f036f2_fk_ic_available_id` (`available_id`),
  KEY `ic_transfer_model_id_8d617667_fk_cat_model_id` (`model_id`),
  KEY `ic_transfer_presentation_id_657c1afb_fk_cat_presentation_id` (`presentation_id`),
  KEY `ic_transfer_transfer_order_id_379d195d_fk_ic_transfer_order_id` (`transfer_order_id`),
  KEY `ic_transfer_warehouse_id_0d50ba37_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `ic_transfer_available_id_c6f036f2_fk_ic_available_id` FOREIGN KEY (`available_id`) REFERENCES `ic_available` (`id`),
  CONSTRAINT `ic_transfer_model_id_8d617667_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `ic_transfer_presentation_id_657c1afb_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `ic_transfer_transfer_order_id_379d195d_fk_ic_transfer_order_id` FOREIGN KEY (`transfer_order_id`) REFERENCES `ic_transfer_order` (`id`),
  CONSTRAINT `ic_transfer_warehouse_id_0d50ba37_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_transfer_order`
--

DROP TABLE IF EXISTS `ic_transfer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_transfer_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_destiny_id` int(11) NOT NULL,
  `warehouse_source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_transfer_order_user_id_9e6ca816_fk_auth_user_id` (`user_id`),
  KEY `ic_transfer_order_warehouse_destiny_id_7d86a084_fk_ic_wareho` (`warehouse_destiny_id`),
  KEY `ic_transfer_order_warehouse_source_id_8c888921_fk_ic_wareho` (`warehouse_source_id`),
  CONSTRAINT `ic_transfer_order_user_id_9e6ca816_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `ic_transfer_order_warehouse_destiny_id_7d86a084_fk_ic_wareho` FOREIGN KEY (`warehouse_destiny_id`) REFERENCES `ic_warehouse` (`id`),
  CONSTRAINT `ic_transfer_order_warehouse_source_id_8c888921_fk_ic_wareho` FOREIGN KEY (`warehouse_source_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ic_warehouse`
--

DROP TABLE IF EXISTS `ic_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ic_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `status` smallint(6) NOT NULL,
  `sell_products_online` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selling_priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ic_warehouse_user_id_cc9128a5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `ic_warehouse_user_id_cc9128a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_client`
--

DROP TABLE IF EXISTS `im_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `credit_status` smallint(6) DEFAULT NULL,
  `credit_days` smallint(6) DEFAULT NULL,
  `credit_limit` decimal(10,2) DEFAULT NULL,
  `discount_status` smallint(6) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `im_client_user_id_328b5e31_fk_auth_user_id` (`user_id`),
  CONSTRAINT `im_client_user_id_328b5e31_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_production_order`
--

DROP TABLE IF EXISTS `im_production_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_production_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_order` varchar(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `im_production_order_user_id_a5e6dbd5_fk_auth_user_id` (`user_id`),
  KEY `im_production_order_warehouse_id_e29bee89_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `im_production_order_user_id_a5e6dbd5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `im_production_order_warehouse_id_e29bee89_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_production_order_recipe`
--

DROP TABLE IF EXISTS `im_production_order_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_production_order_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) DEFAULT NULL,
  `quantity_recipe` decimal(10,3) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `production_order_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_production_order__production_order_id_27926fd1_fk_im_produc` (`production_order_id`),
  KEY `im_production_order_recipe_recipe_id_ed53d155_fk_im_recipe_id` (`recipe_id`),
  CONSTRAINT `im_production_order__production_order_id_27926fd1_fk_im_produc` FOREIGN KEY (`production_order_id`) REFERENCES `im_production_order` (`id`),
  CONSTRAINT `im_production_order_recipe_recipe_id_ed53d155_fk_im_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `im_recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_purchase_order`
--

DROP TABLE IF EXISTS `im_purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_order` varchar(20) NOT NULL,
  `currency` smallint(6) DEFAULT NULL,
  `exchange_rate` decimal(10,2) DEFAULT NULL,
  `pay_form` smallint(6) DEFAULT NULL,
  `pay_method` smallint(6) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `status` int(11) NOT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_purchase_order_supplier_id_22bbd091_fk_im_supplier_id` (`supplier_id`),
  KEY `im_purchase_order_user_id_d9ef3654_fk_auth_user_id` (`user_id`),
  KEY `im_purchase_order_warehouse_id_55b90182_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `im_purchase_order_supplier_id_22bbd091_fk_im_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `im_supplier` (`id`),
  CONSTRAINT `im_purchase_order_user_id_d9ef3654_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `im_purchase_order_warehouse_id_55b90182_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_raw_material`
--

DROP TABLE IF EXISTS `im_raw_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_raw_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` decimal(10,3) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `model_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_raw_material_model_id_057fd1ca_fk_cat_model_id` (`model_id`),
  KEY `im_raw_material_presentation_id_bec9ee9a_fk_cat_presentation_id` (`presentation_id`),
  KEY `im_raw_material_recipe_id_c78b79f3_fk_im_recipe_id` (`recipe_id`),
  KEY `im_raw_material_user_id_b7c5dac3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `im_raw_material_model_id_057fd1ca_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `im_raw_material_presentation_id_bec9ee9a_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `im_raw_material_recipe_id_c78b79f3_fk_im_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `im_recipe` (`id`),
  CONSTRAINT `im_raw_material_user_id_b7c5dac3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_recipe`
--

DROP TABLE IF EXISTS `im_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `model_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  `recipe_group_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_recipe_model_id_b3ebc5f0_fk_cat_model_id` (`model_id`),
  KEY `im_recipe_presentation_id_9b0ff9d8_fk_cat_presentation_id` (`presentation_id`),
  KEY `im_recipe_recipe_group_id_0590352e_fk_im_recipe_group_id` (`recipe_group_id`),
  KEY `im_recipe_user_id_0a81a41f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `im_recipe_model_id_b3ebc5f0_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `im_recipe_presentation_id_9b0ff9d8_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `im_recipe_recipe_group_id_0590352e_fk_im_recipe_group_id` FOREIGN KEY (`recipe_group_id`) REFERENCES `im_recipe_group` (`id`),
  CONSTRAINT `im_recipe_user_id_0a81a41f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_recipe_group`
--

DROP TABLE IF EXISTS `im_recipe_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_recipe_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_recipe_group_product_id_94f1a925_fk_cat_product_id` (`product_id`),
  KEY `im_recipe_group_user_id_b332cb68_fk_auth_user_id` (`user_id`),
  CONSTRAINT `im_recipe_group_product_id_94f1a925_fk_cat_product_id` FOREIGN KEY (`product_id`) REFERENCES `cat_product` (`id`),
  CONSTRAINT `im_recipe_group_user_id_b332cb68_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_req_material_order`
--

DROP TABLE IF EXISTS `im_req_material_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_req_material_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `department` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `date_delivered` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_req_material_order_user_id_bb4fa8c2_fk_auth_user_id` (`user_id`),
  KEY `im_req_material_order_warehouse_id_0737f8d1_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `im_req_material_order_user_id_bb4fa8c2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `im_req_material_order_warehouse_id_0737f8d1_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_sales_order`
--

DROP TABLE IF EXISTS `im_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_sales_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_order` varchar(20) NOT NULL,
  `currency` smallint(6) DEFAULT NULL,
  `exchange_rate` decimal(10,2) DEFAULT NULL,
  `pay_form` smallint(6) DEFAULT NULL,
  `pay_method` smallint(6) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `iva` decimal(6,2) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_sales_order_client_id_bb8edaff_fk_im_client_id` (`client_id`),
  KEY `im_sales_order_user_id_fb0aa59d_fk_auth_user_id` (`user_id`),
  KEY `im_sales_order_warehouse_id_0d619698_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `im_sales_order_client_id_bb8edaff_fk_im_client_id` FOREIGN KEY (`client_id`) REFERENCES `im_client` (`id`),
  CONSTRAINT `im_sales_order_user_id_fb0aa59d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `im_sales_order_warehouse_id_0d619698_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_supplier`
--

DROP TABLE IF EXISTS `im_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `credit_status` smallint(6) DEFAULT NULL,
  `credit_days` smallint(6) DEFAULT NULL,
  `credit_limit` decimal(10,2) DEFAULT NULL,
  `discount_status` smallint(6) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_supplier_user_id_f69deb92_fk_auth_user_id` (`user_id`),
  CONSTRAINT `im_supplier_user_id_f69deb92_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `im_supplier_product`
--

DROP TABLE IF EXISTS `im_supplier_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_supplier_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `im_supplier_product_supplier_id_product_id_b4387b3d_uniq` (`supplier_id`,`product_id`),
  KEY `im_supplier_product_product_id_6b019f50_fk_cat_product_id` (`product_id`),
  CONSTRAINT `im_supplier_product_product_id_6b019f50_fk_cat_product_id` FOREIGN KEY (`product_id`) REFERENCES `cat_product` (`id`),
  CONSTRAINT `im_supplier_product_supplier_id_3142bfc6_fk_im_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `im_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnd_component`
--

DROP TABLE IF EXISTS `lnd_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnd_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `layout` smallint(6) NOT NULL,
  `bg_type` smallint(6) NOT NULL,
  `bg_color1` varchar(10) DEFAULT NULL,
  `bg_color2` varchar(10) DEFAULT NULL,
  `bg_image` smallint(6) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `bg_gradiant_orientation` varchar(15) DEFAULT NULL,
  `bg_image_overlay` tinyint(1) DEFAULT NULL,
  `bg_image_overlay_alpha` smallint(6) NOT NULL,
  `bg_image_overlay_color` varchar(10) DEFAULT NULL,
  `justify_content` varchar(15) DEFAULT NULL,
  `layout_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnd_image`
--

DROP TABLE IF EXISTS `lnd_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnd_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnd_section`
--

DROP TABLE IF EXISTS `lnd_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnd_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_by` smallint(6) NOT NULL,
  `type` smallint(6) NOT NULL,
  `view` smallint(6) NOT NULL,
  `component_id` int(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lnd_section_component_id_23871adc_fk_lnd_component_id` (`component_id`),
  CONSTRAINT `lnd_section_component_id_23871adc_fk_lnd_component_id` FOREIGN KEY (`component_id`) REFERENCES `lnd_component` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnd_subcomponent`
--

DROP TABLE IF EXISTS `lnd_subcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnd_subcomponent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `image` smallint(6) DEFAULT NULL,
  `button_title` varchar(50) DEFAULT NULL,
  `button_action` varchar(100) DEFAULT NULL,
  `link` smallint(6) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `text_color` varchar(10) DEFAULT NULL,
  `button_active` tinyint(1) NOT NULL,
  `image_scale` decimal(4,2) NOT NULL,
  `image_transform_x` smallint(6) DEFAULT NULL,
  `image_transform_y` smallint(6) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `label_active` tinyint(1) NOT NULL,
  `label_color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lnd_subcomponent_component_id_9d3e346e_fk_lnd_component_id` (`component_id`),
  CONSTRAINT `lnd_subcomponent_component_id_9d3e346e_fk_lnd_component_id` FOREIGN KEY (`component_id`) REFERENCES `lnd_component` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_auth_code`
--

DROP TABLE IF EXISTS `pos_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `code` varchar(10) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_auth_code_owner_id_5a2534cf_fk_auth_user_id` (`owner_id`),
  KEY `pos_auth_code_user_id_4bdde99c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `pos_auth_code_owner_id_5a2534cf_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `pos_auth_code_user_id_4bdde99c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_cash_in_out`
--

DROP TABLE IF EXISTS `pos_cash_in_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_cash_in_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(12,2) NOT NULL,
  `reason` varchar(250) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `cash_register_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_cash_in_out_cash_register_id_037dcf3e_fk_pos_cash_` (`cash_register_id`),
  KEY `pos_cash_in_out_user_id_7877bf97_fk_auth_user_id` (`user_id`),
  CONSTRAINT `pos_cash_in_out_cash_register_id_037dcf3e_fk_pos_cash_` FOREIGN KEY (`cash_register_id`) REFERENCES `pos_cash_register` (`id`),
  CONSTRAINT `pos_cash_in_out_user_id_7877bf97_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_cash_register`
--

DROP TABLE IF EXISTS `pos_cash_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_cash_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(17,2) DEFAULT NULL,
  `subtotal` decimal(17,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `cash_in` decimal(10,2) DEFAULT NULL,
  `cash_out` decimal(10,2) DEFAULT NULL,
  `cash` decimal(10,2) DEFAULT NULL,
  `bank` decimal(10,2) DEFAULT NULL,
  `cash_counted` decimal(10,2) DEFAULT NULL,
  `closed_with_diff` smallint(6) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_closed` datetime(6) DEFAULT NULL,
  `date_canceled` datetime(6) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_cash_register_branch_id_132a8386_fk_branch_id` (`branch_id`),
  KEY `pos_cash_register_user_id_6ffab480_fk_auth_user_id` (`user_id`),
  KEY `pos_cash_register_warehouse_id_cd538b89_fk_ic_warehouse_id` (`warehouse_id`),
  CONSTRAINT `pos_cash_register_branch_id_132a8386_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `pos_cash_register_user_id_6ffab480_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `pos_cash_register_warehouse_id_cd538b89_fk_ic_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `ic_warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_discount`
--

DROP TABLE IF EXISTS `pos_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_discount_user_id_9a49182a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `pos_discount_user_id_9a49182a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_item_exchange`
--

DROP TABLE IF EXISTS `pos_item_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_item_exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL CHECK (`qty` >= 0),
  `date_created` datetime(6) NOT NULL,
  `pos_item_id` int(11) NOT NULL,
  `pos_item_refund_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_item_exchange_pos_item_id_a7104f74_fk_pos_order_item_id` (`pos_item_id`),
  KEY `pos_item_exchange_pos_item_refund_id_a27e0e0e_fk_pos_order` (`pos_item_refund_id`),
  CONSTRAINT `pos_item_exchange_pos_item_id_a7104f74_fk_pos_order_item_id` FOREIGN KEY (`pos_item_id`) REFERENCES `pos_order_item` (`id`),
  CONSTRAINT `pos_item_exchange_pos_item_refund_id_a27e0e0e_fk_pos_order` FOREIGN KEY (`pos_item_refund_id`) REFERENCES `pos_order_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_order`
--

DROP TABLE IF EXISTS `pos_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(17,2) DEFAULT NULL,
  `subtotal` decimal(17,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `auth_code_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_exchange_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_order_auth_code_id_da18e0b9_fk_pos_auth_code_id` (`auth_code_id`),
  KEY `pos_order_cash_register_id_763672a4_fk_pos_cash_register_id` (`cash_register_id`),
  KEY `pos_order_discount_id_55e69125_fk_pos_discount_id` (`discount_id`),
  KEY `pos_order_user_id_7fe42fdc_fk_auth_user_id` (`user_id`),
  KEY `pos_order_customer_id_880a0813_fk_cmn_customer_id` (`customer_id`),
  KEY `pos_order_order_exchange_id_015c2f74_fk_pos_order_id` (`order_exchange_id`),
  CONSTRAINT `pos_order_auth_code_id_da18e0b9_fk_pos_auth_code_id` FOREIGN KEY (`auth_code_id`) REFERENCES `pos_auth_code` (`id`),
  CONSTRAINT `pos_order_cash_register_id_763672a4_fk_pos_cash_register_id` FOREIGN KEY (`cash_register_id`) REFERENCES `pos_cash_register` (`id`),
  CONSTRAINT `pos_order_customer_id_880a0813_fk_cmn_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `cmn_customer` (`id`),
  CONSTRAINT `pos_order_discount_id_55e69125_fk_pos_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `pos_discount` (`id`),
  CONSTRAINT `pos_order_order_exchange_id_015c2f74_fk_pos_order_id` FOREIGN KEY (`order_exchange_id`) REFERENCES `pos_order` (`id`),
  CONSTRAINT `pos_order_user_id_7fe42fdc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_order_item`
--

DROP TABLE IF EXISTS `pos_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL,
  `qty_pending` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total` decimal(17,2) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `model_id` int(11) NOT NULL,
  `pos_order_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_order_item_model_id_bb8be56a_fk_cat_model_id` (`model_id`),
  KEY `pos_order_item_pos_order_id_54c000be_fk_pos_order_id` (`pos_order_id`),
  KEY `pos_order_item_presentation_id_d6b59676_fk_cat_presentation_id` (`presentation_id`),
  CONSTRAINT `pos_order_item_model_id_bb8be56a_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `pos_order_item_pos_order_id_54c000be_fk_pos_order_id` FOREIGN KEY (`pos_order_id`) REFERENCES `pos_order` (`id`),
  CONSTRAINT `pos_order_item_presentation_id_d6b59676_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `pos_order_item_qty_82690298_check` CHECK (`qty` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_pay_split`
--

DROP TABLE IF EXISTS `pos_pay_split`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_pay_split` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `pos_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_pay_split_pos_order_id_edc44d65_fk_pos_order_id` (`pos_order_id`),
  CONSTRAINT `pos_pay_split_pos_order_id_edc44d65_fk_pos_order_id` FOREIGN KEY (`pos_order_id`) REFERENCES `pos_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_settings`
--

DROP TABLE IF EXISTS `pos_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `is_iva` tinyint(1) NOT NULL,
  `iva` int(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `display_branch_name_on_ticket` tinyint(1) DEFAULT NULL,
  `display_RFC_on_ticket` tinyint(1) DEFAULT NULL,
  `display_branch_address_on_ticket` tinyint(1) DEFAULT NULL,
  `ticket_footnote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` smallint(6) NOT NULL,
  `open_time` time(6) NOT NULL,
  `close_time` time(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_branch_id_21e8769b_fk_branch_id` (`branch_id`),
  CONSTRAINT `schedule_branch_id_21e8769b_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_cart`
--

DROP TABLE IF EXISTS `str_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) DEFAULT NULL,
  `last_update` datetime(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `str_cart_business_id_58113a4e_fk_business_id` (`business_id`),
  KEY `str_cart_user_id_aa39ce46_fk_auth_user_id` (`user_id`),
  CONSTRAINT `str_cart_business_id_58113a4e_fk_business_id` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
  CONSTRAINT `str_cart_user_id_aa39ce46_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_cart_item`
--

DROP TABLE IF EXISTS `str_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) DEFAULT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `is_preparation_time` tinyint(1) DEFAULT NULL,
  `preparation_time` smallint(6) DEFAULT NULL,
  `last_update` datetime(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `presentation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `str_cart_item_cart_id_c21530ab_fk_str_cart_id` (`cart_id`),
  KEY `str_cart_item_model_id_f64ec40d_fk_cat_model_id` (`model_id`),
  KEY `str_cart_item_presentation_id_680ab34c_fk_cat_presentation_id` (`presentation_id`),
  CONSTRAINT `str_cart_item_cart_id_c21530ab_fk_str_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `str_cart` (`id`),
  CONSTRAINT `str_cart_item_model_id_f64ec40d_fk_cat_model_id` FOREIGN KEY (`model_id`) REFERENCES `cat_model` (`id`),
  CONSTRAINT `str_cart_item_presentation_id_680ab34c_fk_cat_presentation_id` FOREIGN KEY (`presentation_id`) REFERENCES `cat_presentation` (`id`),
  CONSTRAINT `str_cart_item_quantity_afa99589_check` CHECK (`quantity` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_cart_order`
--

DROP TABLE IF EXISTS `str_cart_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_cart_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_confirmed` datetime(6) DEFAULT NULL,
  `date_shipping` datetime(6) DEFAULT NULL,
  `date_delivery` datetime(6) DEFAULT NULL,
  `date_cancel` datetime(6) DEFAULT NULL,
  `date_processed` datetime(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `preparation_time` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_last_updated` datetime(6) NOT NULL,
  `shipping_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `str_cart_order_cart_id_5c6261f9_fk_str_cart_id` (`cart_id`),
  KEY `str_cart_order_delivery_address_id_d33d4718_fk_address_users_id` (`delivery_address_id`),
  KEY `str_cart_order_user_id_f4fc701b_fk_auth_user_id` (`user_id`),
  KEY `str_cart_order_shipping_address_id_1331627e_fk_address_b` (`shipping_address_id`),
  CONSTRAINT `str_cart_order_cart_id_5c6261f9_fk_str_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `str_cart` (`id`),
  CONSTRAINT `str_cart_order_delivery_address_id_d33d4718_fk_address_users_id` FOREIGN KEY (`delivery_address_id`) REFERENCES `address_users` (`id`),
  CONSTRAINT `str_cart_order_shipping_address_id_1331627e_fk_address_b` FOREIGN KEY (`shipping_address_id`) REFERENCES `address_business` (`id`),
  CONSTRAINT `str_cart_order_user_id_f4fc701b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_cart_order_canceled`
--

DROP TABLE IF EXISTS `str_cart_order_canceled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_cart_order_canceled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canceled_by` smallint(6) NOT NULL,
  `date_canceled` datetime(6) NOT NULL,
  `receipt_no` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `time_out` decimal(10,2) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `str_cart_order_canceled_order_id_ef3c0140_fk_str_cart_order_id` (`order_id`),
  CONSTRAINT `str_cart_order_canceled_order_id_ef3c0140_fk_str_cart_order_id` FOREIGN KEY (`order_id`) REFERENCES `str_cart_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_clip_checkout`
--

DROP TABLE IF EXISTS `str_clip_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_clip_checkout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_request_id` varchar(255) DEFAULT NULL,
  `payment_request_url` varchar(255) DEFAULT NULL,
  `expired_at` datetime(6) DEFAULT NULL,
  `attempts` smallint(6) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `canceled_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `declined_at` datetime(6) DEFAULT NULL,
  `detail_type` varchar(255) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `me_reference_id_id` int(11) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `receipt_no` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `resource_status` varchar(255) DEFAULT NULL,
  `sent_date` datetime(6) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `str_clip_checkout_me_reference_id_id_8d9ccbd2_fk_str_cart_` (`me_reference_id_id`),
  CONSTRAINT `str_clip_checkout_me_reference_id_id_8d9ccbd2_fk_str_cart_` FOREIGN KEY (`me_reference_id_id`) REFERENCES `str_cart_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_commission`
--

DROP TABLE IF EXISTS `str_commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_commission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `open_pay_amount` decimal(10,2) NOT NULL,
  `open_pay_tax` decimal(10,2) NOT NULL,
  `open_pay_total` decimal(10,2) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `cart_order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `str_commission_cart_order_id_953edaa0_fk_str_cart_order_id` (`cart_order_id`),
  CONSTRAINT `str_commission_cart_order_id_953edaa0_fk_str_cart_order_id` FOREIGN KEY (`cart_order_id`) REFERENCES `str_cart_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_openpay_transaction`
--

DROP TABLE IF EXISTS `str_openpay_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_openpay_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` varchar(20) DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `verification_code` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `unique_index` smallint(6) DEFAULT NULL,
  `order_unique_index` varchar(50) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `order_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `str_openpay_transact_order_id_id_a2f98dd1_fk_str_cart_` (`order_id_id`),
  CONSTRAINT `str_openpay_transact_order_id_id_a2f98dd1_fk_str_cart_` FOREIGN KEY (`order_id_id`) REFERENCES `str_cart_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_settings`
--

DROP TABLE IF EXISTS `str_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `is_iva` tinyint(1) NOT NULL,
  `iva` int(11) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `sell_by_state` tinyint(1) NOT NULL,
  `proximity` tinyint(1) NOT NULL,
  `selling_rule` smallint(6) NOT NULL,
  `clip_key` varchar(255) DEFAULT NULL,
  `envioclick_key` varchar(255) DEFAULT NULL,
  `fixed_shipping_cost` decimal(10,2) DEFAULT NULL,
  `free_shipping_threshold` decimal(10,2) DEFAULT NULL,
  `is_free_shipping_activated` tinyint(1) NOT NULL,
  `is_shipping_paid_by_client` tinyint(1) NOT NULL,
  `clip_key_verified` tinyint(1) NOT NULL,
  `clip_token` varchar(255) DEFAULT NULL,
  `envioclick_key_verified` tinyint(1) NOT NULL,
  `envioclick_webhook_verified` tinyint(1) NOT NULL,
  `is_store_enable` tinyint(1) NOT NULL,
  `is_store_ready` tinyint(1) NOT NULL,
  `is_warehouse_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `str_shipping_guide`
--

DROP TABLE IF EXISTS `str_shipping_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_shipping_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_guide_number` varchar(255) DEFAULT NULL,
  `user_guide_company` varchar(255) DEFAULT NULL,
  `shipping_type` smallint(6) DEFAULT NULL,
  `delivery_date` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `delivery_days` smallint(6) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `vendor_guide_company` varchar(255) DEFAULT NULL,
  `vendor_guide_cost` varchar(255) DEFAULT NULL,
  `vendor_guide_id` varchar(255) DEFAULT NULL,
  `vendor_guide_number` varchar(255) DEFAULT NULL,
  `vendor_guide_tracker` varchar(255) DEFAULT NULL,
  `vendor_guide_url` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `str_shipping_guide_order_id_92112bc7_fk_str_cart_order_id` (`order_id`),
  CONSTRAINT `str_shipping_guide_order_id_92112bc7_fk_str_cart_order_id` FOREIGN KEY (`order_id`) REFERENCES `str_cart_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_branch`
--

DROP TABLE IF EXISTS `user_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_branch_user_id_branch_id_d7ffe97a_uniq` (`user_id`,`branch_id`),
  KEY `user_branch_branch_id_dcfc17e4_fk_branch_id` (`branch_id`),
  CONSTRAINT `user_branch_branch_id_dcfc17e4_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `user_branch_user_id_4247e0d2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_business`
--

DROP TABLE IF EXISTS `user_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_business_business_id_77e15f7d_fk_business_id` (`business_id`),
  KEY `user_business_user_id_fa8903ad_fk_auth_user_id` (`user_id`),
  CONSTRAINT `user_business_business_id_77e15f7d_fk_business_id` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
  CONSTRAINT `user_business_user_id_fa8903ad_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_settings_user_id_46a3df84_fk_auth_user_id` (`user_id`),
  CONSTRAINT `user_settings_user_id_46a3df84_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `verification_code`
--

DROP TABLE IF EXISTS `verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verification_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `status` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  1:00:07
