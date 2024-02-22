Naviguation : 

* [Racine Port-folio](https://github.com/FabHaar/projets)
* [Pipeline CI CD](https://github.com/FabHaar/projets/tree/main/Pipeline%20CI%20CD)
* [SAE51 projet 1 Mise en place et interrogation de SGBD](https://github.com/FabHaar/projets/tree/main/SAE51%20projet%201%20Mise%20en%20place%20et%20interrogation%20de%20SGBD)
* [SAE51 projet 2 Installation d’un ERP CRM](https://github.com/FabHaar/projets/tree/main/SAE51%20projet%202%20Installation%20d%E2%80%99un%20ERPCRM)
* [SAE52 projet 1 Collecte et traitement des logs de fonctionnement](https://github.com/FabHaar/projets/tree/main/SAE52%20projet%201%20Collecte%20et%20traitement%20des%20logs%20de%20fonctionnement)
* [SAE61 projet 1 Page web d’inscription à un service](https://github.com/FabHaar/projets/tree/main/SAE61%20projet%201%20Page%20web%20d%E2%80%99inscription%20%C3%A0%20un%20service)

# SAE51 - projet 3 Sécurité informatique: Mise en place d’un Firewall et durcissement d’un serveur Web

## 1 Mise en place des prérequis

Pour faire fonctionner le projet, nous avons suivi les instructions disponibles dans le fichier `Note installation env SAE51-3`.

Ces instructions permettent de mettre en place la virtualisation imbriquée si elle est nécessaire, et ensuite indique les étapes à suivre pour la mise en place de vagrant en association avec virtualbox.

## 2 mise en place

Une fois les machines virtuelles fonctionnelles, nous avons activé ufw sur le serveur, par défaut toutes les connexions sont désactivées. Il a donc fallu activer explicitement les connexions à autoriser.

Nous avons aussi mis en place des attaques, certaines que le serveur peut directement contrer ainsi qu'une qui nécessiterait une sandbox avec plus de materiel pour pouvoir l'annuler.

## 3 troubleshooting

Vagrant met parfois très logntemps à démarrer les machines virtuelles et peut considérablement ralentir nos tests.

En manque de théorie sur le sujet, nous avons eu du mal à produire une insfrastructure (sandbox) avec beaucoup d'exemples.