-- =====================================================================
-- HR Analytics SQL Project  |  01_schema.sql
-- Author: Doreen Tumuhairwe
-- Database: MySQL 8.x  (also runs on MariaDB / SQLite with minor tweaks)
-- Purpose: Define the HR database schema used for analytics queries.
-- =====================================================================

-- Clean slate (safe to rerun)
DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS performance_reviews;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- ---------------------------------------------------------------------
-- DEPARTMENTS
-- ---------------------------------------------------------------------
CREATE TABLE departments (
    department_id     INT             PRIMARY KEY,
    department_name   VARCHAR(60)     NOT NULL UNIQUE,
    location          VARCHAR(60)     NOT NULL,
    annual_budget     DECIMAL(12, 2)  NOT NULL
);

-- ---------------------------------------------------------------------
-- EMPLOYEES
-- ---------------------------------------------------------------------
CREATE TABLE employees (
    employee_id       INT             PRIMARY KEY,
    first_name        VARCHAR(40)     NOT NULL,
    last_name         VARCHAR(40)     NOT NULL,
    gender            CHAR(1)         NOT NULL,            -- 'M' / 'F'
    email             VARCHAR(120)    NOT NULL UNIQUE,
    hire_date         DATE            NOT NULL,
    termination_date  DATE            NULL,                -- NULL = still active
    job_title         VARCHAR(60)     NOT NULL,
    department_id     INT             NOT NULL,
    manager_id        INT             NULL,                -- self-reference for org chart
    CONSTRAINT fk_emp_department  FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT fk_emp_manager     FOREIGN KEY (manager_id)    REFERENCES employees(employee_id)
);

-- ---------------------------------------------------------------------
-- SALARIES  (one row = the salary an employee earned in a given year)
-- ---------------------------------------------------------------------
CREATE TABLE salaries (
    salary_id         INT             PRIMARY KEY,
    employee_id       INT             NOT NULL,
    salary_year       INT             NOT NULL,
    base_salary       DECIMAL(10, 2)  NOT NULL,
    bonus             DECIMAL(10, 2)  NOT NULL DEFAULT 0,
    CONSTRAINT fk_sal_employee FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- ---------------------------------------------------------------------
-- PERFORMANCE REVIEWS  (annual rating 1-5)
-- ---------------------------------------------------------------------
CREATE TABLE performance_reviews (
    review_id         INT             PRIMARY KEY,
    employee_id       INT             NOT NULL,
    review_year       INT             NOT NULL,
    rating            INT             NOT NULL,            -- 1 (low) ... 5 (top)
    comments          VARCHAR(255)    NULL,
    CONSTRAINT fk_rev_employee FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- ---------------------------------------------------------------------
-- PROJECTS
-- ---------------------------------------------------------------------
CREATE TABLE projects (
    project_id        INT             PRIMARY KEY,
    project_name      VARCHAR(80)     NOT NULL,
    department_id     INT             NOT NULL,
    start_date        DATE            NOT NULL,
    end_date          DATE            NULL,                -- NULL = ongoing
    budget            DECIMAL(10, 2)  NOT NULL,
    CONSTRAINT fk_proj_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- ---------------------------------------------------------------------
-- EMPLOYEE_PROJECTS  (many-to-many junction)
-- ---------------------------------------------------------------------
CREATE TABLE employee_projects (
    employee_id       INT             NOT NULL,
    project_id        INT             NOT NULL,
    role_on_project   VARCHAR(40)     NOT NULL,
    hours_logged      INT             NOT NULL DEFAULT 0,
    PRIMARY KEY (employee_id, project_id),
    CONSTRAINT fk_ep_employee FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_ep_project  FOREIGN KEY (project_id)  REFERENCES projects(project_id)
);
