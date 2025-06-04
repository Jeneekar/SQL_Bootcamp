-- создание таблицы person_audit
create table person_audit (
  created timestamp with time zone not NULL default current_timestamp,
  type_event char(1) not null  default 'I',
  row_id bigint not null,
  name varchar,
  age integer,
  gender varchar,
  address varchar,
  constraint ch_type_event check (type_event IN('I','U','D'))
);

create or REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER as $fnc_trg_person_insert_audit$
BEGIN
	insert into person_audit(created, type_event, row_id, name, age, gender, address)
    values(CURRENT_TIMESTAMP, 'I', new.id, new.name, new.age, new.gender, New.address);
    return NULL;
end;
	$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;
    drop TRIGGER if EXISTS trg_person_insert_audit on person;
    create  trigger trg_person_insert_audit AFTER INSERT ON person
    	FOR each row
        EXECUTE FUNCTION fnc_trg_person_insert_audit();

    insert into person(id, name, age, gender, address)
    VALUES(10, 'Damir', 22, 'male', 'Irkutsk');

-- проверка    select * from person_audit;
