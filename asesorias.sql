
CREATE DATABASE  IF NOT EXISTS `consejeria_asesorias`;
USE `consejeria_asesorias`;

DROP TABLE IF EXISTS `asesorados`;

CREATE TABLE `asesorados` (
  `id_asesorado` int NOT NULL,
  `estatus_trabajo` tinyint NOT NULL,
  `id_motivo` int DEFAULT NULL,
  `id_estado_civil` int NOT NULL,
  `numero_hijos` int DEFAULT NULL,
  `ingreso_mensual` double DEFAULT NULL,
  PRIMARY KEY (`id_asesorado`),
  KEY `fk_estado_civil_idx` (`id_estado_civil`),
  KEY `fk_motivo_asesorado_idx` (`id_motivo`),
  CONSTRAINT `fk_estado_civil_asesorado` FOREIGN KEY (`id_estado_civil`) REFERENCES `estados_civiles` (`id_estado_civil`),
  CONSTRAINT `fk_motivo_asesorado` FOREIGN KEY (`id_motivo`) REFERENCES `motivos` (`id_motivo`),
  CONSTRAINT `fk_persona_asesorado` FOREIGN KEY (`id_asesorado`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB ;
LOCK TABLES `asesorados` WRITE;

INSERT INTO `asesorados` VALUES (1,0,3,2,12,NULL),(2,0,1,1,1,NULL),(3,0,1,1,1,NULL),(4,0,1,1,1,NULL),(5,0,3,1,2,NULL),(6,0,1,1,1,NULL);

UNLOCK TABLES;


DROP TABLE IF EXISTS `asesores`;

CREATE TABLE `asesores` (
  `id_asesor` int NOT NULL AUTO_INCREMENT,
  `nombre_asesor` varchar(100) NOT NULL,
  `id_zona` int NOT NULL,
  PRIMARY KEY (`id_asesor`),
  KEY `fk_zona_asesor_idx` (`id_zona`),
  CONSTRAINT `fk_zona_asesor` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=19 ;


LOCK TABLES `asesores` WRITE;

INSERT INTO `asesores` VALUES (1,'Aguilar Delgado Juan Manuel',1),(2,'Esparza Llamas Brenda',1),(3,'Galaz Valenzuela Aracely',1),(4,'García Barceló José Francisco',1),(5,'Huerta Puebla Manuel',1),(6,'Hugez Atondo Alejandra',1),(7,'Leyva Samperio Andrea',1),(8,'Nichols Rodríguez Leslye',1),(9,'Ochoa Vazquez Carlos Rosalio',1),(10,'Perera Garcia Claudia Elena',1),(11,'Reyes Felix Martha Alicia',1),(12,'Rivera Bustamante Melisa Carolina',1),(13,'Romo Vega Ricardo',1),(14,'Yanajara Roman José Guillermo',1),(15,'Gaxiola Santa Cruz Teresita',1),(16,'Vega Torres Carmen Lucía',1),(17,'Leyva Campoy Medardo',1),(18,'Carvajal Perez Luis Ivan',1);

UNLOCK TABLES;


DROP TABLE IF EXISTS `asesorias`;

CREATE TABLE `asesorias` (
  `id_asesoria` int NOT NULL AUTO_INCREMENT,
  `resumen_asesoria` varchar(250) DEFAULT NULL,
  `conclusion_asesoria` varchar(250) DEFAULT NULL,
  `estatus_requisitos` tinyint DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id_asesor` int NOT NULL,
  `id_turno` int DEFAULT NULL,
  `id_asesorado` int NOT NULL,
  `usuario` varchar(195) NOT NULL,
  `id_tipo_juicio` int NOT NULL,
  PRIMARY KEY (`id_asesoria`),
  KEY `fk_asesor_asesoria_idx` (`id_asesor`),
  KEY `fk_asesorado_asesoria_idx` (`id_asesorado`),
  KEY `fk_turno_asesoria_idx` (`id_turno`),
  KEY `fk_tipo_juicio_idx` (`id_tipo_juicio`),
  CONSTRAINT `fk_asesor_asesoria` FOREIGN KEY (`id_asesor`) REFERENCES `asesores` (`id_asesor`),
  CONSTRAINT `fk_asesorado_asesoria` FOREIGN KEY (`id_asesorado`) REFERENCES `asesorados` (`id_asesorado`),
  CONSTRAINT `fk_id_tipo_juicio_asesoria` FOREIGN KEY (`id_tipo_juicio`) REFERENCES `tipos_juicios` (`id_tipo_juicio`),
  CONSTRAINT `fk_turno_asesoria` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 ;

LOCK TABLES `asesorias` WRITE;

INSERT INTO `asesorias` VALUES (1,'Yo le pego a mi esposa    ','                Me cae mal, odio a mi esposa.                ',1,'2023-09-26',1,1,1,'Jose Jesus Hernandez Orozco',1),(2,'Me pega mi esposa.    ','                Se quiere divorciar                ',0,'2023-09-27',2,3,2,'Jose Jesus Hernandez Orozco',2),(3,'    Prueba 3','Prueba 3                                ',0,'2023-09-27',1,NULL,3,'Jose Jesus Hernandez Orozco',1),(4,'Me pega mi marido    ','Divorcio                                ',0,'2023-09-27',13,NULL,4,'Jose Jesus Hernandez Orozco',1),(5,'Divorcio por parte de la pareja.','               El marido requiere el divorcio.                 ',1,'2023-09-29',1,NULL,5,'Jose Jesus Hernandez Orozco',1),(6,'Front arreglado    ','Front                                ',0,'2023-09-30',1,NULL,6,'Jose Jesus Hernandez Orozco',1);

UNLOCK TABLES;


DROP TABLE IF EXISTS `catalogo_requisitos`;

CREATE TABLE `catalogo_requisitos` (
  `id_catalogo` int NOT NULL AUTO_INCREMENT,
  `descripcion_catalogo` varchar(75) NOT NULL,
  PRIMARY KEY (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;
LOCK TABLES `catalogo_requisitos` WRITE;

INSERT INTO `catalogo_requisitos` VALUES (1,'Requisitos'),(2,'Carta compromiso'),(3,'Citatorio');

UNLOCK TABLES;


DROP TABLE IF EXISTS `detalle_asesorias_catalogos`;

CREATE TABLE `detalle_asesorias_catalogos` (
  `id_asesoria` int NOT NULL,
  `id_catalogo` int NOT NULL,
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_detalle_asesoria_idx` (`id_asesoria`),
  KEY `fk_detalle_catalogo_idx` (`id_catalogo`),
  CONSTRAINT `fk_detalle_asesoria` FOREIGN KEY (`id_asesoria`) REFERENCES `asesorias` (`id_asesoria`),
  CONSTRAINT `fk_detalle_catalogo` FOREIGN KEY (`id_catalogo`) REFERENCES `catalogo_requisitos` (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 ;


LOCK TABLES `detalle_asesorias_catalogos` WRITE;

INSERT INTO `detalle_asesorias_catalogos` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6);

UNLOCK TABLES;

DROP TABLE IF EXISTS `domicilios`;

CREATE TABLE `domicilios` (
  `id_domicilio` int NOT NULL AUTO_INCREMENT,
  `calle_domicilio` varchar(75) NOT NULL,
  `numero_exterior_domicilio` varchar(25) DEFAULT NULL,
  `numero_interior_domicilio` varchar(25) DEFAULT NULL,
  `id_colonia` int NOT NULL,
  PRIMARY KEY (`id_domicilio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 ;


LOCK TABLES `domicilios` WRITE;

INSERT INTO `domicilios` VALUES (1,'Las haciendas san miguel','310','',78784),(2,'Alberto vargas','2905','',107729),(3,'Mario','2905','',4844),(4,'Marte','2905','',116095),(5,'Robles Reyes','2903','',107729),(6,'Oroz','2903','',139096);

UNLOCK TABLES;


DROP TABLE IF EXISTS `estados_civiles`;

CREATE TABLE `estados_civiles` (
  `id_estado_civil` int NOT NULL AUTO_INCREMENT,
  `estado_civil` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 ;
LOCK TABLES `estados_civiles` WRITE;

INSERT INTO `estados_civiles` VALUES (1,'Soltero(a)'),(2,'Casado(a)'),(3,'Unión Libre'),(4,'Separado(a)'),(5,'Divorciado(a)'),(6,'Viudo(a)');

UNLOCK TABLES;


DROP TABLE IF EXISTS `generos`;

CREATE TABLE `generos` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `descripcion_genero` varchar(25) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;
LOCK TABLES `generos` WRITE;

INSERT INTO `generos` VALUES (1,'Masculino'),(2,'Femenino'),(3,'No Binario');

UNLOCK TABLES;


DROP TABLE IF EXISTS `motivos`;

CREATE TABLE `motivos` (
  `id_motivo` int NOT NULL AUTO_INCREMENT,
  `descripcion_motivo` varchar(75) NOT NULL,
  PRIMARY KEY (`id_motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=5;

LOCK TABLES `motivos` WRITE;

INSERT INTO `motivos` VALUES (1,'Discapacidad o enfermedad'),(2,'Ama de casa'),(3,'En busca de empleo'),(4,'Pensionado(a)');

UNLOCK TABLES;


DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_domicilio` int NOT NULL,
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `fk_domicilio_idx` (`id_domicilio`),
  KEY `fk_genero_idx` (`id_genero`),
  CONSTRAINT `fk_domicilio_persona` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilios` (`id_domicilio`),
  CONSTRAINT `fk_genero_persona` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 ;

LOCK TABLES `personas` WRITE;

INSERT INTO `personas` VALUES (1,'Carlos Alfonso','Sauceda','Cervantes',23,'644413585',1,1),(2,'Jose Jesus','Orozco','Hernandez',18,'6442138091',2,1),(3,'Julia','Antonieta','Hernandez',18,'6442138094',3,2),(4,'Giovanni','Garrido','Barron',18,'6442138596',4,1),(5,'Juan Antonio','Maldonado','Barrera',30,'6442478394',5,1),(6,'Ivan','Alonso','Moreno',18,'6442157826',6,1);

UNLOCK TABLES;


DROP TABLE IF EXISTS `tipos_juicios`;

CREATE TABLE `tipos_juicios` (
  `id_tipo_juicio` int NOT NULL AUTO_INCREMENT,
  `tipo_juicio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_juicio`)
) ENGINE=InnoDB AUTO_INCREMENT=15 ;

LOCK TABLES `tipos_juicios` WRITE;

INSERT INTO `tipos_juicios` VALUES (1,'Divorcio Incausado'),(2,'Divorcio Voluntario'),(3,'J. Vol de Acred. de Hechos de Concubinato'),(4,'J. Vol de Convenio Judicial (Pensión y Convivencia)'),(5,'J. Vol. Acred. Hechos de Defunción'),(6,'J. Vol. Acred. Hechos de Dep. Económica'),(7,'J. Vol. Acred. Hechos de Nacimiento'),(8,'J. Vol. de Cancelación de Pensión'),(9,'J. Vol. de Consignación de Pensión'),(10,'Nulidad de Acta de Nacimiento'),(11,'Oral Cuestiones Familiares (Convivencia)'),(12,'Oral de Alimentos'),(13,'Sucesorio Intestamentario'),(14,'Sucesorio Testamentario');

UNLOCK TABLES;

DROP TABLE IF EXISTS `turnos`;

CREATE TABLE `turnos` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `fecha_turno` date NOT NULL,
  `hora_turno` time NOT NULL,
  PRIMARY KEY (`id_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;
LOCK TABLES `turnos` WRITE;

INSERT INTO `turnos` VALUES (1,'2023-09-26','12:12:00'),(2,'2023-09-27','12:25:00'),(3,'2023-09-29','11:13:00');

UNLOCK TABLES;


DROP TABLE IF EXISTS `zonas`;

CREATE TABLE `zonas` (
  `id_zona` int NOT NULL AUTO_INCREMENT,
  `nombre_zona` varchar(50) NOT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;
LOCK TABLES `zonas` WRITE;

INSERT INTO `zonas` VALUES (1,'NORTE'),(2,'CENTRO'),(3,'SUR');

UNLOCK TABLES;