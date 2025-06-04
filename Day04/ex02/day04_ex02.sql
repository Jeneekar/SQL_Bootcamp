
CREATE VIEW v_generated_dates AS
select my_date::DATE
from generate_series('2022-01-01', '2022-01-31', interval '1 day') as my_date
order by 1;

-- проверить select * from v_generated_dates;