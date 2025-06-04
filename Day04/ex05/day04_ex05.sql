CREATE VIEW v_price_with_discount as(
 SELECT person.name, menu.pizza_name, menu.price, ROUND(menu.price - menu.price*0.1) as dicount_price from person
 join person_order ON person_order.person_id = person.id
 join menu ON person_order.menu_id = menu.id
 order by person.name, menu.pizza_name
 );
 