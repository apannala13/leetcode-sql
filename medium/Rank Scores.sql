
-- https://leetcode.com/problems/rank-scores/submissions/


with cte as(
    select 
        visited_on, 
        sum(amount) as total 
    from Customer
    group by 1
)
select 
    a.visited_on, 
    a.total as amount, 
    round(avg(b.total), 1) as average_amount
from cte a 
join cte b 
on datediff(a.visited_on, b.visited_on) between 0 and 6 
group by 1, 2
order by 1
