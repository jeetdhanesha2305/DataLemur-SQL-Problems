
SELECT 
  B.age_bucket, 
  ROUND(
    SUM(
      CASE 
        WHEN A.activity_type = 'send' THEN A.time_spent 
        ELSE 0 
      END
    ) * 100 / SUM(A.time_spent), 
  2) AS send_perc, 
  ROUND(
    SUM(
      CASE 
        WHEN A.activity_type = 'open' THEN A.time_spent 
        ELSE 0 
      END
    ) * 100 / SUM(A.time_spent), 
  2) AS open_perc
FROM activities A 
INNER JOIN age_breakdown B 
ON A.user_id = B.user_id 
WHERE A.activity_type IN ('send', 'open')
GROUP BY B.age_bucket