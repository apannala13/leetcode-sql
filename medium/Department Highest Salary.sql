-- https://leetcode.com/problems/department-highest-salary/submissions/

with cte as(
    select 
        d.name as Department, 
        e.name as Employee, 
        e.salary as Salary, 
        dense_rank() over(partition by d.name order by salary desc) as ranked 
    from Employee e 
    join Department d 
    on e.departmentId = d.id
    group by 1, 2, 3

)
select Department, Employee, Salary
from cte 
where ranked = 1 
