-- =====================================================================
-- HR Analytics SQL Project  |  02_seed_data.sql
-- Populates the database with realistic sample data.
-- Run AFTER 01_schema.sql.
-- =====================================================================

-- ---------------------------------------------------------------------
-- DEPARTMENTS
-- ---------------------------------------------------------------------
INSERT INTO departments (department_id, department_name, location, annual_budget) VALUES
(1, 'Engineering',       'San Francisco', 4500000.00),
(2, 'Sales',             'New York',      3200000.00),
(3, 'Marketing',         'Chicago',       1800000.00),
(4, 'Human Resources',   'Austin',        900000.00),
(5, 'Finance',           'Boston',        1500000.00),
(6, 'Customer Support',  'Remote',        1200000.00);

-- ---------------------------------------------------------------------
-- EMPLOYEES  (40 people, mix of active + terminated, with org hierarchy)
-- ---------------------------------------------------------------------
-- Managers are inserted before their reports to satisfy FK self-reference.
INSERT INTO employees
(employee_id, first_name, last_name, gender, email, hire_date, termination_date, job_title, department_id, manager_id) VALUES
-- Engineering
(1,  'Sarah',     'Chen',       'F', 'sarah.chen@company.com',       '2018-03-15', NULL,         'VP Engineering',            1, NULL),
(2,  'Marcus',    'Johnson',    'M', 'marcus.johnson@company.com',   '2019-06-01', NULL,         'Engineering Manager',       1, 1),
(3,  'Priya',     'Patel',      'F', 'priya.patel@company.com',      '2020-08-20', NULL,         'Senior Software Engineer',  1, 2),
(4,  'David',     'Kim',        'M', 'david.kim@company.com',        '2021-02-10', NULL,         'Software Engineer',         1, 2),
(5,  'Aisha',     'Williams',   'F', 'aisha.williams@company.com',   '2022-09-05', NULL,         'Software Engineer',         1, 2),
(6,  'James',     'OConnor',    'M', 'james.oconnor@company.com',    '2023-04-18', NULL,         'Junior Engineer',           1, 2),
(7,  'Lin',       'Wei',        'F', 'lin.wei@company.com',          '2021-11-22', '2024-08-30', 'Software Engineer',         1, 2),
(8,  'Carlos',    'Mendoza',    'M', 'carlos.mendoza@company.com',   '2024-01-15', NULL,         'Junior Engineer',           1, 2),
-- Sales
(9,  'Robert',    'Taylor',     'M', 'robert.taylor@company.com',    '2018-07-01', NULL,         'VP Sales',                  2, NULL),
(10, 'Emily',     'Rodriguez',  'F', 'emily.rodriguez@company.com',  '2019-09-12', NULL,         'Sales Manager',             2, 9),
(11, 'Michael',   'Brown',      'M', 'michael.brown@company.com',    '2020-03-25', NULL,         'Senior Account Executive',  2, 10),
(12, 'Jessica',   'Lee',        'F', 'jessica.lee@company.com',      '2021-05-14', NULL,         'Account Executive',         2, 10),
(13, 'Daniel',    'Garcia',     'M', 'daniel.garcia@company.com',    '2022-08-19', NULL,         'Account Executive',         2, 10),
(14, 'Sophia',    'Martinez',   'F', 'sophia.martinez@company.com',  '2023-11-02', NULL,         'Sales Development Rep',     2, 10),
(15, 'Kevin',     'Park',       'M', 'kevin.park@company.com',       '2020-10-08', '2023-12-15', 'Account Executive',         2, 10),
-- Marketing
(16, 'Olivia',    'Anderson',   'F', 'olivia.anderson@company.com',  '2019-04-22', NULL,         'Marketing Director',        3, NULL),
(17, 'Ethan',     'Thompson',   'M', 'ethan.thompson@company.com',   '2020-07-11', NULL,         'Marketing Manager',         3, 16),
(18, 'Ava',       'Nguyen',     'F', 'ava.nguyen@company.com',       '2021-09-30', NULL,         'Content Strategist',        3, 17),
(19, 'Lucas',     'Wright',     'M', 'lucas.wright@company.com',     '2022-12-05', NULL,         'Digital Marketing Specialist', 3, 17),
(20, 'Mia',       'Lopez',      'F', 'mia.lopez@company.com',        '2024-03-18', NULL,         'Marketing Associate',       3, 17),
-- HR
(21, 'Grace',     'Wilson',     'F', 'grace.wilson@company.com',     '2018-11-08', NULL,         'HR Director',               4, NULL),
(22, 'Nathan',    'Davis',      'M', 'nathan.davis@company.com',     '2020-02-14', NULL,         'HR Manager',                4, 21),
(23, 'Chloe',     'Robinson',   'F', 'chloe.robinson@company.com',   '2022-06-27', NULL,         'HR Generalist',             4, 22),
(24, 'Isabella',  'Hall',       'F', 'isabella.hall@company.com',    '2023-09-10', NULL,         'Recruiter',                 4, 22),
-- Finance
(25, 'William',   'Clark',      'M', 'william.clark@company.com',    '2019-01-20', NULL,         'CFO',                       5, NULL),
(26, 'Charlotte', 'Lewis',      'F', 'charlotte.lewis@company.com',  '2020-05-08', NULL,         'Finance Manager',           5, 25),
(27, 'Benjamin',  'Walker',     'M', 'benjamin.walker@company.com',  '2021-08-15', NULL,         'Senior Accountant',         5, 26),
(28, 'Amelia',    'Young',      'F', 'amelia.young@company.com',     '2022-11-22', NULL,         'Accountant',                5, 26),
(29, 'Henry',     'Hernandez',  'M', 'henry.hernandez@company.com',  '2024-02-05', NULL,         'Financial Analyst',         5, 26),
(30, 'Zoe',       'King',       'F', 'zoe.king@company.com',         '2021-04-12', '2024-06-20', 'Accountant',                5, 26),
-- Customer Support
(31, 'Alexander', 'Scott',      'M', 'alexander.scott@company.com',  '2019-08-03', NULL,         'Support Director',          6, NULL),
(32, 'Harper',    'Green',      'F', 'harper.green@company.com',     '2020-11-17', NULL,         'Support Manager',           6, 31),
(33, 'Liam',      'Adams',      'M', 'liam.adams@company.com',       '2021-07-26', NULL,         'Senior Support Specialist', 6, 32),
(34, 'Emma',      'Baker',      'F', 'emma.baker@company.com',       '2022-04-09', NULL,         'Support Specialist',        6, 32),
(35, 'Mason',     'Nelson',     'M', 'mason.nelson@company.com',     '2023-06-14', NULL,         'Support Specialist',        6, 32),
(36, 'Aria',      'Carter',     'F', 'aria.carter@company.com',      '2024-08-21', NULL,         'Support Specialist',        6, 32),
(37, 'Noah',      'Mitchell',   'M', 'noah.mitchell@company.com',    '2022-10-30', '2025-01-10', 'Support Specialist',        6, 32),
(38, 'Layla',     'Perez',      'F', 'layla.perez@company.com',      '2023-02-18', NULL,         'Support Specialist',        6, 32),
(39, 'Ryan',      'Phillips',   'M', 'ryan.phillips@company.com',    '2025-03-04', NULL,         'Junior Support Specialist', 6, 32),
(40, 'Maya',      'Roberts',    'F', 'maya.roberts@company.com',     '2024-11-12', NULL,         'Support Specialist',        6, 32);

