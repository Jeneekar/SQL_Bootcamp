--1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--2
BEGIN TRANSACTION ISOLATION LEVEL  REPEATABLE READ;
--1
UPDATE pizzeria set rating =1 where id =1;
--2
UPDATE pizzeria set rating =1 where id =2;
--1
UPDATE pizzeria set rating =5 where id =2;
--2
UPDATE pizzeria set rating =5 where id =1;
-- здесь ошибка о взаимоблокировке
--1
commit;
--2
commit;
-- rollback поскольку внутри транзакции произошла ошибка
