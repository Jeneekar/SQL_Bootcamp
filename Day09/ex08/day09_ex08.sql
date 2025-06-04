
create or replace FUNCTION fnc_fibonacci(pstop integer default 10)
returns table(
  n integer
) as $$ 
WITH RECURSIVE fib(n, fib_value) AS (
    SELECT 0 AS n, 1 as fib_value
    UNION ALL
    SELECT fib_value, fib_value + n
    FROM fib
    WHERE fib_value < pstop
)
SELECT n FROM fib;

$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
