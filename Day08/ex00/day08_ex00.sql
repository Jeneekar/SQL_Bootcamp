--1
--  начало транзакции
BEGIN;
-- обновление рейтинга пиццерии
update pizzeria set rating = 5 where name = 'Pizza Hut';
-- проверка что в текущей сессии изменения выполнены
select * from pizzeria;
--2
-- проверка что в текущей сессии изменения не выполнены
select * from pizzeria;

--1
-- сохранение изменений в первом окне
COMMIT;
--2
select * from pizzeria;
