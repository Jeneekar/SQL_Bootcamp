--  две временные таблицы, отсортировать по номеру id чтобы не было повторов и к одному и тому же
-- не попадало
with temp1 as(
select id as id1, name as person_name1, address as address1 from person
),
temp2 as(
select id as id2,name as person_name2, address as address2 from person
)
select person_name1, person_name2, address1 as common_address from temp1 
join temp2 on address1=address2  and temp1.id1 > temp2.id2
order by person_name1, person_name2, common_address;
