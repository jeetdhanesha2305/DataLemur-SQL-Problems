WITH user_trans_num AS (
  SELECT 
    *, 
    ROW_NUMBER() OVER(
        PARTITION BY user_id 
        ORDER BY transaction_date ASC
    ) AS trn_num 
  FROM transactions
)

SELECT 
  user_id, 
  spend, 
  transaction_date 
FROM user_trans_num 
WHERE trn_num = 3

