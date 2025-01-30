with Netflix_cast AS
(
    select  * from 
    dbtraw.netflix_raw
)

select 
show_id,
'cast'
from
Netflix_country
 