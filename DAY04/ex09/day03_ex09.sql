INSERT INTO person_visits
SELECT (SELECT MAX(id) FROM person_visits) + ROW_NUMBER() OVER (), *
    FROM 
    (VALUES
    ((SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'), 
    '2022-02-24'::date),
    ((SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'), 
    '2022-02-24'::date));
