
drop TRIGGER if EXISTS trg_person_delete_audit on person;
 create or replace function fnc_trg_person_delete_audit() 
 returns trigger as $fnc_trg_person_delete_audit$
 BEGIN
 	insert into person_audit(created, type_event, row_id, name, age, gender, address)
    values(CURRENT_TIMESTAMP, 'D', OLD.id, OLD.name, OLD. age, OLD.gender, OLD.address);
    return null;
 end;
 $fnc_trg_person_delete_audit$ LANGUAGE plpgsql;
 
 create TRIGGER trg_person_delete_audit AFTER DELETE on person
 	for each ROW
    EXECUTE FUNCTION fnc_trg_person_delete_audit();
    
    DELETE FROM person WHERE id = 10;
