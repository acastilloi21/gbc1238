--1 Concatenate Course Name and Semester
SELECT course_name, semester, concat(course_name, '-', semester)
FROM courses

--2 Find Courses with Labs on Fridays:
SELECT * 
FROM courses
WHERE lab_time LIKE 'fri%'

--3 Upcoming Assignments:
SELECT *
FROM assignments
WHERE due_date >date()

--4 Count Assignments by Status:
SELECT id entry, status, COUNT (*)
FROM assignments
GROUP by status

--5 Longest Course Name:
SELECT course_name
from courses
order by length(course_name) DESC
LIMIT 1

--6 Uppercase Course Names:
SELECT upper(course_name)
FROM courses

--7 Assignments Due in September:
SELECT *
FROM assignments
where due_date LIKE '%-09-%'

--8 Assignments with Missing Due Dates:
SELECT *
FROM assignments
where due_date is NULL

--E1 Total Assignments per Course:
-- teacher you may not have been here but there was a victory warcry after this ran as intended
SELECT courses.course_id, title, status,due_date, COUNT(*) 'No of Assignments'
from assignments
LEFT JOIN courses WHERE assignments.course_id = courses.course_id
GROUP BY course_name

--E2 Courses Without Assignments (advanced):
-- Approaches
SELECT courses.course_id, course_name, title, status, due_date, COUNT(*) 'No of Assignments'
from assignments
LEFT JOIN courses WHERE assignments.id is NULL
GROUP by courses.course_id

-- Attempt 2
SELECT courses.course_id, title, status,due_date, COUNT(*) 'No of Assignments'
from assignments
LEFT JOIN courses WHERE assignments.course_id = courses.course_id
GROUP BY courses.course_id
AND assignments.id is NULL

-- Query rendered unfruitful, below was run to insert new course yet still did not appear in above queries.
INSERT INTO courses (course_id, semester, course_name) 
VALUES ('COMP7357','2024-2','TEST NO ASSIGNMENT')
