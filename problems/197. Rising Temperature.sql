/* Write your PL/SQL query statement below */

/* 

Method 1 :  a.recordDate + 1 = b.recordDate where b.temperature > a.temperature
1. Passes edge cases with missing days
2. Handles first row automatically
3. Matches problem’s definition of “previous day”


Method 2 : Only get dates current_date - prev_date = 1 ( Difference of 1)
(recordDate - prev_recordDate) = 1 and temperature > prev_temperature

*/


-- Method 1 
select b.id from Weather a join Weather b on a.recordDate + 1 = b.recordDate where b.temperature > a.temperature

/*

-- Method 2
select id from (
select id,recordDate,lag(recordDate,1,recordDate-1) over(order by recordDate) as prev_recordDate , 
temperature , lag(temperature ,1)  over(order by recordDate) as prev_temperature  from Weather
) where (recordDate - prev_recordDate) = 1 and temperature > prev_temperature;

*/
