CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
    RETURNS numeric
    LANGUAGE SQL
AS $$ SELECT MIN(x) FROM unnest(arr) AS x $$;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);