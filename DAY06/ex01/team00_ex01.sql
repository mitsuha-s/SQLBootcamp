WITH result(total_cost, tour) AS (
    WITH RECURSIVE intermediate(total_cost, tour, last_node) AS (
    SELECT 0, ARRAY['a'], 'a'::text

    UNION 

    SELECT total_cost + cost, array_append(tour, point2), point2 
    FROM intermediate JOIN graph ON last_node = point1 AND point2 != ALL(tour))

    SELECT total_cost + cost, array_append(tour, point2)
    FROM 
        intermediate
        JOIN graph ON last_node = point1 AND point2 = 'a'
    WHERE array_length(tour, 1) = 4
)
SELECT * FROM result 
WHERE total_cost = (SELECT MIN(total_cost) FROM result)
	OR total_cost = (SELECT MAX(total_cost) FROM result)
ORDER BY total_cost, tour;