--https://leetcode.com/problems/capital-gainloss/


--solution 1:
with cte as(
    select 
        stock_name,
        sum(case when operation = 'Sell' then price else 0 end) as sell,
    sum(case when operation = 'Buy' then price else 0 end)  as buy
    from Stocks
    group by 1
)
select stock_name, 
        sell - buy as capital_gain_loss 
    from cte 

--solution 2:
with t1 as(
    select 
        stock_name, 
    sum(price)  as total
    from stocks 
    where operation = 'Buy'
        group by 1
), 
t2 as(
    select 
        stock_name, 
    sum(price)  as total
    from stocks 
    where operation = 'Sell'
    group by 1


)
select 
    t1.stock_name,
    t2.total - t1.total as capital_gain_loss
from t1 
join t2 
on t1.stock_name = t2.stock_name
    
