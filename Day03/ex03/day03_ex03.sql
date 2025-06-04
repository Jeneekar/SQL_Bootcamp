/*найдите пиццерии которые чаще посещали  женщины или мужчины. сохраните 
дубликаты любых операторов SQL с множествами (UNION ALL, EXCEPT ALL, 
INTERSECT ALL). Отсортируйте результат по названию пицерий*/
with woman as ( --все пиццерии, которые посетили женщины
select pizzeria.name as pizzeria_name from pizzeria
join person_visits ON pizzeria.id=person_visits.pizzeria_id
join person ON person_visits.person_id = person.id
where person.gender = 'female'
), man as ( --все пиццерии, которые посетили мужчины
select pizzeria.name as pizzeria_name from pizzeria
join person_visits ON pizzeria.id=person_visits.pizzeria_id
join person ON person_visits.person_id = person.id
where person.gender = 'male'
), visit_woman as( --все пиццерии, которые посетили женщины исключая те, где могли быть и мужчины
select * from woman
except all 
select * from man
), visit_man as( --все пиццерии, которые посетили мужчины, исключая визиты женщин
select * from man
except all 
select * from woman
)
select * from visit_woman
UNION ALL 
select * from visit_man
order by pizzeria_name;
