/* Write your PL/SQL query statement below */

select name as Customers from Customers where not exists( select * from Orders where Orders.customerId = Customers.id);
