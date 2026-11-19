/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Identify the employee with the highest salary 

-- SELECT employee_id
-- FROM employee_dimension JOIN employee_performance_fact

-- in the "Analytics" department who completed 
-- at least 5 projects in January 2023.

-- WHERE department = 'Analytics' AND projects_completed >= 5
-- AND month = 'January' AND year = 2023

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    employee_id,
    role,
    salary

FROM employee_dimension 
JOIN employee_performance_fact
USING(employee_id)
WHERE department = 'Analytics' 
    AND projects_completed >= 5
    AND month = 'January' 
    AND year = 2023
ORDER BY salary DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role, e.salary
-- FROM employee_dimension e
-- JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
-- WHERE e.department = 'Analytics'
-- AND ep.month = 'January' AND ep.Year = 2023
-- AND ep.projects_completed >= 5
-- ORDER BY e.salary DESC
-- LIMIT 1;