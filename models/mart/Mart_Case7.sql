
--Last 10 years movies relase for salmankhan
select 
na.actorname,
n.title,
n.release_year
from raw."dim_Netflix" n
left join raw."dim_NetflixActor" na
on n.show_id=na.show_id
WHERE LOWER(ActorName) LIKE '%salman khan%'
and n.release_year <= EXTRACT (year from current_date)-10
order by n.release_year desc