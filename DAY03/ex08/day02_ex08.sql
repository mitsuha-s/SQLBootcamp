SELECT DISTINCT person.name AS name
FROM
    person
    JOIN person_order ON person_order.person_id = person.id 
    JOIN (SELECT * FROM menu WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')) AS pizzas ON pizzas.id = person_order.menu_id
WHERE person.gender = 'male' AND person.address IN ('Moscow', 'Samara')
ORDER BY name DESC;
