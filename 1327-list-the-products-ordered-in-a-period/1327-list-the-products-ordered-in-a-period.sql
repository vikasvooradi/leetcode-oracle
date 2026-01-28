/* Write your PL/SQL query statement below */


select 
product_name,sum(unit) as unit
from Products join Orders using (product_id) where to_char(order_date,'YYYY-MM') ='2020-02'
group by product_name having sum(unit) >=100;