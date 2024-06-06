
-- https://leetcode.com/problems/recyclable-and-low-fat-products/

with cte as( 
    select 
        distinct 
        product_id 
    from Products
    where low_fats = 'Y' and recyclable = 'Y'




)
select * from cte 
