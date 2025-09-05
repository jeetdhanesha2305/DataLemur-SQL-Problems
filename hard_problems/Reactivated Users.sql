WITH user_login_months AS (
  SELECT 
    user_id,
    EXTRACT(MONTH FROM login_date) AS curr_login_mth,
    EXTRACT( MONTH FROM LAG(login_date) OVER(
      PARTITION BY user_id 
      ORDER BY login_date ASC
    )) AS prev_login_mth
  FROM user_logins 
) 

SELECT 
  curr_login_mth AS mth, 
  COUNT(user_id) AS reactivated_users
FROM user_login_months 
WHERE 
  prev_login_mth < curr_login_mth - 1 OR 
  prev_login_mth IS NULL 
GROUP BY curr_login_mth
ORDER BY mth ASC