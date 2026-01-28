/* Write your PL/SQL query statement below */

/*

| Syntax              | Meaning        |
| ------------------- | -------------- |
| `A.col = B.col (+)` | A LEFT JOIN B  |
| `A.col (+) = B.col` | A RIGHT JOIN B |


*/

select unique_id,name from Employees e, EmployeeUNI u where e.id = u.id (+);

