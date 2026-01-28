/* Write your PL/SQL query statement below */

select 
name,NVL(sum(distance),0) as travelled_distance 
from Users u , Rides r where u.id = r.user_id(+)
group by u.id, u.name order by 2 desc,name

/*

SELECT 
    u.name,
    NVL(SUM(r.distance),0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r 
    ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name;


*/
