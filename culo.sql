CREATE DATABASE  IF NOT EXISTS `bddogpackage` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bddogpackage`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bddogpackage
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.38-MariaDB

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `idComentarios` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idDetaServicio` int(11) NOT NULL,
  `Comentario` mediumtext NOT NULL,
  `FechaComentario` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idComentarios`),
  KEY `fk_Comentarios_usuario1_idx` (`idusuario`),
  KEY `fk_Comentarios_DetaServicio1_idx` (`idDetaServicio`),
  CONSTRAINT `fk_Comentarios_DetaServicio1` FOREIGN KEY (`idDetaServicio`) REFERENCES `detaservicio` (`idDetaServicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Comentarios_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,3,1,'Me encantó el servicio','2020-03-27 19:26:47'),(2,3,2,'Muy buena atención','2020-03-27 21:02:48'),(3,4,3,'Bien','2020-03-27 21:09:06');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detaservicio`
--

DROP TABLE IF EXISTS `detaservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detaservicio` (
  `idDetaServicio` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idServicios` int(11) NOT NULL,
  `idTransaccion` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `ValorCantidad` decimal(20,2) NOT NULL,
  `Calificacion` tinyint(1) NOT NULL,
  PRIMARY KEY (`idDetaServicio`),
  KEY `fk_DetaServicio_usuario1_idx` (`idusuario`),
  KEY `fk_DetaServicio_Servicios1_idx` (`idServicios`),
  KEY `fk_DetaServicio_Transaccion1_idx` (`idTransaccion`),
  CONSTRAINT `fk_DetaServicio_Servicios1` FOREIGN KEY (`idServicios`) REFERENCES `servicios` (`idServicios`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaServicio_Transaccion1` FOREIGN KEY (`idTransaccion`) REFERENCES `transaccion` (`idTransaccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaServicio_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detaservicio`
--

LOCK TABLES `detaservicio` WRITE;
/*!40000 ALTER TABLE `detaservicio` DISABLE KEYS */;
INSERT INTO `detaservicio` VALUES (1,3,1,1,1,12.00,5),(2,4,2,1,1,30.00,3),(3,4,3,1,1,10.00,5),(4,3,4,1,1,50.00,4);
/*!40000 ALTER TABLE `detaservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `NombEmpresa` varchar(45) NOT NULL,
  `EstaEmpresa` varchar(45) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Niñeros para tus mascotas',' '),(2,'Guevonaditas para sus perros',' '),(3,'Bañadores de perros',' '),(4,'Peluquería de mascotas',' '),(5,'Helados para perros',' '),(6,'Paseadores','Activo'),(7,'','Activo'),(8,'Helados','Activo'),(9,'Funeraria','Activo'),(10,'Caninos','Activo'),(11,'Huellitas','Activo'),(12,'Perros','Activo'),(13,'Burbujas','Activo'),(14,'Funeraria','Activo'),(15,'Funeraria','Activo'),(16,'Funeraria','Activo'),(17,'erty','Activo'),(18,'Perrunos','Activo'),(19,'wedfgt','Activo');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `empresaflash`
--

DROP TABLE IF EXISTS `empresaflash`;
/*!50001 DROP VIEW IF EXISTS `empresaflash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `empresaflash` AS SELECT 
 1 AS `Código`,
 1 AS `Tipo de Usuario`,
 1 AS `Nombre del Usuario`,
 1 AS `Nombre de la empresa`,
 1 AS `Nombre del Servicio`,
 1 AS `Valor del Servicio`,
 1 AS `Fecha de inicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idtipo_usuario` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `fechaInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProveedor`),
  KEY `fk_Proveedor_usuario1_idx` (`idusuario`,`idtipo_usuario`),
  KEY `fk_Proveedor_empresa1_idx` (`idempresa`),
  CONSTRAINT `fk_Proveedor_empresa1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Proveedor_usuario1` FOREIGN KEY (`idusuario`, `idtipo_usuario`) REFERENCES `usuario` (`idusuario`, `idtipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,5,1,1,'2020-03-28 16:35:49'),(2,6,1,2,'2020-03-28 16:58:17'),(6,6,1,2,'0000-00-00 00:00:00'),(7,6,1,2,'2020-06-19 20:24:43'),(9,12,1,8,'2020-06-19 20:27:42');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `idServicios` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoServicio` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `NombServicio` varchar(45) NOT NULL,
  `Descripcion` text NOT NULL,
  `ValorServicio` decimal(20,2) NOT NULL,
  PRIMARY KEY (`idServicios`),
  KEY `fk_Servicios_TipoServicio1_idx` (`idTipoServicio`),
  KEY `fk_Servicios_empresa1_idx` (`idempresa`),
  CONSTRAINT `fk_Servicios_TipoServicio1` FOREIGN KEY (`idTipoServicio`) REFERENCES `tiposervicio` (`idTipoServicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Servicios_empresa1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,1,1,'Paseadores','',12.00),(2,5,3,'Baño de perros','',30.00),(3,4,2,'Cosas para perros','',10.00),(4,3,1,'Guardería','',50.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `idtipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Empresa'),(2,'Cliente');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposervicio`
--

DROP TABLE IF EXISTS `tiposervicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposervicio` (
  `idTipoServicio` int(11) NOT NULL AUTO_INCREMENT,
  `NombTipoServ` varchar(155) NOT NULL,
  PRIMARY KEY (`idTipoServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposervicio`
--

LOCK TABLES `tiposervicio` WRITE;
/*!40000 ALTER TABLE `tiposervicio` DISABLE KEYS */;
INSERT INTO `tiposervicio` VALUES (1,'Paseadores'),(2,'Veterinaria'),(3,'Guardería'),(4,'Helados'),(5,'Baño'),(6,'Paseo'),(7,'Baño de perros'),(8,'Baño de perros'),(9,'Baño de perros'),(10,'Baño de perros'),(11,'Baño de perros'),(12,'Baño de perros'),(13,'Baño de perros'),(14,'Baño de perros'),(15,'Baño de perros'),(16,'Baño de perros'),(17,'Baño de perros'),(18,'Baño de perros'),(19,'Baño de perros'),(20,'Baño de perros'),(21,'Baño de perros'),(22,'Baño de perros'),(23,'Baño de perros'),(24,'Baño de perros'),(25,'Baño de perros'),(26,'Baño de perros'),(27,'Baño de perros');
/*!40000 ALTER TABLE `tiposervicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `idTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `FechaTran` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EstaTran` varchar(45) DEFAULT 'Causado',
  PRIMARY KEY (`idTransaccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,'2020-03-11 16:03:25','cancelado');
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo_usuario` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `apellidoUsuario` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `contrasenia` varchar(8) NOT NULL,
  `estadoUsuario` varchar(45) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`idusuario`,`idtipo_usuario`),
  KEY `fk_usuario_tipo_usuario1_idx` (`idtipo_usuario`),
  CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`idtipo_usuario`) REFERENCES `tipo_usuario` (`idtipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (3,2,0,'','',0,0,'camila@gmail.com','123','Activo'),(4,2,0,'','',0,0,'dayhana@gmail.com','123','Activo'),(5,1,0,'','',0,0,'mascoticas@gmail.com','123','Activo'),(6,1,0,'','',0,0,'organizacion@gmail.com','123','Activo'),(7,2,1036404045,'valentina ','Zuluaga',21,2147483647,'valen.lapris@hotmail.com','123','Activo'),(8,1,71116366,'Sergio','Zuluaga',40,34432112,'mascotas@gmail.com','123','Activo'),(10,1,43714888,'Lina','Londoño',0,2147483647,'perros@gmail.com','123','Activo'),(11,1,568398,'Laura','Zuluaga',0,2147483647,'lalita-zulu.lon@hotmail.c','123','Activo'),(12,1,342948343,'Luciana','Pérez',0,432332,'caninosforever@gmail.com','123','Activo'),(13,1,789655,'Jose Manuel','Castro',0,2453446,'huellitasporelmundo@gmail','123','Activo'),(14,1,434556,'Sandra','Zapata',0,35345467,'perros@gmail.com','123','Activo'),(15,1,8384739,'Pepa','Pelaez',0,238933,'burbujas@gmail.com','123','Activo'),(20,1,1343345,'Martha','Muñoz',0,3232345,'perrunos@gmail.com','123','Activo'),(21,1,12345,'fds','Castro',0,2147483647,'qasdf@gmail.com','123','Activo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usuarioflash`
--

DROP TABLE IF EXISTS `usuarioflash`;
/*!50001 DROP VIEW IF EXISTS `usuarioflash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usuarioflash` AS SELECT 
 1 AS `Código`,
 1 AS `Tipo de Usuario`,
 1 AS `Nombre del Usuario`,
 1 AS `Comentario`,
 1 AS `Fecha del comentario`,
 1 AS `Calificación del Servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bddogpackage'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `MSJ` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `MSJ` ON SCHEDULE EVERY 1 MINUTE STARTS '2020-03-12 15:36:00' ENDS '2020-03-12 15:40:00' ON COMPLETION NOT PRESERVE ENABLE DO SELECT CONCAT('Mensaje por minuto', now()) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'bddogpackage'
--
/*!50003 DROP FUNCTION IF EXISTS `2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `2`(
 varnombTipoServ varchar(255)
) RETURNS int(11)
BEGIN
set @sad =(select `idempresa` from `empresa` where `NombEmpresa` = varnombTipoServ);
RETURN @sad ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ContarComentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ContarComentarios`(
vidDetaServicio int

) RETURNS int(11)
BEGIN

DECLARE a int;

SET a = (select count(idComentarios) from comentarios where idDetaServicio = vidDetaServicio);
RETURN a;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `devolveridalgunachimbada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `devolveridalgunachimbada`(
 varnombTipoServ varchar(255)
) RETURNS int(11)
BEGIN
set @sad =(select `idTipoServicio` from `tiposervicio` where `NombTipoServ` = varnombTipoServ);
RETURN @sad ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fechaYHora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fechaYHora`() RETURNS varchar(45) CHARSET latin1
BEGIN
declare hora varchar(45);


set hora = (SELECT SYSDATE());
RETURN hora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDcomentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDcomentarios`(
	in vidComentarios int,
    in vidusuario int,
    in vidDetaServicio int,
    in vComentario mediumtext,
    in opcion varchar(45)

)
BEGIN
-- Procedimientos almacenados para el crud de comentarios

DECLARE msj varchar(255);
DECLARE fechaYHora varchar (45);
SET fechaYHora = (select bddogpackage.fechaYHora());

case

when opcion = 'guardar' then 
-- Insertamos los datos en la tabla

	INSERT INTO comentarios VALUES (vidComentarios, vidusuario, vidDetaServicio, vComentario, fechaYHora);
    SET msj = concat('Su comentario se ha guardaddo ', vComentario);
    SELECT msj;
    
when opcion = 'modificar' then 
-- Modificamos los comentarios de la columna comentario

		UPDATE comentarios SET Comentario = vComentario, FechaComentario = fechaYHora where idComentarios = vidComentarios;
        SET msj = concat('Su comenntario ha sido modificado ', vComentario);
        SELECT msj;
		END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDdetaservicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDdetaservicio`(
	in vidDetaServicio int,
    in vidusuario int,
    in vidServicios int,
    in vidTransaccion int,
    in vCantidad int,
    in vValorCantidad decimal (20,2),
    in vCalificacion tinyint(1),
    in opcion varchar (45)
)
BEGIN
-- Procedimientos almacenados para el crud de detalle de servicio

DECLARE msj varchar(255);

case

when opcion = 'guardar' then 
-- Insertamos los datos en la tabla

	INSERT INTO detaservicio VALUES (vidDetaServicio, vidusuario, vidServicios, vidTransaccion, vCantidad, vValorCantidad, vCalificacion );
    SET msj = concat('Su servicio ha sido guardado ');
    SELECT msj;
    
when opcion = 'modificar' then 
-- Modificamos los comentarios de la columna comentario

		UPDATE detaservicio SET idusuario = vidusuario, idServicios = vidServicios, idTransaccion = vidTransaccion, Cantidad =  vCantidad, ValorCantidad = vValorCantidad, Calificacion = vCalificacion where idDetaServicio = vidDetaServicio;
        SET msj = concat('Su servicio ha sido modificado ');
        SELECT msj;
		END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDempresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDempresa`(
	in vidempresa int,
    in vNombEmpresa varchar(45),
    in vEstadoEmpresa varchar(45),
    in opcion varchar(45)
)
BEGIN

DECLARE msj varchar (255);

case

when opcion = 'guardar' then
-- Insertamos los datos en la tabla

	INSERT INTO empresa VALUES(vidempresa,vNombEmpresa,vEstadoEmpresa);
    SET msj = ('Los datos de la empresa han sido guardados');
    SELECT msj;
    
when opcion = 'modificar' then
-- Modificaremos el nombre y el estado de la empresa

	UPDATE empresa SET NombEmpresa = vNombEmpresa, EstadoEmpresa = vEstadoEmpresa where idempresa = vidempresa;
    SET msj = ('El nombre y el estado de la empresa han sido modificados');
    SELECT msj;

when opcion = 'eliminar' then
-- Eliminaremos los datos de la empresa

	DELETE FROM empresa where idempresa = vidempresa;
    SET msj = ('Los datos de la empresa han sido eliminados');
    SELECT msj;
    
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDproveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDproveedor`(
	in vidProveedor int,
    in vidusuario int,
    in vidtipo_usuario int,
    in vidempresa int,
    in opcion varchar(45)
)
BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);
DECLARE fechaYHora varchar (45);
SET fechaYHora = (select bddogpackage.fechaYHora());


case

when opcion = 'guardar' then 
-- Insertamos los datos en la tabla

	INSERT INTO proveedor VALUES (vidProveedor,vidusuario,vidtipo_usuario,vidempresa,fechaYHora);
	SET msj = ('El proveedor ha sido guardado');
	SELECT msj;
    
    
when opcion = 'eliminar' then 
-- Elinaremos los datos de la tabla

	DELETE FROM proveedor where idProveedor = vidProveedor;
    SET msj = ('El proveedor ha sido eliminado');
    SELECT msj;
    
END CASE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDservicios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDservicios`(
	in vidServicios int,
    in vidTipoServicio int,
    in vidempresa int,
    in vNombServicio varchar(25),
    in vValorServicio decimal(20,2),
    in opcion varchar(45)
)
BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case

when opcion = 'guardar' then 

INSERT INTO servicios VALUES (vidServicios,vidTipoServicio,vidempresa,vNombServicio,vValorServicio);
SET msj = concat('El nombre y el precio del servicio han sido guardados ',vNombServicio, vValorServicio);
SELECT msj;

when opcion = 'modificar' then 
-- Modificaremos el nombre y el valor del servicio

	UPDATE servicios SET NombServicio = vNombServicio, ValorServicio = vValorServicio where idServicios = vidServicios;
	SET msj = concat('El nombre y el precio del servicio han sido modoficados ',vNombServicio, vValorServicio);
	SELECT msj;

when opcion = 'eliminar' then
-- Eliminares el servicio

	DELETE FROM servicios where idServicios = vidServicios;
    SET msj = ('El servicio ha sido eliminado');
    SELECT msj;

END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDtiposervicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDtiposervicio`(
	in VidTipoServicio int,
    in vNombTipoServ varchar(155),
    in opcion varchar(45)
)
BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case 

when opcion = 'guardar' then
-- Insertamos los datos en la tabla

	INSERT INTO tiposervicio VALUES (VidTipoServicio, vNombTipoServ);
	SET msj = concat('Se ha guardado el tipo de servicio ',vNombTipoServ);
	SELECT msj;

when opcion = 'modificar' then
-- Modificamos el nombre del servicio de la columna nombtiposerv
	
    UPDATE tiposervicio SET NombTipoServ = vNombTipoServ where idTipoServicio = VidTipoServicio;
	SET msj = concat('EL nombre del servicio ha sido modificado ',vNombTipoServ);
    SELECT msj;

when opcion = 'eliminar' then
-- Eliminaremos el tipo de servicio
 
	DELETE FROM tiposervicio where idTipoServicio = vidTipoServicio;
    SET msj = ('El tipo de servicio ha sido eliminado');
    SELECT msj;
    
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDtipo_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDtipo_usuario`(
	in vidtipo_usuario int, 
    in vtipo_usuario varchar(45),
    in opcion varchar(45)
)
BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case

when opcion = 'modificar' then
	-- Modificamos el tipo de usuario de la columna tipo usuario
    
	UPDATE tipo_usuario SET tipo_usuario = vtipo_usuario where idtipo_usuario = vidtipo_usuario;
    SET msj = concat('Se ha modificado el tipo de usuario ', vtipo_usuario);
    SELECT msj;

when opcion = 'eliminar' then
	-- Eliminamos el tipo de usuario de la columna tipo usuario
    
    DELETE FROM tipo_usuario where idtipo_usuario = vidtipo_usuario;
    SET msj = ('El tipo de usuario ha sido eliminado');
    SELECT msj;
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDtransaccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDtransaccion`(
	in vidTransaccion int,
    in vEstadoTran varchar(45),
    in opcion varchar(45)
    
	)
BEGIN

DECLARE msj varchar(45);
DECLARE fechaYHora varchar(45);
SET fechaYHora = (select bddogpackage.fechaYHora());
case

when opcion = 'guardar' then
-- Insertamos los datos en la tabla

	INSERT INTO transaccion VALUES(vidTransaccion,fechaYHora,vEstadoTran);
    SET msj = ('La transaccion ha sido guardada');
    SELECT msj;
    
when opcion = 'modificar' then 
-- Modificaremos la fecha y el estado de la transaccion

	UPDATE transaccion SET FechaTran = fechaYHora, EstadoTran = vEstadoTran where idTransaccion = vidTransaccion;
    SET msj = ('Los datos han sido modificados');
    SELECT msj;
    
    
when opcion = 'eliminar' then 
-- Eliminaremos los datos de la transaccion

	DELETE FROM transaccion where idTransaccion = vidTransaccion;
    SET msj = ('La transacción ha sido eliminada');
    SELECT msj;
    
END CASE;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CRUDusuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDusuario`(
	in vidusuario int,
	in vidtipo_usuario int,
    in vemail varchar(25),
    in vcontrasenia varchar(8),
	in opcion varchar(45)
)
BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case

when opcion = 'guardar' then
-- Insertamos los datos en la tabla

	INSERT INTO usuario VALUES (vidusuario,vidtipo_usuario,vemail,vcontrasenia);
	SET msj = concat('El usuario se ha guardado con éxito ',vemail, vcontrasenia);
	SELECT msj;

when opcion = 'modificar' then
-- Modificamos el email y la contraseña

	UPDATE usuario SET email = vemail, contrasenia = vcontrasenia where idusuario = vidusuario;
	SET msj = concat('El email y la contraseña han sido modificados',vemail, vcontrasenia);
	SELECT msj;

when opcion = 'eliminar' then
-- Eliminamos el email y la contraseña

	DELETE FROM usuario where idusuario = vidusuario;
    SET msj = ('El usuario ha sido eliminado');
    SELECT msj;
    
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarEmpresa`(
in nombEmpresa varchar (45),
in nombreUsuario varchar(45),
in apellidoUsuario varchar (45),
in documento int(11),
in telefono int(11),
in email varchar(45),
in contrasenia varchar(45)

)
BEGIN

DECLARE iduser int;
DECLARE idempresa int;

INSERT INTO `empresa`( `NombEmpresa`) VALUES (nombEmpresa);

INSERT INTO `usuario`(`idtipo_usuario`, `nombreUsuario`, `apellidoUsuario`,  `documento`, `telefono`, `email`, `contrasenia`)
VALUES (1,nombreUsuario,apellidoUsuario,documento,telefono,email,contrasenia);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarServicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarServicio`(
in nombTipoServ varchar(155),
in nombEmpresa varchar (45),
in nombServicio varchar (45),
in descripcion text,
in valorServcio decimal(20,2)

)
BEGIN

DECLARE idTipoServicio int;
DECLARE idempresa int;

INSERT INTO `tiposervicio`(`NombTipoServ`) VALUES (nombTipoServ);

set idTipoServicio = (select bddogpackage.devolveridalgunachimbada(nombTipoServ));
#set idempresa =(select bddogpackage.`2`(nombEmpresa));
#set @obcion ="guardar";
call bddogpackage.CRUDservicios(idTipoServicio,idempresa,nombServicio,@obcion );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
	in correo varchar(45),
    in clave varchar(8)
)
BEGIN

-- Variables de validación

set @user = (select idtipo_usuario from usuario where email = correo and contrasenia = clave);
    if @user =1 then
		set @mensaje = "bienvenido cliente";
		select @mensaje;
	elseif @user =2 then
		set @mensaje = "bienvenido empresa";
		select @mensaje;
    else 
		set @mensaje = "correo o clave incorrecto";
		select @mensaje;
END if;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `empresaflash`
--

/*!50001 DROP VIEW IF EXISTS `empresaflash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empresaflash` AS select `u`.`idusuario` AS `Código`,`t`.`tipo_usuario` AS `Tipo de Usuario`,`u`.`email` AS `Nombre del Usuario`,`e`.`NombEmpresa` AS `Nombre de la empresa`,`s`.`NombServicio` AS `Nombre del Servicio`,`s`.`ValorServicio` AS `Valor del Servicio`,`p`.`fechaInicio` AS `Fecha de inicio` from ((((`empresa` `e` join `proveedor` `p` on((`e`.`idempresa` = `p`.`idempresa`))) join `tipo_usuario` `t` on((`t`.`idtipo_usuario` = `p`.`idtipo_usuario`))) join `servicios` `s` on((`e`.`idempresa` = `s`.`idempresa`))) join `usuario` `u` on((`u`.`idusuario` = `p`.`idusuario`))) group by `p`.`fechaInicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarioflash`
--

/*!50001 DROP VIEW IF EXISTS `usuarioflash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarioflash` AS select `u`.`idusuario` AS `Código`,`t`.`tipo_usuario` AS `Tipo de Usuario`,`u`.`email` AS `Nombre del Usuario`,`c`.`Comentario` AS `Comentario`,`c`.`FechaComentario` AS `Fecha del comentario`,`d`.`Calificacion` AS `Calificación del Servicio` from (((`usuario` `u` join `tipo_usuario` `t` on((`u`.`idtipo_usuario` = `t`.`idtipo_usuario`))) join `detaservicio` `d` on((`u`.`idusuario` = `d`.`idusuario`))) join `comentarios` `c` on((`u`.`idusuario` = `c`.`idusuario`))) group by `c`.`FechaComentario` */;
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

-- Dump completed on 2020-06-22 17:16:56
