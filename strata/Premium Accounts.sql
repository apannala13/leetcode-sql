with t1 as(
    select 
        a.entry_date, 
        count(a.account_id) as premium_paid_accounts, 
        count(b.account_id) as premium_paid_accounts_after_7d
    from premium_accounts_by_day a 
    left join premium_accounts_by_day b 
    on a.account_id = b.account_id 
    and b.entry_date = a.entry_date + interval '7 days'
    and b.final_price > 0 
    where a.final_price > 0
    group by 1
    order by 1
)
select * from t1
limit 7 
