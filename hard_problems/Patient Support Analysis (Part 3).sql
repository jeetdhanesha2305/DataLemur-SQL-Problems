WITH days_btwn_calls AS (
  SELECT 
    policy_holder_id,
    EXTRACT(DAY FROM (
      LEAD(call_date) OVER(
        PARTITION BY policy_holder_id 
        ORDER BY call_date ASC 
      )- call_date
    )) AS days_btwn
  FROM callers 
) 

SELECT 
  COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM days_btwn_calls 
WHERE days_btwn < 7