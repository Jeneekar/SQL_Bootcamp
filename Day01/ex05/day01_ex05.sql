SELECT per.id "person.id",
per.name "person.name", 
per.age,
per.gender,
per.address, 
pizza.id "pizzaria.id",
pizza.name "pizzeria.name",
pizza.rating "rating"
FROM person AS per, pizzeria AS pizza
ORDER BY per.id, pizza.id;

/*
SELECT * FROM person, pizzeria
ORDER BY person.id, pizzeria.id*/