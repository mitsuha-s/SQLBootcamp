CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy', pprice numeric DEFAULT 500, pdate date DEFAULT '2022-01-08')
    RETURNS TABLE (name varchar)
    LANGUAGE SQL
AS 
$$ 
    SELECT DISTINCT pizzeria.name FROM
        person
        JOIN person_visits ON person.id = person_visits.person_id
        JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
        JOIN menu ON menu.pizzeria_id = pizzeria.id
    WHERE person.name = $1 AND visit_date = $3 AND price < $2
$$;

SELECT *  
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *  
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
