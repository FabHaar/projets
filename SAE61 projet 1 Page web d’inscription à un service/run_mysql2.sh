#!/bin/bash

docker run --rm -d \
		-p 3306:3306 \
		-v vol-sql-demo:/var/lib/mysql \
		--name serveur-mysql \
		--env MYSQL_ROOT_PASSWORD=foo \
		--env MYSQL_USER=python \
		--env MYSQL_PASSWORD=python \
		--network net-sae61 \
		mysql

sleep 15

mysql -u root -p'foo' -h 127.0.0.1 --port=3306 < "sql/sae61_grant_python.sql"

mysql -u python -p'python' -h 127.0.0.1 --port=3306 < "sql/sae61.sql"
