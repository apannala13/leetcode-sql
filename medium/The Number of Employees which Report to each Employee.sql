
-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/

with cte as(
    select 
        a.employee_id, 
        a.name, 
        count(
            case when a.reports_to = b.reports_to then 1 else 0 end
        ) as reports_count, 
        round(avg(b.age), 0) as average_age
    from employees a 
    join employees b 
    on a.employee_id = b.reports_to
    group by 1, 2
    order by 1
)
select * from cte 
