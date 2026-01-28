/* Write your PL/SQL query statement below */

-- Note on Edge Cases:  
-- Although the problem statement guarantees a single top customer, in practice there could be test cases where multiple customers have the same maximum number of orders. 
-- The query should be robust enough to handle ties and return all such customers, not just one.


/*

SELECT customer_number
FROM (
        SELECT customer_number,
               Count(*)  AS cnt_orders,
               dense_rank() over (ORDER BY Count(*) DESC) AS rnk
        FROM   orders
        GROUP  BY customer_number
     )
WHERE  rnk = 1; 

*/

SELECT customer_number
FROM (
    SELECT customer_number, COUNT(order_number) AS cnt_orders
    FROM Orders
    GROUP BY customer_number
)
WHERE cnt_orders = (
    SELECT MAX(cnt_orders)
    FROM (
        SELECT COUNT(order_number) AS cnt_orders
        FROM Orders
        GROUP BY customer_number
    )
);




