with t1 as(
    select user1_id as user_id, user2_id as friend_id from friendship
    union 
    select user2_id as user_id, user1_id as friend_id from friendship
), 
t2 as(
    select 
        t1.user_id, 
        l.page_id, 
        count(distinct t1.friend_id) as friends_likes
    from t1 
    join likes l 
    on t1.friend_id = l.user_id
    group by 1, 2
), 
t3 as(
    select 
        user_id, page_id 
    from likes
)

select 
    t2.user_id, 
    t2.page_id, 
    t2.friends_likes
from t2 
left join t3 
on t2.user_id = t3.user_id 
and t2.page_id = t3.page_id
where t3.page_id is null 
