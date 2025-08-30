# DataLemur-SQL-Problems


| Problem Name                     | Problem Url                                                    | Difficulty |
| ---------------------------------- | ---------------------------------------------------------------- | ------------ |
|                                  |                                                                |            |
| User's Third Transaction         | https://datalemur.com/questions/sql-third-transaction          | MEDIUM     |
| Second Highest Salary            | https://datalemur.com/questions/sql-second-highest-salary      | MEDIUM     |
|                                  |                                                                |            |
| Compressed Mode                  | https://datalemur.com/questions/alibaba-compressed-mode        | MEDIUM     |
| Card Launch Success              | https://datalemur.com/questions/card-launch-success            | MEDIUM     |
| International Call Percentage    | https://datalemur.com/questions/international-call-percentage  | MEDIUM     |
| Patient Support Analysis (Part2) | https://datalemur.com/questions/uncategorized-calls-percentage | MEDIUM     |
| Active User Retention            | https://datalemur.com/questions/user-retention                 | HARD       |

with salary_rank as (
select
*,
dense_rank() over(order by salary desc) as rnk
from employee
)

select
salary as second_highest_salary
from salary_rank
where rnk = 2
limit 1;

with salary_rank as (
select
*,
dense_rank() over(order by salary desc) as rnk
from employee
)

select
salary as second_highest_salary
from salary_rank
where rnk = 2
limit 1;

with salary_rank as (
select
*,
dense_rank() over(order by salary desc) as rnk
from employee
)

select
salary as second_highest_salary
from salary_rank
where rnk = 2
limit 1;
