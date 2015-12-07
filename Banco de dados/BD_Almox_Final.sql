-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdalmox
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `blocos`
--

DROP TABLE IF EXISTS `blocos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocos` (
  `idbloco` int(11) NOT NULL AUTO_INCREMENT,
  `nomeBloco` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idbloco`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nomeDepartamento` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarios` (
  `siape` int(9) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `departamentos_idDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`siape`),
  KEY `fk_professores_departamentos1_idx` (`departamentos_idDepartamento`),
  CONSTRAINT `fk_professores_departamentos1` FOREIGN KEY (`departamentos_idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patrimonios`
--

DROP TABLE IF EXISTS `patrimonios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patrimonios` (
  `idPatrimonio` int(11) NOT NULL AUTO_INCREMENT,
  `numRegistro` int(11) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `dataAquisicao` varchar(10) NOT NULL,
  `unidade` varchar(45) NOT NULL,
  `nomeUnidade` varchar(45) NOT NULL,
  PRIMARY KEY (`idPatrimonio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patrimonioscompletos`
--

DROP TABLE IF EXISTS `patrimonioscompletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patrimonioscompletos` (
  `numRegistro` int(11) NOT NULL,
  `idUnidade` int(11) DEFAULT NULL,
  `descricao` varchar(150) NOT NULL,
  `valorCorrigido` varchar(45) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `numProcesso` varchar(45) NOT NULL,
  `anoDocumento` int(11) NOT NULL,
  `codEstruturado` varchar(45) NOT NULL,
  `nomeUnidade` varchar(45) NOT NULL,
  `anoAquisicao` int(11) NOT NULL,
  `descricaoDoc` varchar(45) DEFAULT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `codUnidadeSel` varchar(45) DEFAULT NULL,
  `nomeUnidadeSel` varchar(45) DEFAULT NULL,
  `matriculaExterna` int(11) DEFAULT NULL,
  `nomeFunc` varchar(45) NOT NULL,
  `dataAquisicao` varchar(45) DEFAULT NULL,
  `salas_idSala` int(11) DEFAULT '0',
  `departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`numRegistro`),
  KEY `fk_patrimonioscompletos_salas1_idx` (`salas_idSala`),
  CONSTRAINT `fk_patrimonioscompletos_salas1` FOREIGN KEY (`salas_idSala`) REFERENCES `salas` (`idSala`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patrimoniostemp`
--

DROP TABLE IF EXISTS `patrimoniostemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patrimoniostemp` (
  `numRegistro` int(11) NOT NULL,
  `idUnidade` int(11) DEFAULT NULL,
  `descricao` varchar(150) NOT NULL,
  `valorCorrigido` varchar(45) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `numProcesso` varchar(45) NOT NULL,
  `anoDocumento` int(11) NOT NULL,
  `codEstruturado` varchar(45) NOT NULL,
  `nomeUnidade` varchar(45) NOT NULL,
  `anoAquisicao` int(11) NOT NULL,
  `descricaoDoc` varchar(45) DEFAULT NULL,
  `sigla` varchar(45) DEFAULT NULL,
  `codUnidadeSel` varchar(45) DEFAULT NULL,
  `nomeUnidadeSel` varchar(45) DEFAULT NULL,
  `matriculaExterna` int(11) DEFAULT NULL,
  `nomeFunc` varchar(45) NOT NULL,
  `dataAquisicao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numRegistro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salas` (
  `idSala` int(11) NOT NULL AUTO_INCREMENT,
  `tipoSala` varchar(45) NOT NULL,
  `numSala` varchar(45) NOT NULL,
  `responsavel` varchar(45) DEFAULT '0',
  `observacao` varchar(150) DEFAULT '0',
  `bloco_idbloco` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idSala`),
  KEY `fk_sala_bloco1_idx` (`bloco_idbloco`),
  CONSTRAINT `fk_sala_bloco1` FOREIGN KEY (`bloco_idbloco`) REFERENCES `blocos` (`idbloco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `siape_idSiape` int(11) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `tipoAdmin` tinyint(1) DEFAULT '0',
  `chefeDepartamento` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`siape_idSiape`),
  CONSTRAINT `fk_usuarios_professores1` FOREIGN KEY (`siape_idSiape`) REFERENCES `funcionarios` (`siape`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-06 23:18:13
