WITH num_users_cum AS 
(
  SELECT 
    *, 
    SUM(num_users) OVER(
      ORDER BY searches 
    ) AS cum_users
  FROM search_frequency 
)

SELECT 
  ROUND(
    ( (
        SELECT MIN(searches) 
        FROM num_users_cum 
        WHERE cum_users >= (
          SELECT (SUM(num_users) / 2 ) AS val 
          FROM search_frequency 
        )
      ) + (
        SELECT MIN(searches) 
        FROM num_users_cum 
        WHERE cum_users >= (
          SELECT (SUM(num_users) / 2 )+1 AS val 
          FROM search_frequency 
        )
      
      ) )::DECIMAL / 2 
  , 1) AS median
