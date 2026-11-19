/* Brainstorming section */

-- Pick employees with qualifications and skills, have an employee dimension (salary), 
-- and have performance facts (month and year worked).

-- Of those employees, pick the ones with a Ph.D. and generated more than $100,000 
-- in revenue in January 2023.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT employee_id
-- FROM employee_dimension JOIN employee_performance_fact JOIN qualificationandskills
-- WHERE education_level = 'Ph.D.' AND revenue_generated = 100000 AND month = January
-- AND year = 2023;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    employee_id,
    role
    
FROM employee_dimension 
JOIN employee_performance_fact 
USING(employee_id)
JOIN qualificationandskills
USING(employee_id)
WHERE 

    education_level = 'Ph.D.' 
    AND revenue_generated > 100000 
    AND month = 'January'
    AND year = 2023;
    
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id,e.role
-- FROM employee_dimension e
-- JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE q.education_level = 'Ph.D.' AND ep.month = 'January' AND ep.year = 2023 AND ep.revenue_generated > 100000;