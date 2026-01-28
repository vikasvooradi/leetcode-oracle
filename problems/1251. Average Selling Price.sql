/* Write your PL/SQL query statement below */

/*
Why to add : NVL 

For this Test case need to use NVL 

Prices : 

| product_id | start_date | end_date   | price |
| ---------- | ---------- | ---------- | ----- |
| 1          | 2019-02-17 | 2019-02-28 | 5     |
| 1          | 2019-03-01 | 2019-03-22 | 20    |
| 2          | 2019-02-01 | 2019-02-20 | 15    |
| 2          | 2019-02-21 | 2019-03-31 | 30    |
| 3          | 2019-02-21 | 2019-03-31 | 30    |

UnitSold :

| product_id | purchase_date | units |
| ---------- | ------------- | ----- |
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |

Expected Output :

| product_id | average_price |
| ---------- | ------------- |
| 1          | 6.96          |
| 2          | 16.96         |
| 3          | 0             |


Your query should not return below output 

| product_id | average_price |
| ---------- | ------------- |
| 1          | 6.96          |
| 2          | 16.96         |
| 3          | null          |


Note :

SELECT 5 / 0 FROM dual; : ORA-01476: divisor is equal to zero

If SUM(a) = 0
👉 Returns: NULL

If SUM(a) = 10
👉 Returns: 10

If SUM(a) = NULL (no rows)
👉 Returns: NULL

SUM(x) / NULLIF(SUM(a), 0)
SUM(x) / NULL  → NULL   (no crash)

Without nullif 
SUM(x) / SUM(a)   -- if SUM(a)=0 → ORA-01476


*/


SELECT 
    p.product_id,
    NVL(ROUND(SUM(p.price * u.units) / NULLIF(SUM(u.units), 0), 2),0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u 
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
ORDER BY p.product_id;





