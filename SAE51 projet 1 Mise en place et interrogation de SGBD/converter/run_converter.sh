#!/bin/bash

#utilisateur=$(users | grep -v 'root' | awk '{print $1}' | head -1)
#chown -R "$utilisateur":"$utilisateur" shared/

mkdir -p shared/

cp *.dbml shared/
cp gen_sql.sh shared/

docker run --rm -it \
	--workdir /srv \
	--name sae51-ub \
	--mount type=bind,source=$(pwd)/shared,target=/srv \
	img_sae51

#apt-get -y install imagemagick


cd shared
for a in *.svg
do
	name=${a%.svg}
	echo "converting $name"
	convert $a $name.png
done

cd ..
