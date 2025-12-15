DROP FUNCTION fnc_persons_female;
DROP FUNCTION fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar DEFAULT 'female') 
    RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar)
    LANGUAGE SQL
AS 
$$ SELECT * FROM person WHERE gender = $1 $$;

SELECT *
FROM fnc_persons('male');

SELECT *
FROM fnc_persons();