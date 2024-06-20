with cte as(
    select 
        concat(price, room_type, host_since, zipcode, number_of_reviews) as host_id, 
        case when 
            number_of_reviews = 0 then 'New'
        when number_of_reviews between 1 and 5 then 'Rising'
        when number_of_reviews between 6 and 15 then 'Trending Up'
        when number_of_reviews between 16 and 40 then 'Popular' 
        else 'Hot'
        end as host_pop_rating, 
        price
    from airbnb_host_searches
    group by 1, 2, 3

)
select 
    host_pop_rating, 
    min(price) as min_price, 
    avg(price) as avg_price,
    max(price) as max_price
from cte
group by 1
