#!/bin/bash
echo "Utilisateurs ayant une machine HP : "
mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 < r8.sql 2> /dev/null
