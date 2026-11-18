/* Brainstorming section */

-- Join the two table together.

-- Filter (where) out the employees that have both a Master's degree and know Hadoop.

-- Display the result set.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT employee_id, role, department
-- FROM employee_dimension
-- JOIN qualificationandskills
-- USING(employee_id)
-- WHERE 
--      education_level = "Master's degree"
--      AND
--      technical_skills LIKE "%Hadoop%";

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

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT employee_id, role, department
FROM employee_dimension
JOIN qualificationandskills
USING(employee_id)
WHERE 
     education_level = "Master's degree"
     AND
     technical_skills LIKE "%Hadoop%";
     
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT e.employee_id, e.role, e.department
-- FROM employee_dimension e
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE q.education_level = "Master's Degree"
-- AND q.technical_skills LIKE '%Hadoop%';