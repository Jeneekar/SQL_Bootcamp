  -- level количество итераций
 WITH temp AS (
 WITH RECURSIVE roads(last, points, level, cost_sum) AS(
   SELECT point1, ARRAY[point1], 1, 0 FROM ex00 WHERE point1 = 'a'
   UNION  
   SELECT ex00.point2, roads.points || ARRAY[ex00.point2], roads.level+1, roads.cost_sum + ex00.cost  
   FROM roads, ex00 
   
   WHERE ex00.point1 = roads.last -- последний пункт в который приехали равен пункту отправления
   AND level < 5
 )
 SELECT points, cost_sum
 FROM roads
 WHERE level = 5 AND roads.last = 'a' AND 'a' = ANY(points) AND 'b' = ANY(points) AND 'c' = ANY(points) AND 'd' = ANY(points) 
 )
 SELECT cost_sum AS total_cost, points AS  tour 
 FROM temp
 WHERE cost_sum = (SELECT MIN(cost_sum) FROM temp)  OR cost_sum = (select MAX(cost_sum) FROM temp) 
 ORDER BY total_cost, tour;
 