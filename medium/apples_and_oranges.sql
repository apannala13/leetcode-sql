-- https://leetcode.com/problems/apples-oranges/


with cte as(
    select sale_date, 
    sum(case when fruit = 'apples' then sold_num else 0 end) - sum(case when fruit = 'oranges' then sold_num else 0 end) as diff 
    from sales 
    group by 1
)
select sale_date, diff 
from cte 
