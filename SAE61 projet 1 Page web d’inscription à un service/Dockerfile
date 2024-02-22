#ON part d'une image debian 11
FROM debian:11

# Update et upgrade pour installer python correctement
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install python-dev python3-pip -y

#Upgrade pip pour installer les bibliothèques python correctement
RUN pip3 install --upgrade pip

#Installation des bibliothèques python nécessaires au fonctionnement 
RUN pip3 install flask
RUN pip3 install mysql-connector-python

#Création des dossiers qui acceuilleuront les page html et leur style css
RUN mkdir /srv/templates /srv/static

#Copie dans le dossier /srv/templates de toutes les pages html 
COPY /html-css/index.html /srv/templates/index.html
COPY /html-css/newuser.html /srv/templates/newuser.html
COPY /html-css/connect.html /srv/templates/connect.html
COPY /html-css/liste.html /srv/templates/liste.html

#Copie dans le dossier /srv/static de la feuille de style css
COPY /html-css/styles.css /srv/static/styles.css

#Commande permettant de lancer l'application et de faire persister le conteneur
CMD ["flask","--app","/srv/app_1","run","--host=0.0.0.0"]
