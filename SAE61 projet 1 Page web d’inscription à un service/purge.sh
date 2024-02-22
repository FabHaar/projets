#!/bin/bash

#suppression de la bdd
mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae61 < "sql/purge.sql"
if [ $? != 0 ]
then
	echo "echec de la suppression de la BDD"
fi

#stop tous les conteneurs
docker stop $(docker ps -aq) 2>/dev/null
if [ $? != 0 ]
then
	echo "echec d'arrêt des conteneurs"
fi

#supprime tous les conteneurs
docker rm $(docker ps -aq) 2>/dev/null
if [ $? != 0 ]
then
	echo "echec de suppression des conteneurs"
fi

#Supprime l'image custom
docker rmi im-sae61

#supprime les volumes
docker volume prune 2>/dev/null
if [ $? != 0 ]
then
	echo "echec de suppression des volumes"
fi

#Reinitialisation des informations systèmes
docker system prune 2>/dev/null
if [ $? != 0 ]
then
	echo "echec de reinitialisation des informations systèmes"
fi

#supprime les network
#docker network prune

