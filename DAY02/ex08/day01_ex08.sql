SELECT order_date, Person_table.name || ' (age:' || Person_table.age || ')' AS person_information 
FROM 
    person_order NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS Person_table
ORDER BY order_date ASC, person_information ASC;