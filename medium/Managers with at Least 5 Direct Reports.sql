-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/


with cte as(
    select e.name 
    from employee e 
    join employee m on e.id = m.managerId
    group by m.managerId    
    having count(m.managerId) >= 5
)
select name from cte 
