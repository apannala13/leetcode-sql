with t1 as(
   select
    o.seller_id,
    dense_rank() over(partition by seller_id order by order_date) as ranked,
    i.item_brand
   from orders o join items i 
    on o.item_id = i.item_id
),
t2 as(
 select * from t1 where ranked = 2
) ,
t3 as(
    select
    u.user_id as seller_id,
    case when t2.item_brand = u.favorite_brand then 'yes' else 'no' end as "2nd_item_fav_brand"
   from users u 
    left join t2 
    on u.user_id = t2.seller_id

)

select * from t3
order by 1 