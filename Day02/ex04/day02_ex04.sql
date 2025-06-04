
SELECT 
    t1.pizza_name, 
    t2.name AS pizzeria_name,
    t1.price
FROM menu t1
LEFT JOIN pizzeria t2 ON t2.id = t1.pizzeria_id 
WHERE 
    t1.pizza_name LIKE 'mushroom%' OR t1.pizza_name LIKE 'pepperoni%'
ORDER BY t1.pizza_name, pizzeria_name;


