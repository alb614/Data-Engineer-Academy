/* Brainstorming section */

-- Pick employees who completed projects.
-- Pick employees who completed at least 6 projects (more than 5 projects) in January 2023.
-- Retrieve their roles and salaries.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT employee_id, role, salary, projects_completed
-- FROM employee_dimension JOIN employee_performance_fact 
-- WHERE projects_completed > 5 AND month = 'January' AND year = '2023'

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact  */

-- SELECT *
-- FROM employee_performance_fact;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    employee_id, 
    role, 
    salary
    
FROM employee_dimension 
JOIN employee_performance_fact
USING(employee_id)
WHERE projects_completed > 5 AND month = 'January' AND year = '2023';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role, e.salary
-- FROM employee_dimension e
-- JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
-- WHERE ep.month = 'January' AND ep.year = 2023 AND ep.projects_completed > 5;