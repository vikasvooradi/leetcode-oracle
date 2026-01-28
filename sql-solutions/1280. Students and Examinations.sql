/* Write your PL/SQL query statement below */

/*

with no_found_in_examinations as 
(
    SELECT s.student_id, s.student_name,sub.subject_name, 0 as attended_exams
    FROM Students s
    CROSS JOIN Subjects sub
    WHERE NOT EXISTS (
        SELECT 1 FROM Examinations e
        WHERE e.student_id = s.student_id
        AND e.subject_name = sub.subject_name
    )
)
select * from (select student_id,student_name,subject_name, count(*) as attended_exams  
from Students st join Examinations ex using(student_id) 
group by student_id,student_name,subject_name 
union 
select student_id,student_name,subject_name,attended_exams from no_found_in_examinations
) order by student_id, subject_name;

*/

select s.student_id,s.student_name,sb.subject_name,count(e.subject_name) as attended_exams 
from Students s cross join Subjects sb left join Examinations e on
e.STUDENT_ID = s.STUDENT_ID and e.SUBJECT_NAME = sb.SUBJECT_NAME
group by s.student_id,s.student_name,sb.subject_name order by s.student_id,sb.subject_name;
