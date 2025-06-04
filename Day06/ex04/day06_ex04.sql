--Стобец person_id не должен иметь значения NULL (используйте имя ограничения ch_nn_person_id)
ALTER table person_discounts add
	CONSTRAINT ch_nn_person_id check (person_id IS NOT NULL);
--Столбец pizzeria_id не должен иметь значение NULL (используйте имя ограничения ch_nn_pizzeria_id);
alter table person_discounts add
	constraint ch_nn_pizzeria_id check (pizzeria_id IS NOT NULL);
--Столбец скидки не должен иметь значение NULL (используйте имя ограничения ch_nn_discount);
alter table person_discounts add
	constraint ch_nn_discount check (discount IS NOT NULL);
--По умолчанию значение столбца скидки должно быть равно 0 процентов;
alter table person_discounts alter column discount SET default 0;
--Столбец скидки должен содержать значения в диапазоне от 0 до 100 (используйте имя ограничения ch_range_discount).
alter table person_discounts add CONSTRAINT ch_range_discount check (discount between 0 and 100);
