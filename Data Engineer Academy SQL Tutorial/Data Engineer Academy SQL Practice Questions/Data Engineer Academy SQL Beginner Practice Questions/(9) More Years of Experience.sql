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

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT COUNT(*) num_employees_with_5plus_years_experience
FROM employee_dimension
WHERE experience_years >= 5;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT COUNT(*) 
-- FROM employee_dimension 
-- WHERE experience_years >= 5;