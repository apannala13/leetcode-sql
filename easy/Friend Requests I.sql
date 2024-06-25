with t1 as(
    select 
        count(distinct(concat(sender_id, send_to_id))) as senders
    from FriendRequest
), 
t2 as(
    select 
        count(distinct(concat(requester_id, accepter_id))) 
            as accepters
    from RequestAccepted
)
select 
    case when senders = 0 then 0.0 else
    coalesce(round(accepters/senders::decimal, 2), 0) end as accept_rate
from t1, t2 

