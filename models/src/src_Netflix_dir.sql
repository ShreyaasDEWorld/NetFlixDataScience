with Netflix_dir AS
(
    select  * from 
    dbtraw.netflix_raw
)

select 
show_id,
director 
from
Netflix_dir
 