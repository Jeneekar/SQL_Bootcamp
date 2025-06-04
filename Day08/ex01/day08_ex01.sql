--1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
--2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- на этом моменте вторая ссесия "зависает" ожидая, пока в первой пропишут комит
--1
COMMIT;
--2
COMMIT;
-- закрыли вторую транзакцию
--1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- в итоге данные записались из второй транзакции, а первая "потерялась"
