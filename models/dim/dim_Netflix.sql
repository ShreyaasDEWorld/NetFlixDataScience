-- models/dim/dim_Netflix
with Netflixbase as (
    select * 
    ,row_number() over (partition by title,type order by show_id) as rnk
    from  raw."src_NetflixSource" -- Correct reference to the source
   
)

select 
show_id,
type,
title,
TO_DATE(date_added, 'Month DD, YYYY') AS date_added,
release_year,
rating,
case when duration is null then rating else duration end as duration,
description
from Netflixbase
where rnk=1