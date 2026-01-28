/* Write your PL/SQL query statement below */

/*

Method 1

select 
product_name,sum(unit) as unit
from Products join Orders using (product_id) where to_char(order_date,'YYYY-MM') ='2020-02'
group by product_name having sum(unit) >=100;

*/

/*

Method 2 

⚠️ Why NOT <= DATE '2020-02-29'

Because Oracle DATE includes time.

Example rows in Feb 29:

Stored Value
2020-02-29 00:00:00
2020-02-29 10:15:45
2020-02-29 23:59:59

Now look at this filter:

order_date <= DATE '2020-02-29'


👉 Oracle interprets DATE '2020-02-29' as:

2020-02-29 00:00:00


🚨 You will MISS all rows on Feb 29 after midnight.

✅ Why < DATE '2020-03-01' Works Perfectly
order_date < 2020-03-01 00:00:00


So it includes:

Feb 1 → Feb 28

Feb 29 23:59:59
✔️ Everything in February

*/

/*

Method 3

SELECT P.PRODUCT_NAME , SUM(O.UNIT) UNIT
FROM PRODUCTS P 
JOIN ORDERS O
ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE O.ORDER_DATE BETWEEN DATE'2020-02-01' AND DATE '2020-02-29' 
GROUP BY P.PRODUCT_NAME
HAVING SUM(O.UNIT) >= 100  ;

*/

SELECT p.product_name,
       SUM(o.unit) AS unit
FROM Products p
JOIN Orders o 
    ON p.product_id = o.product_id
WHERE o.order_date >= DATE '2020-02-01'
  AND o.order_date <  DATE '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
