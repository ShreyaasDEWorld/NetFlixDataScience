with Netflix_listed as (
    select * from dbtraw.netflix_raw
    )

select 
show_id,
listed_in
 from Netflix_listed
