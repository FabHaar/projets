#!/bin/bash
# Attention l'ordre d'ajouts des règles à une importance

### Initialisation de ufw (activation et affichage des règles)
ufw status
ufw logging on
ufw --force enable
ufw status
ufw status verbose


### Ajout de règles bloquant le traffic (entrant / sortant )
#ufw default deny
#ufw default deny outgoing



### Ajout de règles autorisant le traffic (entrant / sortant )
#ufw default allow
#ufw default allow outgoing
#http-https
ufw allow 80
ufw allow 443
#ssh
ufw allow 22
#ufw allow from 10.0.2.2 to 10.0.2.15 port 22

### Application de la configuration (rechargement de ufw).
ufw --force reload
ufw status verbose

#limiter le nombre de connexions http
#ufw limit 80

#réinitialisé ufw : sudo ufw reset --force
