/* Brainstorming section */

-- Pick employees who have qualifications and skills credentials and also have department
-- info listed on them.

-- Group the selected employees with skills by department.

-- Select only the employees in the "Data Science" department who have expertise in Python.
-- (List all employees who have expertise in Python among those who work in the 
-- "Data Science" department.)

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT department, employee_id, technical_skills
-- FROM qualificationandskills JOIN employee_dimension
-- GROUP BY department, technical_skills
-- HAVING department = 'Data Science' AND technical_skills = 'Python';

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    employee_id,
    role,
    department
    
FROM qualificationandskills 
JOIN employee_dimension
USING (employee_id)
WHERE department = 'Data Science' AND technical_skills LIKE '%Python%';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role, e.department
-- FROM employee_dimension e
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE q.technical_skills LIKE '%Python%' AND e.department = 'Data Science';