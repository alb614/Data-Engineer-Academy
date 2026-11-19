/* Brainstorming section */

-- Pick employees with skill set (qualificationandskills table) and have additional 
-- employee info (employee_dimension).

-- Filter out and select the employees that have the Data Analyst role and have 
-- expertise in SQL or Python.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT employee_id, role, technical_skills
-- FROM qualificationandskills JOIN employee_dimension
-- WHERE role = 'Data Analyst' 
-- AND (technical_skills LIKE '%SQL%' OR technical_skills LIKE '%Python%')

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    employee_id, 
    role
    
FROM qualificationandskills 
JOIN employee_dimension
USING(employee_id)
WHERE 
    role = 'Data Analyst' 
    AND (technical_skills LIKE '%SQL%' OR technical_skills LIKE '%Python%');
    
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role
-- FROM employee_dimension e
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE (q.technical_skills LIKE '%SQL%' OR q.technical_skills LIKE '%Python%')
-- AND e.role = 'Data Analyst';