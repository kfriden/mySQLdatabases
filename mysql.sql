USE university_course;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO students(students_name, students_lastname)
VALUES ('Sean', 'McKenney');

INSERT INTO courses(course_name)
VALUES ('Biology');

INSERT INTO professors(prof_name, prof_last_name, prof_course_id)
VALUES ('Bob', 'Brighton', 9);

INSERT INTO grades(grades_grade, grades_student_id, grades_course_id, grades_prof_id)
VALUES (90, 6, 4, 11);

SELECT AVG(grades_grade) AS grade
FROM grades
WHERE grades_prof_id = 8;

SELECT MAX(grades_grade) AS grade
FROM grades
WHERE grades_student_id = 2;

SELECT * 
FROM courses c
JOIN students s
ON s.students_id = c.courses_students_id
JOIN professors p
ON p.professors_id = c.courses_prof_id
ORDER BY c.courses_id;

SELECT c.courses_id,
c.course_name,
c.courses_students_id,
s.students_id,
s.students_name
FROM courses c
INNER JOIN students s
ON c.courses_students_id = s.students_id
GROUP BY c.courses_students_id;

SELECT g.grades_grade,
g.grades_course_id,
c.courses_id,
c.course_name,
AVG (g.grades_grade) as average
FROM grades g
JOIN courses c
WHERE g.grades_course_id = c.courses_id
GROUP BY c.course_name
ORDER BY average ASC;

SELECT *
FROM courses;

SELECT *
FROM grades;

SELECT *
FROM students;

SELECT *
FROM professors;

DELETE FROM professors WHERE prof_course_id = 1;

ROLLBACK