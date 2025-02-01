-- models/dim/dim_NetflixDirector
with director_date 
AS
(
    select show_id,
    unnest(string_to_array(director, ', ')) AS director
    from raw."src_NetflixSource"

)

select show_id,
trim(director) as director
 from director_date