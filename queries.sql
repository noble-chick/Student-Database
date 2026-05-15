-- ============================================================
--  QUERIES  —  run schema.sql and seed.sql first
-- ============================================================


-- ── JOINS ────────────────────────────────────────────────────

-- Full transcript: student + course + grade + instructor
SELECT
    s.first_name || ' ' || s.last_name   AS student,
    c.course_code,
    c.title                              AS course,
    g.grade,
    g.semester,
    i.first_name || ' ' || i.last_name   AS instructor
FROM grades      g
JOIN students    s ON s.student_id    = g.student_id
JOIN courses     c ON c.course_id     = g.course_id
JOIN instructors i ON i.instructor_id = c.instructor_id
ORDER BY student, c.course_code;


-- ── FILTERING ────────────────────────────────────────────────

-- Students who scored below 70 (at risk)
SELECT
    s.first_name || ' ' || s.last_name AS student,
    c.title                            AS course,
    g.grade
FROM grades   g
JOIN students s ON s.student_id = g.student_id
JOIN courses  c ON c.course_id  = g.course_id
WHERE g.grade < 70
ORDER BY g.grade;

-- Courses taught by a specific instructor
SELECT course_code, title, credits
FROM courses
WHERE instructor_id = (
    SELECT instructor_id FROM instructors WHERE last_name = 'Martin'
);


-- ── GROUPING & AGGREGATION ───────────────────────────────────

-- Average grade per student
SELECT
    s.first_name || ' ' || s.last_name  AS student,
    ROUND(AVG(g.grade), 2)              AS avg_grade,
    COUNT(g.course_id)                  AS courses_taken
FROM grades   g
JOIN students s ON s.student_id = g.student_id
GROUP BY s.student_id, student
ORDER BY avg_grade DESC;

-- Average grade per course
SELECT
    c.course_code,
    c.title,
    ROUND(AVG(g.grade), 2) AS avg_grade,
    COUNT(g.student_id)    AS enrolled_students
FROM grades  g
JOIN courses c ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_code, c.title
ORDER BY avg_grade DESC;

-- Top student per course
SELECT
    c.title         AS course,
    s.first_name || ' ' || s.last_name AS top_student,
    g.grade         AS highest_grade
FROM grades   g
JOIN students s ON s.student_id = g.student_id
JOIN courses  c ON c.course_id  = g.course_id
WHERE g.grade = (
    SELECT MAX(g2.grade)
    FROM grades g2
    WHERE g2.course_id = g.course_id
)
ORDER BY c.title;


-- ── VIEWS ────────────────────────────────────────────────────

CREATE VIEW v_student_summary AS
SELECT
    s.student_id,
    s.first_name || ' ' || s.last_name  AS student,
    s.email,
    COUNT(g.course_id)                  AS courses_enrolled,
    ROUND(AVG(g.grade), 2)              AS gpa
FROM students s
LEFT JOIN grades g ON g.student_id = s.student_id
GROUP BY s.student_id, student, s.email;

CREATE VIEW v_course_summary AS
SELECT
    c.course_id,
    c.course_code,
    c.title,
    c.credits,
    i.first_name || ' ' || i.last_name  AS instructor,
    COUNT(g.student_id)                 AS enrolled,
    ROUND(AVG(g.grade), 2)              AS avg_grade
FROM courses     c
LEFT JOIN instructors i ON i.instructor_id = c.instructor_id
LEFT JOIN grades      g ON g.course_id     = c.course_id
GROUP BY c.course_id, c.course_code, c.title, c.credits, instructor;

-- Use the views
SELECT * FROM v_student_summary ORDER BY gpa DESC;
SELECT * FROM v_course_summary  ORDER BY avg_grade DESC;
