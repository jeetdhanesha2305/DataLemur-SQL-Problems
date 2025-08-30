
WITH users_june_july_2022 AS (
  SELECT DISTINCT(user_id) AS user_id
  FROM user_actions 
  WHERE 
    EXTRACT(MONTH FROM event_date) = 6 AND 
    EXTRACT(YEAR FROM event_date) = 2022
  UNION ALL 
  SELECT DISTINCT(user_id) AS user_id
  FROM user_actions 
  WHERE EXTRACT(MONTH FROM event_date) = 7 AND 
    EXTRACT(YEAR FROM event_date) = 2022
)

SELECT 
  7 AS month, 
  COUNT(*) AS monthly_active_users
FROM (

  SELECT 
    user_id 
  FROM users_june_july_2022 
  GROUP BY user_id 
  HAVING COUNT(*) >= 2
) S










