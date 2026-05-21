# HR Analytics SQL Project

SQL portfolio project built around a realistic HR database covering employee records, salaries, performance reviews, departments, and projects.

The goal of the project is to answer common business questions about workforce analytics, compensation, attrition, performance, and project staffing.

The project includes schema design, realistic seed data, and business-focused SQL queries using joins, aggregations, CTEs, and window functions.

---

## What's inside

| File | Purpose |
|---|---|
| `01_schema.sql` | `CREATE TABLE` statements for 6 related tables, with primary and foreign keys. |
| `02_seed_data.sql` | Realistic sample data: 6 departments, 40 employees (active + terminated), 3 years of salaries, 2 years of performance reviews, 8 projects, 31 project assignments. |
| `03_analysis_queries.sql` | 25 business questions, from simple headcount through window-function analytics, with the question stated above each query. |
| `HR_Analytics_Dashboard.xlsx` | Excel summary dashboard with the key results as tables and charts. |
| `insights.md` | Short read-through of what the queries surface, in analyst voice. |

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

## Example analysis areas

- Workforce headcount and hiring trends
- Compensation and pay distribution
- Attrition analysis
- Performance and promotion analysis
- Manager/team reporting
- Project staffing analysis
- Flight-risk identification
- Salary progression and ranking analysis

---

## Key insights from the sample data

These are the headline numbers an analyst would present to leadership:

- **Headcount.** 36 active employees across 6 departments. Customer Support (9) and Engineering (7) are the largest.
- **Compensation.** Sales has the highest average total comp in 2025 at about $163k (commission carries most of it), followed by Finance ($158k), HR ($155k), and Engineering ($144k). Customer Support sits lowest at $95k.
- **Gender pay.** Average base salaries by gender are within a few percent in most departments — but the spread widens in roles with very few people, which is the right caveat to call out.
- **Attrition.** 3.3% in 2023, ticked up to 8.3% in 2024 (three terminations), and 0% so far in 2025. The 2024 exits spanned three different teams, so no single department is bleeding people.
- **Top performers.** Nine employees rated 5/5 in both 2023 and 2024 — the obvious promotion and retention priorities.
- **Flight risk (Q25).** Nine high performers got raises under 5% into 2025. The five most exposed got between 2.1% and 3.0% — exactly the kind of list HR can act on this quarter.

Full read-through in [`insights.md`](./insights.md).

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

**Doreen Tumuhairwe** 

Email: doreentumuhairwe143@gmail.com
