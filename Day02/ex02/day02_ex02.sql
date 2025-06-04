-- соединить три разные таблицы причем учесть  null
SELECT
    COALESCE(person.name, '-') AS person_name, --from person
   
    t1.visit_date,-- from person_visits
     
    COALESCE(pizzeria.name, '-') AS pizzeria_name -- from pizzeria
    --таблицы все разные,  но с визитами самая связаная  поэтому возьмем ее
FROM
    (SELECT *  FROM person_visits
    WHERE  visit_date BETWEEN '2022-01-01' AND '2022-01-03' ) t1 
-- получили стобики где строки тольк с датами 1-3 янв.
-- теперь надо приклеить к ним имена и названия пиццерий 
    FUll JOIN pizzeria ON pizzeria.id = t1.pizzeria_id 
    FUll JOIN person ON t1.person_id = person.id
ORDER BY 1,2,3;