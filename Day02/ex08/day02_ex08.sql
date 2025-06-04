select person.name from person
left join person_order ON person.id = person_order.person_id
left join menu ON person_order.menu_id = menu.id
where person.gender = 'male' AND (person.address = 'Moscow' OR person.address = 'Samara')
AND (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')
ORDER BY name DESC;
