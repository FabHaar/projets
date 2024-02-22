Naviguation : 

* [Racine Port-folio](https://github.com/FabHaar/projets)
* [Pipeline CI CD](https://github.com/FabHaar/projets/tree/main/Pipeline%20CI%20CD)
* [SAE51 projet 1 Mise en place et interrogation de SGBD](https://github.com/FabHaar/projets/tree/main/SAE51%20projet%201%20Mise%20en%20place%20et%20interrogation%20de%20SGBD)
* [SAE51 projet 1 Mise en place et interrogation de SGBD](https://github.com/FabHaar/projets/tree/main/SAE51%20projet%201%20Mise%20en%20place%20et%20interrogation%20de%20SGBD)
* [SAE51 projet 2 Installation d’un ERP CRM](https://github.com/FabHaar/projets/tree/main/SAE51%20projet%202%20Installation%20d%E2%80%99un%20ERPCRM)
* [SAE51 projet 3 Sécurité informatique Mise en place d’un Firewall et durcissement d’un serveur Web](https://github.com/FabHaar/projets/tree/main/SAE51%20projet%203%20S%C3%A9curit%C3%A9%20informatique%20Mise%20en%20place%20d%E2%80%99un%20Firewall%20et%20durcissement%20d%E2%80%99un%20serveur%20Web)
* [SAE61 projet 1 Page web d’inscription à un service](https://github.com/FabHaar/projets/tree/main/SAE61%20projet%201%20Page%20web%20d%E2%80%99inscription%20%C3%A0%20un%20service)

# Guide d'utilisation

#### fait par Haar Fabien et Sofianos Lucas
groupe FI
<div align="right">le 04/10/2023 </div>

Pour effectuer la mise en oeuvre de situation de collecte de logs, nous avons décider de pouvoir visualiser les logs http d'un serveur web qui possède uniquement une page web static par défaut d'un serveur nginx. Pour cela 3 fichiers ont été produit pour rendre la mise en oeuvre la plus simple possible :
* `FI_E04_Dockerfile_1` : dockerfile permettant la construction d'une image nginx pour docker. Nous avons fait le choix de construire cette image au lieu d'utiliser l'image nginx fourni par docker car avec celle-ci les fichiers des logs existait bien mais ils ne semblaient pas fonctionner correctement en ne fournissant jamais d'informations.
* `FI_E04_Dockerfile_2` : dockerfile permettant la cosntruction d'une image goaccess pour docker.
* `FI_E04_Automatisation.sh` : script permettant d'automatiser la mise en oeuvre de la situation. Un fichier `FI_E04_purge.sh` a également été fourni afin de facilement purger tout ce qui a été mis en place par `FI_E04_Automatisation.sh`.

## Mise en oeuvre :

Une fois tous les fichiers dans le même dossier, pour mettre en oeuvre la situation de collecte de logs, il faudra éxecuter le script `FI_E04_Automatisation.sh`. Il produira les étapes suivantes (pouvant également être réaliser en tapant les commandes indiqués) : 

### Etape 1 : 
Execution de la commande :
`docker build -t serveur-nginx -f FI_E04_Dockerfile_1 .` qui construit l'image qui servira à lancer le conteneur se serveur web<br>
Puis éxecution de la commande : `docker build -t go-access -f FI_E04_Dockerfile_2 .` qui construit l'image qui servira à lancer le conteneur contenant l'application goaccess
### Etape 2 : 
Execution de la commande : `docker volume create nginx-logs`. Cela créé le volume qui servira à donner l'accès aux logs du conteneur nginx au conteneur goaccess.
### Etape 3 : 
Execution de la commande :`docker run --name nginx-server -p 80:80 -v nginx-logs:/var/log/nginx -d serveur-nginx`. Lance le conteneur qui sera le serveur nginx. IL utilisera le volume nginx-logs pour sauvegarder et partager le contenu de ses lofgs avec l'autre conteneur. Le port 80 du conteneur sera lié au port 80 de la machine hôte.
### Etape 4 : 
Execution de la commande : `docker run --name logs-collector -v nginx-logs:/var/log/nginx -d -it go-access`. Lance le conteneur qui sera l'application goaccess. Il utilise le volume nginx pour lui donner accès aux logs du serveur nginx.
### Etape 5 : 
Execution de la commande :`docker exec -it logs-collector bash -c "goaccess -f /var/log/nginx/access.log --log-format COMBINED"`. Prise en main du conbteneur goaccess en lançant directement l'application en lisant le fichier access.log du serveur nginx et choisi la mise en forme pour un accès direct au dashboard.

## Visualisation de la collecte de logs : 

Dans un navigateur de la machine hôte, entrer l'URL : `localhost`, à partir de là des logs peuvent commencer à apparaitre dans chaque catégorie de logs de l'application. Recharger la page peut etrainer la collecte de plus de logs, par exemple cela peut augmenter les `requested files` visible dans la deuxième catégorie du dashboard.<br>
Appuyer sur `q` à tout moment pour quitter l'application goaccess

Tant que les conteneurs sont démarrés, la commande `docker exec -it logs-collector bash -c "goaccess -f /var/log/nginx/access.log --log-format COMBINED"` peut être entrée pour reprendre la main sur l'application goaccess.
