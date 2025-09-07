
WITH user_tweet_counts_2022 AS (
  SELECT 
    user_id, 
    COUNT(*) AS tweet_counts 
  FROM tweets 
  WHERE EXTRACT(YEAR FROM tweet_date) = 2022 
  GROUP BY user_id
)

SELECT 
  tweet_counts AS tweet_bucket, 
  COUNT(*) AS users_num
FROM user_tweet_counts_2022
GROUP BY tweet_counts 
ORDER BY tweet_bucket ASC
