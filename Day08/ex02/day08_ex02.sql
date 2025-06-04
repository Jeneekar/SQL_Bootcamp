--1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- другой уровень изоляции
--2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
--2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- опять "зависло" ожидая пока завершится в первом окне транзакция
--1
COMMIT;
--2
-- после завершения транзакции в первом окне выведет ошибку
-- "не удалось сериализовать доступ из-за параллельного изменения"
COMMIT;
-- откатился назад - rollback
--1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- данные сохранились те, которые менялись в первой транзакции
