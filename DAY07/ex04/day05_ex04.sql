CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan = off; 

-- Checking the index. There should be an error --
EXPLAIN ANALYZE INSERT INTO menu VALUES (100, 1, 'cheese pizza');

-- Checking the index
EXPLAIN ANALYZE SELECT * FROM menu WHERE pizzeria_id = 1;
