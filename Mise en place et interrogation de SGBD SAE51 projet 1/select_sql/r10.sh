#!/bin/bash
echo "intervention entre le 10 octobre 2021 et 10 décembre 2021 :"
mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 < r10.sql 2> /dev/null
