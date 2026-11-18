/* Brainstorming section */

-- Pick the employees that have a master's degree.

-- Display the retrieved data.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT COUNT(*) AS emp_with_masters
-- FROM employee_dimension
-- JOIN qualificationandskills
-- USING(employee_id)
-- WHERE education_level = "Master's Degree";

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

/* Viewing table qualificationandskills  */

-- SELECT *
-- FROM qualificationandskills 
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

-- Note: If you want an apostrophe in a string, wrap the string 
-- in double quotes before inserting the single quote
-- (apostrophe).

SELECT COUNT(*) AS emp_with_masters
FROM employee_dimension
JOIN qualificationandskills
USING(employee_id)
WHERE education_level = "Master's Degree";

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT COUNT(*) 
-- FROM employee_dimension e
-- JOIN qualificationandskills q
-- USING(employee_id)
-- WHERE q.Education_Level = "Master's Degree";