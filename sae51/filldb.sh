#!/bin/bash

function insert_utilisateurs {
	tail -n +2 "csv/utilisateurs.csv" | while IFS=";" read -r nom prenom;
	do
		mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 2> /dev/null<< EOF
		INSERT INTO utilisateurs (nom, prenom) VALUES ('$nom', '$prenom');
EOF
	done
}

function insert_techniciens {
	tail -n +2 "csv/techniciens.csv" | while IFS=";" read -r nom prenom;
	do
		mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 2> /dev/null<< EOF
		INSERT INTO techniciens (nom, prenom) VALUES ('$nom', '$prenom');
EOF
	done
}

function insert_machines {
	tail -n +2 "csv/machines.csv" | while IFS=";" read -r marque os ram date_achat id_utilisateur;
	do
		mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 2> /dev/null<< EOF
		INSERT INTO machines (marque, os, ram, date_achat, id_utilisateur) VALUES ('$marque', '$os', '$ram', '$date_achat', '$id_utilisateur');
EOF
	done
}

function insert_logiciels {
	tail -n +2 "csv/logiciels.csv" | while IFS=";" read -r nom id_machine version licence;
	do
		mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 2> /dev/null<< EOF
		INSERT INTO logiciels (nom, id_machine, version, licence) VALUES ('$nom', '$id_machine', '$version', '$licence');
EOF
	done
}

function insert_interventions {
	tail -n +2 "csv/interventions.csv" | while IFS=";" read -r id_technicien date_intervention id_machine action;
	do
		mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 2> /dev/null<< EOF
		INSERT INTO interventions (id_technicien, date_intervention, id_machine, action) VALUES ('$id_technicien', '$date_intervention', '$id_machine', '$action');
EOF
	done
}

#appel des fonctions pour remplir la base de données
insert_utilisateurs
insert_techniciens
insert_machines
insert_logiciels
insert_interventions
