-- HR Analytics SQL Project | 02_seed_data.sql
-- Sample data for a fictional 40-person company across 6 departments.
-- Run after 01_schema.sql.

-- Departments
INSERT INTO departments (department_id, department_name, location, annual_budget) VALUES
(1, 'Engineering',      'San Francisco', 4500000.00),
(2, 'Sales',            'New York',      3200000.00),
(3, 'Marketing',        'Chicago',       1800000.00),
(4, 'Human Resources',  'Austin',         900000.00),
(5, 'Finance',          'Boston',        1500000.00),
(6, 'Customer Support', 'Remote',        1200000.00);

-- Employees

INSERT INTO employees
(employee_id, first_name, last_name, gender, email, hire_date,
 termination_date, job_title, department_id, manager_id)
VALUES
-- Engineering (dept 1)
(1,  'Sarah',  'Chen',     'Female', 'sarah.chen@company.com',     '2018-03-15', NULL,         'VP Engineering',           1, NULL),
(2,  'Marcus', 'Johnson',  'Male',   'marcus.johnson@company.com', '2019-06-01', NULL,         'Engineering Manager',      1, 1),
(3,  'Priya',  'Patel',    'Female', 'priya.patel@company.com',    '2020-08-20', NULL,         'Senior Software Engineer', 1, 2),
(4,  'David',  'Kim',      'Male',   'david.kim@company.com',      '2021-02-10', NULL,         'Software Engineer',        1, 2),
(5,  'Aisha',  'Williams', 'Female', 'aisha.williams@company.com', '2022-09-05', NULL,         'Software Engineer',        1, 2),
(6,  'James',  'OConnor',  'Male',   'james.oconnor@company.com',  '2023-04-18', NULL,         'Junior Engineer',          1, 2),
(7,  'Lin',    'Wei',      'Female', 'lin.wei@company.com',        '2021-11-22', '2024-08-30', 'Software Engineer',        1, 2),
(8,  'Carlos', 'Mendoza',  'Male',   'carlos.mendoza@company.com', '2024-01-15', NULL,         'Junior Engineer',          1, 2),

-- Sales (dept 2)
(9,  'Robert',  'Taylor',    'Male',   'robert.taylor@company.com',   '2018-07-01', NULL,         'VP Sales',                 2, NULL),
(10, 'Emily',   'Rodriguez', 'Female', 'emily.rodriguez@company.com', '2019-09-12', NULL,         'Sales Manager',            2, 9),
(11, 'Michael', 'Brown',     'Male',   'michael.brown@company.com',   '2020-03-25', NULL,         'Senior Account Executive', 2, 10),
(12, 'Jessica', 'Lee',       'Female', 'jessica.lee@company.com',     '2021-05-14', NULL,         'Account Executive',        2, 10),
(13, 'Daniel',  'Garcia',    'Male',   'daniel.garcia@company.com',   '2022-08-19', NULL,         'Account Executive',        2, 10),
(14, 'Sophia',  'Martinez',  'Female', 'sophia.martinez@company.com', '2023-11-02', NULL,         'Sales Development Rep',    2, 10),
(15, 'Kevin',   'Park',      'Male',   'kevin.park@company.com',      '2020-10-08', '2023-12-15', 'Account Executive',        2, 10),

-- Customer Support (dept 6)
(16, 'Linda',   'Foster',  'Female', 'linda.foster@company.com',  '2018-11-04', NULL,         'Director of Support',         6, NULL),
(17, 'Tomas',   'Silva',   'Male',   'tomas.silva@company.com',   '2019-08-19', NULL,         'Support Manager',             6, 16),
(18, 'Rachel',  'Green',   'Female', 'rachel.green@company.com',  '2020-05-11', NULL,         'Senior Support Specialist',   6, 17),
(19, 'Marcus',  'Lee',     'Male',   'marcus.lee@company.com',    '2021-04-06', NULL,         'Support Specialist',          6, 17),
(20, 'Olivia',  'Brooks',  'Female', 'olivia.brooks@company.com', '2021-09-13', NULL,         'Support Specialist',          6, 17),
(21, 'Jordan',  'Smith',   'Other',  'jordan.smith@company.com',  '2022-03-21', NULL,         'Support Specialist',          6, 17),
(22, 'Tariq',   'Hassan',  'Male',   'tariq.hassan@company.com',  '2023-02-09', NULL,         'Junior Support Specialist',   6, 17),
(23, 'Amara',   'Okafor',  'Female', 'amara.okafor@company.com',  '2023-06-27', NULL,         'Junior Support Specialist',   6, 17),
(24, 'Yuki',    'Tanaka',  'Female', 'yuki.tanaka@company.com',   '2024-02-12', NULL,         'Junior Support Specialist',   6, 17),
(25, 'Brendan', 'Walsh',   'Male',   'brendan.walsh@company.com', '2022-07-18', '2024-03-22', 'Support Specialist',          6, 17),

