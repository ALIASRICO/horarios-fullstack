-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: sscd_horarios
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acceso` (
  `pk_acceso` int NOT NULL AUTO_INCREMENT,
  `fk_id_cia` int DEFAULT NULL,
  `fk_id_datos` int DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `record` datetime DEFAULT NULL,
  `fk_id_estado` int DEFAULT NULL,
  `fk_modulos` int DEFAULT NULL,
  PRIMARY KEY (`pk_acceso`),
  KEY `fk_acceso_cia` (`fk_id_cia`),
  KEY `fk_acceso_datos` (`fk_id_datos`),
  KEY `fk_acceso_estado` (`fk_id_estado`),
  KEY `fk_acceso_modulos` (`fk_modulos`),
  CONSTRAINT `fk_acceso_cia` FOREIGN KEY (`fk_id_cia`) REFERENCES `cia` (`pk_id_cia`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_acceso_datos` FOREIGN KEY (`fk_id_datos`) REFERENCES `datos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_acceso_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_acceso_modulos` FOREIGN KEY (`fk_modulos`) REFERENCES `modulos` (`pk_modulos`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `pk_id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `pk_id_aulas` int NOT NULL AUTO_INCREMENT,
  `nombre_aula` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_id_aulas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `pk_id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(100) NOT NULL,
  `fk_id_estado` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_cargo`),
  KEY `fk_cargo_estado` (`fk_id_estado`),
  CONSTRAINT `fk_cargo_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cia`
--

DROP TABLE IF EXISTS `cia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cia` (
  `pk_id_cia` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `e_mail` varchar(254) DEFAULT NULL,
  `record` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fk_pk_estado` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_cia`),
  KEY `fk_cia_estado` (`fk_pk_estado`),
  CONSTRAINT `fk_cia_estado` FOREIGN KEY (`fk_pk_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cia`
--

LOCK TABLES `cia` WRITE;
/*!40000 ALTER TABLE `cia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `civil`
--

DROP TABLE IF EXISTS `civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `civil` (
  `pk_id_civil` int NOT NULL AUTO_INCREMENT,
  `nombre_civil` varchar(50) NOT NULL,
  `fk_id_estado` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_civil`),
  KEY `fk_civil_estado` (`fk_id_estado`),
  CONSTRAINT `fk_civil_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civil`
--

