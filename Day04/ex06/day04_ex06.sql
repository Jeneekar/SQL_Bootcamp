
create MATERIALIZED VIEW mv_dmitriy_visits_and_eats as(
SELECT pizzeria.name as pizzeria_name FROM pizzeria
left join menu ON menu.pizzeria_id = pizzeria.id
left join person_visits ON pizzeria.id = person_visits.pizzeria_id
left join person ON person_visits.person_id = person_id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price <800
order by pizzeria.name
 );
 
--  проверить select * from mv_dmitriy_visits_and_eats