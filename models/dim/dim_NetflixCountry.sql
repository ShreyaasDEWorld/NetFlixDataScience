-- models/dim/dim_NetflixCountry

with country_data 
AS
(
    select show_id,
    unnest(string_to_array(country, ', ')) AS country
    --from raw."src_NetflixSource"
    from {{ ref('src_NetflixSource')}}

)

select show_id,
trim(country) as country
 from country_data 