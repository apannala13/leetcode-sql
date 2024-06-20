with t1 as( 
    select 
        account_id,
        count(
            distinct
            case when date > '2021-01-31' then 1 else 0 end
        ) as january,
        count(
            distinct
            case when date > '2020-12-31' then 1 else 0 end
        ) as december 
    from sf_events
    group by 1
    
)
select 
    account_id, 
    round(january/december, 1) as total 
from t1
order by 1
