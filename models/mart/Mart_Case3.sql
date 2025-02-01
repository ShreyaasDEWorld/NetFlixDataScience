--For each year (as per date added to netflix),which director has maximum nmber
--movies released

with cte2 as (
select 
ng.director,
EXTRACT(YEAR from(n.date_added)) as date_year_added,
count(distinct(n.show_id)) as no_of_movies_released
from raw."dim_NetflxDirector" ng
inner join raw."dim_Netflix" n
on ng.show_id=n.show_id
where n.type='Movie'
group by ng.director,n.date_added
),
 cte3 
as 
(
select *,
row_number() over (partition by date_year_added order by  no_of_movies_released desc) as rnk1
from 
cte2
)
select * from cte3 where rnk1=1

order by date_year_added desc,no_of_movies_released desc
