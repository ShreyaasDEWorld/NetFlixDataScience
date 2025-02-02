--Director who has created both horror and comedy movies 
with Comedie_Horror_dir_date AS
(
    select nd.director
--from raw."dim_NetflxDirector" nd
from {{ ref('dim_NetflxDirector')}} nd
--inner join raw."dim_NetflixGenre" ng 
inner join {{ref('dim_NetflixGenre')}} ng
on nd.show_id=ng.show_id
--inner join raw."dim_Netflix" n
inner join {{ ref('dim_Netflix')}} n 
on nd.show_id=n.show_id
where ng.genre in ('Comedies','Horror Movies') and n.type='Movie'
group by nd.director
having count(distinct (ng.genre))>1
)

select 
* from 
Comedie_Horror_dir_date