
--  посчитать количество посещений по каждому ресторану
-- посчитать количество заказов в каждом ресторане
-- объединитьperson_order
with visits as (
   SELECT pizzeria.name, COUNT(*) as count, 'visit' as action_type from pizzeria
   join person_visits ON pizzeria.id = person_visits.pizzeria_id
   group by pizzeria.name
   order by count desc
   LIMIT 3), 
  orders as (
   SELECT pizzeria.name, COUNT(*) as count, 'order' as action_type from pizzeria
   join menu ON pizzeria.id = menu.pizzeria_id
   Join person_order ON menu.id = person_order.menu_id
   group by pizzeria.name order by count desc
   LIMIT 3),
  unions as (
   select * from visits
   UNION
   select * from orders
   order by action_type asc, count desc)
select * from unions;