-- ---------------------------------------------------------------------
-- SALARIES  (2023, 2024, 2025 — only for years employee was active)
-- ---------------------------------------------------------------------
INSERT INTO salaries (salary_id, employee_id, salary_year, base_salary, bonus) VALUES
-- Engineering
(1,  1, 2023, 215000, 40000), (2,  1, 2024, 225000, 45000), (3,  1, 2025, 235000, 50000),
(4,  2, 2023, 145000, 22000), (5,  2, 2024, 152000, 25000), (6,  2, 2025, 160000, 28000),
(7,  3, 2023, 115000, 13000), (8,  3, 2024, 122000, 15000), (9,  3, 2025, 128000, 16000),
(10, 4, 2023,  88000,  7000), (11, 4, 2024,  94000,  9000), (12, 4, 2025,  99000, 10000),
(13, 5, 2023,  82000,  6000), (14, 5, 2024,  88000,  8000), (15, 5, 2025,  93000,  9000),
(16, 6, 2023,  62000,  3000), (17, 6, 2024,  68000,  4000), (18, 6, 2025,  73000,  5000),
(19, 7, 2023,  85000,  7000), (20, 7, 2024,  88000,  8000),
(21, 8, 2024,  65000,  3500), (22, 8, 2025,  70000,  4500),
-- Sales
(23, 9, 2023, 210000, 50000), (24, 9, 2024, 220000, 55000), (25, 9, 2025, 230000, 60000),
(26, 10, 2023, 138000, 30000), (27, 10, 2024, 145000, 33000), (28, 10, 2025, 152000, 36000),
(29, 11, 2023, 105000, 22000), (30, 11, 2024, 112000, 25000), (31, 11, 2025, 118000, 28000),
(32, 12, 2023,  85000, 15000), (33, 12, 2024,  92000, 18000), (34, 12, 2025,  98000, 20000),
(35, 13, 2023,  78000, 12000), (36, 13, 2024,  85000, 15000), (37, 13, 2025,  90000, 17000),
(38, 14, 2023,  58000,  5000), (39, 14, 2024,  63000,  7000), (40, 14, 2025,  68000,  9000),
(41, 15, 2023,  82000, 14000),
-- Marketing
(42, 16, 2023, 165000, 28000), (43, 16, 2024, 173000, 30000), (44, 16, 2025, 180000, 32000),
(45, 17, 2023, 118000, 16000), (46, 17, 2024, 125000, 18000), (47, 17, 2025, 132000, 20000),
(48, 18, 2023,  82000,  8000), (49, 18, 2024,  88000,  9000), (50, 18, 2025,  93000, 10000),
(51, 19, 2023,  72000,  6000), (52, 19, 2024,  78000,  7000), (53, 19, 2025,  83000,  8000),
(54, 20, 2024,  58000,  3000), (55, 20, 2025,  63000,  4000),
-- HR
(56, 21, 2023, 162000, 25000), (57, 21, 2024, 170000, 27000), (58, 21, 2025, 178000, 29000),
(59, 22, 2023, 115000, 14000), (60, 22, 2024, 122000, 16000), (61, 22, 2025, 128000, 17000),
(62, 23, 2023,  72000,  5000), (63, 23, 2024,  78000,  6000), (64, 23, 2025,  83000,  7000),
(65, 24, 2023,  60000,  3500), (66, 24, 2024,  66000,  4500), (67, 24, 2025,  71000,  5500),
-- Finance
(68, 25, 2023, 245000, 55000), (69, 25, 2024, 255000, 60000), (70, 25, 2025, 265000, 65000),
(71, 26, 2023, 142000, 20000), (72, 26, 2024, 150000, 23000), (73, 26, 2025, 157000, 25000),
(74, 27, 2023, 108000, 12000), (75, 27, 2024, 115000, 14000), (76, 27, 2025, 121000, 15000),
(77, 28, 2023,  78000,  6000), (78, 28, 2024,  84000,  7500), (79, 28, 2025,  89000,  8500),
(80, 29, 2024,  72000,  5000), (81, 29, 2025,  77000,  6000),
(82, 30, 2023,  76000,  6000), (83, 30, 2024,  80000,  6500),
-- Customer Support
(84, 31, 2023, 158000, 22000), (85, 31, 2024, 165000, 24000), (86, 31, 2025, 172000, 26000),
(87, 32, 2023, 108000, 13000), (88, 32, 2024, 115000, 15000), (89, 32, 2025, 121000, 16000),
(90, 33, 2023,  78000,  6500), (91, 33, 2024,  84000,  7500), (92, 33, 2025,  89000,  8500),
(93, 34, 2023,  62000,  4000), (94, 34, 2024,  67000,  4500), (95, 34, 2025,  72000,  5500),
(96, 35, 2023,  58000,  3500), (97, 35, 2024,  63000,  4000), (98, 35, 2025,  68000,  5000),
(99, 36, 2024,  56000,  3000), (100, 36, 2025, 61000,  3800),
(101, 37, 2023,  60000,  3500), (102, 37, 2024,  64000,  4000), (103, 37, 2025, 66000,  1500),
(104, 38, 2023,  56000,  3000), (105, 38, 2024,  62000,  4000), (106, 38, 2025, 67000,  5000),
(107, 39, 2025,  52000,  2500),
(108, 40, 2024,  55000,  2500), (109, 40, 2025, 60000,  3500);

