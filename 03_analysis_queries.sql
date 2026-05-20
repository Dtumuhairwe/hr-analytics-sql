-- =====================================================================
-- HR Analytics SQL Project  |  03_analysis_queries.sql
-- 25 business questions, grouped Basic → Intermediate → Advanced.
-- Each query is preceded by the business question it answers.
-- Compatible with MySQL 8.x.
-- =====================================================================


-- =====================================================================
-- BASIC (SELECT, WHERE, ORDER BY, simple aggregates)
-- =====================================================================

-- Q1. How many employees does the company currently have?
-- (Active = no termination_date)
SELECT COUNT(*) AS active_headcount
FROM employees
WHERE termination_date IS NULL;


-- Q2. What is the headcount in each department?
SELECT  d.department_name,
        COUNT(e.employee_id) AS headcount
FROM    departments d
LEFT JOIN employees e
       ON e.department_id = d.department_id
      AND e.termination_date IS NULL
GROUP BY d.department_name
ORDER BY headcount DESC;


-- Q3. List all employees hired in 2023 or later, newest first.
SELECT  employee_id, first_name, last_name, job_title, hire_date
FROM    employees
WHERE   hire_date >= '2023-01-01'
ORDER BY hire_date DESC;


-- Q4. What is the gender split across the company?
SELECT  gender,
        COUNT(*)                                         AS employees,
        ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_total
FROM    employees
WHERE   termination_date IS NULL
GROUP BY gender;


-- Q5. What are the 10 highest base salaries in 2025?
SELECT  e.first_name, e.last_name, e.job_title, s.base_salary
FROM    employees e
JOIN    salaries  s ON s.employee_id = e.employee_id
WHERE   s.salary_year = 2025
ORDER BY s.base_salary DESC
LIMIT 10;


-- =====================================================================
-- INTERMEDIATE (JOINs, GROUP BY, HAVING, subqueries, CASE)
-- =====================================================================

-- Q6. Average base salary and total compensation per department (2025).
SELECT  d.department_name,
        ROUND(AVG(s.base_salary), 0)               AS avg_base_salary,
        ROUND(AVG(s.base_salary + s.bonus), 0)     AS avg_total_comp
FROM    departments d
JOIN    employees   e ON e.department_id = d.department_id
JOIN    salaries    s ON s.employee_id   = e.employee_id
WHERE   s.salary_year = 2025
GROUP BY d.department_name
ORDER BY avg_total_comp DESC;


-- Q7. Which departments have an average 2025 salary above the company-wide average?
SELECT  d.department_name,
        ROUND(AVG(s.base_salary), 0) AS dept_avg
FROM    departments d
JOIN    employees   e ON e.department_id = d.department_id
JOIN    salaries    s ON s.employee_id   = e.employee_id
WHERE   s.salary_year = 2025
GROUP BY d.department_name
HAVING  AVG(s.base_salary) > (
            SELECT AVG(base_salary) FROM salaries WHERE salary_year = 2025
        )
ORDER BY dept_avg DESC;


-- Q8. Gender pay gap: average base salary by gender, per department (2025).
SELECT  d.department_name,
        e.gender,
        COUNT(*)                       AS n,
        ROUND(AVG(s.base_salary), 0)   AS avg_base_salary
FROM    departments d
JOIN    employees   e ON e.department_id = d.department_id
JOIN    salaries    s ON s.employee_id   = e.employee_id
WHERE   s.salary_year = 2025
GROUP BY d.department_name, e.gender
ORDER BY d.department_name, e.gender;


-- Q9. Tenure of each currently-active employee (in whole years).
SELECT  employee_id,
        CONCAT(first_name, ' ', last_name)              AS full_name,
        hire_date,
        TIMESTAMPDIFF(YEAR, hire_date, CURRENT_DATE)    AS years_at_company
FROM    employees
WHERE   termination_date IS NULL
ORDER BY years_at_company DESC;


