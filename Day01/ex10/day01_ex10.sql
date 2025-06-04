SELECT per.name AS person_name, M.pizza_name, piz.name AS pizzeria_name
FROM person_order AS po
INNER JOIN person AS per ON per.id = po.person_id
INNER JOIN menu AS m ON  M.id =po.menu_id
INNER JOIN pizzeria AS piz ON M.pizzeria_id=piz.id
ORDER BY 1, 2, 3;