-- ---------------------------------------------------------------------
-- PERFORMANCE REVIEWS  (2023 + 2024)
-- ---------------------------------------------------------------------
INSERT INTO performance_reviews (review_id, employee_id, review_year, rating, comments) VALUES
-- 2023
(1,  1, 2023, 5, 'Outstanding leadership of engineering org.'),
(2,  2, 2023, 4, 'Strong manager, delivers consistently.'),
(3,  3, 2023, 5, 'Exceptional technical work; mentors juniors.'),
(4,  4, 2023, 4, 'Reliable engineer, meets all goals.'),
(5,  5, 2023, 3, 'Solid contributor, room for growth.'),
(6,  6, 2023, 3, 'New hire ramping up well.'),
(7,  7, 2023, 2, 'Below expectations on delivery and collaboration.'),
(8,  9, 2023, 5, 'Crushed annual quota by 130%.'),
(9,  10, 2023, 4, 'Team hit targets two quarters running.'),
(10, 11, 2023, 5, 'Top performer; largest enterprise deal closed.'),
(11, 12, 2023, 4, 'Consistent quota attainment.'),
(12, 13, 2023, 3, 'Met quota; pipeline could be stronger.'),
(13, 14, 2023, 3, 'New SDR, learning fast.'),
(14, 15, 2023, 2, 'Missed quota two quarters in a row.'),
(15, 16, 2023, 4, 'Strong brand growth, good leadership.'),
(16, 17, 2023, 4, 'Effective manager, ran successful campaigns.'),
(17, 18, 2023, 5, 'Content drove record traffic growth.'),
(18, 19, 2023, 3, 'Decent contributor, mixed campaign results.'),
(19, 21, 2023, 4, 'Improved retention programs notably.'),
(20, 22, 2023, 4, 'Well-organized, supportive HR partner.'),
(21, 23, 2023, 3, 'Reliable generalist.'),
(22, 25, 2023, 5, 'Excellent financial stewardship.'),
(23, 26, 2023, 4, 'Clean audit, solid leadership.'),
(24, 27, 2023, 4, 'Senior-level reliability and accuracy.'),
(25, 28, 2023, 3, 'Meets expectations.'),
(26, 30, 2023, 2, 'Frequent errors; under PIP.'),
(27, 31, 2023, 4, 'Reduced ticket resolution time meaningfully.'),
(28, 32, 2023, 4, 'Built a strong support team.'),
(29, 33, 2023, 5, 'Highest CSAT in the team.'),
(30, 34, 2023, 3, 'Consistent agent.'),
(31, 35, 2023, 3, 'New hire ramping smoothly.'),
(32, 37, 2023, 2, 'Repeated tardiness and low CSAT.'),
(33, 38, 2023, 4, 'Excellent CSAT and ownership.'),
-- 2024
(34, 1, 2024, 5, 'Continues to lead exceptionally.'),
(35, 2, 2024, 5, 'Promoted scope; delivered major launch.'),
(36, 3, 2024, 5, 'Tech lead on Mobile App Redesign.'),
(37, 4, 2024, 4, 'Strong engineer, leveling up.'),
(38, 5, 2024, 4, 'Growing into senior responsibilities.'),
(39, 6, 2024, 4, 'Big improvement; promotable next cycle.'),
(40, 8, 2024, 3, 'New hire — solid first year.'),
(41, 9, 2024, 5, 'Record revenue year for sales org.'),
(42, 10, 2024, 4, 'Team hit 115% of plan.'),
(43, 11, 2024, 5, 'Largest deal in company history.'),
(44, 12, 2024, 4, 'Steady performer; expanded accounts.'),
(45, 13, 2024, 4, 'Closed several mid-market deals.'),
(46, 14, 2024, 4, 'Promoted from SDR to AE track.'),
(47, 16, 2024, 4, 'Successful brand refresh kickoff.'),
(48, 17, 2024, 5, 'Doubled qualified leads.'),
(49, 18, 2024, 5, 'Content engine running smoothly.'),
(50, 19, 2024, 4, 'Improved digital ROI by 25%.'),
(51, 20, 2024, 3, 'New hire, on track.'),
(52, 21, 2024, 5, 'Best-in-class retention work.'),
(53, 22, 2024, 4, 'Smooth annual review cycle.'),
(54, 23, 2024, 4, 'Strong improvement.'),
(55, 24, 2024, 3, 'Hit recruiting targets.'),
(56, 25, 2024, 5, 'Clean audit, expanded forecasting program.'),
(57, 26, 2024, 4, 'Led successful ERP migration.'),
(58, 27, 2024, 5, 'Owned ERP cutover flawlessly.'),
(59, 28, 2024, 4, 'Stepped up after team transition.'),
(60, 29, 2024, 3, 'Solid first year as analyst.'),
(61, 31, 2024, 4, 'Support portal V2 on track.'),
(62, 32, 2024, 5, 'Best CSAT and resolution time on record.'),
(63, 33, 2024, 5, 'Mentored team to top CSAT scores.'),
(64, 34, 2024, 4, 'Improved markedly; promoted scope.'),
(65, 35, 2024, 4, 'Strong sophomore year.'),
(66, 36, 2024, 3, 'Onboarded smoothly.'),
(67, 38, 2024, 5, 'Highest CSAT in the company.'),
(68, 40, 2024, 3, 'New hire, settling in.');

