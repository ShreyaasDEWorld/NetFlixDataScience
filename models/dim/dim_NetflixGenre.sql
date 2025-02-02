-- models/dim/dim_NetflixGenre
with listed_data 
AS
(
    select show_id,
    unnest(string_to_array(listed_in, ', ')) AS listed_in
    --from raw."src_NetflixSource"
    from {{ ref('src_NetflixSource')}}

)

select show_id,
trim(listed_in) as genre 
 from listed_data 