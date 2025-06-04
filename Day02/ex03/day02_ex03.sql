WITH temp AS(
-- создать столбик с своими датами от 1 до 10 янв
SELECT missing_date:: date 
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') as missing_date 
)
SELECT missing_date
FROM temp
-- объединить его с внутренным селектом, где выбираются столбцы где 1 и 2 были с 1 по 10 число 
LEFT JOIN (SELECT * FROM person_visits 
  		   WHERE (person_visits.person_id = '1' OR person_visits.person_id = '2')
		   AND (person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-10')
) AS t1
-- объединятся на условии чтобы дата из моего столбца была равна дате из столбца внутренного селекта

    ON  (missing_date = t1.visit_date)
-- где дата получилась null
	WHERE visit_date is null
ORDER BY missing_date asc;
