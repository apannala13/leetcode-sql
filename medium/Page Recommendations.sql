with t1 as(
    select 
        user1_id as id
    from Friendship
    where user2_id = 1
    union 
    select 
        user2_id as id
    from friendship
    where user1_id = 1
), 
t2 as(
    select
        distinct page_id as recommended_page
    from likes l 
    join t1 
    on l.user_id = t1.id
), 
t3 as(
    select 
        page_id
    from likes 
    where user_id = 1
)
select recommended_page 
from t2
where recommended_page not in(select page_id from t3)
