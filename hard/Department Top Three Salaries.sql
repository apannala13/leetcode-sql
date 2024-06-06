
-- https://leetcode.com/problems/department-top-three-salaries/


with cte as(
    select 
        distinct
        d.name as Department, 
        e.name as Employee, 
        e.salary as Salary, 
        dense_rank() over(partition by d.name order by e.salary desc) as ranked 
    from department d 
    join employee e 
    on d.id = e.departmentId
    group by 1, 2, 3
)
select Department, Employee, Salary from cte 
where ranked <= 3
