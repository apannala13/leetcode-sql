-- https://leetcode.com/problems/class-performance/


with cte as(
    select 
        student_id,
        sum(assignment1 + assignment2 + assignment3) as total 
    from Scores
    group by 1

)
select max(total) - min(total) as difference_in_score
from cte 
