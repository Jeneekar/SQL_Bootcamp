
create table person_discounts
( ID BIGINT PRIMARY KEY ,
 person_id BIGINT,
 pizzeria_id BIGINT,
 discount numeric,
 -- ограничение для поддержки целостности данных,
 -- чтобы нельзя было вписать в столбец данные, не существующие в родительской таблице
 CONSTRAINT fk_person_discounts_person_id Foreign Key (person_id) REFERENCES person(id),
 CONSTRAINT fk_person_discounts_pizzeria_id Foreign Key (pizzeria_id) REFERENCES pizzeria(id)
);
