/* Write your PL/SQL query statement below */

select name,balance from (select 
account, sum(amount) as balance
from Transactions group by account
having sum(amount) > 10000
) join users using (account);
