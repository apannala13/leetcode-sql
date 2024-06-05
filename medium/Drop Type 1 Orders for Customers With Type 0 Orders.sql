-- https://leetcode.com/problems/drop-type-1-orders-for-customers-with-type-0-orders/

with cte as(
    select 
    distinct 
        customer_id
    from 
        Orders
    where order_type = 0


)

select 
    * 
from orders 
where 
    customer_id not in(select customer_id from cte) or order_type = 0
    