-- Marketing (dept 3)
(26, 'Diana',  'Patel',   'Female', 'diana.patel@company.com',   '2019-04-22', NULL,         'Director of Marketing',     3, NULL),
(27, 'Ethan',  'Brooks',  'Male',   'ethan.brooks@company.com',  '2020-07-14', NULL,         'Marketing Manager',         3, 26),
(28, 'Hannah', 'Cole',    'Female', 'hannah.cole@company.com',   '2021-08-09', NULL,         'Senior Marketing Specialist', 3, 27),
(29, 'Felix',  'Romero',  'Male',   'felix.romero@company.com',  '2022-05-30', NULL,         'Marketing Specialist',      3, 27),
(30, 'Zoe',    'Bennett', 'Female', 'zoe.bennett@company.com',   '2023-03-13', NULL,         'Content Strategist',        3, 27),
(31, 'Mateo',  'Diaz',    'Male',   'mateo.diaz@company.com',    '2023-10-02', NULL,         'Marketing Analyst',         3, 27),
(32, 'Lauren', 'Page',    'Female', 'lauren.page@company.com',   '2021-06-15', '2024-05-10', 'Marketing Specialist',      3, 27),

-- Finance (dept 5)
(33, 'Henry',   'Wong',    'Male',   'henry.wong@company.com',    '2018-02-26', NULL, 'Chief Financial Officer',  5, NULL),
(34, 'Natalia', 'Ivanov',  'Female', 'natalia.ivanov@company.com','2020-01-08', NULL, 'Finance Manager',          5, 33),
(35, 'Oliver',  'Reid',    'Male',   'oliver.reid@company.com',   '2021-07-19', NULL, 'Senior Financial Analyst', 5, 34),
(36, 'Grace',   'Lim',     'Female', 'grace.lim@company.com',     '2023-05-22', NULL, 'Financial Analyst',        5, 34),
(37, 'Samuel',  'Akpan',   'Male',   'samuel.akpan@company.com',  '2024-07-08', NULL, 'Financial Analyst',        5, 34),

-- Human Resources (dept 4)
(38, 'Patricia', 'Davis',   'Female', 'patricia.davis@company.com', '2018-10-15', NULL, 'VP Human Resources',    4, NULL),
(39, 'Andre',    'Williams','Male',   'andre.williams@company.com', '2020-04-03', NULL, 'HR Manager',            4, 38),
(40, 'Naomi',    'Berhane', 'Female', 'naomi.berhane@company.com',  '2022-11-28', NULL, 'HR Business Partner',   4, 39);

-- Salaries (2023, 2024, 2025 where the employee was active)
INSERT INTO salaries (employee_id, salary_year, base_salary, bonus) VALUES
-- Engineering
( 1, 2023, 215000, 40000), ( 1, 2024, 225000, 45000), ( 1, 2025, 235000, 50000),
( 2, 2023, 145000, 22000), ( 2, 2024, 152000, 25000), ( 2, 2025, 160000, 28000),
( 3, 2023, 115000, 13000), ( 3, 2024, 122000, 15000), ( 3, 2025, 128000, 16000),
( 4, 2023,  92000,  8000), ( 4, 2024,  98000, 10000), ( 4, 2025, 104000, 11000),
( 5, 2023,  88000,  7000), ( 5, 2024,  94000,  9000), ( 5, 2025,  96000,  9500),  -- low raise, high rating -> flight risk
( 6, 2023,  72000,  3000), ( 6, 2024,  78000,  5000), ( 6, 2025,  84000,  6000),
( 7, 2023,  90000,  8000), ( 7, 2024,  95000,  9000),                              -- Lin Wei, termed Aug 2024
( 8, 2024,  70000,     0), ( 8, 2025,  76000,  4000),                              -- Carlos, hired Jan 2024

