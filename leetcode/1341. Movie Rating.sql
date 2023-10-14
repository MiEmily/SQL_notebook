-- 1. count() over(partition by .. order by ..) just define how the window function work on data. not gonna impact the final result(display result)
-- so need to put order by name asc outside of window function
with cte as 
(select distinct name,rating,created_at,title,mr.movie_id,mr.user_id, count(mr.movie_id) over (partition by user_id) as au 
from movierating mr
join users u on u.user_id=mr.user_id
join movies m on mr.movie_id=m.movie_id
order by name asc)
,cte2 as(
  select title,avg(rating)as m_avgrate
  from cte 
  where year(created_at)='2020' and month(created_at)='02'
  group by title
  order by title asc 
)
(
  select distinct name as results
from cte
where au in (select max(au) from cte )
limit 1
)
union all
(
  select title as results
from cte2 
where m_avgrate in (select max(m_avgrate) from cte2)
limit 1
)
-- limit 1 not gonna work in subquery
-- union automatically drop duplicated rows 
-- where m_avgrate in (select max(m_avgrate) from cte2)
