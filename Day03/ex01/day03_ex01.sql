/*найти позиции в меню которые никто не заказал*/
select menu.id as menu_id from menu
WHERE NOT EXISTS(
select person_order.menu_id from person_order
WHERE person_order.menu_id = menu.id)
order by menu_id;
