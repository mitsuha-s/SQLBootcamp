-- Analyze query without using an index --
EXPLAIN ANALYZE SELECT pizza_name, name AS pizzeria_name
FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;

-- Forced disabling of seqscan in the current session --
SET enable_seqscan = off;

-- Analyze query with using an index --
EXPLAIN ANALYZE SELECT pizza_name, name AS pizzeria_name
FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;
