-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/submissions/



with cte as(
    select 
        v.customer_id, 
        count(*) as count_no_trans
    from Visits v 
    left join transactions t 
    on v.visit_id = t.visit_id
    where t.transaction_id is null
    group by 1

)
select * from cte 
