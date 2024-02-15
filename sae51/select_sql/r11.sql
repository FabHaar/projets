SELECT DISTINCT machines.*
FROM machines
JOIN interventions ON machines.id = interventions.id_machine
JOIN techniciens ON interventions.id_technicien = techniciens.id
WHERE techniciens.id = 11;
