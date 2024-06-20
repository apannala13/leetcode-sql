with t1 as(
    select * from fb_eu_energy
    union all 
    select * from fb_asia_energy 
    union all 
    select * from fb_na_energy
), 
t2 as(
    select 
        date, 
        sum(consumption) as total,
        dense_rank() over(order by sum(consumption) desc) as ranked
    from t1
    group by 1

)
select date, 
        total
from t2 
where ranked = 1
