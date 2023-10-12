

CREATE DATABASE  IF NOT EXISTS `consejeria_demandas` ;
USE `consejeria_demandas`;


DROP TABLE IF EXISTS `demanda`;

CREATE TABLE `demanda` (
  `id_demanda` int NOT NULL AUTO_INCREMENT,
  `id_proceso_judicial` int DEFAULT NULL,
  `tipo_demanda` varchar(25) DEFAULT NULL,
  `descripcion_demanda` varchar(200) DEFAULT NULL,
  `fecha_demanda` date DEFAULT NULL,
  PRIMARY KEY (`id_demanda`),
  KEY `id_proceso_judicial` (`id_proceso_judicial`),
  CONSTRAINT `demanda_ibfk_1` FOREIGN KEY (`id_proceso_judicial`) REFERENCES `proceso_judicial` (`id_proceso_judicial`)
) ENGINE=InnoDB ;

LOCK TABLES `demanda` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `denuncia`;

CREATE TABLE `denuncia` (
  `id_denuncia` int NOT NULL AUTO_INCREMENT,
  `id_proceso_judicial` int DEFAULT NULL,
  `causa_penal` varchar(25) DEFAULT NULL,
  `delito` varchar(25) DEFAULT NULL,
  `modalidad` varchar(25) DEFAULT NULL,
  `hechos` varchar(25) DEFAULT NULL,
  `plazo_cierre` varchar(25) DEFAULT NULL,
  `unidad_mp` varchar(25) DEFAULT NULL,
  `estrategia` varchar(25) DEFAULT NULL,
  `id_juez` int DEFAULT NULL,
  PRIMARY KEY (`id_denuncia`),
  KEY `id_proceso_judicial` (`id_proceso_judicial`),
  KEY `id_juez` (`id_juez`),
  CONSTRAINT `denuncia_ibfk_1` FOREIGN KEY (`id_proceso_judicial`) REFERENCES `proceso_judicial` (`id_proceso_judicial`),
  CONSTRAINT `denuncia_ibfk_2` FOREIGN KEY (`id_juez`) REFERENCES `juez` (`id_juez`)
) ENGINE=InnoDB ;
LOCK TABLES `denuncia` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `escolaridad`;

CREATE TABLE `escolaridad` (
  `id_escolaridad` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_escolaridad`)
) ENGINE=InnoDB ;

LOCK TABLES `escolaridad` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `estado_procesal`;

CREATE TABLE `estado_procesal` (
  `id_estado_procesal` int NOT NULL AUTO_INCREMENT,
  `descripcion_estado_procesal` varchar(200) DEFAULT NULL,
  `fecha_estado_procesal` date DEFAULT NULL,
  `id_proceso_judicial` int DEFAULT NULL,
  PRIMARY KEY (`id_estado_procesal`),
  KEY `id_proceso_judicial` (`id_proceso_judicial`),
  CONSTRAINT `estado_procesal_ibfk_1` FOREIGN KEY (`id_proceso_judicial`) REFERENCES `proceso_judicial` (`id_proceso_judicial`)
) ENGINE=InnoDB ;
--
-- Dumping data for table `estado_procesal`
--

LOCK TABLES `estado_procesal` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `etnia`;

CREATE TABLE `etnia` (
  `id_etnia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_etnia`)
) ENGINE=InnoDB ;
LOCK TABLES `etnia` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `imputado`;

CREATE TABLE `imputado` (
  `id_participante` int NOT NULL,
  `delito` varchar(255) NOT NULL,
  PRIMARY KEY (`id_participante`),
  CONSTRAINT `imputado_ibfk_1` FOREIGN KEY (`id_participante`) REFERENCES `participante` (`id_participante`)
) ENGINE=InnoDB ;
LOCK TABLES `imputado` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `juez`;

CREATE TABLE `juez` (
  `id_juez` int NOT NULL AUTO_INCREMENT,
  `nombre_juez` varchar(50) NOT NULL,
  PRIMARY KEY (`id_juez`)
) ENGINE=InnoDB ;

LOCK TABLES `juez` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `juzgado`;

CREATE TABLE `juzgado` (
  `id_juzgado` int NOT NULL AUTO_INCREMENT,
  `nombre_juzgado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_juzgado`)
) ENGINE=InnoDB ;

LOCK TABLES `juzgado` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `ocupacion`;

CREATE TABLE `ocupacion` (
  `id_ocupacion` int NOT NULL AUTO_INCREMENT,
  `descripcion_ocupacion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ocupacion`)
) ENGINE=InnoDB ;


LOCK TABLES `ocupacion` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `participante`;

CREATE TABLE `participante` (
  `id_participante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `edad` int DEFAULT NULL,
  `id_escolaridad` int DEFAULT NULL,
  `id_etnia` int DEFAULT NULL,
  `id_ocupacion` int DEFAULT NULL,
  `id_persona` int NOT NULL,
  PRIMARY KEY (`id_participante`),
  UNIQUE KEY `id_persona_UNIQUE` (`id_persona`),
  KEY `id_escolaridad` (`id_escolaridad`),
  KEY `id_etnia` (`id_etnia`),
  KEY `id_ocupacion` (`id_ocupacion`),
  CONSTRAINT `participante_ibfk_1` FOREIGN KEY (`id_escolaridad`) REFERENCES `escolaridad` (`id_escolaridad`),
  CONSTRAINT `participante_ibfk_2` FOREIGN KEY (`id_etnia`) REFERENCES `etnia` (`id_etnia`),
  CONSTRAINT `participante_ibfk_3` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id_ocupacion`)
) ENGINE=InnoDB ;
LOCK TABLES `participante` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `proceso_judicial`;

CREATE TABLE `proceso_judicial` (
  `id_proceso_judicial` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_proceso` date DEFAULT NULL,
  `fecha_conclusion` date DEFAULT NULL,
  `area_seguimiento` varchar(255) DEFAULT NULL,
  `numero_expediente` varchar(25) DEFAULT NULL,
  `id_juzgado` int DEFAULT NULL,
  PRIMARY KEY (`id_proceso_judicial`),
  KEY `id_juzgado` (`id_juzgado`),
  CONSTRAINT `proceso_judicial_ibfk_1` FOREIGN KEY (`id_juzgado`) REFERENCES `juzgado` (`id_juzgado`)
) ENGINE=InnoDB ;
LOCK TABLES `proceso_judicial` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `promovente`;

CREATE TABLE `promovente` (
  `id_participante` int NOT NULL,
  `espanol` tinyint NOT NULL,
  PRIMARY KEY (`id_participante`),
  CONSTRAINT `promovente_ibfk_1` FOREIGN KEY (`id_participante`) REFERENCES `participante` (`id_participante`)
) ENGINE=InnoDB ;
LOCK TABLES `promovente` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `prueba`;

CREATE TABLE `prueba` (
  `id_prueba` int NOT NULL AUTO_INCREMENT,
  `descripcion_prueba` varchar(200) NOT NULL,
  `id_proceso_judicial` int DEFAULT NULL,
  PRIMARY KEY (`id_prueba`),
  KEY `id_proceso_judicial` (`id_proceso_judicial`),
  CONSTRAINT `prueba_ibfk_1` FOREIGN KEY (`id_proceso_judicial`) REFERENCES `proceso_judicial` (`id_proceso_judicial`)
) ENGINE=InnoDB ;