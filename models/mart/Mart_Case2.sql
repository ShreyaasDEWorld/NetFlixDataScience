--Countries which has highest number of comedy movies
with comedy_movies_date AS
(select 
nc.country,
count(distinct(ng.show_id)) as no_of_movies
from 
--raw."dim_NetflixCountry" nc
{{ ref('dim_NetflixCountry')}} nc 
--inner join raw."dim_NetflixGenre" ng on nc.show_id=ng.show_id 
inner join {{ ref('dim_NetflixGenre')}} ng on nc.show_id=ng.show_id  
--inner join raw."dim_Netflix" n on ng.show_id=n.show_id
inner join {{ ref('dim_Netflix')}} n on ng.show_id=n.show_id
where ng.genre='Comedies' and n.type='Movie'
group by nc.country
--order by no_of_movies desc
limit 2
)
select * 
from
comedy_movies_date 
order by no_of_movies desc
