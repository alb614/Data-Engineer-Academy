/* Brainstorming section */

-- Calculate the average experience for only data scientists.

-- Display the results.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT AVG(experience_years) AS avg_experience_years
-- FROM employee_dimension
-- WHERE role = 'Data Scientist';

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT AVG(experience_years) AS avg_experience_years
FROM employee_dimension
WHERE role = 'Data Scientist';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT AVG(experience_years) 
-- FROM employee_dimension 
-- WHERE role = 'Data Scientist';