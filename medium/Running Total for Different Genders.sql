-- https://leetcode.com/problems/running-total-for-different-genders/
  
with cte as(
    select 
        gender, 
        day,
        sum(score_points) over(partition by gender order by day) as total 
    from scores
    group by 1, 2


)
select * from cte 
