with cte as(
    select 
        c.customer_id, 
        c.customer_name
    from Customers c 
    join Orders o 
    on c.customer_id = o.customer_id
    group by 1, 2
    having  
        count(
            distinct case when product_name = 'A' then 1 end
        ) > 0 
        and 
        count(
            distinct case when product_name = 'B' then 1 end
        ) > 0 
        and 
        count(
            distinct case when product_name = 'C' then 1 end
        ) = 0
    order by 1 
)
select * from cte
