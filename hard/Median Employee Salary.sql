-- https://leetcode.com/problems/median-employee-salary/description/


with t1 as(
    select 
        id, 
        company, 
        salary, 
        row_number() over(partition by company order by salary) as ranked 
    from Employee
), 
t2 as(
    select 
        company, 
        count(distinct id) as cnt 
    from Employee
    group by 1
)

select 
    t1.id, t1.company, t1.salary 
from t1 
join t2 
on t1.company = t2.company and 
t1.ranked between
            t2.cnt / 2 and t2.cnt / 2 + 1
