with t1 as(
    select 
        count(distinct(concat(sender_id, send_to_id))) as nr 
    from FriendRequest
), 
t2 as(
    select 
        count(distinct(concat(requester_id, accepter_id))) as na 
    from RequestAccepted
)
select 
    case when nr = 0 then 0.0 
    else coalesce(round(na/nr::decimal, 2), 0) end as accept_rate
from t1, t2
