CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female')
RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) AS $$ --  выбрать изи мужчин или женщин в зависимости от того чему равен pgender
        (SELECT
                person.id, person.name, person.age, person.gender, person.address
        FROM person
            WHERE person.gender = pgender);
$$ LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
