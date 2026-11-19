/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Calculate the average experience (in years) of employees 
-- who have expertise in "TensorFlow" 
-- and have completed more than 5 projects in January 2023.

-- AVG(experience_years) AS avg_exp_years
-- technical_skills LIKE '%Tensor Flow%'
-- AND projects_completed > 5
-- AND month = 'January'
-- AND year = 2023

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

    AVG(experience_years) AS avg_exp_years
    
FROM employee_dimension ed
JOIN employee_performance_fact epf
USING(employee_id)
JOIN qualificationandskills q
USING(employee_id)
WHERE technical_skills LIKE '%TensorFlow%'
    AND projects_completed > 5
    AND month = 'January'
    AND year = 2023;
    
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT AVG(e.experience_years) AS Avg_Experience
-- FROM employee_dimension e
-- JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE q.technical_skills LIKE '%TensorFlow%'
-- AND ep.month = 'January' AND ep.year = 2023 AND ep.projects_completed > 5;