-- =====================================================================
-- HR Analytics SQL Project | 02_seed_data.sql
-- Populates the database with realistic sample data.
-- Run AFTER 01_schema.sql.
-- =====================================================================

-- ---------------------------------------------------------------------
-- Department records
-- ---------------------------------------------------------------------
INSERT INTO departments (department_id, department_name, location, annual_budget) VALUES
(1, 'Engineering',      'San Francisco', 4500000.00),
(2, 'Sales',            'New York',      3200000.00),
(3, 'Marketing',        'Chicago',       1800000.00),
(4, 'Human Resources',  'Austin',         900000.00),
(5, 'Finance',          'Boston',        1500000.00),
(6, 'Customer Support', 'Remote',        1200000.00);

-- ---------------------------------------------------------------------
-- Employee records
-- ---------------------------------------------------------------------
INSERT INTO employees
(employee_id, first_name, last_name, gender, email, hire_date,
termination_date, job_title, department_id, manager_id)
VALUES

-- Engineering
(1, 'Sarah',  'Chen',     'Female', 'sarah.chen@company.com',      '2018-03-15', NULL,         'VP Engineering',           1, NULL),
(2, 'Marcus', 'Johnson',  'Male',   'marcus.johnson@company.com',  '2019-06-01', NULL,         'Engineering Manager',      1, 1),
(3, 'Priya',  'Patel',    'Female', 'priya.patel@company.com',     '2020-08-20', NULL,         'Senior Software Engineer', 1, 2),
(4, 'David',  'Kim',      'Male',   'david.kim@company.com',       '2021-02-10', NULL,         'Software Engineer',        1, 2),
(5, 'Aisha',  'Williams', 'Female', 'aisha.williams@company.com',  '2022-09-05', NULL,         'Software Engineer',        1, 2),
(6, 'James',  'OConnor',  'Male',   'james.oconnor@company.com',   '2023-04-18', NULL,         'Junior Engineer',          1, 2),
(7, 'Lin',    'Wei',      'Female', 'lin.wei@company.com',         '2021-11-22', '2024-08-30', 'Software Engineer',       1, 2),
(8, 'Carlos', 'Mendoza',  'Male',   'carlos.mendoza@company.com',  '2024-01-15', NULL,         'Junior Engineer',          1, 2),

-- Sales
(9,  'Robert',  'Taylor',    'Male',   'robert.taylor@company.com',   '2018-07-01', NULL,         'VP Sales',                 2, NULL),
(10, 'Emily',   'Rodriguez', 'Female', 'emily.rodriguez@company.com', '2019-09-12', NULL,         'Sales Manager',            2, 9),
(11, 'Michael', 'Brown',     'Male',   'michael.brown@company.com',   '2020-03-25', NULL,         'Senior Account Executive', 2, 10),
(12, 'Jessica', 'Lee',       'Female', 'jessica.lee@company.com',     '2021-05-14', NULL,         'Account Executive',        2, 10),
(13, 'Daniel',  'Garcia',    'Male',   'daniel.garcia@company.com',   '2022-08-19', NULL,         'Account Executive',        2, 10),
(14, 'Sophia',  'Martinez',  'Female', 'sophia.martinez@company.com', '2023-11-02', NULL,         'Sales Development Rep',    2, 10),
(15, 'Kevin',   'Park',      'Male',   'kevin.park@company.com',      '2020-10-08', '2023-12-15', 'Account Executive',       2, 10);

-- ---------------------------------------------------------------------
-- Compensation records
-- ---------------------------------------------------------------------
INSERT INTO salaries
(salary_id, employee_id, salary_year, base_salary, bonus)
VALUES

(1, 1, 2023, 215000, 40000),
(2, 1, 2024, 225000, 45000),
(3, 1, 2025, 235000, 50000),

(4, 2, 2023, 145000, 22000),
(5, 2, 2024, 152000, 25000),
(6, 2, 2025, 160000, 28000),

(7, 3, 2023, 115000, 13000),
(8, 3, 2024, 122000, 15000),
(9, 3, 2025, 128000, 16000);

-- ---------------------------------------------------------------------
-- Performance review records
-- ---------------------------------------------------------------------
INSERT INTO performance_reviews
(review_id, employee_id, review_year, rating, comments)
VALUES

(1, 1, 2023, 5, 'Outstanding leadership of engineering organization.'),
(2, 2, 2023, 4, 'Strong manager who delivers consistently.'),
(3, 3, 2023, 5, 'Exceptional technical work and mentorship.'),
(4, 4, 2023, 4, 'Reliable engineer who meets expectations.');

-- ---------------------------------------------------------------------
-- Project records
-- ---------------------------------------------------------------------
INSERT INTO projects
(project_id, project_name, department_id, start_date, end_date, budget)
VALUES

(1, 'Project Atlas (Platform Rebuild)', 1, '2023-01-15', '2024-06-30', 500000),
(2, 'Mobile App Redesign',              1, '2024-03-01', NULL,         750000),
(3, 'Q4 Enterprise Sales Campaign',     2, '2024-09-01', '2024-12-31', 200000);

-- ---------------------------------------------------------------------
-- Employee project assignments
-- ---------------------------------------------------------------------
INSERT INTO employee_projects
(employee_id, project_id, role_on_project, hours_logged)
VALUES

(2, 1, 'Tech Lead',         1200),
(3, 1, 'Senior Engineer',   1500),
(4, 1, 'Engineer',          1300),

(2, 2, 'Engineering Manager', 600),
(3, 2, 'Tech Lead',          1100),
(5, 2, 'Engineer',            950),

(10, 3, 'Campaign Lead',      400),
(11, 3, 'Account Executive',  350),
(12, 3, 'Account Executive',  300);
