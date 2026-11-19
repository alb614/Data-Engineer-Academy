/* Brainstorming section */

-- Picking employees with qualifications and skills, performance facts, and specific roles.

-- From those employees, pick the ones who have a Master's degree and worked more than 
-- 150 hours in Jan 2023.

-- Display their roles.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT employee_id, role
-- FROM qualificationandskills JOIN employee_performance_fact JOIN employee_dimension
-- WHERE education_level = 'Master's' AND hours_worked > 150 AND month = 'January' AND year = '2023'

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills  */

-- SELECT *
-- FROM qualificationandskills;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    employee_id, 
    role
    
FROM qualificationandskills 
JOIN employee_performance_fact 
USING(employee_id)
JOIN employee_dimension
USING(employee_id)
WHERE 
    education_level LIKE 'Master%' 
    AND hours_worked > 150 
    AND month = 'January' 
    AND year = '2023';
    
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role
-- FROM employee_dimension e
-- JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
-- JOIN qualificationandskills q ON q.employee_id=e.employee_id
-- WHERE q.education_level = "Master's Degree"
-- AND ep.month = 'January' AND ep.year = 2023 AND ep.hours_worked > 150;