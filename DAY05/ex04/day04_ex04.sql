CREATE VIEW v_symmetric_union AS
WITH R(person_id) AS 
    (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-02'),
S(person_id) AS
    (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-06')
(SELECT * FROM R EXCEPT SELECT * FROM S)
UNION
(SELECT * FROM S EXCEPT SELECT * FROM R);
