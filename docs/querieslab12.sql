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