-- ---------------------------------------------------------------------
-- PROJECTS
-- ---------------------------------------------------------------------
INSERT INTO projects (project_id, project_name, department_id, start_date, end_date, budget) VALUES
(1, 'Project Atlas (Platform Rebuild)',  1, '2023-01-15', '2024-06-30', 500000),
(2, 'Mobile App Redesign',               1, '2024-03-01', NULL,         750000),
(3, 'Q4 Enterprise Sales Campaign',      2, '2024-09-01', '2024-12-31', 200000),
(4, 'Customer Acquisition Push 2025',    2, '2025-01-15', NULL,         300000),
(5, 'Brand Refresh 2025',                3, '2024-11-01', '2025-03-31', 180000),
(6, 'Content Strategy Overhaul',         3, '2024-06-01', '2025-05-31', 120000),
(7, 'ERP Migration',                     5, '2023-08-01', '2024-12-15', 400000),
(8, 'Support Portal V2',                 6, '2024-05-01', NULL,         250000);

-- ---------------------------------------------------------------------
-- EMPLOYEE_PROJECTS  (assignments)
-- ---------------------------------------------------------------------
INSERT INTO employee_projects (employee_id, project_id, role_on_project, hours_logged) VALUES
-- Project Atlas
(2, 1, 'Tech Lead', 1200), (3, 1, 'Senior Engineer', 1500), (4, 1, 'Engineer', 1300), (7, 1, 'Engineer', 900),
-- Mobile App Redesign
(2, 2, 'Engineering Manager', 600), (3, 2, 'Tech Lead', 1100), (5, 2, 'Engineer', 950), (6, 2, 'Junior Engineer', 700), (8, 2, 'Junior Engineer', 500),
-- Q4 Enterprise Campaign
(10, 3, 'Campaign Lead', 400), (11, 3, 'Account Executive', 350), (12, 3, 'Account Executive', 300),
-- Customer Acquisition Push 2025
(10, 4, 'Lead', 200), (13, 4, 'AE', 180), (14, 4, 'SDR', 220),
-- Brand Refresh
(16, 5, 'Sponsor', 80), (17, 5, 'Project Lead', 350), (18, 5, 'Content Lead', 280), (19, 5, 'Digital Lead', 250),
-- Content Strategy Overhaul
(18, 6, 'Owner', 500), (19, 6, 'Contributor', 320), (20, 6, 'Contributor', 200),
-- ERP Migration
(26, 7, 'Project Lead', 600), (27, 7, 'Tech Lead', 800), (28, 7, 'Analyst', 550), (30, 7, 'Analyst', 400),
-- Support Portal V2
(31, 8, 'Sponsor', 90), (32, 8, 'PM', 450), (33, 8, 'Senior Specialist', 380), (34, 8, 'Specialist', 280), (38, 8, 'Specialist', 320);
