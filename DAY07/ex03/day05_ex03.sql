-- Creating an index --
CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id) INCLUDE (order_date);

-- Analyze query without using an index --
EXPLAIN ANALYZE SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;

-- Forced disabling of seqscan in the current session --
SET enable_seqscan = off;

-- Analyze query with using an index --
EXPLAIN ANALYZE SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;
