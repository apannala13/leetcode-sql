with t1 as(
    select 
        user_id, 
        to_char(timestamp, 'YYYY-MM-DD') as date, 
        max(timestamp) as min_date
    from facebook_web_log
    where action = 'page_load'
    group by 1, 2
), 
t2 as(
    select 
        user_id, 
        to_char(timestamp, 'YYYY-MM-DD') as date, 
        min(timestamp) as min_date
    from facebook_web_log
    where action = 'page_exit'
    group by 1, 2
)

select 
    t1.user_id, 
    avg(t2.min_date - t1.min_date) as session_time
from t1 
join t2 
on t1.user_id = t2.user_id
and t1.date = t2.date
group by 1
