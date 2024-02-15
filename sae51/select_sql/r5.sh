#!/bin/bash
echo "Machines entre 4 et 8 GB de RAM :"
mysql -u root -p'foo' -h 127.0.0.1 --port=3306 sae51 < r5.sql 2> /dev/null
