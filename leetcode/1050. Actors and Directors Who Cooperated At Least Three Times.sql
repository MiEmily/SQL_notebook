the key idea: count the pair of (actor_id,director_id) ! with the group by.

select actor_id,director_id
from (
select *, count((actor_id)) num
from actordirector 
group by actor_id,director_id
having num>2) a_3_d