-- Q10. Show each employee with their manager's name.
SELECT  e.employee_id,
        CONCAT(e.first_name, ' ', e.last_name)  AS employee,
        e.job_title,
        CONCAT(m.first_name, ' ', m.last_name)  AS manager
FROM    employees e
LEFT JOIN employees m ON m.employee_id = e.manager_id
ORDER BY manager, employee;


-- Q11. Which managers have the most direct reports? (currently active)
SELECT  CONCAT(m.first_name, ' ', m.last_name) AS manager,
        m.job_title,
        COUNT(e.employee_id)                   AS direct_reports
FROM    employees m
JOIN    employees e
       ON e.manager_id = m.employee_id
      AND e.termination_date IS NULL
GROUP BY m.employee_id, m.first_name, m.last_name, m.job_title
ORDER BY direct_reports DESC;


-- Q12. Annual headcount (active employees at end of each year, 2022-2025).
SELECT  yr.year_val                                       AS year,
        SUM(CASE
                WHEN e.hire_date <= CONCAT(yr.year_val, '-12-31')
                 AND (e.termination_date IS NULL
                      OR e.termination_date > CONCAT(yr.year_val, '-12-31'))
                THEN 1 ELSE 0
            END) AS headcount_eoy
FROM    (SELECT 2022 AS year_val UNION ALL
         SELECT 2023 UNION ALL
         SELECT 2024 UNION ALL
         SELECT 2025) yr
CROSS JOIN employees e
GROUP BY yr.year_val
ORDER BY yr.year_val;


-- Q13. Attrition rate by year (terminations in year / headcount at start of year).
SELECT  yr.year_val AS year,
        SUM(CASE
              WHEN YEAR(e.termination_date) = yr.year_val THEN 1 ELSE 0 END) AS terminations,
        SUM(CASE
              WHEN e.hire_date < CONCAT(yr.year_val, '-01-01')
               AND (e.termination_date IS NULL
                    OR e.termination_date >= CONCAT(yr.year_val, '-01-01'))
              THEN 1 ELSE 0 END) AS headcount_start_of_year,
        ROUND(100.0 *
              SUM(CASE WHEN YEAR(e.termination_date) = yr.year_val THEN 1 ELSE 0 END) /
              NULLIF(SUM(CASE
                          WHEN e.hire_date < CONCAT(yr.year_val, '-01-01')
                           AND (e.termination_date IS NULL
                                OR e.termination_date >= CONCAT(yr.year_val, '-01-01'))
                          THEN 1 ELSE 0 END), 0),
              1) AS attrition_pct
FROM    (SELECT 2023 AS year_val UNION ALL
         SELECT 2024 UNION ALL
         SELECT 2025) yr
CROSS JOIN employees e
GROUP BY yr.year_val
ORDER BY yr.year_val;


-- Q14. Top performers — anyone who received a 5-rating in BOTH 2023 and 2024.
SELECT  e.employee_id,
        CONCAT(e.first_name, ' ', e.last_name) AS full_name,
        e.job_title,
        d.department_name
FROM    employees e
JOIN    departments d ON d.department_id = e.department_id
WHERE   e.employee_id IN (SELECT employee_id FROM performance_reviews WHERE review_year = 2023 AND rating = 5)
  AND   e.employee_id IN (SELECT employee_id FROM performance_reviews WHERE review_year = 2024 AND rating = 5)
ORDER BY d.department_name, full_name;


-- Q15. Project staffing — how many people, and total hours logged, per project.
SELECT  p.project_name,
        d.department_name,
        COUNT(ep.employee_id)        AS people_on_project,
        SUM(ep.hours_logged)         AS total_hours_logged,
        p.budget
FROM    projects p
JOIN    departments d        ON d.department_id = p.department_id
LEFT JOIN employee_projects ep ON ep.project_id = p.project_id
GROUP BY p.project_id, p.project_name, d.department_name, p.budget
ORDER BY total_hours_logged DESC;


