#!/bin/bash

mysql -u dolibarr -p'dolibarr' -h 127.0.0.1 --port=3306 dolibarr < "sql/purge.sql" 2> /dev/null

docker stop SQL_Server
docker stop Dolibarr_CRM
docker stop cron_backup

docker rm SQL_Server
docker rm Dolibarr_CRM
docker rm cron_backup

docker network rm sae51
