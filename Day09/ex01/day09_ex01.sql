create or replace function fnc_trg_person_update_audit()
 returns trigger as $fnc_trg_person_update_audit$
 BEGIN
 	insert into person_audit(created, type_event, row_id, name, age, gender, address)
    values(CURRENT_TIMESTAMP, 'U', OLD.id, OLD.name, OLD. age, OLD.gender, OLD.address);
    return null;
 end;
 $fnc_trg_person_update_audit$ LANGUAGE plpgsql;
 drop trigger if exists trg_person_update_audit on person;
 create TRIGGER trg_person_update_audit AFTER UPDATE on person
 	for each ROW
    EXECUTE FUNCTION fnc_trg_person_update_audit();
 UPDATE person SET name = 'Bulat' WHERE id = 10;
 UPDATE person SET name = 'Damir' WHERE id = 10;
--  проверка  select * from person_audit;


