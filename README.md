# Student-Database
A beginner SQL project demonstrating schema design, joins, filtering, grouping, and normalization using a university student records system.

## Tables

```
instructors ──< courses ──< grades >── students
```

| Table | Description |
|---|---|
| `students` | Student personal info |
| `instructors` | Instructor info and department |
| `courses` | Course catalog, linked to an instructor |
| `grades` | Student–course–grade records |

## Skills Covered

- **Joins** — multi-table queries across all 4 tables
- **Filtering** — WHERE clauses and subqueries
- **Grouping** — AVG, COUNT, GROUP BY, ORDER BY
- **Normalization** — 3NF schema, no data duplication

## How to Run

1. Run `schema.sql` first — creates all tables
2. Run `seed.sql` — inserts sample data
3. Run any query from `queries.sql`

Tested on **PostgreSQL 15**. To try it online with no install: [db-fiddle.com](https://www.db-fiddle.com) → set database to PostgreSQL.

## Sample Queries

```sql
-- Average grade per student
SELECT s.first_name, ROUND(AVG(g.grade), 2) AS gpa
FROM grades g
JOIN students s ON s.student_id = g.student_id
GROUP BY s.student_id, s.first_name
ORDER BY gpa DESC;
```

## File Structure

```
student-database/
├── schema.sql    ← CREATE TABLE statements
├── seed.sql      ← Sample data
├── queries.sql   ← Practice queries + views
└── README.md
```
