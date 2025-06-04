create view  v_persons_female AS 
select * FROM person
where gender = 'female';

create view  v_persons_male AS 
select * FROM person
where gender = 'male';

-- проверить select * from v_persons_male; select * from v_persons_female

