/* Write your PL/SQL query statement below */

select * from Patients where REGEXP_LIKE(conditions, '(^| )DIAB1');

/*
SELECT PATIENT_ID, PATIENT_NAME, CONDITIONS
 FROM PATIENTS 
 WHERE CONDITIONS 
 LIKE 'DIAB1%' or conditions 
 like '% DIAB1%';
*/

/*

DIAB1

Matches the exact disease code

(^| )

^ → start of string

' ' → space
✔ Ensures DIAB1 is either:

At the beginning, or

After a space (multiple conditions case)

✅ Matches these

✔ DIAB1
✔ DIAB1 hypertension
✔ asthma DIAB1 flu

❌ Does NOT match

❌ XDIAB1
❌ DIAB12
❌ DIAB
*/
