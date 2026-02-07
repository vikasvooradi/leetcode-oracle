/* Write your PL/SQL query statement below */

select customer_id,count(customer_id) as count_no_trans 
from Visits left join Transactions using(visit_id) where TRANSACTION_ID is null
group by customer_id;
