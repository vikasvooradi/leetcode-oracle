/* Write your PL/SQL query statement below */

select tweet_id from Tweets where length(replace(content,' ','')) > 15;
