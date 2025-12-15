SELECT d AS missing_date
FROM
    (SELECT visit_date, person_id
    FROM person_visits
    WHERE person_id BETWEEN 1 AND 2)
    RIGHT JOIN (SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date AS d) ON d = visit_date
WHERE person_id IS NULL
ORDER BY missing_date;