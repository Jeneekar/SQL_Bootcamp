--  посчитать количество посещений по каждому ресторану
-- посчитать количество заказов в каждом ресторане
-- объединитьperson_order

with visits as (
   SELECT pizzeria.name as pizzeria_name, COUNT(*) as counter from pizzeria
   join person_visits ON pizzeria.id = person_visits.pizzeria_id
   group by pizzeria.name
   order by counter desc
   ),
  orders as (
   SELECT pizzeria.name as pizzeria_name, COUNT(*) as counter from pizzeria
   join menu ON pizzeria.id = menu.pizzeria_id
   Join person_order ON menu.id = person_order.menu_id
   group by pizzeria.name order by counter desc
   ),
  unions as (
  select visits.pizzeria_name ,  COALESCE(visits.counter, 0) AS visit_count,
        COALESCE(orders.counter, 0) AS order_count
    FROM visits
  full join orders ON visits.pizzeria_name = orders.pizzeria_name
  )
    select pizzeria.name,
    COALESCE(unions.visit_count, 0) + COALESCE(unions.order_count, 0) AS total_count
    from pizzeria
    full join unions ON pizzeria.name = unions.pizzeria_name
    ORDER BY total_count DESC, name;
