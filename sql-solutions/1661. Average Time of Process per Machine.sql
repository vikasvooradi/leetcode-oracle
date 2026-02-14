/* Write your PL/SQL query statement below */

/*

🧠 Average Processing Time per Machine — Explanation

Each process has two records:
start
end

Processing time for one process = end_timestamp - start_timestamp

🔹 Step 1: Calculate Total Processing Time per Machine

We use this trick:

SUM(CASE 
      WHEN activity_type = 'end' THEN timestamp
      ELSE -timestamp
    END)


This works because: (end - start)
gets calculated automatically when summed.

🔹 Step 2: Count Number of Processes per Machine
COUNT(DISTINCT process_id)
DISTINCT is required because each process appears twice (start & end).

🔹 Step 3: Compute Average
Average Processing Time =
Total Processing Time / Number of Processes

*/

SELECT
    machine_id,
    ROUND(
        SUM(CASE 
                WHEN activity_type = 'end' THEN timestamp
                ELSE -timestamp
            END)
        / COUNT(DISTINCT process_id),
        3
    ) AS processing_time
FROM Activity
GROUP BY machine_id;


