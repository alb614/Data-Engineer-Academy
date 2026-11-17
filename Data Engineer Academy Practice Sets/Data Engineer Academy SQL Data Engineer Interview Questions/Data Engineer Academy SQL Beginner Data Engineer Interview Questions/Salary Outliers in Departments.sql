/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find employees whose salaries are 
-- higher than both their department manager’s salary 
-- and the average salary of their department.

-- Return the following columns: 
-- employee (employee name), 
-- employee_salary, 
-- manager_salary, 
-- avg_dept_salary, 
-- department_name.

-- This helps identify outliers and high earners within teams.

-- WITH CTE AS
-- (
-- SELECT 
--     department_id,
--     AVG(salary_usd) AS avg_dept_salary
-- FROM dim_employee_twitter
-- GROUP BY department_id
-- ORDER BY department_id
-- ),
-- CTE2 AS
-- (
-- SELECT
--     e1.name AS employee_name,
--     e1.salary_usd AS employee_salary,
--     e2.salary_usd AS manager_salary,
--     avg_dept_salary,
--     ddt.department_name
-- FROM dim_dept_twitter ddt
-- JOIN CTE c
-- ON ddt.department_id = c.department_id
-- JOIN dim_employee_twitter e1
-- ON c.department_id = e1.department_id
-- JOIN dim_employee_twitter e2
-- ON e1.manager_id = e2.user_id AND e1.department_id = e2.department_id
-- )
-- SELECT *
-- FROM CTE2
-- WHERE employee_salary > manager_salary
--     AND employee_salary > avg_dept_salary;
    
/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_dept_twitter */

-- SELECT 
--     ddt.department_id AS dept_from_ddt, e2.department_id AS dept_from_e2, department_name, ddt.manager_id, user_id, name
-- FROM dim_dept_twitter ddt
-- JOIN dim_employee_twitter e2
-- ON ddt.manager_id = e2.user_id
-- ORDER BY ddt.department_id
-- LIMIT 50;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_employee_twitter */

-- SELECT 
--     department_id,
--     user_id,
--     name,
--     manager_id
-- FROM dim_employee_twitter
-- ORDER BY department_id
-- LIMIT 50;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- WITH average_salary_by_dept AS
-- (
-- SELECT 
--     department_id,
--     AVG(salary_usd) AS avg_dept_salary
-- FROM dim_employee_twitter
-- GROUP BY department_id
-- ORDER BY department_id
-- ),
-- employee_manager_dept_data AS
-- (
-- SELECT
    -- e1.name AS employee_name,
    -- e1.salary_usd AS employee_salary,
    -- e2.salary_usd AS manager_salary,
    -- avg_dept_salary,
    -- ddt.department_name
-- FROM dim_dept_twitter ddt
-- JOIN average_salary_by_dept c
-- ON ddt.department_id = c.department_id
-- JOIN dim_employee_twitter e1
-- ON c.department_id = e1.department_id
-- JOIN dim_employee_twitter e2
-- ON e1.manager_id = e2.user_id AND e1.department_id = e2.department_id
-- )
-- SELECT *
-- FROM employee_manager_dept_data
-- WHERE employee_salary > manager_salary
--     AND employee_salary > avg_dept_salary;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- WITH average_salary_by_dept AS
-- (
-- SELECT 
--     department_id,
--     AVG(salary_usd) AS avg_dept_salary
-- FROM dim_employee_twitter
-- GROUP BY department_id
-- ORDER BY department_id
-- ),
-- employee_manager_dept_data AS
-- (
-- SELECT
--     e1.user_id AS employee_id,
--     e1.name AS employee_name,
--     e1.salary_usd AS employee_salary,
--     e1.manager_id,
--     e2.user_id AS confirmed_manager_id,
--     e2.name AS manager_name,
--     e2.salary_usd AS manager_salary,
--     ddt.department_name
-- FROM dim_dept_twitter ddt
-- JOIN dim_employee_twitter e1
-- ON ddt.department_id = e1.department_id
-- LEFT JOIN dim_employee_twitter e2
-- ON e1.manager_id = e2.user_id
-- )
-- SELECT *
-- FROM employee_manager_dept_data
-- ORDER BY department_name;

-- SELECT
--     ddt.department_name,
--     e1.user_id,
--     e1.name,
--     e1.salary_usd,
--     e1.manager_id,
--     e2.user_id AS other_manager_id,
--     e2.name AS manager_name
-- FROM dim_dept_twitter ddt
-- JOIN dim_employee_twitter e1
-- ON ddt.department_id = e1.department_id
-- JOIN dim_employee_twitter e2
-- ON e1.manager_id = e2.user_id
-- ORDER BY ddt.department_name;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- WITH average_salary_by_dept AS
-- (
-- SELECT 
--     department_id,
--     AVG(salary_usd) AS avg_dept_salary
-- FROM dim_employee_twitter
-- GROUP BY department_id
-- ORDER BY department_id
-- ),
-- employee_manager_dept_data AS
-- (
-- SELECT
--     e1.name AS employee_name,
--     e1.salary_usd AS employee_salary,
--     e2.salary_usd AS manager_salary,
--     ddt.department_id,
--     ddt.department_name
-- FROM dim_dept_twitter ddt
-- JOIN dim_employee_twitter e1
-- ON ddt.department_id = e1.department_id
-- JOIN dim_employee_twitter e2
-- ON e1.manager_id = e2.user_id
-- )
-- SELECT
--     employee_name,
--     employee_salary,
--     manager_salary,
--     avg_dept_salary,
--     department_name
-- FROM employee_manager_dept_data
-- JOIN average_salary_by_dept
-- USING(department_id)
-- WHERE employee_salary > manager_salary
--     AND employee_salary > avg_dept_salary
-- ORDER BY ddt.department_name;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH average_salary_by_dept AS
(
SELECT 
    department_id,
    AVG(salary_usd) AS avg_dept_salary
FROM dim_employee_twitter
GROUP BY department_id
ORDER BY department_id
),
employee_manager_dept_data AS
(
SELECT
    e1.name AS employee_name,
    e1.salary_usd AS employee_salary,
    e2.salary_usd AS manager_salary,
    ddt.department_id,
    ddt.department_name
FROM dim_dept_twitter ddt
JOIN dim_employee_twitter e1
ON ddt.department_id = e1.department_id
JOIN dim_employee_twitter e2
ON ddt.manager_id = e2.user_id
ORDER BY ddt.department_name
)
SELECT
    employee_name,
    employee_salary,
    manager_salary,
    avg_dept_salary,
    department_name
FROM employee_manager_dept_data
JOIN average_salary_by_dept
USING(department_id)
WHERE employee_salary > manager_salary
    AND employee_salary > avg_dept_salary;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH dept_avg AS (
--   SELECT 
--     department_id, 
--     AVG(salary_usd) AS avg_dept_salary
--   FROM dim_employee_twitter
--   GROUP BY department_id
-- )

-- SELECT 
--   emp.name AS employee,
--   emp.salary_usd AS employee_salary,
--   mgr.salary_usd AS manager_salary,
--   da.avg_dept_salary,
--   dept.department_name
-- FROM dim_employee_twitter emp
-- JOIN dim_dept_twitter dept ON emp.department_id = dept.department_id
-- JOIN dim_employee_twitter mgr ON dept.manager_id = mgr.user_id
-- JOIN dept_avg da ON emp.department_id = da.department_id
-- WHERE emp.salary_usd > mgr.salary_usd
--   AND emp.salary_usd > da.avg_dept_salary;