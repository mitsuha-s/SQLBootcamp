SELECT pizzeria.name AS pizzeria_name
FROM 
    (SELECT * FROM person_visits WHERE person_id = (SELECT id FROM person WHERE name = 'Andrey')) AS andrey_visits
    JOIN pizzeria ON andrey_visits.pizzeria_id = pizzeria.id
EXCEPT 
SELECT pizzeria.name
FROM
    (SELECT * FROM person_order WHERE person_id = (SELECT id FROM person WHERE name = 'Andrey')) AS andrey_orders
    JOIN menu ON menu.id = andrey_orders.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;