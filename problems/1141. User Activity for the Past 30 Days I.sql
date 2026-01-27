/* Write your PL/SQL query statement below */

/*
-- Method : 1
SELECT 
TO_CHAR(a.activity_date, 'YYYY-MM-DD') day, COUNT(DISTINCT a.user_id) active_users 
FROM Activity a
WHERE a.activity_date BETWEEN TO_DATE('2019-07-27', 'YYYY-MM-DD')-29 AND TO_DATE('2019-07-27', 'YYYY-MM-DD')
GROUP BY a.activity_date;
*/

/*
-- Method : 2
select 
to_char(activity_date, 'YYYY-MM-DD') as day, 
count(distinct user_id) as active_users 
from activity where activity_date > '2019-06-27' and activity_date <= '2019-07-27' 
group by activity_date order by activity_date;
*/

-- Method : 3
select 
    to_char(activity_date, 'YYYY-MM-DD') as day,
    count(distinct user_id) as active_users 
from Activity where 
     to_date(activity_date,'YYYY-MM-DD') >= TO_DATE('2019-07-27', 'YYYY-MM-DD')-29 and 
     to_date(activity_date,'YYYY-MM-DD') <= TO_DATE('2019-07-27', 'YYYY-MM-DD')
group by to_char(activity_date, 'YYYY-MM-DD');
