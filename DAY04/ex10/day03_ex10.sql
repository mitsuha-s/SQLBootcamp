INSERT INTO person_order
SELECT (SELECT MAX(id) FROM person_order) + ROW_NUMBER() OVER (), *
FROM
    (VALUES
    ((SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM menu WHERE pizza_name = 'Sicilian pizza'), 
    '2022-02-24'::date), 
    ((SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM menu WHERE pizza_name = 'Sicilian pizza'), 
    '2022-02-24'::date));