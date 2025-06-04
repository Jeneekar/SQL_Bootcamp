-- создать таблицу с жен именами и столцом заказов и вытянуть из них и то и другое название пицц
with temp as (
select person.name, menu.pizza_name  from person
left join person_order ON person.id = person_order.person_id --  имена тех кто сделал заказ
left join menu ON person_order.menu_id=menu.id
where person.gender = 'female')

select name from temp
where pizza_name = 'pepperoni pizza'

intersect -- искать сыр только у тех  кто уже заказал пепперони

select name from temp
where pizza_name = 'cheese pizza'
order by name asc;
