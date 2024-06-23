--get the countries with average call durations 
--get the total average call duration 
--filter for countries with > call duration than total

with t1 as(
    select
        caller_id as id, 
        duration
    from calls
    union all 
    select 
        callee_id as id, 
        duration
    from calls
), 
t2 as(
    select 
        avg(duration) as global_duration
    from t1
), 
t3 as(
    select 
        c.name as country, 
        avg(duration) as country_duration
    from 
        person p 
    join country c 
    on substring(p.phone_number, 1, 3) = c.country_code 
    join t1 
        on p.id = t1.id
    group by 1
)

select 
    country
from t3 
where country_duration > (select global_duration from t2)
