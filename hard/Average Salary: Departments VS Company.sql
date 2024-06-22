-- https://leetcode.com/problems/average-salary-departments-vs-company/

with t1 as(
    select  
        to_char(pay_date, 'YYYY-MM') as pay_month,
        avg(amount) as total_salary
    from salary 
    group by 1
), 
t2 as(
    select  
        to_char(pay_date, 'YYYY-MM') as pay_month, 
        e.department_id, 
        avg(s.amount) as dept_salary
    from employee e join salary s 
    on e.employee_id = s.employee_id
    group by 1, 2
),
t3 as(
    select  
        t1.pay_month, 
        t2.department_id, 
        case when t2.dept_salary > t1.total_salary then 'higher'
            when t1.total_salary > t2.dept_salary then 'lower'
            else 'same' end as comparison
    from t1 
    join t2 
    on t1.pay_month = t2.pay_month 
)
select * from t3 
