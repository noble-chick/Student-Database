-- ============================================================
--  SEED DATA  —  run this file after schema.sql
-- ============================================================

INSERT INTO instructors (first_name, last_name, email, department) VALUES
('Alice',   'Martin',  'a.martin@uni.edu',  'Computer Science'),
('Bob',     'Singh',   'b.singh@uni.edu',   'Mathematics'),
('Carla',   'Torres',  'c.torres@uni.edu',  'Physics');

INSERT INTO courses (course_code, title, credits, instructor_id) VALUES
('CS101',  'Intro to Programming',  3, 1),
('CS201',  'Data Structures',       3, 1),
('MA101',  'Calculus I',            4, 2),
('PH101',  'Mechanics',             3, 3),
('MA201',  'Linear Algebra',        3, 2);

INSERT INTO students (first_name, last_name, email, date_of_birth) VALUES
('Omar',    'Khan',     'omar@example.com',   '2002-03-15'),
('Sara',    'Ahmed',    'sara@example.com',   '2001-07-22'),
('James',   'Lee',      'james@example.com',  '2003-01-10'),
('Priya',   'Nair',     'priya@example.com',  '2002-11-05'),
('Yusuf',   'Hassan',   'yusuf@example.com',  '2001-09-30');

INSERT INTO grades (student_id, course_id, grade, semester) VALUES
(1, 1, 88.5, 'Fall 2024'),
(1, 2, 75.0, 'Fall 2024'),
(1, 3, 91.0, 'Fall 2024'),
(2, 1, 95.0, 'Fall 2024'),
(2, 3, 82.0, 'Fall 2024'),
(2, 5, 78.5, 'Fall 2024'),
(3, 1, 60.0, 'Fall 2024'),
(3, 4, 55.0, 'Fall 2024'),
(4, 2, 88.0, 'Fall 2024'),
(4, 3, 93.5, 'Fall 2024'),
(4, 5, 85.0, 'Fall 2024'),
(5, 1, 72.0, 'Fall 2024'),
(5, 4, 68.0, 'Fall 2024');
