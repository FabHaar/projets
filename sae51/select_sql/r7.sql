SELECT logiciels.*
FROM logiciels
JOIN machines ON logiciels.id_machine = machines.id
JOIN utilisateurs ON machines.id_utilisateur = utilisateurs.id
WHERE utilisateurs.nom = 'Duchmoll';
