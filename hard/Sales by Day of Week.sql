-- https://leetcode.com/problems/sales-by-day-of-the-week/submissions/

with cte as(
    select 
        distinct 
        item_category as Category, 
        sum(case when dayofweek(order_date) = 2 then quantity else 0 end) as MONDAY,
        sum(case when dayofweek(order_date) = 3 then quantity else 0 end) as TUESDAY,
        sum(case when dayofweek(order_date) = 4 then quantity else 0 end) as WEDNESDAY,
        sum(case when dayofweek(order_date) = 5 then quantity else 0 end) as THURSDAY,
        sum(case when dayofweek(order_date) = 6 then quantity else 0 end) as FRIDAY,
        sum(case when dayofweek(order_date) = 7 then quantity else 0 end) as SATURDAY,
        sum(case when dayofweek(order_date) = 1 then quantity else 0 end) as SUNDAY
    from items i 
    left join orders o 
    on o.item_id = i.item_id
    group by 1
    order by 1
)
select * from cte 
