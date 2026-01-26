/* Write your PL/SQL query statement below */

/*

Employee Table
      │
      ├── Alias e (Employee)
      │
      ├── Alias m (Manager)
      │
      ▼
Join on e.managerId = m.id
      │
      ▼
Filter: e.salary > m.salary
      │
      ▼
Project: e.name AS Employee
      │
      ▼
Final Result Set


*/

SELECT 
       e.name AS employee
FROM employee e
JOIN employee m 
    ON e.managerid = m.id
WHERE e.salary > m.salary;
