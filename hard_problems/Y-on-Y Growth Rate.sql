
WITH product_year_spend AS (
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year, 
    product_id, 
    SUM(spend) AS total_spend 
  FROM user_transactions 
  GROUP BY EXTRACT(YEAR FROM transaction_date), product_id

), product_curr_prev_year_sales AS (
  SELECT 
    year, 
    product_id, 
    total_spend AS curr_year_spend, 
    LAG(total_spend) OVER(
      PARTITION BY product_id 
      ORDER BY year ASC
    ) AS prev_year_spend
  FROM product_year_spend
)

SELECT 
  *, 
  ROUND(
    ( curr_year_spend - prev_year_spend )::DECIMAL 
      / prev_year_spend * 100
    , 2
  )
FROM product_curr_prev_year_sales
