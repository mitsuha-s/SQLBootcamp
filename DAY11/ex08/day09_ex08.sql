CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) 
    RETURNS TABLE (i integer)
    LANGUAGE SQL
AS 
$$
    WITH RECURSIVE fib(a, b) AS (
        SELECT 0, 1
        UNION ALL
        SELECT b, a + b FROM fib WHERE b < pstop)
    SELECT a FROM fib;
$$;

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();