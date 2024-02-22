#!/bin/bash
# Script de test de charge avec Apache Benchmark (ab)

# Ce script utilise Apache Benchmark (ab) pour simuler un test de charge légitime
# sur un serveur distant en envoyant un nombre spécifié de requêtes simultanées.
# pour vérifié l'impact sur les performances du serveur, utiliser la commande "top"

# Paramètres de test
url="http://192.168.1.2/"  # URL du serveur à attaquer
num_requests=20000	   # Nombre total de requêtes à envoyer
concurrency=1000	   # Nombre de connexions simultanées à maintenir

# Exécute le test de charge avec ab
ab -n $num_requests -c $concurrency $url

# -n : Nombre total de requêtes à effectuer pendant le test.
# -c : Nombre de connexions simultanées à maintenir pendant le test.
