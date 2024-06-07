


-- https://leetcode.com/problems/product-price-at-a-given-date/
with t1 as(
    select 
        product_id, 
        max(change_date) over(partition by product_id) as change_date
    from products
    where change_date <= '2019-08-16'
), 
t2 as(
    select 
        t1.product_id, 
        p.new_price as price 
    from t1 
    join products p 
    on t1.product_id = p.product_id and t1.change_date = p.change_date
)
select 
    product_id, 
    price 
from t2
union 
select 
    product_id, 
    10 as price 
from products 
where product_id not in(
    select distinct product_id from t2)
