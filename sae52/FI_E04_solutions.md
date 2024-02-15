SAE52 - Présentation de solution de collecte et de traitement des logs de fonctionnement
=
#### fait par Haar Fabien et Sofianos Lucas
groupe FI
<div align="right">le 28/09/2023 </div>

### **Résumé**
Ce document de synthèse présente des solutions libres permettant la collecte, la centralisation et la présentation des logs. Notamment leurs points-clés, avantages et inconvénients.
Il se compose de la présentation de 3 solutions différentes : 
 
#### **I. GoAccess**
#### **II. Fluentd**
#### **III. Lnav**
<br>

*********************
I. GoAccess
-

[GoAccess][1], solution open source, est un analyseur de log Web en temps réel, ainsi qu'une visionneuse interactive qui s'exécute dans un terminal sur les systèmes *nix ou via votre navigateur. Il fournit des statistiques HTTP rapides et précieuses aux administrateurs système qui ont besoin d'un rapport visuel du serveur à la volée.

### Features

Cette solution propose différentes `fonctionnalités` :

 - Entièrement en temps réel
 - Compatible avec presque tous les formats de journaux Web
 - Un suivi du temps de réponse de l'application
 - Un traitement de journaux incrémentiel
 - Requiert une seule dépendance (ncurses)
 - Configuration minimale requise
 - Une vue sur les visiteurs
 - Une métriques par hôte virtuel (repérer les hôtes/bots agressifs)
 - Un panel de couleurs personnalisable

### Dashboard

Cette solution met en avant divers information sur un `tableau de bord` :

 - Statistique général (résumé en nombre)
 - Visiteur unique
 - Fichiers demandés
 - Fichiers statiques demandés
 - 404 or Not Found
 - Hôtes
 - Systèmes d'exploitation
 - Navigateur
 - Heure de visite
 - Hôtes virtuel
 - URL de référence
 - Site de référence
 - Expressions-clés
 - Geo localisation
 - Code de status HTTP
 - ASN
 - Utilisateur distant (authentification HTTP)
 - État du cache
 - Type MIME
 - Paramètres de cryptage


### Communauté

> **GitHub** : [répertoire Github du projet][2]

### Avantages et Inconvénients

Présentation du comparatif de points positifs et négatifs de la solution :

| Avantages  | Inconvénients   |
| ------- | -------- |
| Un tableau de bord sur un terminal, plus léger qu'une autre solution graphique   | Esthétiquement et ergonomiquement repoussant pour les utilisateurs normaux sous forme de terminal, le format HTML est meilleur sur ces points   |
|  Dashboard personnalisable  | Restrain sur le formatage des logs de type HTTP    |
| Plusieurs types de formatage de logs prédéfinie, pour une facilité d'utilisation accrue   |
| Installation rapide, légère et compatible avec de nombreux supports   |
| Lié a la communauté Github, permet un support question / aide et de patch régulier  |
| Différents types de format d'export des logs après mise en forme   | 



### Facilité d'utilisation

Pour un utilisateur normal le logiciel n'est pas forcément adapté, mais pour un administrateur système qui as besoin d'un retour visuel d'analyse de logs de son serveur, ce logiciel est parfaitement adapté.

#### Note final : 4/5

*********************
II. Fluentd
-

[Fluentd][3], solution open source, est une solution de centralisation de logs permettant de combiner plusieurs types de logs à traiter, puis rediriger par Fluentd vers leur traitement respectif (solution supplémentaire): analyse, alerte, archive...

La solution Fluentd permet d'embarquer de nombreux plug-in de source ou de sortie.

Il existe une version avec une interface utilisateur (UI) s'appelant **fluentd-ui** ainsi qu'une interface utilisateur d'entreprise avec **Calyptia**.
### Features

Cette solution propose différentes `fonctionnalités` :

 - Journalisation unifiée avec JSON
 - Architecture modulaire
 - Ressources minimales requises
 - Une solution basé sur la fiabilité

### Dashboard

Cette solution ne possède pas de dashboard natif, de nombreuses solutions/plug-ins permettent d'avoir un tableau de bord approprié a vos besoins.

### Communautés

> [Forum][4]

> [Liste de diffusion][5]

