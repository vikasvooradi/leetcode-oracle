/* Write your PL/SQL query statement below */

SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    JOIN Company c ON c.com_id = o.com_id
    WHERE c.name = 'RED'
      AND o.sales_id = s.sales_id
);



/*

SELECT name 
FROM SalesPerson
WHERE sales_id NOT IN(
    select O.sales_id
    from Company C join Orders O Using(com_id)
    WHERE C.name = 'RED'
);

*/
