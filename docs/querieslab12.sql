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