>[Traqueur d'incidents][6] (Github)

>[Code source][7] (Github)

>[Slack][8]

>[Stack Overflow][9]

### Associée

Entreprise lié au service Fluentd :
> Calyptia

>ClearCode

>ITOCHU Techno-Solutions America, Inc.

>Sage Infrastructure Solutions Group Inc.

Utilisé par : 
> Atlassian

>Pits

>AWS

>Change.org

>Microsoft

>NAMCO BANDAI Studios Inc.

>Nintendo

>PPTV.com

>Et de nombreux autres...

### Avantages et Inconvénients

Présentation du comparatif de points positifs et négatifs de la solution :

| Avantages  | Inconvénients   |
| ------- | -------- |
| Compatible avec tout types de logs   | Fastidueux a mettre en place car la solution ne se suffit pas a elle même, elle sert à la centralisation   |
| Compatible avec un grand nombre de solution externe ayant besoin d'une centralisation   | Ne convient pas au architecture simple    |
| Simple et facile mais flexible   |
| Fiabilité et performances prouvées   |
| Grande communauté   |
| Atténue les risques lié au mauvais type de donnée affecter au sein de l'infrastructure de log, et permet une infrastruture de log plus clair et lisible   |

### Facilité d'utilisation

Elle remplie son rôle mais ne convient pas en tant que solution simple pour une architecture simple, par contre FLuentd convient a une architecture de grande envergure, tel que les besoins d'une entreprise, ce qui est démontré par ces associés.

#### Note final : 3/5

*********************
III. Lnav
-

[Lnav][10], solution open source, est un visualisateur avancé de fichiers logs pour le terminal, il permet la surveillance et l'analyse des logs. il combine les messages logs suivant leur horodatage en reconnaissant automatiquement les formats de logs indexé.

### Features

Cette solution propose différentes `fonctionnalités` :

- Permet la centralisation des fichiers logs suivant leur horodatage.
- Chaque type d'information possède sa propre couleur pour permettre plus de lisibilité.
- Détection automatique du format de logs
- Filtrage de logs
- Vue chronologique
- Permet d'être lié à une base de données
- Permet une visualisation en direct
- Headless mode : Restreidre l'affichage pour l'utilisation sous forme de commandes ou de script pour l'affichage d'un information plus légère et précise


### Dashboard

Cette solution met en avant divers information sur un `tableau de bord` :

 - Onglet principal Log (suivant l'horodatage) :
Les erreurs seront affichées en rouge 
Les avertissements en jaune 
Les résultats de recherche seront en vidéo inversée 
Diverses couleurs seront utilisées pour mettre en évidence : les adresses IP, les mots-clés SQL, les balises XML, les numéros de fichier et de ligne dans les traces Java, et les chaînes de caractères entre guillemets
Les "identificateurs" dans les messages se verront attribuer aléatoirement des couleurs en fonction de leur contenu
 - Onglet BD, une vue sur la base de donnée
 - Onglet aide
 - Onglet histogramme
 - Onglet "Pretty", un possible export de mise en forme des logs sous différents format
 - Onglet shémas
 - Onglet spectrogram

### Communauté

> Github : [Projet][11] &amp; [Discussions][12]

> X : [Profil][13]

> Discord : [Server][14]

### Avantages et Inconvénient

Présentation du comparatif de points positifs et négatifs de la solution :

| Avantages  | Inconvénients   |
| ------- | -------- |
| Facile à mettre en place  | Lecture des informations difficile  |
| Ne nécessecite pas de configuration une fois installé    | Manque de personalisation    |
| Filtre les informations   | Gros problème d'ergonomie |
| Convient pour une utilisation simple    | Ne convient pas pour une utilisation à grande échelle |

### Facilité d'utilisation

La solution Lnav permet une installation légère et facile d'accès, avec une prise en main et une interface non ergonomique. De plus elle n'est pas déployable pour une utilisation a grande échelle.

#### Note final : 2/5


  [1]: https://goaccess.io/
  [2]: https://github.com/allinurl/goaccess
  [3]: https://www.fluentd.org/
  [4]: https://github.com/fluent/fluentd/discussions
  [5]: https://groups.google.com/g/fluentd
  [6]: https://github.com/fluent/fluentd/issues
  [7]: https://github.com/fluent/fluentd
  [8]: https://launchpass.com/fluent-all
  [9]: https://stackoverflow.com/questions/tagged/fluentd
  [10]: https://lnav.org/
  [11]: https://github.com/tstack/lnav/lnav.org/
  [12]: https://github.com/tstack/lnav/discussions
  [13]: https://twitter.com/lnavapp
  [14]: https://discord.com/invite/erBPnKwz7R