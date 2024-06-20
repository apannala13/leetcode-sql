with t1 as(
    select 
        policy_num, 
        state, 
        claim_cost, 
        fraud_score, 
        percent_rank() over(partition by state order by fraud_score desc) as ranked
    from fraud_score


)
select policy_num, 
        state, 
        claim_cost, 
        fraud_score
from t1 
where ranked <= 0.05
order by 1

