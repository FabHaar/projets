SELECT DISTINCT machines.*
FROM machines
JOIN interventions ON machines.id = interventions.id_machine
WHERE interventions.date_intervention BETWEEN '2021-10-10' AND '2021-12-10';
