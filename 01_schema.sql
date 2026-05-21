-- HR Analytics SQL Project | 01_schema.sql
-- Author: Doreen Tumuhairwe
-- Database: MySQL 8.x
-- Purpose: Normalized HR analytics schema for employee, salary,
--          performance, department, and project analysis.

DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS performance_reviews;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Departments
CREATE TABLE departments (
    department_id      INT AUTO_INCREMENT PRIMARY KEY,
    department_name    VARCHAR(60) NOT NULL UNIQUE,
    location           VARCHAR(60) NOT NULL,
    annual_budget      DECIMAL(12, 2) NOT NULL,
    CONSTRAINT chk_department_budget CHECK (annual_budget > 0)
);

-- Employees
CREATE TABLE employees (
    employee_id        INT AUTO_INCREMENT PRIMARY KEY,
    first_name         VARCHAR(40) NOT NULL,
    last_name          VARCHAR(40) NOT NULL,
    gender             ENUM('Male', 'Female', 'Other', 'Prefer not to say') NOT NULL,
    email              VARCHAR(120) NOT NULL UNIQUE,
    hire_date          DATE NOT NULL,
    termination_date   DATE NULL,
    job_title          VARCHAR(60) NOT NULL,
    department_id      INT NOT NULL,
    manager_id         INT NULL,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON UPDATE CASCADE,
    CONSTRAINT fk_employee_manager
        FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT chk_employee_dates
        CHECK (termination_date IS NULL OR termination_date >= hire_date)
);

-- Salaries
CREATE TABLE salaries (
    salary_id          INT AUTO_INCREMENT PRIMARY KEY,
    employee_id        INT NOT NULL,
    salary_year        YEAR NOT NULL,
    base_salary        DECIMAL(10, 2) NOT NULL,
    bonus              DECIMAL(10, 2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_salary_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_employee_salary_year UNIQUE (employee_id, salary_year),
    CONSTRAINT chk_salary_amounts CHECK (base_salary > 0 AND bonus >= 0)
);

-- Performance reviews
CREATE TABLE performance_reviews (
    review_id          INT AUTO_INCREMENT PRIMARY KEY,
    employee_id        INT NOT NULL,
    review_year        YEAR NOT NULL,
    rating             INT NOT NULL,
    comments           VARCHAR(255) NULL,
    CONSTRAINT fk_review_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_employee_review_year UNIQUE (employee_id, review_year),
    CONSTRAINT chk_review_rating CHECK (rating BETWEEN 1 AND 5)
);

-- Projects
CREATE TABLE projects (
    project_id         INT AUTO_INCREMENT PRIMARY KEY,
    project_name       VARCHAR(80) NOT NULL,
    department_id      INT NOT NULL,
    start_date         DATE NOT NULL,
    end_date           DATE NULL,
    budget             DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_project_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON UPDATE CASCADE,
    CONSTRAINT chk_project_dates CHECK (end_date IS NULL OR end_date >= start_date),
    CONSTRAINT chk_project_budget CHECK (budget > 0)
);

-- Employee-project assignments
CREATE TABLE employee_projects (
    employee_id        INT NOT NULL,
    project_id         INT NOT NULL,
    role_on_project    VARCHAR(40) NOT NULL,
    hours_logged       INT NOT NULL DEFAULT 0,
    PRIMARY KEY (employee_id, project_id),
    CONSTRAINT fk_employee_project_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_employee_project_project
        FOREIGN KEY (project_id) REFERENCES projects(project_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_hours_logged CHECK (hours_logged >= 0)
);

-- Indexes for common analytics queries
CREATE INDEX idx_employees_department      ON employees(department_id);
CREATE INDEX idx_employees_manager         ON employees(manager_id);
CREATE INDEX idx_salaries_employee_year    ON salaries(employee_id, salary_year);
CREATE INDEX idx_reviews_employee_year     ON performance_reviews(employee_id, review_year);
CREATE INDEX idx_projects_department       ON projects(department_id);
CREATE INDEX idx_employee_projects_project ON employee_projects(project_id);
