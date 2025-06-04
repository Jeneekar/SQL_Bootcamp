
/*найдите пиццерии которые чаще посещали  женщины или мужчины. сохраните 
дубликаты любых операторов SQL с множествами (UNION ALL, EXCEPT ALL, 
INTERSECT ALL). Отсортируйте результат по названию пицерий*/
with woman as ( 
select pizzeria.name as pizzeria_name from pizzeria
join menu ON pizzeria.id = menu.pizzeria_id
join person_order ON person_order.menu_id = menu.id
join person ON person_order.person_id = person.id
where person.gender = 'female'
), man as (
select pizzeria.name as pizzeria_name from pizzeria
join menu ON pizzeria.id = menu.pizzeria_id
join person_order ON person_order.menu_id = menu.id
join person ON person_order.person_id = person.id
where person.gender = 'male'
), visit_woman as(
select * from woman
except 
select * from man
), visit_man as( 
select * from man
except 
select * from woman
)
select * from visit_woman
UNION   
select * from visit_man
order by pizzeria_name;
