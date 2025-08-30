
SELECT 
  ROUND(
    SUM(
      CASE 
        WHEN call_category = 'n/a' 
          THEN 1 
        WHEN call_category = '' 
          THEN 1
        WHEN call_category IS NULL
          THEN 1
        ELSE 0 END 
    )::DECIMAL*100 / COUNT(*)
    , 1) AS uncategorised_call_pct
FROM callers 