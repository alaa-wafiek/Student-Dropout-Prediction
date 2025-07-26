-- Q1. What percentage of students dropped out?
SELECT 
  COUNT(*) AS TotalStudents,
  SUM(CAST(Dropped_Out AS INT)) AS DroppedOutCount,
  CAST(100.0 * SUM(CAST(Dropped_Out AS FLOAT)) / COUNT(*) AS DECIMAL(5,2)) AS DropoutRatePercentage
FROM cleaned_student_data;
--answer: 649	100	15.41

-- Q2. How many students dropped out vs. stayed?
SELECT 
  Dropped_Out AS DropoutStatus,
  COUNT(*) AS StudentCount
FROM cleaned_student_data
GROUP BY Dropped_Out;
--answer:
/*0	549 
 1	100*/


-- Q3. Are male or female students dropping out more?
SELECT 
  Gender,
  COUNT(*) AS Total,
  SUM(CAST(Dropped_Out AS INT)) AS DroppedOut,
  CAST(100.0 * SUM(CAST(Dropped_Out AS FLOAT)) / COUNT(*) AS DECIMAL(5,2)) AS DropoutRate
FROM cleaned_student_data
GROUP BY Gender;
/*
    Total   Droppedout  Dropout Rate
F	383		50			13.05%
M	266		50			18.80%
*/


-- Q4. How does number of absences relate to dropout?
SELECT 
  Number_of_Absences,
  COUNT(*) AS TotalStudents,
  SUM(CAST(Dropped_Out AS INT)) AS DroppedOut,
  CAST(100.0 * SUM(CAST(Dropped_Out AS FLOAT)) / COUNT(*) AS DECIMAL(5,2)) AS DropoutRate
FROM cleaned_student_data
GROUP BY Number_of_Absences
ORDER BY Number_of_Absences;
/*answer :
0	244	34	13.93
1	12	0	0.00
2	110	16	14.55
3	7	3	42.86
4	93	11	11.83
5	12	2	16.67
6	49	6	12.24
7	3	1	33.33
8	42	9	21.43
9	7	3	42.86
10	21	3	14.29
11	5	0	0.00
12	44	12	27.27*/

--Q5. Does participation in extracurricular activities reduce dropout?
SELECT 
  Extra_Curricular_Activities,
  COUNT(*) AS Total,
  SUM(CAST(Dropped_Out AS INT)) AS Dropped,
  CAST(100.0 * SUM(CAST(Dropped_Out AS FLOAT)) / COUNT(*) AS DECIMAL(5,2)) AS DropoutRate
FROM cleaned_student_data
GROUP BY Extra_Curricular_Activities;
--answer
/*
0	334	57	17.07
1	315	43	13.65*/

--  Q6. Which parental education level is linked to higher dropout?
SELECT 
  Mother_Education,
  COUNT(*) AS Total,
  SUM(CAST(Dropped_Out AS INT)) AS DroppedOut,
  CAST(100.0 * SUM(CAST(Dropped_Out AS FLOAT)) / COUNT(*) AS DECIMAL(5,2)) AS DropoutRate
FROM cleaned_student_data
GROUP BY Mother_Education
ORDER BY DropoutRate DESC;
/*answer:
1	143	37	25.87
3	139	22	15.83
2	186	27	14.52
4	175	14	8.00
0	6	0	0.00*/


--  Q7. What’s the dropout distribution by study time?
SELECT 
  Study_Time,
  COUNT(*) AS TotalStudents,
  SUM(CAST(Dropped_Out AS INT)) AS Dropouts,
  CAST(100.0 * SUM(CAST(Dropped_Out AS FLOAT)) / COUNT(*) AS DECIMAL(5,2)) AS DropoutRate
FROM cleaned_student_data
GROUP BY Study_Time
ORDER BY Study_Time;
/*answer:
1	212	50	23.58
2	305	41	13.44
3	97	7	7.22
4	35	2	5.71*/


-- Q8. What is the most common dropout student profile?
SELECT TOP 5 
  Gender,
  Mother_Education,
  Number_of_Failures,
  Number_of_Absences,
  Extra_Curricular_Activities,
  COUNT(*) AS DropoutCount
FROM cleaned_student_data
WHERE Dropped_Out = 1
GROUP BY Gender, Mother_Education, Number_of_Failures, Number_of_Absences, Extra_Curricular_Activities
ORDER BY DropoutCount DESC;
/*answer:
0	1	1	0	0	4
0	4	0	0	1	3
1	1	0	0	1	3
1	2	0	0	1	3
0	1	0	0	0	2*/

--  Q9. How many students with Final_Grade < 10 dropped out?
SELECT COUNT(*) AS LowGradeDropouts
FROM cleaned_student_data
WHERE Final_Grade < 10 AND Dropped_Out = 1;
--answer:100

