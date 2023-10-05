# Write your MySQL query statement below
with cte as(
select requester_id,count(accepter_id) countid1
from requestaccepted
group by requester_id),
cte2 as (
  select accepter_id, count(requester_id) countid2
  from requestaccepted
  group by accepter_id
),
# select * from cte2;
cte3 as(
select *
from cte left join cte2 on cte.requester_id=cte2.accepter_id
union
select *
from cte right join cte2 on cte.requester_id=cte2.accepter_id)

select * from cte3
case when requester_id=accepter_id, then countid1=countid1+countid2
case when requester_id is null,then requester_id=accepter_id
