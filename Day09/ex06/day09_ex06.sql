
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
   pperson varchar DEFAULT 'Dmitriy',
   pprice numeric default 500,
   pdate date DEFAULT '2022-01-08'
)
RETURNS TABLE (
        name varchar --  название пиццерий 
) AS $fnc_person_visits_and_eats_on_date$
    begin  
    return query --  чтобы вернуть данные
    SELECT p.name as pizzeria_name
    	from menu 
    	 join pizzeria p on p.id = menu.pizzeria_id
    	 join person_visits pv ON menu.pizzeria_id=pv.pizzeria_id
    	 join person on person.id=pv.person_id
        where price<pprice and person.name = pperson and visit_date=pdate;
        end;
        
     $fnc_person_visits_and_eats_on_date$ LANGUAGE plpgsql;
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
