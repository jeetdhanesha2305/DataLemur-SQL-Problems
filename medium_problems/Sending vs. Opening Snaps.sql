with age_wise_activity_time as (
  select 
    l.age_bucket,
    r.activity_type, 
    r.time_spent
  from age_breakdown l 
  left join activities r 
  on l.user_id = r.user_id 
)

select 
  age_bucket, 
  round( 
    sum(
      case when activity_type = 'send' then time_spent else 0 end 
    ) * 100.0 / sum(
      case when activity_type in ('send','open') then time_spent else 0 end 
    )
  , 2) as send_perc,
  round( 
    sum(
      case when activity_type = 'open' then time_spent else 0 end 
    ) * 100.0 / sum(
      case when activity_type in ('send','open') then time_spent else 0 end 
    )
  , 2) as open_perc
from age_wise_activity_time 
group by age_bucket 
order by age_bucket asc