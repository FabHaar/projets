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