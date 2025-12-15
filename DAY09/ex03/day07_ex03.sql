SELECT name, SUM(count) AS total_count
FROM 
    (SELECT name, COUNT(*) AS count
    FROM
        pizzeria
        JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY name
    UNION ALL
    SELECT name, COUNT(*) AS count
    FROM
        pizzeria
        JOIN menu ON pizzeria.id = menu.pizzeria_id
        JOIN person_order ON menu.id = person_order.menu_id
    GROUP BY name)
GROUP BY name
ORDER BY total_count DESC, name ASC;
