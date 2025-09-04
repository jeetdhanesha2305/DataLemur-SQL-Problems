
WITH transactions_with_time_diff AS (
  SELECT 
    *,
    (
      EXTRACT(EPOCH  FROM 
        T2.transaction_timestamp - T1.transaction_timestamp
      ) / 60 )::INTEGER AS time_diff_mins
  FROM transactions T1 
  INNER JOIN transactions T2 
  ON 
    T1.merchant_id = T2.merchant_id AND 
    T1.credit_card_id = T2.credit_card_id AND 
    T1.amount = T2.amount AND 
    T1.transaction_timestamp < T2.transaction_timestamp
  
)

SELECT 
  COUNT(*) AS payment_count
FROM transactions_with_time_diff 
WHERE time_diff_mins <= 10
  
  

  