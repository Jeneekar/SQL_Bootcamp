comment ON table  person_discounts
	IS 'Таблица скидок для каждого клиента с идентификаторами пиццерий, в которых были сделаны заказы, а также с идентификаторами заказчиков'
comment ON column  person_discounts.id
	IS 'Столбец с номерами id строк'
comment ON COLUMN  person_discounts.person_id
	IS 'Столбец с id клиентов'
comment ON COLUMN  person_discounts.pizzeria_id
	IS 'Столбец с id пиццерии, в которых были сделаны заказы соответствующими клиентами'
comment ON COLUMN  person_discounts.discount
	IS 'Столбец процента скидки в зависимости от количества заказов'

--  посмотреть комментарии \d+ имя таблицы
