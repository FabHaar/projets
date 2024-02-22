#!/bin/bash
echo "Utilisateurs ayant une machine HP et un OS windows 10 : "
mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 < r9.sql 2> /dev/null
