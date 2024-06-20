with cte as(
    select 
        cust_id, 
        sum(total_order_cost) as total_revenue
    from orders
    where extract(month from order_date) = 3
    group by 1

)
select * from cte
