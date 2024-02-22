SELECT logiciels.*
FROM logiciels
JOIN machines ON logiciels.id_machine = machines.id
WHERE machines.id = 10;
