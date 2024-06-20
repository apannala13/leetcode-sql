with cte as(
    select 
        state, 
        count(distinct business_id) as total, 
        dense_rank() over(order by count(distinct business_id) desc) as ranked
    from yelp_business
    where stars = 5
    group by 1



)
select state, total from cte 
where ranked <= 4
