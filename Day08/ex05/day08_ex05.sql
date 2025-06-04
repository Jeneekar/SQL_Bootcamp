--1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--1
select  sum(rating) from pizzeria;
--2
insert into pizzeria values (10,'Kazan Pizza', 5);
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
