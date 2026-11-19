/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the top-performing employee 
-- in terms of both revenue generated and projects completed 
-- in January 2023.

-- SELECT 

--     employee_id,
--     role,
--     salary
    
-- FROM employee_dimension
-- JOIN employee_performance_fact
-- USING(employee_id)
-- WHERE month = 'January'
--     AND year = 2023



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

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    employee_id,
    role
    
FROM employee_dimension
JOIN employee_performance_fact
USING(employee_id)
WHERE month = 'January'
    AND year = 2023
ORDER BY revenue_generated DESC, projects_completed DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role
-- FROM employee_dimension e
-- JOIN employee_performance_fact ep 
-- ON e.employee_id = ep.employee_id
-- WHERE ep.month = 'January' AND ep.year = 2023
-- AND (ep.revenue_generated, ep.projects_completed) = (
--     SELECT MAX(revenue_generated), MAX(projects_completed)
--     FROM employee_performance_fact
--     WHERE month = 'January' AND year = 2023);