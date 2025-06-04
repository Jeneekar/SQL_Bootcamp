select p.name, COUNT(*) as counter from person_visits pv
join person p ON pv.person_id=p.id
group by p.name
having count(*)>3;
