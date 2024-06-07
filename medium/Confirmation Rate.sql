
-- https://leetcode.com/problems/confirmation-rate/

with cte as(
    select 
        s.user_id,
        round(sum(case when action = 'confirmed' then 1 else 0 end)/count(s.user_id), 2) as confirmation_rate 
    from signups s
    left join confirmations c 
    on s.user_id = c.user_id
    group by 1
)
select * from cte 
