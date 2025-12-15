CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 
WITH Dmitriy_visits AS
(
    SELECT * FROM person_visits
    WHERE 
        person_id = (SELECT id FROM person WHERE name = 'Dmitriy') AND 
        visit_date = '2022-01-08'
)
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM
    Dmitriy_visits
    JOIN pizzeria ON Dmitriy_visits.pizzeria_id = pizzeria.id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE menu.price < 800;
