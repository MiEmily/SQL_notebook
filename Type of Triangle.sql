--problem

/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/
--solution
select 
  case 
     when (A+B)<=C OR (B+C)<=A OR (C+A)<=B then 'Not A Triangle'
     when A=B and B=C and C=A then 'Equilateral'
     when A=B or B=C or C=A then 'Isosceles'
     when A!=B and B!=C and A!=C then 'Scalene'
  end 
from triangles;

/*
note: case when usage:
1. select caluse 
2. must have componets{when,then,end},else not require
3.other conditional statement or operator in between when then.
*/
