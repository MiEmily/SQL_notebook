/*
select 1 clause:
  select 1/select * /select null common used in EXISTS subselect. In EXISTS subselect, the database does not actually "retrieve" rows,
it doesn not always need to scan the entire result set for the sbselect, becasue just one row will provide an answer. That answer either TRUE or FALSE.

EXISTS operator: test for the existence of any record in a subquery; return true if the subquery returns one or more records.(not exactly return any rows or records)
  


*/
