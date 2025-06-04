
/*найти пицерию куда пришел андрей, но заказа так и не сделал*/
with all_visit as (
select pizzeria.name as pizzeria_name FROM pizzeria
join person_visits ON pizzeria.id = person_visits.pizzeria_id
join person ON person_visits.person_id = person.id
where person.name = 'Andrey'
)
, all_order as (
select pizzeria.name as pizzeria_name FROM pizzeria
join menu ON pizzeria.id =menu.pizzeria_id
join person_order ON  person_order.menu_id = menu.id
join person ON person_order.person_id = person.id
where person.name = 'Andrey'
)
SELECT *   from all_visit
except
select *   from all_order
order by 1;
