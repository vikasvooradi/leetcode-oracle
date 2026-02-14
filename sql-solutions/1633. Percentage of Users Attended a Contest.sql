/* Write your PL/SQL query statement below */

-- Percentage = (count of DISTINCT user_id per contest) / (total users including nulls) × 100 -> round off to 2 decimal places.

SELECT 
    r.contest_id,
    ROUND(
        COUNT(DISTINCT r.user_id) 
        / (SELECT COUNT(*) FROM users) * 100,
        2
    ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id;
