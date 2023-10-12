
CREATE DATABASE  IF NOT EXISTS `consejeria_usuarios` ;
USE `consejeria_usuarios`;

DROP TABLE IF EXISTS `tipo_user`;

CREATE TABLE `tipo_user` (
  `id_tipouser` int NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipouser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 ;
LOCK TABLES `tipo_user` WRITE;

INSERT INTO `tipo_user` VALUES (1,'Admin'),(2,'Normal');

UNLOCK TABLES;

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `password` varchar(65) NOT NULL,
  `id_zona` int NOT NULL,
  `id_tipouser` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_zona_idx` (`id_zona`),
  KEY `fk_tipo_user_idx` (`id_tipouser`),
  CONSTRAINT `fk_tipo_user` FOREIGN KEY (`id_tipouser`) REFERENCES `tipo_user` (`id_tipouser`),
  CONSTRAINT `fk_zona` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;
LOCK TABLES `usuarios` WRITE;

INSERT INTO `usuarios` VALUES (1,'carlos','sauceda','cervantes','carlos@','123',3,1),(2,'Carlos Alfonso','Sauceda','Cervantes','carlos.sauceda205690@potros.itson.edu.mx','$2b$10$SkbUbJHJCPgsxw8JeiIeDuSWRGCD6A2LEE68cHTk5s66.bhU8WJVC',3,1),(3,'Jose Jesus','Orozco','Hernandez','josejesusorozcohernandez502@gmail.com','$2b$10$a.wUwOLZgTX67L5R4XWIDO/JGAUZPRwZjDHVLUX4taVF45nVryfce',3,2);

UNLOCK TABLES;

DROP TABLE IF EXISTS `zonas`;

CREATE TABLE `zonas` (
  `id_zona` int NOT NULL AUTO_INCREMENT,
  `zona` varchar(45) NOT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;
LOCK TABLES `zonas` WRITE;

INSERT INTO `zonas` VALUES (1,'Norte'),(2,'Centro'),(3,'Sur');

UNLOCK TABLES;
