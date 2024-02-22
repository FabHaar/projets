#!/bin/bash

docker run -d -it\
		-p 5000:5000 \
		--name regex-app \
		--network net-sae61 \
		--mount type=bind,source="$(pwd)"/python/app_1.py,target=/srv/app_1.py \
		--mount type=bind,source="$(pwd)"/python/fonctions.py,target=/srv/fonctions.py \
		im-sae61

if [ $? != 0 ]
then
	echo "echec de lancement du conteneur app"
	exit 1
fi
