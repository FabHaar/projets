#!/bin/bash

#Etape 1 :
docker build -t img_sae51 -f converter/Dockerfile .
./converter/run_converter.sh

#ETAPE 2 :
docker volume create V_BDD

#ETAPE 3 :
echo "Création du conteneur du SGBD"
docker run --name SQL_Server \
	-p 3306:3306 \
	-v V_BDD:/var/lib/mysql \
	--env MYSQL_ROOT_PASSWORD=foo \
	-d mysql

echo "Le sgbd prend un petit moment pour être accessible, veuillez patienter un instant"	
sleep 5          #attente du socket ready

#ETAPE intermediaire :
#echo "vérification des prérequis à la connexion"
#./bypass_warning.sh



#ETAPE 4 :
echo "Création de la base de données sur le SGBD..."
./create_db.sh

#ETAPE 5 :
echo "Remplissage de la base de données"
./filldb.sh


#ETAPE 6 :
cd select_sql
./exemples.sh
