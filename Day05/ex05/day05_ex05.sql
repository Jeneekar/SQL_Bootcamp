-- создали индекс с улсовием(частично уникальный)
CREATE UNIQUE INDEX idx_person_order_order_date
ON person_order(person_id, menu_id)
WHERE order_date = '2022-01-01';

SET enable_seqscan = OFF;
explain ANALYZE
SELECT person_id, menu_id FROM person_order
WHERE order_date = '2022-01-01';
