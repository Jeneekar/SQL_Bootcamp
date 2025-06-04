-- эта команда "заставляет" sql использовать ранее созданные индексы
-- без нее проводится так называемое последовательное сканирование
SET enable_seqscan TO OFF;
-- сам запрос:
EXPLAIN ANALYZE
select menu.pizza_name, pizzeria.name from menu
join pizzeria ON menu.pizzeria_id = pizzeria.id;
