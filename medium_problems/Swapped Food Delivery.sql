
SELECT 
  CASE 
    WHEN order_id % 2 = 0
      THEN order_id - 1 
    WHEN order_id % 2 = 1 AND order_id = (
      SELECT MAX(order_id) FROM orders 
    )
      THEN order_id
    ELSE 
      order_id + 1
  END
  AS corrected_order_id, 
  item
FROM orders 
ORDER BY corrected_order_id ASC