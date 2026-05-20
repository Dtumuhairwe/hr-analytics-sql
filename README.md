# HR Analytics SQL Project

A portfolio SQL project that uses a realistic HR database to answer the kinds of business questions a Data Analyst, BI Analyst, or Junior Data Scientist gets asked on day one: *How many people work here? Who's leaving? Are we paying fairly? Who are our top performers?*

The project is intentionally scoped for a recent graduate — no exotic syntax, no oversized schemas — but it covers everything a hiring manager wants to see: schema design, joins, aggregation, subqueries, CTEs, and window functions.

---

## What's inside

| File | Purpose |
|---|---|
| `01_schema.sql` | `CREATE TABLE` statements for 6 related tables, with primary and foreign keys. |
| `02_seed_data.sql` | Realistic sample data: 6 departments, 40 employees (active + terminated), 3 years of salaries, 2 years of performance reviews, 8 projects, 31 project assignments. |
| `03_analysis_queries.sql` | 25 business questions, grouped Basic → Intermediate → Advanced, with the question stated above each query. |
| `HR_Analytics_Dashboard.xlsx` | Excel summary dashboard with the key results as tables and charts. |

---

## Database schema

```
+---------------+        +--------------------+        +----------------------+
| departments   |<------>|     employees      |<------>|  performance_reviews |
+---------------+   FK   +--------------------+   FK   +----------------------+
| department_id |        | employee_id (PK)   |        | review_id (PK)       |
| department_   |        | first_name         |        | employee_id (FK)     |
|   name        |        | last_name          |        | review_year          |
| location      |        | gender             |        | rating (1-5)         |
| annual_budget |        | hire_date          |        +----------------------+
+---------------+        | termination_date   |
        ^                | job_title          |        +----------------------+
        |                | department_id (FK) |        |      salaries        |
        |                | manager_id (FK ↺)  |        +----------------------+
        |                +--------------------+        | salary_id (PK)       |
        |                          |                   | employee_id (FK)     |
        |                          |                   | salary_year          |
        |                          |                   | base_salary, bonus   |
+----------------+                 |                   +----------------------+
|   projects     |                 |
+----------------+        +---------------------+
| project_id     |<------>|  employee_projects  |
| project_name   |   FK   +---------------------+
| department_id  |        | employee_id (FK)    |
| start_date     |        | project_id (FK)     |
| end_date       |        | role_on_project     |
| budget         |        | hours_logged        |
+----------------+        +---------------------+
```

The `manager_id` field in `employees` self-references `employee_id`, giving us a real organizational hierarchy to query.

---

## Tech stack

- **MySQL 8.x** (queries also run on MariaDB 10.x with no changes)
- Standard `INFORMATION_SCHEMA` and built-in functions — no external extensions
- Excel for the dashboard layer

---

## How to run it

1. Create an empty database in your MySQL client (MySQL Workbench, DBeaver, command line, etc.):

   ```sql
   CREATE DATABASE hr_analytics;
   USE hr_analytics;
   ```

2. Run the scripts in order:

   ```bash
   mysql -u <user> -p hr_analytics < 01_schema.sql
   mysql -u <user> -p hr_analytics < 02_seed_data.sql
   mysql -u <user> -p hr_analytics < 03_analysis_queries.sql
   ```

3. Open `HR_Analytics_Dashboard.xlsx` to see the headline metrics rendered as charts.

---

## The 25 business questions

### Basic (Q1 – Q5)
1. How many employees does the company currently have?
2. What is the headcount in each department?
3. List all employees hired in 2023 or later.
4. What is the gender split across the company?
5. Top 10 highest base salaries in 2025.

### Intermediate (Q6 – Q17)
6. Average base salary and total compensation per department.
7. Which departments pay above the company-wide average?
8. Gender pay gap by department.
9. Tenure of each currently-active employee.
10. Each employee paired with their manager.
11. Which managers have the most direct reports?
12. Annual headcount (active employees at end of each year, 2022–2025).
13. Attrition rate by year.
14. Two-time top performers (rating = 5 in both 2023 and 2024).
15. Project staffing — people and hours per project.
16. Salary band classification per employee.
17. Headcount distribution across salary bands.

### Advanced (Q18 – Q25)
18. Rank employees by 2025 total comp within each department (`RANK() OVER`).
19. Year-over-year salary change per employee (`LAG`).
20. Running total of new hires per department by year.
21. Top 3 highest-paid employees per department (`DENSE_RANK`).
22. Employees earning above their department's median salary (`PERCENT_RANK`).
23. Average rating per manager — who develops their team best?
24. Tenure cohort vs. average performance rating.
25. **Flight-risk shortlist** — high performers (rating ≥ 4 in 2024) who got <5% raise into 2025.

---

## Key insights from the sample data

These are the headline numbers an analyst would present to leadership:

- **Headcount.** 36 active employees across 6 departments. Customer Support (9) and Engineering (7) are the largest.
- **Compensation.** Engineering and Finance carry the highest average total comp; Customer Support sits lowest, as expected.
- **Gender pay.** Average base salaries by gender are within a few percent in most departments — but the spread widens in roles with very few people, which is the right caveat to call out.
- **Attrition.** Annualized attrition has been in the 5–8% range; not alarming, but worth watching by team.
- **Top performers.** A small group of employees rated 5/5 in both 2023 and 2024 — these are obvious promotion candidates.
- **Flight risk (Q25).** A handful of high-performing employees received raises under 5% into 2025 — the kind of list HR can act on this quarter.

---

## What this project demonstrates

| Skill | Where to look |
|---|---|
| Schema design (PK/FK, self-reference, junction table) | `01_schema.sql` |
| Realistic data modeling | `02_seed_data.sql` |
| `JOIN`, `LEFT JOIN`, multi-table queries | Q2, Q6, Q10, Q15 |
| Aggregation, `GROUP BY`, `HAVING` | Q6, Q7, Q8 |
| Subqueries (IN, scalar) | Q7, Q14 |
| `CASE` expressions for bucketing | Q16, Q17, Q24 |
| CTEs (`WITH ... AS`) | Q18 – Q25 |
| Window functions (`RANK`, `DENSE_RANK`, `LAG`, `PERCENT_RANK`, running totals) | Q18 – Q22 |
| Self-joins for org hierarchy | Q10, Q11, Q23 |
| Business judgment in query design | Q13 (attrition formula), Q25 (flight risk) |

---

## Author

**Doreen Tumuhairwe** — Recent graduate, aspiring Data Analyst.
Feedback welcome.
