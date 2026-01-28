/* Write your PL/SQL query statement below */

select firstName,lastName,city,state from Person left join Address using (personId) 
