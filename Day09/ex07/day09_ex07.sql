--  чтобы найти минимум, заданный массив нужно представить в виде набора строк -  unnest(arr) 
-- variadic - не знаем размер массива, этот "модификатор" который позволяет функции принимать не фиксированное 
-- количество элементов, а любое в виде массива
create or replace FUNCTION func_minimum(VARIADIC arr NUMERIC[])
returns numeric as $func_minimum$ -- вернуть число одно
BEGIN
return(select min(i) from unnest(arr) number(i));
end;
$func_minimum$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
