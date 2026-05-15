-- ============================================================
--  SCHEMA  —  run this file first
-- ============================================================

CREATE TABLE instructors (
    instructor_id   SERIAL          PRIMARY KEY,
    first_name      VARCHAR(50)     NOT NULL,
    last_name       VARCHAR(50)     NOT NULL,
    email           VARCHAR(100)    UNIQUE NOT NULL,
    department      VARCHAR(100)
);

CREATE TABLE courses (
    course_id       SERIAL          PRIMARY KEY,
    course_code     VARCHAR(10)     UNIQUE NOT NULL,
    title           VARCHAR(100)    NOT NULL,
    credits         SMALLINT        NOT NULL CHECK (credits BETWEEN 1 AND 6),
    instructor_id   INT             REFERENCES instructors(instructor_id)
);

CREATE TABLE students (
    student_id      SERIAL          PRIMARY KEY,
    first_name      VARCHAR(50)     NOT NULL,
    last_name       VARCHAR(50)     NOT NULL,
    email           VARCHAR(100)    UNIQUE NOT NULL,
    date_of_birth   DATE,
    enrolled_on     DATE            DEFAULT CURRENT_DATE
);

CREATE TABLE grades (
    grade_id        SERIAL          PRIMARY KEY,
    student_id      INT             NOT NULL REFERENCES students(student_id)  ON DELETE CASCADE,
    course_id       INT             NOT NULL REFERENCES courses(course_id)    ON DELETE CASCADE,
    grade           NUMERIC(4,2)    CHECK (grade BETWEEN 0 AND 100),
    semester        VARCHAR(20),
    UNIQUE (student_id, course_id, semester)
);
