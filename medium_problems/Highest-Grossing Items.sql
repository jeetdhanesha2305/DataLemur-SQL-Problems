
WITH product_category_rankings AS (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_amount_spent, 
    ROW_NUMBER() OVER(
      PARTITION BY category 
      ORDER BY SUM(spend) DESC
    ) AS rnk
  FROM product_spend 
  WHERE YEAR(transaction_date) = '2022' 
  GROUP BY category, product
)

SELECT 
  category, 
  product, 
  total_amount_spent AS total_spend
FROM product_category_rankings
WHERE rnk IN (1, 2)



