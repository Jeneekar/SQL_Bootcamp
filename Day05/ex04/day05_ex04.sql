-- создали индекс
create index idx_menu_unique ON menu(pizzeria_id, pizza_name);
SET enable_seqscan = OFF;
-- вызвали объяснение
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name from menu
where pizzeria_id = 2 and pizza_name LIKE 'ch%'; 
