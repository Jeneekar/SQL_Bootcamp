SELECT  t1.order_date, t2.name ||' (age:' || t2.age || ')' AS person_information FROM person_order AS t1 
INNER JOIN person AS t2 ON t1.person_id=t2.id
ORDER BY order_date ASC, person_information ASC; 