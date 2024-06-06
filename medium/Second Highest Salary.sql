
-- https://leetcode.com/problems/second-highest-salary/


--im using max here to catch the 'NULL' edge case. 
with cte as(
    select 
        id,
        max(salary) as salary, 
        dense_rank() over(order by salary desc) as ranked
    from Employee
    group by 1

)
select max(salary) as SecondHighestSalary
from cte 
where ranked = 2
