/* Write your PL/SQL query statement below */

SELECT customer_number
FROM (
        SELECT customer_number,
               Count(*)  AS cnt_orders,
               Dense_rank() over (ORDER BY Count(*) DESC) AS rnk
        FROM   orders
        GROUP  BY customer_number
     )
WHERE  rnk = 1; 
