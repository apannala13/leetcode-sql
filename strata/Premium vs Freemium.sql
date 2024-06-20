with cte as(
    select 
        f.date, 
        sum(
            case when paying_customer = 'no' then downloads else 0 end
        ) as non_paying, 
        sum(
            case when paying_customer = 'yes' then downloads else 0 end
        ) as paying
    from ms_user_dimension u 
    join ms_download_facts f 
    on u.user_id = f.user_id
    join ms_acc_dimension acc 
    on acc.acc_id = u.acc_id
    group by 1

)
select * from cte 
where non_paying > paying 
order by 1 asc 


