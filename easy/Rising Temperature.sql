
--https://leetcode.com/problems/rising-temperature/

with t1 as (
    select 
        a.id 
    from weather a 
    join weather b 
    on datediff(a.recordDate, b.recordDate) = 1
    and a.temperature > b.temperature

)
select * from t1 
