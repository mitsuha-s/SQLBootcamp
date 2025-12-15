SELECT *, (formula > average)::text AS comparison
FROM
    (SELECT 
        address, 
        ROUND(MAX(age) - (MIN(AGE)::numeric / MAX(AGE)), 2) AS formula, 
        ROUND(AVG(age), 2) AS average
    FROM person
    GROUP BY address)
ORDER BY address;