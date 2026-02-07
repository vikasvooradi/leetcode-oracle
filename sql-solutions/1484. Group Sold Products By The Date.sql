/* Write your PL/SQL query statement below */

SELECT
    sell_date,COUNT(product) as num_sold,
    LISTAGG(product, ',')
        WITHIN GROUP (ORDER BY product) AS products
FROM (
    SELECT DISTINCT
           TO_CHAR(sell_date, 'YYYY-MM-DD') AS sell_date,
           product
    FROM Activities
)
GROUP BY sell_date;
