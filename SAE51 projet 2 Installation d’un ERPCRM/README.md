Naviguation : 

* [Racine Port-folio](https://github.com/FabHaar/projets)
* [Pipeline CI CD](https://github.com/FabHaar/projets/tree/main/Pipeline%20CI%20CD)
* [SAE51 projet 1 Mise en place et interrogation de SGBD](https://github.com/FabHaar/projets/tree/main/SAE51%20projet%201%20Mise%20en%20place%20et%20interrogation%20de%20SGBD)
* [SAE51 projet 3 Sécurité informatique Mise en place d’un Firewall et durcissement d’un serveur Web](https://github.com/FabHaar/projets/tree/main/SAE51%20projet%203%20S%C3%A9curit%C3%A9%20informatique%20Mise%20en%20place%20d%E2%80%99un%20Firewall%20et%20durcissement%20d%E2%80%99un%20serveur%20Web)
* [SAE52 projet 1 Collecte et traitement des logs de fonctionnement](https://github.com/FabHaar/projets/tree/main/SAE52%20projet%201%20Collecte%20et%20traitement%20des%20logs%20de%20fonctionnement)
* [SAE61 projet 1 Page web d’inscription à un service](https://github.com/FabHaar/projets/tree/main/SAE61%20projet%201%20Page%20web%20d%E2%80%99inscription%20%C3%A0%20un%20service)
# Installation d'un ERP/CRM

#### Fait par Haar Fabien et Sofianos Lucas
Groupe FI
<div align="right">le 22/11/2023 </div>

# Points clés

## 1 Description de l'architecture conteneurisé mise en place : 
| **Conteneurs** |                 **Conteneur Dolibarr**                |                        **Conteneur mysql**                        |                 **Conteneur cron**                 |
|:--------------:|:-----------------------------------------------------:|:-----------------------------------------------------------------:|:--------------------------------------------------:|
|    **Image**   |                    upshift/dolibarr                    |                               mysql                               | cron_save (personalisée à partir d'un image ubuntu) |
|  **Fonction** | Logiciel Dolibarr accessible depuis une interface web | Base de données permettant à Dolibarr de fonctionner correctement |         Serveur de sauvegarde hebdomadaire         |


## 2 Mise en place et utilisation de Dolibarr:

Pour la mise en place de Dolibarr, il suffit de lancer le script `install.sh` qui execute dans l'ordre les Etapes suivantes (correspondantes aux étapes commentées dans le script):

### Etape 1 :

Creation des volumes nécessaires pour la persistance des données au travers des deux commandes :<br>
`docker volume create dolibarr_db` <br>
`docker volume create dolibarr_docs`<br>
Puis, creation du réseau qui servira à tous les conteneurs la possibilité de pouvoir communiquer : <br>
`docker network create sae51` <br>

### Etape 2 :
Creation du conteneur mysql au travers de la commande:<br>
`docker run --name SQL_Server \`<br>
`-p 3306:3306 \`<br>
`-v dolibarr_db:/var/lib/mysql \`<br>
`--env MYSQL_ROOT_PASSWORD=foo \`<br>
`--env MYSQL_USER=dolibarr \`<br>
`--env MYSQL_PASSWORD=dolibarr \`<br>
`--env MYSQL_DATABASE=dolibarr \`<br>
`--env character_set_client=utf8 \`<br>
`--env character-set-server=utf8mb4 \`<br>
`--env collation-server=utf8mb4_unicode_ci \`<br>
`-network=sae51 \`<br>
`-d mysql`<br><br>
Puis une attente de quelques secondes au travers de la commande :<br>
`sleep 10`<br>
Cette attente est nécessaire pour permettre au SGBD d'être correctement accessible via un client mysql.<br><br>
Il est important de noter qu'en aucun cas un conteneur utilisera l'utilisateur root de la base de données pouyr s'y connecter.
### Etape 3 :

Creation de la base de données `dolibarr` via la commande : <br>
`mysql -u dolibarr -p'dolibarr' -h 127.0.0.1 --port=3306 < sql/dolibarr.sql 2> /dev/null`<br>
Le fichier `dolibarr.sql` contient l'instruction nécessaire pour la création de la base de données :<br> 
`CREATE DATABASE dolibarr;`

### Etape 4 :
Creation du conteneur Dolibarr via la commande :<br>
`docker run -p 80:80 \ `<br>
`--name Dolibarr_CRM \ `<br>
`--env DOLI_DB_HOST=SQL_Server -d \ `<br>
`--env DOLI_DB_NAME=dolibarr \ `<br>
`--env DOLI_MODULES=modSociete\ `<br>
`--env DOLI_ADMIN_LOGIN=Haar\ `<br>
`--env DOLI_ADMIN_PASSWORD=Balete\ `<br>
`--network=sae51 \ `<br>
`upshift/dolibarr`

### Etape 5 :

Execution du script `build_and_run_cron.sh`:<br> 
Construction de l'image pour le conteneur cron :<br>
`docker build -t cron_save -f cron/Dockerfile .`<br>

Puis lancement du conteneur :<br>
`docker run -d \ `<br>
`--name cron_backup \ `<br>
`-v dolibarr_docs:/var/www/documents \ `<br>
`--network=sae51 \ `<br>
`cron_save`

# Troubleshooting : 
## Probleme 1 :
Première implémentation dockerisé : solution BDD -- Dolibarr et ses dépendances

(passer de docker compose avec mariaDB à docker run sur mysql et le reste)

Premier esssai d'implémentation en suivant https://github.com/upshift-docker/dolibarr pour la creation d'un docker-compose permettant l'implementation de dolibarr.
Le fichier docker-compose.yml permettait en théorie de faire l'installation de mariadb dans un conteneur paramétrer de sorte qu'il y est création de base de donnée, une communication directe avec le second conteneur créé, celui d'une image dolibarr modifier pour permettre de manipuler l'installation avec des variable pour la preset, ainsi que toute les solutions nécessaire embarquer au fonctionnement de dolibarr (apache2, serveur php...) . 
finalement cette solution ne fonctionnait pas complétement alors nous l'avons adapté en reprenant tout d'abord, une base de donnée mysql comme le projet précédent, mais aussi en ne passant plus par un docker-compose.yml mais simplement avec un script pour lancer 2 conteneurs (docker run ...)

## Probleme 2 :
(problème de connection entre le dolibarr et mysql --> solution, ajout de network entre les 2)

Le second problème est intervenu à la suite du première essai, grâce au logs de docker nous avons pu voir que la connection entre la base de donnée mysql et le conteneur dolibarr ne s'effectuait pas correctement, par conséquence dolibarr ne pouvais pas fonctionner.
La solution à été de rajouter un réseau entre les 2 conteneurs afin de leur premettre la connection mutuel (une erreur qui était présente d'origine dans le fichier docker-compose.yml fournie précédemment) <br>
Nous avons donc utiliser dans le script `install.sh` la commande :<br> 
`docker network create sae51`<br>
Et lors de la création de chaque conteneur, spécifier l'option : <br>
`--network=sae51`

## Probleme 3 :
(enfin, problème de création de la Database avec la variable env MYSQL_DATABASE qui n'étais pas prise en compte --> solution, crée la database grâce à l'envoie d'une requête)

Pour finir, nous avions une erreur lors de la récupération par dolibarr de la base de données appelé "dolibarr" (nom dolibarr inconnu) pour cause elle n'était pas correctement créée.
Malgré l'utilisation de la variable d'environnement MYSQL_DATABASE qui est censé permettre la création de la base de donnée à l'initialisation du SGBD, la base de données n'était pas présente, la variable n'était pas prise en compte comparé aux autres variables d'environnement présentes permettant d'autre paramétrages.
La solution à été d'utiliser une autre méthode pour effectuer l'implémentation de la base données, par l'envoie d'une requete pour effectuer la création de la base de données "dolibarr" : <br>
`CREATE DATABASE dolibarr`

## Probleme 4 :

Cron

## Probleme 5 :

Imprtation des csv
