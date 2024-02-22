SELECT utilisateurs.*
FROM utilisateurs
JOIN machines ON utilisateurs.id = machines.id_utilisateur
WHERE machines.marque = 'HP'
