SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu as m
JOIN pizzeria as pz ON m.pizzeria_id = pz.id --взяли общее -названия
JOIN person_order as po ON m.id = po.menu_id -- взяли только что заказывали 
JOIN person ON po.person_id = person.id -- взяли имена заказчиков
WHERE person.name = 'Anna' OR person.name = 'Denis'
ORDER BY pizza_name, pizzeria_name
