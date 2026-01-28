/* Write your PL/SQL query statement below */

-- Note : You cannot use nested aggregate functions : avg(sum(...))

/*

-- Method 1 
select 
    query_name,
    round(avg((rating / position)),2) as quality,
    round(sum(case when rating < 3 then 1 else 0 end) * 100.0 / count(*),2) as poor_query_percentage
from Queries group by query_name;

*/

select 
    query_name,
    round(avg((rating / position)),2) as quality,
    round(avg(case when rating < 3 then 1 else 0 end) * 100.0,2) as poor_query_percentage
from Queries group by query_name;
