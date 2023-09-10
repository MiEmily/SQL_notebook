--problem
/*
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
*/

--solution

select concat(name,'(',right(name,1),')')
from occupations
order by name asc;

select concat('There are a total of',' ',count(occupation),' ',occupation,'s.')
from occupations
group by occupation
order by count(occupation),occupation asc; 

/*
note: 
selec concat (string1, string2, ...): merge string

group by x: put all those same values for x in the same row.All column names from the SELECT clause should either appear in the GROUP BY clause or be used in the aggregate functions. 
        
*/