-- Sales
( 9, 2023, 195000, 55000), ( 9, 2024, 205000, 60000), ( 9, 2025, 218000, 70000),
(10, 2023, 135000, 35000), (10, 2024, 142000, 38000), (10, 2025, 150000, 42000),
(11, 2023,  95000, 45000), (11, 2024, 100000, 50000), (11, 2025, 108000, 55000),
(12, 2023,  82000, 32000), (12, 2024,  88000, 36000), (12, 2025,  90000, 37000),  -- low raise, rating 4 -> flight risk
(13, 2023,  78000, 28000), (13, 2024,  84000, 32000), (13, 2025,  89000, 35000),
(14, 2023,  58000,  8000), (14, 2024,  64000, 11000), (14, 2025,  70000, 13000),
(15, 2023,  88000, 30000),                                                          -- Kevin Park, termed Dec 2023

-- Customer Support
(16, 2023, 165000, 25000), (16, 2024, 172000, 27000), (16, 2025, 180000, 30000),
(17, 2023, 115000, 15000), (17, 2024, 121000, 17000), (17, 2025, 128000, 19000),
(18, 2023,  78000,  8000), (18, 2024,  83000,  9000), (18, 2025,  88000, 10000),
(19, 2023,  62000,  5000), (19, 2024,  66000,  6000), (19, 2025,  68000,  6500),  -- low raise, rating 4 -> flight risk
(20, 2023,  63000,  5000), (20, 2024,  67000,  6000), (20, 2025,  71000,  7000),
(21, 2023,  58000,  4000), (21, 2024,  62000,  5000), (21, 2025,  66000,  6000),
(22, 2023,  48000,  2000), (22, 2024,  52000,  3000), (22, 2025,  56000,  4000),
(23, 2023,  47000,  2000), (23, 2024,  51000,  3000), (23, 2025,  55000,  4000),
(24, 2024,  50000,  2000), (24, 2025,  54000,  3000),                              -- Yuki, hired Feb 2024
(25, 2023,  60000,  4000), (25, 2024,  63000,     0),                              -- Brendan, termed Mar 2024

-- Marketing
(26, 2023, 155000, 22000), (26, 2024, 162000, 24000), (26, 2025, 170000, 27000),
(27, 2023, 112000, 15000), (27, 2024, 118000, 17000), (27, 2025, 124000, 19000),
(28, 2023,  82000,  8000), (28, 2024,  87000, 10000), (28, 2025,  89000, 10500),  -- low raise, rating 4 -> flight risk
(29, 2023,  68000,  6000), (29, 2024,  73000,  7000), (29, 2025,  78000,  8000),
(30, 2023,  65000,  4000), (30, 2024,  70000,  5000), (30, 2025,  75000,  6000),
(31, 2023,  62000,  3000), (31, 2024,  67000,  4000), (31, 2025,  72000,  5000),
(32, 2023,  70000,  6000), (32, 2024,  73000,     0),                              -- Lauren, termed May 2024

-- Finance
(33, 2023, 240000, 55000), (33, 2024, 252000, 60000), (33, 2025, 265000, 65000),
(34, 2023, 130000, 20000), (34, 2024, 137000, 22000), (34, 2025, 145000, 25000),
(35, 2023,  95000, 10000), (35, 2024, 100000, 12000), (35, 2025, 103000, 13000),  -- low raise, rating 5 -> flight risk
(36, 2023,  72000,  5000), (36, 2024,  78000,  7000), (36, 2025,  84000,  8000),
(37, 2024,  70000,  4000), (37, 2025,  76000,  6000),                              -- Samuel, hired Jul 2024

-- Human Resources
(38, 2023, 180000, 25000), (38, 2024, 188000, 27000), (38, 2025, 198000, 30000),
(39, 2023, 110000, 13000), (39, 2024, 116000, 15000), (39, 2025, 122000, 17000),
(40, 2023,  78000,  7000), (40, 2024,  83000,  8000), (40, 2025,  88000, 10000);

