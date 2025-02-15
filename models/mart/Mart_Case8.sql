--Find contenct which were added last 5 years
select *
from raw."dim_Netflix"
where
release_year > extract(year from current_date)-5