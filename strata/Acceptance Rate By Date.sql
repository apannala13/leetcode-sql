with t1 as(
    select 
        user_id_sender, 
        date
    from fb_friend_requests
    where action = 'accepted'
), 
t2 as(
    select 
        user_id_sender, 
        date
    from fb_friend_requests
    where action = 'sent'
)

select 
    t2.date, 
    (count(t1.user_id_sender)::decimal / count(t2.user_id_sender)) as percentage_acceptance
from t2 
left join t1 
on t2.user_id_sender = t1.user_id_sender
group by 1 

