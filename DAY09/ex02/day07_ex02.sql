(SELECT name, COUNT(*) AS count, 'visit' AS action_type 
FROM
    pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
GROUP BY name
ORDER BY count DESC
LIMIT 3)
UNION ALL
(SELECT name, COUNT(*) AS count, 'order' AS action_type
FROM
    pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_order ON menu.id = person_order.menu_id
GROUP BY name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type, count DESC;
