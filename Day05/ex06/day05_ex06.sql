-- создали индекс для рейтинга
CREATE INDEX idx_1 ON pizzeria(rating);
SET enable_seqscan TO OFF;
-- проверили сколько времени занимает с индексом
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

-- удалили индекс
DROP INDEX idx_1;
-- проверили время работы без него 
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
