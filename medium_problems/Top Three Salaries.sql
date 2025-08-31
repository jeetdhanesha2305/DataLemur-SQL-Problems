
WITH dept_emp_salary_ranked AS (
  SELECT 
    D.department_name,
    E.name, 
    E.salary,
    DENSE_RANK() OVER(
      PARTITION BY D.department_name 
      ORDER BY E.salary DESC 
    ) AS rnk
  FROM employee E 
  INNER JOIN department D 
  ON E.department_id = D.department_id
)

SELECT 
  department_name, 
  name, 
  salary
FROM dept_emp_salary_ranked 
WHERE rnk <= 3
ORDER BY 
  department_name ASC, 
  salary DESC, 
  name ASC









