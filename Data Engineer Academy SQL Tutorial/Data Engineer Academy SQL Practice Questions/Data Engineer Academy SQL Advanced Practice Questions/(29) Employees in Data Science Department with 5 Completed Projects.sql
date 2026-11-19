/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Identify employees in the "Data Science" department 

-- SELECT employee_id, role, department

-- who have expertise in "Python" 
-- and have completed at least 5 projects 
-- in January 2023.

-- WHERE department = 'Data Science'
-- AND technical_skills LIKE '%Python%'
-- AND projects_completed >= 5
-- AND month = 'January'
-- AND year = '2023'

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
    role, 
    department
    
FROM employee_dimension
JOIN employee_performance_fact
USING(employee_id)
JOIN qualificationandskills
USING(employee_id)
WHERE department = 'Data Science'
    AND technical_skills LIKE '%Python%'
    AND projects_completed >= 5
    AND month = 'January'
    AND year = '2023';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role, e.department
-- FROM employee_dimension e
-- JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE e.department = 'Data Science'
-- AND q.technical_skills LIKE '%Python%' 
-- AND ep.month = 'January' AND ep.year = 2023 AND ep.projects_completed >= 5;