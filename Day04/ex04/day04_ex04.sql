
--(R-S)U(S-R)
--R-S включается в себя строки из первой без строк из второй
create VIEW v_symmetric_union as(
with R as (
	select * FROM person_visits
  	where visit_date = '2022-01-02' 
), S AS (
	select * FROM person_visits
  	where visit_date = '2022-01-06'
), R_S AS (
SELECt * from R
EXCEPT
SELECT * from S
), S_R as(
select * from S
EXCEPT
SELECT * from R
)
select person_id from R_S
union 
SELECT person_id from S_R
order by person_id
  );
 --  проверить  select * from v_symmetric_union;