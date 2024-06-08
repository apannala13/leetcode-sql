-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/

with cte as(
    select 
        turn, person_name, weight, 
        sum(weight) over(order by turn asc) as total 
    from queue
    order by 1
)

select 
    person_name 
from cte
where turn = (select max(turn) from cte where total <= 1000)
