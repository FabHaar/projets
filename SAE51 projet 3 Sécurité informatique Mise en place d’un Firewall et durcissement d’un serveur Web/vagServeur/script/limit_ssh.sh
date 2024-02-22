#!/bin/bash

#interdit le ssh
ufw delete allow 22

#autorise le ssh seulement pour machine hote uniquement sur le reseau entre serveur et hote
ufw allow from 10.0.2.2 to 10.0.2.15 port 22

#reload
ufw --force reload
ufw status verbose
