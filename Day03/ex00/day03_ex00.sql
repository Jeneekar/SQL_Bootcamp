/*найти пиццерий, которые посетила кейт и потратила от 800 до 1000 руб*/
SELECT  menu.pizza_name AS pizza_name,
	    menu.price AS price, 
		pizzeria.name AS pizzeria_name,
		person_visits.visit_date AS vizit_date
FROM	menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Kate' AND (menu.price BETWEEN 800 AND 1000)
ORDER BY 1,2,3;

