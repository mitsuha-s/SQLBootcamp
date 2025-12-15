INSERT INTO person_order
SELECT *
FROM
    (SELECT generate_series((SELECT MAX(id) FROM person_order) + 1, (SELECT COUNT(*) FROM person) + (SELECT MAX(id) FROM person_order)), generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person))), 
    (SELECT (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25'::date);