WITH user_shopping_days AS (
  SELECT
    *, 
    DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date::DATE ASC) rnk
  FROM transactions 
) 

SELECT 
  user_id 
FROM user_shopping_days 
WHERE rnk = 3