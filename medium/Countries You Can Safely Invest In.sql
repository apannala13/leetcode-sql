--get the countries with average call durations 
--get the total average call duration 
--filter for countries with > call duration than total


with t1 as(
    select 
        caller_id as id, 
        duration
    from Calls 
    union all
    select callee_id as id, 
    duration
    from calls
), 
t2 as(
    select 
        c.name as country, 
        avg(t1.duration) as country_duration
    from country c 
    join Person p 
    on substring(p.phone_number, 1, 3) = country_code
    join t1 on t1.id = p.id 
    group by 1
), 
t3 as(
    select 
        avg(duration) as global_duration
    from t1
)
select country from t2 where country_duration > (select global_duration from t3)

