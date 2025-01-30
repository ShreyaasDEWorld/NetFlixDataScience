WITH cte AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY title, type ORDER BY show_id) AS rn
    FROM dbtraw.netflix_raw
)
SELECT show_id, 
       type, 
       title, 
       CAST(date_added AS DATE) AS date_added, 
       release_year,
       rating,
       COALESCE(duration, rating) AS duration,  -- Using COALESCE for handling NULLs
       description
FROM cte