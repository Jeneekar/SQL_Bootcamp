SELECT generated_date as missing_date from v_generated_dates
EXCEPT
select visit_date  from person_visits
where visit_date BETWEEn '2022-01-01' and '2022-01-31'
order by missing_date;
