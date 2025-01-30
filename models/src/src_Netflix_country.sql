with Netflix_country AS
(
    select  * from 
    dbtraw.netflix_raw
)

select 
show_id,
country
from
Netflix_country
 