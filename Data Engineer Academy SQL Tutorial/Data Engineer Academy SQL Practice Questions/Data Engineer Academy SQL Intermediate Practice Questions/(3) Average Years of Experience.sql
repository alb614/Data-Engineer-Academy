/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- 

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

SELECT

    AVG(experience_years) AS average_exp_years
    
FROM qualificationandskills qs JOIN employee_dimension ed
USING(employee_id)
WHERE 
    role = "Data Scientist" AND technical_skills LIKE "%TensorFlow%";

/*----------------------------------------------------------------------------------------------*/

/* Extraneous query */

-- SELECT *
-- FROM qualificationandskills JOIN employee_dimension
-- USING(employee_id);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT AVG(e.experience_years) AS Avg_Experience
-- FROM employee_dimension e
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- WHERE e.role = 'Data Scientist'
-- AND q.technical_skills LIKE '%TensorFlow%';