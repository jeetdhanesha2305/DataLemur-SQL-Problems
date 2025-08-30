WITH caller_receiver_country AS (
  SELECT 
    I1.country_id AS caller_country, 
    I2.country_id AS receiver_country
  FROM phone_calls P 
  INNER JOIN phone_info I1 
  ON P.caller_id = I1.caller_id 
  INNER JOIN phone_info I2 
  ON P.receiver_id = I2.caller_id 
)

SELECT 
  ROUND(
    
    SUM(
      CASE WHEN caller_country <> receiver_country THEN 1 ELSE 0 END  
    )::DECIMAL*100 / COUNT(*)
  
  , 1) AS international_calls_pct
FROM caller_receiver_country 
