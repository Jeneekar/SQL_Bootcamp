--1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--2
BEGIN TRANSACTION ISOLATION LEVEL  REPEATABLE READ;
--1
select  sum(rating) from pizzeria;
--2
insert into pizzeria values (11,'Kazan Pizza 2', 4);
--2
commit;
--1
select sum(rating) from pizzeria;
--1
commit;
--1
select sum(rating) from pizzeria;
--2
select sum(rating) from pizzeria;
