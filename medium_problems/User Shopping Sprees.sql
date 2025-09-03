
SELECT 
  DISTINCT(T1.user_id) AS user_id
FROM transactions T1 
INNER JOIN transactions T2 
ON 
  T1.user_id = T2.user_id AND 
  EXTRACT(DAY FROM T2.transaction_date - T1.transaction_date) = 1
INNER JOIN transactions T3 
ON 
  T2.user_id = T3.user_id AND 
  EXTRACT(DAY FROM T3.transaction_date - T2.transaction_date) = 1
ORDER BY T1.user_id