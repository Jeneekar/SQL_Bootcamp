
insert into person_discounts(id, person_id, pizzeria_id, discount)
SELECT
	ROW_NUMBER( ) over ( ) as id, --  сгенерировали номера id-шников для этой таблицы
    person_order.person_id,
    menu.pizzeria_id,
   -- скидка рассчитывается по разному
   /* псевдо код с ветвлением поэтому используем  case
   if “amount of orders” = 1 then
   “discount” = 10.5
   else if “amount of orders” = 2 then
   “discount” = 22
   else  “discount” = 30
   */
   case when count(*) = 1 then 10.5
   		 when count(*) = 2 then 22.0
         else 30
   end discount
from person_order
join menu ON person_order.menu_id=menu.id -- чтобы взять номер пиццерии

GROUP BY -- чтобыы case работал нужно сгруппировать данные
    person_order.person_id,
    menu.pizzeria_id

order by person_order.person_id;

-- Проверяем заполнение SELECT * FROM person_discounts;
