/*выберите пиццы с одинаковыми ценой и названиями но из разных пиццерий*/
select
    menu1.pizza_name as pizza_name,
    pizzeria1.name as pizzeria_name1,
    pizzeria2.name as pizzeria_name2,
    menu1.price
from menu as menu1
 join menu as menu2 on menu1.price = menu2.price
 join pizzeria as pizzeria1 on menu1.pizzeria_id = pizzeria1.id
 join pizzeria as pizzeria2 on menu2.pizzeria_id = pizzeria2.id
    where menu1.id > menu2.id
            and menu1.pizza_name = menu2.pizza_name
order by pizza_name;

