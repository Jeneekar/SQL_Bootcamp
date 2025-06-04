
-- количество заказов 
--средню цену
--максимальную цену
--минимальную цену
-- для каждой пиццерии
with
counter_order as(
  select pizzeria.name, count(*) as counter_order  from pizzeria
  join menu ON pizzeria.id= menu.pizzeria_id
  join person_order ON person_order.menu_id=menu.id
  group by pizzeria.name),
midle_price as (
  select pizzeria.name, round(AVG(price),2)::REAL as average_price  from pizzeria
  join menu ON pizzeria.id= menu.pizzeria_id
  join person_order ON person_order.menu_id=menu.id
  group by pizzeria.name
  ),
max_price as (

  select pizzeria.name, MAX(price) as max_price  from pizzeria
  join menu ON pizzeria.id= menu.pizzeria_id
  join person_order ON person_order.menu_id=menu.id
  group by pizzeria.name
  ),
min_price as (
  select pizzeria.name, MIN(price) as min_price  from pizzeria
  join menu ON pizzeria.id= menu.pizzeria_id
  join person_order ON person_order.menu_id=menu.id
  group by pizzeria.name
  )
  select counter_order.name,
  		 counter_order.counter_order as count_of_orders,
         midle_price.average_price,
         max_price.max_price,
         min_price.min_price
 from counter_order
 join midle_price ON midle_price.name = counter_order.name
 JOIN max_price  ON counter_order.name = max_price.name
 JOIN min_price  ON counter_order.name = min_price.name
 order by name;
