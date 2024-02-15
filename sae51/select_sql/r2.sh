#!/bin/bash
echo "Liste de toutes les machines achetées entre 2018 et 2020: "
mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 < r2.sql 2> /dev/null
