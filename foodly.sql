-- MySQL dump 10.13  Distrib 8.0.21, for osx10.15 (x86_64)
--
-- Host: localhost    Database: foodly2
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `aliment`
--

DROP TABLE IF EXISTS `aliment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aliment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `marque` varchar(100) DEFAULT NULL,
  `sucre` float DEFAULT NULL,
  `calories` int NOT NULL,
  `graisses` float DEFAULT NULL,
  `proteines` float DEFAULT NULL,
  `bio` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliment`
--

LOCK TABLES `aliment` WRITE;
/*!40000 ALTER TABLE `aliment` DISABLE KEYS */;
INSERT INTO `aliment` VALUES (1,'pomme','sans marque',19.1,72,0.2,0.4,0),(2,'poire','sans marque',27.5,134,0.2,1.1,1),(3,'banane','chiquita',24,101,0.3,1.1,0),(4,'jambon','herta',0.2,34,0.8,6.6,0),(5,'compote','andros',11,51,0,0.5,0),(6,'steak haché','charal',0.8,68,4.8,4.8,0),(7,'saumon','guyader',0,206,12.3,22.1,0),(8,'haricots verts','bonduelle',5.8,25,0.1,1.5,0),(9,'riz','oncle benz',28.2,130,0.3,2.7,0),(10,'pâtes completes','barilla',64,353,2.7,14,1),(11,'blanc de dinde','père dodu',0.6,98,0.9,22,0),(12,'filet de poulet','le gaulois',0,121,1.8,26.2,0),(13,'muesli','bjorg',26.5,170,5,3.5,1),(14,'café','carte noire',0,0,0,0,0),(15,'jus d\'orange','innocent',16,74,0,1.6,0),(16,'jus de pomme','andros',24,100,0.2,0.2,1),(17,'pomme de terre','doréac',21.1,104,0.2,2.8,0),(18,'oeuf','naturalia',0.4,74,5.1,6.5,1),(19,'baguette','sans marque',36.1,185,1.2,7.5,0),(20,'lait d\'amande','bjorg',6.1,80,5.3,1.5,1);
/*!40000 ALTER TABLE `aliment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` (`nom`,`prenom`,`email`) VALUES ('durantay','quentin','qentin@gmail.com'),
('dupont','marie','marie@hotmail.fr'),
('miller','vincent','vm@yahoo.com'),
('zuckerberg','marc','marc@gmail.com'),
('paul','pierre','pp@orange.fr'),
('de vauclerc','lisa','lisadv@gmail.com'),
('gluntig','éléonore','glunt@sfr.com'),
('cavill','henry','henry@outlook.fr'),
('hopper','lionel','hpp@gmail.com'),
('tember','fabienne','fabienne@yopmail.com');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

INSERT INTO `aliment` (`nom`, `marque`, `sucre`, `calories`, `graisses`, `proteines`, `bio`)
VALUES
('poire', 'monoprix', 27.5, 134, 0.2, 1.1, FALSE),
('pomme', 'monoprix', 19.1, 72, 0.2, 0.4, FALSE),
('oeuf', 'carrefour', 0.6, 82, 5.8, 6.9, TRUE),
('lait d\''amande', 'bjorg', 4.5, 59, 3.9, 1.1, TRUE);

SELECT `nom`,`prenom`,`email`  FROM utilisateur WHERE `id`=14;
/* commande select pour recuperer les informations de la BDD
les `` sur les noms des tables sont pas obligatoires mais recommandés*/

UPDATE `aliment` SET `nom` = 'pomme golden' WHERE `id`= '1';
/* commande UPDATE pour modifier un element specifique dans la BDD*/

DELETE FROM `utilisateur` WHERE `id`=12;
/* commande DELETE pour supprimer une donnee de la BDD*/

/* On peut aussi utiliser les operateurs <,>,<=,>= avec le WHERE*/

SELECT * FROM utilisateur WHERE `email` LIKE '%gmail.com';
/* LIKE permet de faire des specifications sur des strings en
precisant le format qu'on souhaite avoir */

SELECT * FROM aliment ORDER BY `calories` DESC;
/* ORDER BY permet de classer les elements dans l'ordre ASC(croissant)
ou DESC(decroissant)*/

SELECT * FROM aliment WHERE `bio`=0 ORDER BY proteines DESC;
/*nbre d'aliments non bio classes par ordre decroissant de proteines*/

SELECT COUNT(*) FROM utilisateur WHERE `email` LIKE '%gmail.com';
/* COUNT() permet de compter le nombre de resultats de cette requete SQL
On peut mettre n'importe quel champ dont on veut connaitre le nom
dans le COUNT*/

SELECT COUNT(DISTINCT nom)  AS "produits différents contenant le mot pomme"
FROM aliment 
WHERE nom LIKE "%pomme%";
/* DISTINCT permet d'obtenir les occurences uniques d'une donnee*/
/* AS permet de donner des noms specifiques aux colonnes qui affichent
les resultats*/

SELECT AVG(sucre)  AS "Moyenne du taux de sucre"
FROM aliment;
/* Fonction de calcul AVG permet de calculer la moyenne
autres fonctions: SUM,MAX,MIN,ROUND*/

CREATE VIEW utilisateur_gmail_vw AS
  (SELECT *
    FROM utilisateur
    WHERE `email` 
    LIKE "%gmail.com"
    );
/* une VIEW est comme une fonction qui contient des commandes SQL 
a executer a l'appel*/
SELECT * FROM utilisateur_gmail_vw;
/* Voila comment ce passe l'appel*/

CREATE VIEW aliment_non_bio_vw AS 
  (SELECT * FROM aliment WHERE `bio`=0 ORDER BY proteines DESC);

SELECT * FROM aliment_non_bio_vw ;