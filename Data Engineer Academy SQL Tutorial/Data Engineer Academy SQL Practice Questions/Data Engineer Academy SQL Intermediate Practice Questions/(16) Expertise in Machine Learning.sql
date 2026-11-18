/* Brainstorming section */

-- Filter the table to show only employees that have expertise in Machine Learning.

-- Display the query results.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT employee_id, role, department
-- FROM qualificationandskills
-- JOIN employee_dimension USING(employee_id)
-- WHERE technical_skills LIKE '%Machine Learning%';

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT employee_id, role, department
FROM qualificationandskills
JOIN employee_dimension USING(employee_id)
WHERE technical_skills LIKE '%Machine Learning%';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role, e.department
-- FROM employee_dimension e
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE q.technical_skills LIKE '%Machine Learning%';