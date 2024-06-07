-- https://leetcode.com/problems/average-time-of-process-per-machine/


with cte as(
    select 
        machine_id, 
        round(avg(case when activity_type = 'end' then timestamp end) - avg(case when activity_type = 'start' then timestamp end), 3) as processing_time
    from Activity
    group by 1
        
    


)
select * from cte 
