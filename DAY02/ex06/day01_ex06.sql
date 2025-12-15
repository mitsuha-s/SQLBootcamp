SELECT action_date, (SELECT name FROM person WHERE T.person_id = person.id) AS person_name
FROM 
    (SELECT order_date AS action_date, person_id FROM person_order
    INTERSECT 
    SELECT visit_date, person_id FROM person_visits) as T
ORDER BY action_date ASC, person_name DESC;

-- With JOIN --
SELECT action_date, name AS person_name
FROM
    (SELECT order_date AS action_date, person_id FROM person_order
    INTERSECT 
    SELECT visit_date, person_id FROM person_visits) AS T INNER JOIN person
    ON T.person_id = person.id
ORDER BY action_date ASC, person_name DESC;