LOCK TABLES `civil` WRITE;
/*!40000 ALTER TABLE `civil` DISABLE KEYS */;
INSERT INTO `civil` VALUES (1,'casado(a)',2),(2,'soltero(a)',2),(3,'viudo(a)',2),(4,'separado(a)',2),(5,'unión libre',2);
/*!40000 ALTER TABLE `civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos`
--

DROP TABLE IF EXISTS `datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_usuario` int DEFAULT NULL,
  `fk_id_cargo` int DEFAULT NULL,
  `fk_id_doc` int DEFAULT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `fk_id_gene` int DEFAULT NULL,
  `fecha_naci` date DEFAULT NULL,
  `fk_id_civil` int DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `e_mail` varchar(254) DEFAULT NULL,
  `record` datetime DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `fk_id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datos_cargo` (`fk_id_cargo`),
  KEY `fk_datos_doc` (`fk_id_doc`),
  KEY `fk_datos_genero` (`fk_id_gene`),
  KEY `fk_datos_civil` (`fk_id_civil`),
  KEY `fk_datos_estado` (`fk_id_estado`),
  CONSTRAINT `fk_datos_cargo` FOREIGN KEY (`fk_id_cargo`) REFERENCES `cargo` (`pk_id_cargo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_datos_civil` FOREIGN KEY (`fk_id_civil`) REFERENCES `civil` (`pk_id_civil`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_datos_doc` FOREIGN KEY (`fk_id_doc`) REFERENCES `documento` (`pk_id_doc`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_datos_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_datos_genero` FOREIGN KEY (`fk_id_gene`) REFERENCES `genero` (`pk_id_gene`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos`
--

LOCK TABLES `datos` WRITE;
/*!40000 ALTER TABLE `datos` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento` (
  `pk_id_doc` int NOT NULL AUTO_INCREMENT,
  `nombre_documento` varchar(50) NOT NULL,
  `fk_id_estado` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_doc`),
  KEY `fk_doc_estado` (`fk_id_estado`),
  CONSTRAINT `fk_doc_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,'cédula de ciudadanía',2),(2,'tarjeta de identidad',2),(3,'pasaporte número',2),(4,'nit',2),(5,'cédula de extranjeria',2),(6,'rut',2);
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `pk_id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`pk_id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'grabado'),(2,'actualizado'),(3,'borrado'),(4,'deshacer'),(5,'no acceso');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `pk_id_gene` int NOT NULL AUTO_INCREMENT,
  `nom_genero` varchar(40) NOT NULL,
  `fk_id_estado` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_gene`),
  KEY `fk_genero_estado` (`fk_id_estado`),
  CONSTRAINT `fk_genero_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'masculino',2),(2,'femenino',2);
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `pk_id_horarios` int NOT NULL AUTO_INCREMENT,
  `asig_horario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_id_horarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorio` (
  `pk_id_laboratorio` int NOT NULL AUTO_INCREMENT,
  `nombre_laboratorio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_id_laboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos` (
  `pk_modulos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`pk_modulos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,'System MANAGER'),(2,'Administración'),(3,'Coordinador'),(4,'Docente'),(5,'Estudiante');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_asig_au`
--

DROP TABLE IF EXISTS `mov_asig_au`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_asig_au` (
  `pk_id_mov_asig_au` int NOT NULL AUTO_INCREMENT,
  `fk_id_cia` int NOT NULL,
  `fk_id_mate` int NOT NULL,
  `fk_tipo_status` int NOT NULL,
  `fk_id_pregrados` int NOT NULL,
  `fk_id_horarios` int NOT NULL,
  `fk_id_materias` int NOT NULL,
  `record` datetime NOT NULL,
  `fk_id_estado` int NOT NULL,
  `fk_id_aula` int DEFAULT NULL,
  `fk_id_laboratorio` int DEFAULT NULL,
  `fk_id_semestre` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_mov_asig_au`),
  KEY `fk_mov_cia` (`fk_id_cia`),
  KEY `fk_mov_mate` (`fk_id_mate`),
  KEY `fk_mov_tipo_status` (`fk_tipo_status`),
  KEY `fk_mov_pregrados` (`fk_id_pregrados`),
  KEY `fk_mov_horarios` (`fk_id_horarios`),
  KEY `fk_mov_materias` (`fk_id_materias`),
  KEY `fk_mov_estado` (`fk_id_estado`),
  KEY `fk_mov_aula` (`fk_id_aula`),
  KEY `fk_mov_lab` (`fk_id_laboratorio`),
  KEY `fk_mov_semestre` (`fk_id_semestre`),
  CONSTRAINT `fk_mov_aula` FOREIGN KEY (`fk_id_aula`) REFERENCES `aulas` (`pk_id_aulas`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_cia` FOREIGN KEY (`fk_id_cia`) REFERENCES `cia` (`pk_id_cia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_horarios` FOREIGN KEY (`fk_id_horarios`) REFERENCES `horarios` (`pk_id_horarios`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_lab` FOREIGN KEY (`fk_id_laboratorio`) REFERENCES `laboratorio` (`pk_id_laboratorio`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_mate` FOREIGN KEY (`fk_id_mate`) REFERENCES `preofe_mate` (`pk_id_mate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_materias` FOREIGN KEY (`fk_id_materias`) REFERENCES `asignaturas` (`pk_id_materia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_pregrados` FOREIGN KEY (`fk_id_pregrados`) REFERENCES `pregrado` (`pk_id_pregrado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_semestre` FOREIGN KEY (`fk_id_semestre`) REFERENCES `semestre` (`pk_id_semestre`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_tipo_status` FOREIGN KEY (`fk_tipo_status`) REFERENCES `tipo_status` (`pk_id_tipo_status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_asig_au`
--

LOCK TABLES `mov_asig_au` WRITE;
/*!40000 ALTER TABLE `mov_asig_au` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_asig_au` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregrado`
--

DROP TABLE IF EXISTS `pregrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregrado` (
  `pk_id_pregrado` int NOT NULL AUTO_INCREMENT,
  `nombre_pregrado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_id_pregrado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregrado`
--

LOCK TABLES `pregrado` WRITE;
/*!40000 ALTER TABLE `pregrado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregrado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preofe_mate`
--

DROP TABLE IF EXISTS `preofe_mate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preofe_mate` (
  `pk_id_mate` int NOT NULL AUTO_INCREMENT,
  `fk_id_datos` int DEFAULT NULL,
  `fk_id_materia` int DEFAULT NULL,
  `fk_id_estado` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_mate`),
  KEY `fk_preofe_datos` (`fk_id_datos`),
  KEY `fk_preofe_materia` (`fk_id_materia`),
  KEY `fk_preofe_estado` (`fk_id_estado`),
  CONSTRAINT `fk_preofe_datos` FOREIGN KEY (`fk_id_datos`) REFERENCES `datos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_preofe_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_preofe_materia` FOREIGN KEY (`fk_id_materia`) REFERENCES `asignaturas` (`pk_id_materia`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preofe_mate`
--

LOCK TABLES `preofe_mate` WRITE;
/*!40000 ALTER TABLE `preofe_mate` DISABLE KEYS */;
/*!40000 ALTER TABLE `preofe_mate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre` (
  `pk_id_semestre` int NOT NULL AUTO_INCREMENT,
  `nombre_semestre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_id_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_status`
--

DROP TABLE IF EXISTS `tipo_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_status` (
  `pk_id_tipo_status` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_status` varchar(50) NOT NULL,
  `fk_id_estado` int NOT NULL,
  PRIMARY KEY (`pk_id_tipo_status`),
  KEY `fk_tipo_status_estado` (`fk_id_estado`),
  CONSTRAINT `fk_tipo_status_estado` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`pk_id_estado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_status`
--

LOCK TABLES `tipo_status` WRITE;
/*!40000 ALTER TABLE `tipo_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sscd_horarios'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-28  4:28:31
