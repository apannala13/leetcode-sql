
-- https://leetcode.com/problems/confirmation-rate/

with cte as(
    select 
        s.user_id, 
        coalesce(round(count(
            case when action = 'confirmed' then 1 end
        )::decimal / count(*), 2), 0) as confirmation_rate
    from Signups s
    left join Confirmations c 
    on s.user_id = c.user_id
    group by 1
)
select * from cte 
