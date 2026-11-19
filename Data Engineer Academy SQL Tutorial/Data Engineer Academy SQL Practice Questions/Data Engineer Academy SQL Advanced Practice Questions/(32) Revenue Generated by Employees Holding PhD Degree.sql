/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the employees 
-- in the "Data Scientist" role 
-- who have expertise in "TensorFlow" 
-- and have a Ph.D., 
-- and calculate their total revenue generated 
-- in January 2023.

-- SELECT employee_id, SUM(revenue_generated) AS total_revenue
-- FROM employee_dimension JOIN employee_performance_fact JOIN qualificationandskills
-- WHERE role = 'Date Scientist'
-- AND technical_skills LIKE '%TensorFlow%'
-- AND education_level = 'Ph.D'
-- AND month = 'January'
-- AND year = 2023
-- GROUP BY employee_id


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

/* Viewing table qualificationandskills  */

-- SELECT *
-- FROM qualificationandskills 
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    SUM(revenue_generated) AS total_revenue
    
FROM employee_dimension 
JOIN employee_performance_fact 
USING(employee_id)
JOIN qualificationandskills
USING(employee_id)
WHERE role = 'Data Scientist'
    AND technical_skills LIKE '%TensorFlow%'
    AND education_level = 'Ph.D.'
    AND month = 'January'
    AND year = 2023;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH DataScientistPhD AS (
--     SELECT e.employee_id
--     FROM employee_dimension e
--     JOIN qualificationandskills q ON e.employee_id = q.employee_id
--     WHERE e.role = 'Data Scientist'
--     AND q.technical_skills LIKE '%TensorFlow%'
--     AND q.education_level = 'Ph.D.'
-- )
-- SELECT SUM(ep.revenue_generated) AS Total_Revenue
-- FROM employee_performance_fact ep
-- WHERE ep.month = 'January' AND ep.year = 2023
-- AND ep.employee_id IN (SELECT employee_id FROM DataScientistPhD);