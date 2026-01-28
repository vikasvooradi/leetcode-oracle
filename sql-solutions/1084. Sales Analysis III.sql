/* Write your PL/SQL query statement below */

/*

Method 1 :

| product_id | MIN(s.sale_date) |
| ---------- | ---------------- |
| 1          | 2019-01-21       |
| 2          | 2019-02-17       |
| 3          | 2019-05-13       |

| product_id | MAX(s.sale_date) |
| ---------- | ---------------- |
| 1          | 2019-01-21       |
| 2          | 2019-06-02       |
| 3          | 2019-05-13       |

Product 1: 2019-01-21 ✅ (inside Q1)
Product 2: 2019-06-02 ❌ (outside Q1)
Product 3: 2019-05-13 ❌ (outside Q1)

SELECT  product_id,min(sale_date),max(sale_date) from Sales group by product_id having min(sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31'

| PRODUCT_ID | MIN(SALE_DATE)      | MAX(SALE_DATE)      |
| ---------- | ------------------- | ------------------- |
| 1          | 2019-01-21 00:00:00 | 2019-01-21 00:00:00 |

SELECT product_id, product_name
FROM (
    SELECT product_id
    FROM Sales
    GROUP BY product_id
    HAVING MIN(sale_date) >= DATE '2019-01-01'
       AND MAX(sale_date) <= DATE '2019-03-31'
) s
JOIN Product USING (product_id);


Note :

BETWEEN PROBLEM (BIGGEST SQL TRAP)

sale_date between '2019-01-01' and '2019-03-31'
>= 2019-01-01 00:00:00
<= 2019-03-31 00:00:00   ❌ MIDNIGHT ONLY

Just do trunc(sales_date)

*/


with in_between_rows as
(
   select product_id from Sales where trunc(sale_date) between date '2019-01-01' and date '2019-03-31'
) , not_in_between_rows as
(
    select product_id from Sales where trunc(sale_date) not between date '2019-01-01' and date '2019-03-31'
) , data as
(
    select a.product_id from in_between_rows a where not exists (
        select 1 from not_in_between_rows b where b.product_id = a.product_id
    )
)
select distinct product_id,product_name from data join Product using (product_id);
