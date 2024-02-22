#!/bin/bash

#2.3 créer le réseau net-sae61 en mode bridge
docker network create -d bridge net-sae61

error=$?

if [ $error != 0 ]
then
	exit $error
fi
