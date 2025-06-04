              
select person.name , count(*) as count_of_visits from person_visits
join person ON person_visits.person_id = person.id
group by person.name
order by count_of_visits desc, person.name ASC
limit 4;
