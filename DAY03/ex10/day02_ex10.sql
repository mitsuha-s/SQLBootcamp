SELECT person.name AS person_name1, p.name AS person_name2, p.address AS common_address
FROM 
    person AS p
    JOIN person ON person.address = p.address AND person.id > p.id
ORDER BY person_name1, person_name2, common_address;