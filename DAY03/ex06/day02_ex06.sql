SELECT DISTINCT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM
    (SELECT id, name FROM person WHERE name IN ('Denis', 'Anna')) AS p
    JOIN person_order ON P.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;