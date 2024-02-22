#!/bin/bash

tail -n +2 "csv/export_simple.csv" | while IFS="," read -r name alias_name _;
do
	mysql -u root -p'foo' -h 127.0.0.1 --port=3306 dolibarr << EOF
	INSERT INTO llx_societe (nom, name_alias)
	VALUES ('$name', '$alias_name');
EOF

done
