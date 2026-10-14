/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employees */

-- SELECT *
-- FROM employees
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT

--     department,
--     COUNT(employee_id) AS total_employees,
--     AVG(salary) AS avg_salary
    
-- FROM employees
-- GROUP BY department;
    
/*------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- SELECT
    
--     department,
--     AVG(salary) AS overall_avg_salary
        
-- FROM employees;

/*------------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- WITH AllDepartments AS
-- (
--     SELECT

--         department,
--         COUNT(employee_id) AS total_employees,
--         AVG(salary) AS avg_salary
    
--     FROM employees
--     GROUP BY department
-- ),
-- OverallAverageSalary AS
-- (
--     SELECT
    
--         department,
--         AVG(salary) AS overall_avg_salary
        
--     FROM employees
-- )
-- SELECT

--     department,
--     total_employees,
--     avg_salary
    
-- FROM AllDepartments
-- WHERE avg_salary > OverallAverageSalary;

/*------------------------------------------------------------------------------------------*/

/* My solution #1 */

-- WITH AllDepartments AS
-- (
--     SELECT

--         department,
--         COUNT(employee_id) AS total_employees,
--         AVG(salary) AS avg_salary
    
--     FROM employees
--     GROUP BY department
-- )
-- SELECT

--     department,
--     total_employees,
--     avg_salary
    
-- FROM AllDepartments
-- WHERE avg_salary > (SELECT AVG(salary) FROM employees);

/*------------------------------------------------------------------------------------------*/

/* My solution #2 */

WITH stage1 AS
(
	SELECT

		department,
		COUNT(*) AS employee_num_in_dept,
		AVG(salary) AS avg_dept_salary

	FROM employees
	GROUP BY department
),
stage2 AS
(

	SELECT *
	FROM stage1
	WHERE avg_dept_salary >
	(

		SELECT
			AVG(salary)
		FROM employees

	)

)
SELECT *
FROM stage2;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH DepartmentStats AS (
--     SELECT
--     department,
--     COUNT(employee_id) AS total_employees,
--     AVG(salary) AS avg_salary
--     FROM employees
--     GROUP BY department
-- ),
-- OverallStats AS (
--     SELECT AVG(salary) AS overall_avg_salary
--     FROM employees
-- )
-- SELECT
--     ds.department,
--     ds.total_employees,
--     ds.avg_salary
-- FROM DepartmentStats ds
-- INNER JOIN OverallStats os
-- ON ds.avg_salary > os.overall_avg_salary;