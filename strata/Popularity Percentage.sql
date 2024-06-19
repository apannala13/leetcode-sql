with t1 as(
    select 
        user1, user2
    from facebook_friends
    union 
    select 
        user2, user1
    from facebook_friends
), 
t2 as(
    select 
        user1,
        count(*) as total, 
        count(*) over() as perc
    from t1     
    group by 1
)
select user1, 
    total::numeric / perc::numeric * 100  as res
from t2
group by 1, total, perc
