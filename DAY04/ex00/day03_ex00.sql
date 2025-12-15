SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM 
    (SELECT * FROM person_visits WHERE person_id = (SELECT id FROM person WHERE name = 'Kate')) AS pv
    JOIN menu ON pv.pizzeria_id = menu.pizzeria_id
    JOIN pizzeria ON pizzeria.id  = menu.pizzeria_id
WHERE price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;