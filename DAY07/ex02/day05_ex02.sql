-- Creating an index --
CREATE INDEX idx_person_name ON person (upper(name));

-- Analyze query without using an index --
EXPLAIN ANALYZE SELECT name FROM person WHERE upper(name) = 'PETER';

-- Forced disabling of seqscan in the current session --
SET enable_seqscan = off;

-- Analyze query with using an index --
EXPLAIN ANALYZE SELECT name FROM person WHERE upper(name) = 'PETER';
