/*найти пиццерий, в которых никто не делал заказ */
with temp as(
SELECT  menu.pizza_name AS pizza_name,
        menu.price AS price, 
        pizzeria.name AS pizzeria_name,
        menu.id as menu_id
FROM    menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT pizza_name, price, pizzeria_name FROM temp
WHERE menu_id NOT IN(SELECT person_order.menu_id FROM person_order)

ORDER BY 1,2;

