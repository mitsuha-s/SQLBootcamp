--  version 01 --
SELECT pizzeria.name
FROM 
    person_visits 
    JOIN person ON person_visits.person_id = person.id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name 
HAVING COUNT(CASE gender WHEN 'female' THEN 1 END) != COUNT(CASE gender WHEN 'male' THEN 1 END) 
ORDER BY pizzeria.name;

-- version 02 --
WITH equale_visits(pizzeria_name) AS
    (SELECT pizzeria.name, COUNT(*)
    FROM 
        person_visits 
        JOIN person ON person_visits.person_id = person.id
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE gender = 'female'
    GROUP BY pizzeria.name
    INTERSECT ALL
    SELECT pizzeria.name, COUNT(*)
    FROM 
        person_visits 
        JOIN person ON person_visits.person_id = person.id
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE gender = 'male'
    GROUP BY pizzeria.name)
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM 
    person_visits JOIN pizzeria ON pizzeria_id = pizzeria.id
EXCEPT ALL 
SELECT equale_visits.pizzeria_name
FROM equale_visits
ORDER BY pizzeria_name;