-- Performance reviews (2023 and 2024 for everyone employed at year end)
INSERT INTO performance_reviews (employee_id, review_year, rating, comments) VALUES
-- 2023 reviews (employed at 2023-12-31)
( 1, 2023, 5, 'Outstanding leadership of the engineering org.'),
( 2, 2023, 4, 'Strong manager, consistent delivery.'),
( 3, 2023, 5, 'Exceptional technical work and mentorship.'),
( 4, 2023, 4, 'Reliable engineer, meets expectations.'),
( 5, 2023, 5, 'Took ownership of two complex projects.'),
( 6, 2023, 3, 'Solid ramp for a new grad.'),
( 7, 2023, 4, 'Good work, occasional context issues.'),
( 9, 2023, 5, 'Exceeded annual quota by 18%.'),
(10, 2023, 4, 'Team hit 92% of plan; coaching improved.'),
(11, 2023, 4, 'Strongest individual contributor on the team.'),
(12, 2023, 4, 'Consistent quarter-over-quarter results.'),
(13, 2023, 3, 'Missed Q3 but recovered in Q4.'),
(14, 2023, 3, 'Reasonable first year as an SDR.'),
(15, 2023, 2, 'Quota missed across three quarters.'),
(16, 2023, 4, 'Strong director; team CSAT trending up.'),
(17, 2023, 4, 'Effective people manager, hiring well.'),
(18, 2023, 5, 'Best CSAT in the org; promotion candidate.'),
(19, 2023, 4, 'Reliable specialist, picks up scope.'),
(20, 2023, 3, 'Met expectations.'),
(21, 2023, 4, 'Good ticket throughput, helpful to peers.'),
(22, 2023, 3, 'Improving each quarter.'),
(23, 2023, 4, 'Fast ramp, strong written communication.'),
(25, 2023, 2, 'Pattern of missed SLAs; PIP recommended.'),
(26, 2023, 5, 'Drove the most successful campaign of the year.'),
(27, 2023, 4, 'Solid manager, good cross-functional rapport.'),
(28, 2023, 4, 'Strong specialist, ready for senior scope.'),
(29, 2023, 3, 'Met expectations.'),
(30, 2023, 4, 'Excellent content output and brand voice.'),
(31, 2023, 3, 'Steady analyst work.'),
(32, 2023, 3, 'Met expectations.'),
(33, 2023, 5, 'Closed the year ahead of plan on every metric.'),
(34, 2023, 4, 'Strong manager, audit-ready close every quarter.'),
(35, 2023, 5, 'Best forecasting accuracy in the team.'),
(36, 2023, 4, 'Fast ramp; ownership of three close cycles.'),
(38, 2023, 5, 'Built the comp framework from scratch.'),
(39, 2023, 4, 'Strong policy work and employee relations.'),
(40, 2023, 4, 'Good HRBP partnership with Engineering.'),

