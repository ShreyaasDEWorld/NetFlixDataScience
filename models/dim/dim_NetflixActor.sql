-- models/dim/dim_NetflixActor
with actor_data
AS
(
    select show_id,
    unnest(string_to_array(actor_name, ', ')) AS actors
    --from raw."src_NetflixSource"
    from {{ ref('src_NetflixSource')}}
)

select show_id,trim(actors) from actor_data 