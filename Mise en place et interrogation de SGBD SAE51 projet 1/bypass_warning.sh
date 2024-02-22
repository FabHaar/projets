#!/bin/bash

file="/etc/mysql/conf.d/mysql.cnf"
if grep -Fxq "[client]" "$file" && grep -Fxq "password=foo" "$file";
then
	echo "Les lignes de configuration pour le client mysql existent deja."
else
	echo "[client]" >> "$file"
	echo "password=foo" >> "$file"
	echo "Les lignes de configuration ont été ajoutées au fichier."
fi
