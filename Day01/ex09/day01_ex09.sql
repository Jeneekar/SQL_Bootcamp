
SELECT name FROM pizzeria 
WHERE id NOT IN(SELECT pizzeria_id FROM person_visits);

SELECT name FROM pizzeria AS t1 
WHERE NOT EXISTS(SELECT pizzeria_id FROM person_visits AS t2 WHERE t1.id = t2.pizzeria_id );



