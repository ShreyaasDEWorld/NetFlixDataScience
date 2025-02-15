--Actors which are appears more than 10 times or top to actors 
--I have normalize the table show_id,actor_name.
--then its easy for fetching reports ..

select 
--show_id,
btrim as "Actor_name",
count(*) as "Appeard for more than 10 times"
from 
raw."dim_NetflixActor"
group by btrim
having count(*) >9
order by "Appeared for more than 10 times" desc limit 10