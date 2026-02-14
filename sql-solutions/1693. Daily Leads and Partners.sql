/* Write your PL/SQL query statement below */

select 
    to_char(date_id,'YYYY-MM-DD') as date_id,
    make_name,
    count(distinct lead_id) as unique_leads,
    count(distinct partner_id) as unique_partners from DailySales
group by date_id,make_name;
