
CREATE SEQUENCE seq_person_discounts START WITH 1; -- создаем последовательность, начиная с 1

ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts'); -- изменяем таблицу с скидками так, чтобы id при новой записи получал номер из последовательности

SELECT setval('seq_person_discounts', (SELECT COUNT(*) + 1 FROM person_discounts)); -- номер задается +1, то есть наложений записей быть не должно
