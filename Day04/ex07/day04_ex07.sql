insert into person_visits (id, person_id, pizzeria_id, visit_date)
VALUES((select max(id)+1 from person_visits),
       (select id from person where name = 'Dmitriy'),
       (select DISTINCT pizzeria.id from pizzeria 
  		join menu ON pizzeria.id = menu.pizzeria_id
        join mv_dmitriy_visits_and_eats 
        	ON mv_dmitriy_visits_and_eats.pizzeria_name != pizzeria.name
        where menu.price < 800 limit 1),
       '2022-01-08'
       );
--  проверить select * from mv_dmitriy_visits_and_eats -  посмотреть что сейчас пап джонс только 
-- обновили
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
-- проверить что теперь еще одна пиццерия показывается select * from mv_dmitriy_visits_and_eats
