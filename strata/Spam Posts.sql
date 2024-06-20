with cte as(
    select 
        post_date,
        sum(
            case when post_keywords 
                like '%spam%' then v.viewer_id::numeric end
        ) / count(v.viewer_id) * 100 as spam_share
    from facebook_posts p 
    join facebook_post_views v 
    on v.post_id = p.post_id
    group by 1

)
select * from cte 
