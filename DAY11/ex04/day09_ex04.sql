CREATE OR REPLACE FUNCTION fnc_persons_female()
    RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar)
    LANGUAGE SQL
    AS $$ SELECT * FROM v_persons_female $$;

CREATE OR REPLACE FUNCTION fnc_persons_male()
    RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar)
    LANGUAGE SQL
    AS $$ SELECT * FROM v_persons_male $$;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();