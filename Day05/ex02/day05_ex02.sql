-- создали индекс
create index idx_person_name ON person(UPPER(name));
-- отключили последовательное сканирование
set enable_seqscan to off;
-- выполнили команду explain ANALYZE
explain ANALYZE
-- создали запрос в том же формате, что и индекс( вместе с UPPER)
select * from person where (UPPER(name)) = 'DENIS';
