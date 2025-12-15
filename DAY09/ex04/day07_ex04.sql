SELECT name, COUNT(*) AS count_of_visits
FROM
    person
    JOIN person_visits ON person_visits.person_id = person.id
GROUP BY 1
HAVING COUNT(*) > 3;