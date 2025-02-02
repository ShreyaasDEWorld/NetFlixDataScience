--what is average duration of movie in each genre?

with average_genre_data as (
   select ng.genre,
round(avg(CAST(REGEXP_REPLACE(duration, 'min', '') AS INTEGER)),2) AS average_genre_duration
--from raw."dim_Netflix" n
from {{ ref('dim_Netflix')}} n 
--inner join raw."dim_NetflixGenre" ng
inner join {{ ref('dim_NetflixGenre')}} ng 
on n.show_id=ng.show_id
where type='Movie'
group by ng.genre
--order by average_genre_duration desc 
)

select *
from average_genre_data
--group by ng.genre
order by average_genre_duration desc