-- 2024 reviews (employed at 2024-12-31)
( 1, 2024, 5, 'Continued to set the standard for the org.'),
( 2, 2024, 5, 'Team shipped on time; retention near 100%.'),
( 3, 2024, 5, 'Led platform rebuild end-to-end.'),
( 4, 2024, 4, 'Steady mid-level engineer; good code quality.'),
( 5, 2024, 5, 'Top individual contributor this cycle.'),
( 6, 2024, 4, 'Big improvement; trusted with bigger scope.'),
( 8, 2024, 3, 'Reasonable ramp for a first-year hire.'),
( 9, 2024, 5, 'Closed largest enterprise deal in company history.'),
(10, 2024, 4, 'Team beat plan by 7%.'),
(11, 2024, 5, 'Highest revenue contributor on the team.'),
(12, 2024, 4, 'Reliable AE, good pipeline hygiene.'),
(13, 2024, 4, 'Recovered from a slow start; finished above plan.'),
(14, 2024, 4, 'Promoted to AE in early 2025.'),
(16, 2024, 4, 'CSAT 4.6/5; team retention strong.'),
(17, 2024, 4, 'Hiring and ramp time both improved.'),
(18, 2024, 5, 'Designed the new support training program.'),
(19, 2024, 4, 'Reliable specialist; mentors juniors well.'),
(20, 2024, 4, 'Stepped into more complex tickets.'),
(21, 2024, 4, 'Consistent contributor.'),
(22, 2024, 4, 'Now meeting senior-level metrics.'),
(23, 2024, 4, 'Best ticket-quality scores on the team.'),
(24, 2024, 3, 'Standard ramp for a 2024 hire.'),
(26, 2024, 5, 'Led brand refresh and new product launch.'),
(27, 2024, 4, 'Strong manager, team morale healthy.'),
(28, 2024, 4, 'Excellent campaign execution.'),
(29, 2024, 4, 'Improvement from previous year.'),
(30, 2024, 4, 'Reliable content lead.'),
(31, 2024, 4, 'Now ready to mentor newer analysts.'),
(33, 2024, 5, 'Closed two acquisitions during the year.'),
(34, 2024, 5, 'Promoted scope into FP&A leadership.'),
(35, 2024, 5, 'Best analyst on the team by a clear margin.'),
(36, 2024, 4, 'Strong second year; ready for senior.'),
(37, 2024, 3, 'Reasonable ramp.'),
(38, 2024, 5, 'HR transformation initiative delivered on time.'),
(39, 2024, 4, 'Solid manager, strong policy work.'),
(40, 2024, 5, 'Best HRBP performance of the year.');

-- Projects
INSERT INTO projects (project_id, project_name, department_id, start_date, end_date, budget) VALUES
(1, 'Project Atlas (Platform Rebuild)', 1, '2023-01-15', '2024-06-30', 500000.00),
(2, 'Mobile App Redesign',              1, '2024-03-01',  NULL,        750000.00),
(3, 'Q4 Enterprise Sales Campaign',     2, '2024-09-01', '2024-12-31', 200000.00),
(4, 'CRM Migration',                    2, '2024-01-15', '2024-10-30', 300000.00),
(5, 'Customer Portal v2',               6, '2023-06-01', '2024-02-28', 250000.00),
(6, 'Brand Refresh & Launch',           3, '2024-04-01', '2024-09-30', 180000.00),
(7, 'ERP Implementation',               5, '2023-09-01', '2024-12-31', 450000.00),
(8, 'HR Onboarding Platform',           4, '2024-02-01',  NULL,        150000.00);

-- Employee project assignments (31 rows)
INSERT INTO employee_projects (employee_id, project_id, role_on_project, hours_logged) VALUES
-- Project Atlas
( 2, 1, 'Tech Lead',           1200),
( 3, 1, 'Senior Engineer',     1500),
( 4, 1, 'Engineer',            1300),
( 5, 1, 'Engineer',            1100),
( 7, 1, 'Engineer',             900),
-- Mobile App Redesign
( 2, 2, 'Engineering Manager',  600),
( 3, 2, 'Tech Lead',           1100),
( 4, 2, 'Engineer',             950),
( 5, 2, 'Engineer',             800),
-- Q4 Enterprise Sales Campaign
(10, 3, 'Campaign Lead',        400),
(11, 3, 'Account Executive',    350),
(12, 3, 'Account Executive',    300),
(14, 3, 'Sales Development',    220),
-- CRM Migration
( 9, 4, 'Sponsor',              150),
(10, 4, 'Project Lead',         500),
(12, 4, 'Implementer',          400),
(13, 4, 'Implementer',          380),
-- Customer Portal v2
(16, 5, 'Sponsor',              200),
(17, 5, 'Project Manager',      600),
(18, 5, 'Tech Lead',            800),
(19, 5, 'QA & Support',         400),
-- Brand Refresh
(26, 6, 'Executive Sponsor',    300),
(27, 6, 'Project Manager',      500),
(28, 6, 'Campaign Lead',        600),
(30, 6, 'Content Lead',         700),
-- ERP Implementation
(33, 7, 'Executive Sponsor',    250),
(34, 7, 'Project Lead',         800),
(35, 7, 'Lead Analyst',        1200),
-- HR Onboarding Platform
(38, 8, 'Executive Sponsor',    200),
(39, 8, 'Project Manager',      500),
(40, 8, 'Process Designer',     600);
