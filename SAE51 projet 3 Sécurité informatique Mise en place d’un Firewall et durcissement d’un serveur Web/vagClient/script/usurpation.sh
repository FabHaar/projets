#!/bin/bash
#MITM
# Script aux privilèges admin requis.


# Récupération des informations pour usurpation :
echo "Déconnecter vous pour balayer en local seulement"
sleep 3
nmap -sSV -O -Pn -p 21,22,23,25,53,80,8080,443,110,139,143,161,162,3306,3389  192.168.1.1-255 # range a modifier pour être plus rapide, ou balayer plus large

# Récupérer l'IP, le masque et l'adresse MAC en résultat de commande nmap.
read -p "Entrer IP : " IP
read -p "Entrer Masque (type : 24) : " Mask
read -p "Entrer MAC address : " MAC


URL=${IP}
./role.sh $URL


# Désactive temporairement l'interface enp0s8
ip link set dev enp0s8 down

# Supprimer l'adresse IP existante
ip addr del 192.168.1.10/24 dev enp0s8
# Ajoute l'adresse IP avec le masque directement à l'interface enp0s8
ip addr add ${IP}/${Mask} dev enp0s8

# Modifie l'adresse MAC de l'interface enp0s8
#ip link set dev enp0s8 address ${MAC}

# Active à nouveau l'interface enp0s8
ip link set dev enp0s8 up




