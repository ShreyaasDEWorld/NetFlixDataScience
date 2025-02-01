
with Max_Movie_Tvshows 
as  (
    select
nd.director,
count(distinct case when n.type='Movie' then n.show_id end) as no_of_movies, 
count(distinct case when n.type='TV Show' then n.show_id end) as no_of_Tvshows
from 
raw."dim_Netflix" n
inner join 
raw."dim_NetflxDirector" nd
on n.show_id=nd.show_id
group by nd.director
having count(distinct(n.type)) >1
)

select * from Max_Movie_Tvshows