-- Q16. Salary band classification (2025).
SELECT  CONCAT(e.first_name, ' ', e.last_name) AS full_name,
        s.base_salary,
        CASE
            WHEN s.base_salary < 70000  THEN 'Entry-Level'
            WHEN s.base_salary < 110000 THEN 'Mid-Level'
            WHEN s.base_salary < 160000 THEN 'Senior'
            ELSE                              'Executive'
        END AS salary_band
FROM    employees e
JOIN    salaries  s ON s.employee_id = e.employee_id
WHERE   s.salary_year = 2025
ORDER BY s.base_salary DESC;


-- Q17. Headcount distribution across salary bands (2025).
SELECT  band,
        COUNT(*) AS employees
FROM (
    SELECT CASE
             WHEN base_salary < 70000  THEN 'Entry-Level'
             WHEN base_salary < 110000 THEN 'Mid-Level'
             WHEN base_salary < 160000 THEN 'Senior'
             ELSE                           'Executive'
           END AS band
    FROM   salaries
    WHERE  salary_year = 2025
) t
GROUP BY band
ORDER BY FIELD(band, 'Entry-Level','Mid-Level','Senior','Executive');


-- =====================================================================
-- ADVANCED (CTEs, Window Functions, Self-joins, Multi-step logic)
-- =====================================================================

-- Q18. Rank employees by 2025 total comp within each department.
WITH comp_2025 AS (
    SELECT  e.employee_id,
            e.first_name, e.last_name,
            d.department_name,
            (s.base_salary + s.bonus) AS total_comp
    FROM    employees e
    JOIN    departments d ON d.department_id = e.department_id
    JOIN    salaries  s   ON s.employee_id   = e.employee_id
    WHERE   s.salary_year = 2025
)
SELECT  department_name,
        first_name, last_name,
        total_comp,
        RANK() OVER (PARTITION BY department_name ORDER BY total_comp DESC) AS dept_rank
FROM    comp_2025
ORDER BY department_name, dept_rank;


-- Q19. Year-over-year salary change for each employee.
WITH s AS (
    SELECT  employee_id, salary_year, base_salary,
            LAG(base_salary) OVER (PARTITION BY employee_id ORDER BY salary_year) AS prev_year_salary
    FROM    salaries
)
SELECT  e.employee_id,
        CONCAT(e.first_name, ' ', e.last_name) AS full_name,
        s.salary_year,
        s.prev_year_salary,
        s.base_salary,
        s.base_salary - s.prev_year_salary                                                   AS yoy_change,
        ROUND(100.0 * (s.base_salary - s.prev_year_salary) / NULLIF(s.prev_year_salary, 0), 1) AS yoy_pct
FROM    s
JOIN    employees e ON e.employee_id = s.employee_id
WHERE   s.prev_year_salary IS NOT NULL
ORDER BY yoy_pct DESC;


