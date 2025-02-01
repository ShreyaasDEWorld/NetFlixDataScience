-- models/src/src_NetflixBase.sql
with Netflixbase as (
    select * 
    ,row_number() over (partition by title,type order by show_id) as rn
    from  dbtraw."Netflix_raw" -- Correct reference to the source
   
)

select * 
from Netflixbase
where rn=1


