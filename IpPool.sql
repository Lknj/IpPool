-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ip_proxy
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `xx_ip`
--

DROP TABLE IF EXISTS `xx_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xx_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `protocol` char(20) NOT NULL COMMENT 'ip类型',
  `ip` char(30) NOT NULL COMMENT 'ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xx_ip_ip_uindex` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COMMENT='西西代理ip';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xx_ip`
--

LOCK TABLES `xx_ip` WRITE;
/*!40000 ALTER TABLE `xx_ip` DISABLE KEYS */;
INSERT INTO `xx_ip` VALUES (145,'https','https://221.226.94.218:110'),(146,'https','https://60.211.218.78:53281'),(147,'https','https://120.78.225.5:3128'),(148,'https','https://221.6.201.18:9999'),(149,'https','https://222.90.110.194:8080'),(150,'https','https://101.254.136.130:8080'),(151,'https','https://180.175.17.206:9797'),(152,'https','https://114.139.34.13:8118'),(153,'https','https://113.247.252.114:9090'),(154,'https','https://124.237.83.14:53281'),(155,'https','https://113.109.249.32:808'),(156,'https','https://122.136.212.132:53281'),(157,'https','https://124.152.32.140:53281'),(158,'https','https://59.38.63.207:9797'),(159,'https','https://180.103.218.209:8118'),(160,'https','https://183.129.207.78:18118'),(161,'https','https://119.39.68.203:808'),(162,'https','https://118.31.9.50:8118'),(163,'https','https://125.123.121.36:9000'),(164,'https','https://182.88.5.99:9797'),(165,'https','https://59.38.61.173:9797'),(166,'https','https://59.38.62.110:9797'),(167,'https','https://58.250.23.210:1080'),(168,'https','https://210.26.64.44:3128'),(169,'https','https://58.20.37.25:8181'),(170,'https','https://218.2.226.42:80'),(171,'https','https://61.130.181.114:9999'),(172,'https','https://218.60.8.99:3129'),(173,'https','https://112.95.205.224:8888'),(174,'https','https://59.38.60.75:9797'),(175,'http','http://222.249.238.138:8080'),(176,'https','https://120.25.255.79:8118'),(177,'https','https://111.230.254.195:8118'),(178,'https','https://120.79.96.54:8118'),(179,'https','https://59.38.60.105:9797'),(180,'https','https://180.160.52.247:8118'),(181,'https','https://171.221.203.130:10184'),(182,'https','https://59.38.63.113:9797'),(183,'https','https://125.123.125.40:9000'),(184,'https','https://119.39.68.130:808'),(185,'https','https://124.232.133.199:3128'),(186,'https','https://27.46.22.72:8888'),(187,'https','https://114.249.117.145:9000'),(188,'https','https://116.62.184.163:3128'),(189,'https','https://119.57.108.73:53281'),(190,'https','https://125.123.120.219:9000'),(191,'https','https://221.7.211.246:60233'),(192,'https','https://61.145.182.27:53281'),(193,'https','https://114.249.118.150:9000'),(194,'https','https://59.38.61.68:9797'),(195,'https','https://123.117.33.244:9000'),(196,'https','https://111.198.154.116:8888'),(197,'https','https://163.125.73.16:9797'),(198,'https','https://115.171.85.163:9000'),(199,'https','https://115.171.85.254:9000'),(200,'https','https://180.160.74.35:8118'),(201,'https','https://175.25.26.117:3128'),(202,'https','https://163.125.252.18:9797'),(203,'https','https://114.106.74.115:8118'),(204,'https','https://123.122.11.138:8118'),(205,'https','https://59.38.60.252:9797'),(206,'https','https://58.246.3.178:53281'),(207,'https','https://14.115.107.88:808'),(208,'https','https://112.95.205.251:8888'),(209,'https','https://123.117.38.49:9000'),(210,'https','https://115.221.64.62:8118'),(211,'https','https://180.117.134.214:8118'),(212,'https','https://116.208.66.2:53281'),(213,'https','https://119.57.108.65:53281'),(214,'https','https://27.46.20.75:8888'),(215,'https','https://120.25.90.253:8118'),(216,'https','https://59.38.62.29:9797'),(217,'https','https://119.130.106.54:3128'),(218,'https','https://27.44.15.216:9000'),(219,'https','https://121.205.84.243:9999'),(220,'https','https://27.152.90.141:9999'),(221,'https','https://113.120.37.84:9999'),(222,'https','https://27.152.91.168:9999'),(223,'https','https://27.152.91.113:9999'),(224,'https','https://180.122.144.86:21570'),(225,'https','https://183.164.239.90:24816'),(226,'https','https://59.57.149.58:9999'),(227,'https','https://183.164.238.252:9999'),(228,'https','https://182.34.32.59:9999'),(229,'https','https://1.198.72.222:9999'),(230,'https','https://27.152.91.77:9999'),(231,'https','https://182.34.35.8:9999'),(232,'https','https://114.239.151.101:9999'),(233,'https','https://117.57.90.248:9999'),(234,'https','https://183.166.111.39:9999'),(235,'https','https://222.89.32.132:9999'),(236,'https','https://182.34.37.4:9999'),(237,'https','https://110.243.11.39:9999'),(238,'https','https://120.83.109.165:9999'),(239,'https','https://182.35.87.114:9999'),(240,'https','https://60.13.42.176:9999'),(241,'https','https://114.239.42.216:22997'),(242,'https','https://117.69.200.70:40899'),(243,'https','https://117.69.200.223:49026'),(244,'https','https://121.232.111.96:50068'),(245,'https','https://113.194.31.62:9999'),(246,'https','https://117.57.90.150:45465'),(247,'https','https://183.164.239.34:47651'),(248,'https','https://58.253.152.244:9999'),(249,'http','http://183.164.238.137:9999'),(250,'https','https://1.197.11.14:9999'),(251,'https','https://183.164.239.195:9999'),(252,'https','https://112.85.149.105:9999'),(253,'https','https://171.13.201.220:9999'),(254,'https','https://114.99.139.201:8118'),(255,'https','https://123.101.212.172:9999'),(256,'http','http://123.163.96.111:9999'),(257,'https','https://27.152.91.251:9999'),(258,'https','https://183.164.238.71:9999'),(259,'https','https://171.12.112.212:9999'),(260,'https','https://113.124.93.181:9999'),(261,'https','https://183.166.110.218:9999'),(262,'https','https://117.30.112.228:9999'),(263,'https','https://125.78.16.249:9999'),(264,'https','https://125.78.17.119:9999'),(265,'https','https://222.89.32.184:9999'),(266,'https','https://117.57.90.5:9999'),(267,'https','https://182.35.81.223:9999'),(268,'https','https://113.194.30.119:9999'),(269,'https','https://119.23.45.52:8080'),(270,'https','https://182.35.81.115:9999'),(271,'https','https://117.69.200.171:37800'),(272,'https','https://113.120.34.117:9999'),(273,'https','https://121.205.15.197:9999'),(274,'https','https://113.120.33.5:9999'),(275,'https','https://27.152.91.48:9999'),(276,'https','https://114.239.254.253:49132'),(277,'https','https://183.164.238.250:9999'),(278,'https','https://117.69.201.103:9999'),(279,'https','https://114.239.248.102:9999');
/*!40000 ALTER TABLE `xx_ip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-16 16:05:27
