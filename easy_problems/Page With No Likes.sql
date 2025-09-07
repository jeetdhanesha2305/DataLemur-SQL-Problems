
SELECT 
  p.page_id
FROM pages P 
LEFT JOIN page_likes L 
ON p.page_id = L.page_id 
WHERE L.user_id IS NULL 
ORDER BY page_id ASC