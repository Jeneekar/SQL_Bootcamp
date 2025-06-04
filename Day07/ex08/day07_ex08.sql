
select person.address, pizzeria.name, count(*) as count_of_orders from person_order
join person ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
group by pizzeria.name, person.address
order by person.address, pizzeria.name;

