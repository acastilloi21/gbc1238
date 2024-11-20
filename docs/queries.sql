-- Lab 11 Query experiments
-- SELECT * 
-- FROM courses

SELECT * FROM courses;
-- Returns all IDs under courses table

SELECT * FROM assignments
LIMIT 10; 
-- Displays first 10 assignments

SELECT count(*) FROM courses;
-- Counts unique values (courses in this case) within the courses table

SELECT min(due_date) FROM assignments;
-- Looks up the lowest dated assignment and pulls the date

SELECT *
FROM  courses
WHERE course_name LIKE 'Intro%';
-- Pulls all courses that start with "Intro" plus remaining text

SELECT *
FROM  assignments
WHERE status != 'Completed'
ORDER BY due_date;
-- Displays all assignments whose status is not completed, then sorts by closest first

-- EXERCISE QUESTIONS
-- ##1 Assignments for a Specific Course
SELECT title,due_date
FROM  assignments
WHERE course_id = 'COMP1234'
ORDER BY due_date

-- ##2 Earliest Assignment Due Date
SELECT min(due_date),title
FROM  assignments

-- ##3 Latest Assignment Due Date
SELECT max(due_date),title
FROM  assignments

-- ##4 Assignments Due on a Specific Date
SELECT due_date,title
FROM  assignments
WHERE due_date = '2024-10-08'

-- ##5 Find All Assignments Due in October
SELECT due_date,title
FROM  assignments
WHERE due_date LIKE '2024-10%'

-- ##6 Find the Most Recent Completed Assignment
-- I interpreted as first to have been due, for latest due, Line 59 would be 'ORDER By due_date DESC'
SELECT due_date,title,status
FROM  assignments
WHERE status = 'Completed'
ORDER By due_date ASC
LIMIT 1

-- ##6v2 Find the Most Recent Completed Assignment
-- Surprisingly, for the closest to today's date, it's a record from two months ago.
SELECT due_date,title,status
FROM  assignments
WHERE status = 'Completed'
 AND due_date < '2024-11-20'
ORDER By due_date DESC
LIMIT 1

-- OPTIONAL TASKS
-- ##7 Count of "Not Started" Assignments
SELECT COUNT(*) 
from assignments
WHERE status LIKE 'NOT STARTED'

-- ##8 Find Courses with Labs on Tuesday
SELECT course_id,course_name,lab_time 
from courses
WHERE lab_time LIKE 'TUE%'

-- Have a good day!