#!/bin/bash

for a in *.dbml
do
	name=${a%.dbml}
	echo "processing $name"
	dbml2sql $a --mysql > $name.sql
	dbml-renderer -i $a -o $name.svg
done

cat /srv/sae51.sql > /srv/buffer.sql
echo "CREATE DATABASE sae51; USE sae51;" > /srv/sae51.sql
cat /srv/buffer.sql >> /srv/sae51.sql
rm /srv/buffer.sql

#echo "CREATE DATABASE sae51; USE sae51;" | cat - /srv/sae51.sql > /srv/sae51.sql
#dbml-renderer -i example.dbml -o output.svg
