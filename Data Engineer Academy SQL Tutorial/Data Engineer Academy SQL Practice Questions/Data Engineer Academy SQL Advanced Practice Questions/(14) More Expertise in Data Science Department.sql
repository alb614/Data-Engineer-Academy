/* Brainstorming section */

-- Pick employees who have technical_skills and are members of a given department.

-- Of those employees, pick those who have expertise in Python and R and work
-- in the Data Science department.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT employee_id, role
-- FROM employee_dimension JOIN qualificationandskills
-- WHERE (technical_skills LIKE '%Python%' AND technical_skills LIKE '%R%')
-- AND department = 'Data Science'

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
JOIN qualificationandskills
USING(employee_id)
WHERE 
    technical_skills LIKE '%Python%' 
    AND technical_skills LIKE '%, R%'
    AND department = 'Data Science';
    
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role
-- FROM employee_dimension e
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE q.technical_skills LIKE '%Python%' AND (q.technical_skills LIKE '% ,R%' OR q.technical_skills LIKE '%R,%')
-- AND e.department = 'Data Science';