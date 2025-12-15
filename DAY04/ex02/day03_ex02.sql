SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM
    (SELECT id FROM menu
    EXCEPT 
    SELECT DISTINCT menu_id FROM person_order) AS unorder
    NATURAL JOIN menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;