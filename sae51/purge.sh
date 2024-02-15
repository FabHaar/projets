#!/bin/bash

mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 < "purge.sql" 2> /dev/null

docker stop SQL_Server

docker rm SQL_Server

rm -r shared/

#docker rmi img_sae51
