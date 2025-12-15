SELECT women.name AS name
FROM 
    (SELECT * FROM person WHERE gender = 'female') AS women
    JOIN person_order ON person_order.person_id = women.id
    JOIN menu ON menu.id = person_order.menu_id
WHERE menu.pizza_name IN ('cheese pizza', 'pepperoni pizza')
GROUP BY women.name
HAVING COUNT(name) > 1
ORDER BY name;