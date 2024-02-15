#!/bin/bash

#ETAPE 1 :
docker build -t serveur-nginx -f FI_E04_Dockerfile_1 .
docker build -t go-access -f FI_E04_Dockerfile_2 .

#ETAPE 2 :
docker volume create nginx-logs

#ETAPE 3 :
docker run --name nginx-server -p 80:80 -v nginx-logs:/var/log/nginx -d serveur-nginx

#ETAPE 4 :
docker run --name logs-collector -v nginx-logs:/var/log/nginx -d -it go-access

#ETAPE 5 :
docker exec -it logs-collector bash -c "goaccess -f /var/log/nginx/access.log --log-format COMBINED"
