WITH orders AS (
    SELECT gender, pizzeria.name AS pizzeria_name
    FROM 
        person_order 
        JOIN person ON person_order.person_id = person.id
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    )
SELECT orders.pizzeria_name
FROM orders
EXCEPT
    (SELECT orders.pizzeria_name
    FROM orders
    WHERE gender = 'female'
    INTERSECT 
    SELECT orders.pizzeria_name
    FROM orders
    WHERE gender = 'male');