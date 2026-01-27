/* Write your PL/SQL query statement below */

/*
  This can be solve using 2 methods 
  1. By using case 
  2. By using decode 
*/

--update Salary set sex = case when sex='m' then 'f' else 'm' end;

update  Salary set sex = DECODE(sex, 'm', 'f', 'f', 'm');
