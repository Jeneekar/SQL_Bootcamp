-- сначала удаляем старые тригеры
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;
-- удаляем все записи из таблицы 
TRUNCATE TABLE person_audit;
-- создаем функцию с ветвлением
create or replace function fnc_trg_person_audit()
returns trigger as $fnc_trg_person_audit$
BEGIN 
	if (TG_OP = 'INSERT') THEN -- если вставка 
    	insert into person_audit(created, type_event, row_id, name, age, gender, address)
    	values(CURRENT_TIMESTAMP, 'I', new.id, new.name, new.age, new.gender, New.address);
    elseif (TG_OP = 'UPDATE') then -- если обновление
        insert into person_audit(created, type_event, row_id, name, age, gender, address)
    	values(CURRENT_TIMESTAMP, 'U', OLD.id, OLD.name, OLD. age, OLD.gender, OLD.address);
    else  -- если удаление
        insert into person_audit(created, type_event, row_id, name, age, gender, address)
        values(CURRENT_TIMESTAMP, 'D', OLD.id, OLD.name, OLD. age, OLD.gender, OLD.address);
    end if;
    return NULL;
end;
$fnc_trg_person_audit$ LANGUAGE plpgsql;
--тригер
drop trigger if EXISTS trg_person_audit on person;
create trigger trg_person_audit after insert or update or delete on person
for each row
EXECUTE FUNCTION fnc_trg_person_audit();


INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
