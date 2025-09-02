
SELECT 
  COALESCE(A.user_id, D.user_id) AS user_id, 
  CASE 
    WHEN A.status = 'NEW' AND D.paid IS NOT NULL 
      THEN 'EXISTING' 
    WHEN A.status = 'NEW' AND D.paid IS NULL 
      THEN 'CHURN'
    WHEN A.status = 'EXISTING' AND D.paid IS NOT NULL 
      THEN 'EXISTING' 
    WHEN A.status = 'EXISTING' AND D.paid IS NULL 
      THEN 'CHURN'
    WHEN A.status = 'CHURN' AND D.paid IS NOT NULL 
      THEN 'RESURRECT' 
    WHEN A.status = 'CHURN' AND D.paid IS NULL 
      THEN 'CHURN'
    WHEN A.status = 'RESURRECT' AND D.paid IS NOT NULL 
      THEN 'EXISTING' 
    WHEN A.status = 'RESURRECT' AND D.paid IS NULL 
      THEN 'CHURN'
    WHEN A.status IS NULL AND D.paid IS NOT NULL 
      THEN 'NEW'
    ELSE ''
    END AS new_status
    
FROM advertiser A 
FULL OUTER JOIN daily_pay D 
ON A.user_id = D.user_id
ORDER BY user_id