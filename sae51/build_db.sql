CREATE DATABASE sae51;

USE sae51;

CREATE TABLE `machines` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `marque` varchar(255),
  `os` varchar(255),
  `ram` int,
  `date_achat` date,
  `id_utilisateur` int
);

CREATE TABLE `utilisateurs` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `prenom` varchar(255)
);

CREATE TABLE `logiciels` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `id_machine` int,
  `version` varchar(255),
  `licence` varchar(255)
);

CREATE TABLE `techniciens` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `prenom` varchar(255)
);

CREATE TABLE `interventions` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_technicien` int,
  `date_intervention` date,
  `id_machine` int,
  `action` varchar(255)
);

ALTER TABLE `machines` ADD FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id`);

ALTER TABLE `interventions` ADD FOREIGN KEY (`id_machine`) REFERENCES `machines` (`id`);

ALTER TABLE `logiciels` ADD FOREIGN KEY (`id_machine`) REFERENCES `machines` (`id`);

ALTER TABLE `interventions` ADD FOREIGN KEY (`id_technicien`) REFERENCES `techniciens` (`id`);
