/* Write your PL/SQL query statement below */

/*
Their are 2 methods to calculate 
Method 1 :
x+y > z  and x+z > y and y+z > x

Method 2 :
x+y+z > 2 * greatest(x,y,z)  

*/

select x,y,z, case when x+y+z > 2 * greatest(x,y,z) then 'Yes' else 'No' end as triangle from Triangle;

--select x,y,z, case when x+y > z and y+z > x and x+z > y then 'Yes' else 'No' end as  triangle from Triangle;
