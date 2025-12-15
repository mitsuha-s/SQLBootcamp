INSERT INTO person_discounts
(SELECT ROW_NUMBER() OVER() AS id,
    person_id,
    pizzeria_id,
    CASE
        amount
        WHEN 1 THEN 10.5
        WHEN 2 THEN 22
        ELSE 30
    END
FROM (
        SELECT person_id,
            pizzeria_id,
            COUNT(*) AS amount
        FROM person_order
            JOIN menu ON person_order.menu_id = menu.id
            JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        GROUP BY person_id,
            pizzeria_id
    ));