#!/bin/bash

docker stop nginx-server
docker stop logs-collector

docker rm nginx-server
docker rm logs-collector

docker rmi serveur-nginx
docker rmi go-access

docker volume rm nginx-logs
