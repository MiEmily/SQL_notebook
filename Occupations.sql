--problem
/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation.
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.
*/
--solution
create view o as(
select 
case when occuaption='doctor' then name end as 'doctor',
case when occupation='professor' then name end as 'professor',
case when occupation='singer' then name end as 'singer',
case when occupation='actor' then name end as 'actor'
row_number () over(partition by occupation order by name) as rn
from occpuations
  );

select max(doctor),max(professor),max(singer),max(actor) from o 
group by rn





/*
note
pivot: only interchange the rows to columns in the output result, but the records still intact.
in mysql don't have built-in function. use if clause or case when clause.
MYSQL

semicolon used for seperate statement(SELECT/UPDATE/DELETE/INSERT INTO/CREATE DATABASE/ALTER DATABASE/CREATE TABLE/ALTER TABLE/DROP TABLE/
DROP INDEX)
ROW_NUMBER() OVER(PARTITION BY occupation) ORDER BY name /
PARTITION_BY_clause:assign unique sequential number to the partition by, start by 1 increase 1 each same partitioner, if it have new 
partitioner then it start from 1 again.
Order_by_clause:define the sequence in which each row is going to assign its unique ROW_NUMBER.



MSSQL:
************
SELECT <non-pivoted column>,  
    [first pivoted column] AS <column name>,  
    [second pivoted column] AS <column name>,  
    ...  
    [last pivoted column] AS <column name>  
FROM  
    (<SELECT query that produces the data>)   
    AS <alias for the source query>  
PIVOT  
(  
    <aggregation function>(<column being aggregated>)  
FOR   
[<column that contains the values that will become column headers>]   
    IN ( [first pivoted column], [second pivoted column],  
    ... [last pivoted column])  
) AS <alias for the pivot table>  
<optional ORDER BY clause>;

*/