-- Q20. Running total of new hires per department, by hire year.
WITH hires AS (
    SELECT  d.department_name,
            YEAR(e.hire_date) AS hire_year,
            COUNT(*)          AS hires_in_year
    FROM    employees e
    JOIN    departments d ON d.department_id = e.department_id
    GROUP BY d.department_name, YEAR(e.hire_date)
)
SELECT  department_name,
        hire_year,
        hires_in_year,
        SUM(hires_in_year) OVER (
            PARTITION BY department_name
            ORDER BY hire_year
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_hires
FROM    hires
ORDER BY department_name, hire_year;


-- Q21. Top 3 highest-paid employees per department (2025) — DENSE_RANK on total comp.
WITH ranked AS (
    SELECT  d.department_name,
            CONCAT(e.first_name, ' ', e.last_name)        AS full_name,
            (s.base_salary + s.bonus)                     AS total_comp,
            DENSE_RANK() OVER (
                PARTITION BY d.department_name
                ORDER BY (s.base_salary + s.bonus) DESC
            ) AS rk
    FROM    employees   e
    JOIN    departments d ON d.department_id = e.department_id
    JOIN    salaries    s ON s.employee_id   = e.employee_id
    WHERE   s.salary_year = 2025
)
SELECT department_name, full_name, total_comp, rk
FROM   ranked
WHERE  rk <= 3
ORDER BY department_name, rk;


-- Q22. Employees who earn ABOVE their department's median 2025 salary.
WITH ranked AS (
    SELECT  e.employee_id,
            CONCAT(e.first_name, ' ', e.last_name) AS full_name,
            d.department_name,
            s.base_salary,
            PERCENT_RANK() OVER (PARTITION BY d.department_name ORDER BY s.base_salary) AS pr
    FROM    employees   e
    JOIN    departments d ON d.department_id = e.department_id
    JOIN    salaries    s ON s.employee_id   = e.employee_id
    WHERE   s.salary_year = 2025
)
SELECT  department_name, full_name, base_salary, ROUND(pr, 2) AS percentile_rank
FROM    ranked
WHERE   pr >= 0.5
ORDER BY department_name, base_salary DESC;


-- Q23. Average rating per manager — who develops their team best?
SELECT  CONCAT(m.first_name, ' ', m.last_name)        AS manager,
        COUNT(DISTINCT pr.employee_id)                AS reports_reviewed,
        ROUND(AVG(pr.rating), 2)                      AS avg_team_rating
FROM    employees           m
JOIN    employees           e  ON e.manager_id = m.employee_id
JOIN    performance_reviews pr ON pr.employee_id = e.employee_id
GROUP BY m.employee_id, m.first_name, m.last_name
HAVING  COUNT(DISTINCT pr.employee_id) >= 2
ORDER BY avg_team_rating DESC;


-- Q24. Tenure cohort vs. average performance — do longer-tenured employees rate higher?
WITH tenure AS (
    SELECT  e.employee_id,
            CASE
                WHEN TIMESTAMPDIFF(YEAR, e.hire_date, CURRENT_DATE) < 2 THEN '0-1 years'
                WHEN TIMESTAMPDIFF(YEAR, e.hire_date, CURRENT_DATE) < 4 THEN '2-3 years'
                WHEN TIMESTAMPDIFF(YEAR, e.hire_date, CURRENT_DATE) < 6 THEN '4-5 years'
                ELSE                                                         '6+ years'
            END AS tenure_band
    FROM    employees e
    WHERE   e.termination_date IS NULL
)
SELECT  t.tenure_band,
        COUNT(DISTINCT t.employee_id) AS employees,
        ROUND(AVG(pr.rating), 2)      AS avg_rating
FROM    tenure t
LEFT JOIN performance_reviews pr ON pr.employee_id = t.employee_id
GROUP BY t.tenure_band
ORDER BY FIELD(t.tenure_band, '0-1 years','2-3 years','4-5 years','6+ years');


-- Q25. Flight-risk shortlist:
--      Active employees whose 2024 rating was >= 4 AND whose 2024->2025 raise was <5%.
--      These are high performers who may feel under-rewarded.
WITH last_rating AS (
    SELECT employee_id, rating
    FROM   performance_reviews
    WHERE  review_year = 2024
),
raise AS (
    SELECT  s2024.employee_id,
            s2024.base_salary AS salary_2024,
            s2025.base_salary AS salary_2025,
            ROUND(100.0 * (s2025.base_salary - s2024.base_salary) / s2024.base_salary, 1) AS raise_pct
    FROM    salaries s2024
    JOIN    salaries s2025
           ON s2025.employee_id = s2024.employee_id
          AND s2024.salary_year = 2024
          AND s2025.salary_year = 2025
)
SELECT  e.employee_id,
        CONCAT(e.first_name, ' ', e.last_name) AS full_name,
        d.department_name,
        lr.rating          AS rating_2024,
        r.salary_2024,
        r.salary_2025,
        r.raise_pct
FROM    employees   e
JOIN    departments d  ON d.department_id = e.department_id
JOIN    last_rating lr ON lr.employee_id  = e.employee_id
JOIN    raise       r  ON r.employee_id   = e.employee_id
WHERE   e.termination_date IS NULL
  AND   lr.rating  >= 4
  AND   r.raise_pct < 5.0
ORDER BY r.raise_pct ASC, lr.rating DESC;
