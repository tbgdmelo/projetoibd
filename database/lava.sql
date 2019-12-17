-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: lavateste1
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `applavajato_user`
--

DROP TABLE IF EXISTS `applavajato_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applavajato_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(15) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applavajato_user`
--

LOCK TABLES `applavajato_user` WRITE;
/*!40000 ALTER TABLE `applavajato_user` DISABLE KEYS */;
INSERT INTO `applavajato_user` VALUES (1,'pbkdf2_sha256$150000$VSSL3jSTFfLm$GcXLJCd29Ib+V4LX9zng1eQ2LcC3VGoB+naVuU9OScs=','2019-12-16 15:32:16.717955',1,'lavajato',1,1),(2,'pbkdf2_sha256$150000$HU3vYkW9ZkkH$vD0kWlvs+dURxGhpPfK1nX7mPReGP2YTdDN4xm4pbyo=',NULL,1,'l.castro',1,1),(3,'pbkdf2_sha256$150000$rsr3aP7I1FF3$MDVHUnI8TBnkaNLJOtkQNzpldvUTahBNXz1DNNk+Zj8=',NULL,0,'l.goncalves',0,1),(4,'pbkdf2_sha256$150000$JPbSyh83aWaR$QaFGVcBYD+uue+Pg/kVmywuExCpWp170BqJLs84bcMU=',NULL,1,'c.correia',1,1),(5,'pbkdf2_sha256$150000$9db2udzckFAj$+n5/TLiEygWllUQxsrPABvDx/7FVH2f6HCC6R4Vbn2U=',NULL,0,'n.almeida',0,1),(6,'pbkdf2_sha256$150000$bp54f5ZV56Qj$aamlUfIwG3V0iSfi9kZK1oNIDdR1Z+/h5+t/OQPpBZQ=',NULL,0,'v.cunha',0,1);
/*!40000 ALTER TABLE `applavajato_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applavajato_user_groups`
--

DROP TABLE IF EXISTS `applavajato_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applavajato_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `applavajato_user_groups_user_id_group_id_41d7486a_uniq` (`user_id`,`group_id`),
  KEY `applavajato_user_groups_group_id_aa1ce9ac_fk_auth_group_id` (`group_id`),
  CONSTRAINT `applavajato_user_groups_group_id_aa1ce9ac_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `applavajato_user_groups_user_id_6c37a26e_fk_applavajato_user_id` FOREIGN KEY (`user_id`) REFERENCES `applavajato_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applavajato_user_groups`
--

LOCK TABLES `applavajato_user_groups` WRITE;
/*!40000 ALTER TABLE `applavajato_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `applavajato_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applavajato_user_user_permissions`
--

DROP TABLE IF EXISTS `applavajato_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applavajato_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `applavajato_user_user_pe_user_id_permission_id_8feddbfa_uniq` (`user_id`,`permission_id`),
  KEY `applavajato_user_use_permission_id_d9f5ceba_fk_auth_perm` (`permission_id`),
  CONSTRAINT `applavajato_user_use_permission_id_d9f5ceba_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `applavajato_user_use_user_id_90e1df67_fk_applavaja` FOREIGN KEY (`user_id`) REFERENCES `applavajato_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applavajato_user_user_permissions`
--

LOCK TABLES `applavajato_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `applavajato_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `applavajato_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add cliente',5,'add_cliente'),(18,'Can change cliente',5,'change_cliente'),(19,'Can delete cliente',5,'delete_cliente'),(20,'Can view cliente',5,'view_cliente'),(21,'Can add fabricante',6,'add_fabricante'),(22,'Can change fabricante',6,'change_fabricante'),(23,'Can delete fabricante',6,'delete_fabricante'),(24,'Can view fabricante',6,'view_fabricante'),(25,'Can add funcionario',7,'add_funcionario'),(26,'Can change funcionario',7,'change_funcionario'),(27,'Can delete funcionario',7,'delete_funcionario'),(28,'Can view funcionario',7,'view_funcionario'),(29,'Can add modelo',8,'add_modelo'),(30,'Can change modelo',8,'change_modelo'),(31,'Can delete modelo',8,'delete_modelo'),(32,'Can view modelo',8,'view_modelo'),(33,'Can add servico',9,'add_servico'),(34,'Can change servico',9,'change_servico'),(35,'Can delete servico',9,'delete_servico'),(36,'Can view servico',9,'view_servico'),(37,'Can add veiculo',10,'add_veiculo'),(38,'Can change veiculo',10,'change_veiculo'),(39,'Can delete veiculo',10,'delete_veiculo'),(40,'Can view veiculo',10,'view_veiculo'),(41,'Can add nota fiscal',11,'add_notafiscal'),(42,'Can change nota fiscal',11,'change_notafiscal'),(43,'Can delete nota fiscal',11,'delete_notafiscal'),(44,'Can view nota fiscal',11,'view_notafiscal'),(45,'Can add log entry',12,'add_logentry'),(46,'Can change log entry',12,'change_logentry'),(47,'Can delete log entry',12,'delete_logentry'),(48,'Can view log entry',12,'view_logentry'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `registro_pessoal` varchar(11) NOT NULL,
  `nome` varchar(85) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `telefone1` varchar(14) NOT NULL,
  `telefone2` varchar(14) NOT NULL,
  PRIMARY KEY (`registro_pessoal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('19663272937','José Melo Araujo','Rua Antônio Carlos da Silva, 211','+5511992477785',''),('24908722730','Camila Sousa Cavalcanti','Rua Clementino Heitor de Carvalho, 651','+5571999408162','+5594993824839'),('27054282400','Emilly Ribeiro Castro','Rua Waldemar Medeiros, 1252','+5547988573236',''),('32228860409','Beatriz Rocha Souza','Servidão João Rosa de Freitas, 1913','+5590938947220',''),('45486319177','Vinicius Alves Dias','Rua José Guilherme, 1443','+5590954812685',''),('54231084033','Julia Lima Costa','Travessa Aléxis Carrel, 1893','+5511928975893','+5511992785364'),('55579386567','Rodrigo Pinto Alves','Avenida D, 283','+5598928986066',''),('56965441500','Kai Azevedo Pinto','Avenida Tancredo de Almeida Neves, 1033','+559299862453',''),('59379785011','Vitoria Castro Rocha','Praça Doutor Luciano Esteves, 1656','92994432472',''),('59737584007','Kauê Sousa Castro','Rua Mariana Pinto Bandeira, 1455','+5598995595448',''),('67530907738','Danilo Almeida Ferreira','Travessa Luiz Carrilho, 162','+559052574810',''),('73602697258','Erick Barros Santos','Avenida V-003, 427','+5593937573852','+5593997450965'),('95682536290','Paulo Pereira Barbosa','Rua Piraju, 246','+5531995102230','');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_applavajato_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_applavajato_user_id` FOREIGN KEY (`user_id`) REFERENCES `applavajato_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'admin','logentry'),(5,'applavajato','cliente'),(6,'applavajato','fabricante'),(7,'applavajato','funcionario'),(8,'applavajato','modelo'),(11,'applavajato','notafiscal'),(9,'applavajato','servico'),(4,'applavajato','user'),(10,'applavajato','veiculo'),(2,'auth','group'),(1,'auth','permission'),(3,'contenttypes','contenttype'),(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-16 15:29:20.407555'),(2,'contenttypes','0002_remove_content_type_name','2019-12-16 15:29:21.672306'),(3,'auth','0001_initial','2019-12-16 15:29:22.872530'),(4,'auth','0002_alter_permission_name_max_length','2019-12-16 15:29:26.893404'),(5,'auth','0003_alter_user_email_max_length','2019-12-16 15:29:26.943412'),(6,'auth','0004_alter_user_username_opts','2019-12-16 15:29:27.001638'),(7,'auth','0005_alter_user_last_login_null','2019-12-16 15:29:27.063514'),(8,'auth','0006_require_contenttypes_0002','2019-12-16 15:29:27.126065'),(9,'auth','0007_alter_validators_add_error_messages','2019-12-16 15:29:27.171915'),(10,'auth','0008_alter_user_username_max_length','2019-12-16 15:29:27.218502'),(11,'auth','0009_alter_user_last_name_max_length','2019-12-16 15:29:27.263400'),(12,'auth','0010_alter_group_name_max_length','2019-12-16 15:29:27.403320'),(13,'auth','0011_update_proxy_permissions','2019-12-16 15:29:27.447212'),(14,'applavajato','0001_initial','2019-12-16 15:29:31.736206'),(15,'applavajato','0002_remove_cliente_usuario','2019-12-16 15:29:44.543119'),(16,'applavajato','0003_remove_notafiscal_valor_final','2019-12-16 15:29:45.276688'),(17,'admin','0001_initial','2019-12-16 15:29:50.285311'),(18,'admin','0002_logentry_remove_auto_add','2019-12-16 15:29:52.265798'),(19,'admin','0003_logentry_add_action_flag_choices','2019-12-16 15:29:52.341920'),(20,'sessions','0001_initial','2019-12-16 15:29:52.701462');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabricante` (
  `id_fabricante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id_fabricante`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES (34,'AUDI'),(43,'BMW'),(23,'CHEVROLET'),(31,'CITROEN'),(42,'FERRARI'),(24,'FIAT'),(26,'FORD'),(30,'HONDA'),(28,'HYUNDAI'),(41,'ISUZU'),(40,'IVECO'),(36,'KYA'),(35,'MERCEDES-BENZ'),(39,'MICHIGAN'),(32,'NISSAN'),(33,'PEUGEOT'),(27,'RENAULT'),(38,'SCANIA'),(29,'TOYOTA'),(25,'VOLKSWAGEN'),(37,'VOLVO');
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `registro_pessoal` varchar(11) NOT NULL,
  `nome` varchar(85) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `funcao` varchar(30) NOT NULL,
  `telefone1` varchar(14) NOT NULL,
  `telefone2` varchar(14) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `registro_pessoal` (`registro_pessoal`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `funcionario_usuario_id_89713158_fk_applavajato_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `applavajato_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'46535339033','Luiz Castro Lima','Rua Crescência Carolo Balbo, 265','Gerente Geral','+5516954864352','',2),(2,'79531139458','Luís Goncalves Melo','Rua Doutor Anastácio Madeira Campos, 1089','Lavador','+5523995565387','+5523993786848',3),(3,'51764978080','Cauã Correia Alves','Rua Rui Coelho, 934','Gerente de Serviços','996934624','',4),(4,'26319899298','Nicolash Almeida Araujo','Rua Pedrolina Evangelista de Souza, 1513','Limpador','+55966009355','',5),(5,'76485312595','Vitór Cunha Santos','Rua B, 1659','Lavador','+5592962253328','',6);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id_modelo`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (2,'7000D'),(11,'ARGO'),(26,'CAMARO'),(5,'CARGO'),(35,'CAYMAN'),(24,'CELTA'),(7,'CITYCLASS'),(29,'CIVIC'),(27,'COBALT'),(25,'CORSA'),(33,'ECLIPSE'),(18,'ECOSPORT'),(40,'ELECTRA'),(32,'ESPIRIT'),(38,'ETIOS'),(8,'EUROTECH'),(6,'F-11000'),(19,'FIESTA'),(22,'FOCUS'),(20,'FUSION'),(37,'HB20'),(1,'HR'),(12,'IDEA'),(4,'JBC'),(3,'MASCARELLO'),(21,'MUSTANG'),(9,'NSX'),(39,'ONIX'),(28,'PRISMA'),(14,'PUNTO'),(31,'RANGE ROVER'),(23,'RANGER'),(10,'SEDAN'),(34,'SENTRA'),(13,'SIENA'),(30,'SPORTAGE'),(15,'STILO'),(16,'STRADA'),(36,'SX4'),(17,'UNO');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_fiscal` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `data_inicio` datetime(6) NOT NULL,
  `data_fim` datetime(6) DEFAULT NULL,
  `forma_pagamento` varchar(8) NOT NULL,
  `cliente_id` varchar(11) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  `veiculo_id` varchar(7) NOT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `nota_fiscal_cliente_id_79da7c0c_fk_cliente_registro_pessoal` (`cliente_id`),
  KEY `nota_fiscal_funcionario_id_fb49907e_fk_funcionario_matricula` (`funcionario_id`),
  KEY `nota_fiscal_veiculo_id_4b0bffb9_fk_veiculo_placa` (`veiculo_id`),
  CONSTRAINT `nota_fiscal_cliente_id_79da7c0c_fk_cliente_registro_pessoal` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`registro_pessoal`),
  CONSTRAINT `nota_fiscal_funcionario_id_fb49907e_fk_funcionario_matricula` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`matricula`),
  CONSTRAINT `nota_fiscal_veiculo_id_4b0bffb9_fk_veiculo_placa` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal`
--

LOCK TABLES `nota_fiscal` WRITE;
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
INSERT INTO `nota_fiscal` VALUES (1,'2019-12-09 00:00:00.000000',NULL,'Dinheiro','19663272937',4,'MUQ2055'),(2,'2019-01-23 00:00:00.000000',NULL,'Debito','54231084033',1,'JGS0313'),(3,'2019-02-25 00:00:00.000000',NULL,'Dinheiro','67530907738',5,'MZE1170'),(4,'2019-02-13 00:00:00.000000',NULL,'Dinheiro','59379785011',5,'NES7389'),(5,'2019-01-15 00:00:00.000000',NULL,'Credito','55579386567',1,'JUR7156'),(6,'2019-03-25 00:00:00.000000',NULL,'Dinheiro','19663272937',2,'MUQ2055'),(7,'2019-04-28 00:00:00.000000',NULL,'Dinheiro','27054282400',1,'FKO4969'),(8,'2019-05-17 00:00:00.000000',NULL,'Dinheiro','32228860409',1,'DSO2771'),(9,'2019-06-18 00:00:00.000000',NULL,'Debito','56965441500',3,'HPE0048'),(10,'2019-07-20 00:00:00.000000',NULL,'Credito','59737584007',3,'KAU2989'),(11,'2019-08-30 00:00:00.000000',NULL,'Debito','73602697258',5,'NEI0418'),(12,'2019-09-13 00:00:00.000000',NULL,'Debito','24908722730',1,'HXJ5822'),(13,'2019-10-15 00:00:00.000000',NULL,'Dinheiro','45486319177',4,'MXH2327'),(14,'2019-11-09 00:00:00.000000',NULL,'Credito','95682536290',4,'LVP0986'),(15,'2019-12-23 00:00:00.000000',NULL,'Credito','95682536290',2,'LVP0986'),(16,'2019-03-17 00:00:00.000000',NULL,'Debito','55579386567',3,'JUR7156'),(17,'2019-04-01 00:00:00.000000',NULL,'Dinheiro','27054282400',3,'NEU0827'),(18,'2019-06-07 00:00:00.000000',NULL,'Credito','32228860409',4,'DSO2771'),(19,'2019-11-27 00:00:00.000000',NULL,'Dinheiro','59737584007',2,'KCN4519'),(20,'2019-10-20 00:00:00.000000',NULL,'Credito','73602697258',5,'NEI0418');
/*!40000 ALTER TABLE `nota_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal_servicos`
--

DROP TABLE IF EXISTS `nota_fiscal_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_fiscal_servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notafiscal_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nota_fiscal_servicos_notafiscal_id_servico_id_d1627980_uniq` (`notafiscal_id`,`servico_id`),
  KEY `nota_fiscal_servicos_servico_id_40893ec2_fk_servico_id_servico` (`servico_id`),
  CONSTRAINT `nota_fiscal_servicos_notafiscal_id_f8e519ae_fk_nota_fisc` FOREIGN KEY (`notafiscal_id`) REFERENCES `nota_fiscal` (`id_nota`),
  CONSTRAINT `nota_fiscal_servicos_servico_id_40893ec2_fk_servico_id_servico` FOREIGN KEY (`servico_id`) REFERENCES `servico` (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal_servicos`
--

LOCK TABLES `nota_fiscal_servicos` WRITE;
/*!40000 ALTER TABLE `nota_fiscal_servicos` DISABLE KEYS */;
INSERT INTO `nota_fiscal_servicos` VALUES (1,1,2),(2,1,3),(3,2,1),(6,3,3),(4,3,8),(5,3,9),(7,4,2),(8,4,3),(9,5,8),(10,5,9),(11,6,2),(12,6,4),(13,7,1),(14,7,3),(15,8,2),(16,9,3),(17,9,4),(18,10,2),(19,10,3),(20,10,4),(21,10,6),(23,11,3),(24,11,4),(22,11,9),(25,12,1),(26,12,2),(28,13,7),(27,13,9),(30,14,1),(31,14,4),(29,14,8),(32,15,2),(33,15,4),(34,16,3),(35,16,4),(36,17,3),(38,18,7),(37,18,8),(39,19,3),(40,19,6),(41,19,7),(42,19,8),(43,19,9),(44,20,2),(45,20,3),(46,20,4);
/*!40000 ALTER TABLE `nota_fiscal_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `id_servico` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_servico`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'LAVAGEM',15.00),(2,'LIMPEZA',20.50),(3,'ENCERAMENTO',35.25),(4,'POLIMENTO',50.00),(5,'CRISTALIZACAO',125.75),(6,'VITRIFICACAO',250.00),(7,'REVITALIZACAO',155.80),(8,'HIDATRACAO',45.60),(9,'IMPERMEABILIZACAO',25.65);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `placa` varchar(7) NOT NULL,
  `cor` varchar(25) DEFAULT NULL,
  `avarias` varchar(400) DEFAULT NULL,
  `tipo_veiculo` varchar(10) NOT NULL,
  `cliente_id` varchar(11) NOT NULL,
  `fabricante_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`placa`),
  KEY `veiculo_cliente_id_366297d5_fk_cliente_registro_pessoal` (`cliente_id`),
  KEY `veiculo_fabricante_id_c68da55b_fk_fabricante_id_fabricante` (`fabricante_id`),
  KEY `veiculo_modelo_id_eae68fda_fk_modelo_id_modelo` (`modelo_id`),
  CONSTRAINT `veiculo_cliente_id_366297d5_fk_cliente_registro_pessoal` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`registro_pessoal`),
  CONSTRAINT `veiculo_fabricante_id_c68da55b_fk_fabricante_id_fabricante` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricante` (`id_fabricante`),
  CONSTRAINT `veiculo_modelo_id_eae68fda_fk_modelo_id_modelo` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES ('DSO2771','Amarelo',NULL,'Aluguel','32228860409',30,29),('FKO4969','Prata','Vidro das portas traseiras arranhado','Particular','27054282400',31,15),('HPE0048','Prata',NULL,'Aluguel','56965441500',26,22),('HXJ5822','Azul','Arranhoes traseiros','Particular','24908722730',26,22),('JGS0313','Laranja',NULL,'Aluguel','54231084033',29,38),('JUR7156','Verde','Porta malas travado','Particular','55579386567',34,36),('KAU2989','Rosa',NULL,'Particular','59737584007',29,38),('KCN4519','Preto',NULL,'Pesado','59379785011',36,32),('LVP0986','Vermelho','Porta riscada e vidro frontal quebrado','Pesado','95682536290',38,2),('MRQ9652','Laranja',NULL,'Aluguel','24908722730',43,24),('MUQ2055','Azul',NULL,'Particular','19663272937',28,37),('MXH2327','Marrom',NULL,'Particular','45486319177',23,39),('MZE1170','Branco',NULL,'Pesado','67530907738',40,8),('NEI0418','Preto',NULL,'Particular','73602697258',32,6),('NES7389','Vermelho','Banco com furos','Pesado','59379785011',41,1),('NEU0827','Laranja',NULL,'Particular','27054282400',24,11);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lavateste1'
--

--
-- Dumping routines for database 'lavateste1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-16 13:08:44