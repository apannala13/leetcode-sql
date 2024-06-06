--https://leetcode.com/problems/employees-earning-more-than-their-managers/

with cte as(
    select 
        a.name 
    from Employee a 
    join Employee b 
    on a.managerId = b.id 
    where a.salary > b.salary
)
select name as Employee from cte 
