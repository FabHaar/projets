#!/bin/bash

echo "Reconnctez-vous au réseau"

sleep 3

# Installation du rôle miroir
apt-get install -y nginx nginx-extras
systemctl enable nginx 
systemctl start nginx

# L'URL dont vous voulez récupérer le contenu
URL=$1

# Le chemin du fichier HTML par défaut de Nginx
NGINX_DEFAULT_HTML="/var/www/html/index.html"

# Utilise curl pour récupérer le contenu de l'URL

NOUVEAU_CONTENU=$(curl -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -e "https://google.com" $URL)

# -s: Mode silencieux, pas de sortie ou de messages d'erreur.
# -A "Mozilla/5.0 ...": Simule une requête provenant du navigateur Chrome.
# -e "https://google.com": Indique que la requête provient de la page https://google.com.
# $URL: URL à interroger.


# Vérifie si curl a réussi à récupérer le contenu
if [ $? -eq 0 ]; then
    # Remplace le contenu du fichier HTML de Nginx avec le nouveau contenu
    echo "$NOUVEAU_CONTENU" | sudo tee $NGINX_DEFAULT_HTML > /dev/null
    sudo sed -i '/<\/body>/i <h1>Site usurpé<\/h1>' /var/www/html/index.html
    systemctl reload nginx
    echo "Le contenu de la page Nginx a été mis à jour."
    
else
    echo "Erreur lors de la récupération du contenu depuis l'URL."
fi

