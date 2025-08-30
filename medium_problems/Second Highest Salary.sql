WITH salary_rank AS (
  SELECT 
    *, 
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk 
  FROM employee
)

SELECT 
  salary AS second_highest_salary
FROM salary_rank 
WHERE rnk = 2 
LIMIT 1;