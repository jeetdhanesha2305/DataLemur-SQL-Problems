
WITH user_transactions_rank AS (
  SELECT 
    *,
    DENSE_RANK() OVER(
      PARTITION BY user_id 
      ORDER BY transaction_date DESC 
    ) rnk
  FROM user_transactions
)

SELECT 
  transaction_date, 
  user_id, 
  COUNT(*) AS purchase_count 
FROM user_transactions_rank 
WHERE rnk = 1
GROUP BY transaction_date, user_id 
ORDER BY transaction_date, user_id, purchase_count