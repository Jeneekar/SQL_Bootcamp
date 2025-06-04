SELECT t1.order_date, t2.name ||' (age:' || t2.age || ')' AS person_information
FROM person_order AS t1
NATURAL JOIN (select name, age, id AS person_id FROM person) AS t2
ORDER BY order_date ASC, person_information ASC;
