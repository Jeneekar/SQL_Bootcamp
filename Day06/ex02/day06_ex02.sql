select person.name,
	   menu.pizza_name,
       menu.price,
       (ROUND(menu.price - menu.price*person_discounts.discount*0.01)) as discount_price,
       pizzeria.name as pizzeria_name
from person_order
join person on person_order.person_id=person.id
join menu on person_order.menu_id=menu.id
join pizzeria ON menu.pizzeria_id=pizzeria.id
join person_discounts ON person_discounts.person_id = person.id
	AND
    person_discounts.pizzeria_id=menu.pizzeria_id
order by person.name, menu.pizza_name;
