#!/bin/bash


# étape d'initialisation
read -p "Do you want to proceed a purge ? (y/n) " yn

case $yn in 
	[yY] ) echo ok, we will proceed a purge;
	      ./purge.sh;;
	[nN] ) echo ok maybe later...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac


if [ $? != 0 ] 
then
	echo "echec d'initialisation : étape initialisation"
	exit 1
fi

#Etape 1 : Création du lien réseau
	./create_network.sh
	
	if [ $? != 0 ]
	then
		echo "échec de creation du réseau"
		exit 1
	fi
	
#Etape 2 : lancement du serveur mysql
	./run_mysql.sh
#problème avec la création de la DATABASE
#	if [ $? != 0 ]
#	then
#		echo "échec de lancement du conteneur mysql"
#		exit 1
#	fi
	
#Etape 3 : Construction de l'image pour l'application flask
	./build.sh


	if [ $? != 0 ]
	then
		echo "échec de creation de l'image à partir du Dockerfile : étape 2"
		exit 1
	fi
	
#Etape 4 : Lancement du conteneur de l'application flask
	./run_app.sh
	
	
	if [ $? != 0 ]
	then
		echo "échec de lancement du conteneur app : étape 3"
		exit 1
	fi


## Etape 5 : Résultat
# Ouvre la page http://localhost:5000/ dans le navigateur par défaut
	xdg-open http://localhost:5000/ 2>/dev/null

# Si cette erreur s'est lancé, c'est pas grave, cela ne veut pas dire que le projet ne fonctionne pas
	if [ $? != 0 ]
	then
		echo "échec de lancement du navigateur, veuillez ouvrir la page http://localhost:5000/ dans votre navigateur "
		exit 1
	fi
