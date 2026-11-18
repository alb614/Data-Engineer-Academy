/* Brainstorming section */

-- Group the table by department.

-- Find the youngest employee in each department.

-- Retrieve the department, employeeid and name of the youngest employees per department.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--      department,
--      MIN(age) AS minimum_age
-- FROM employees_prc
-- GROUP BY department;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employees_prc */

-- SELECT *
-- FROM employees_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
     department,
     MIN(age) AS minimum_age
FROM employees_prc
GROUP BY department;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT department, MIN(age) AS YoungestAge
-- FROM employees_prc
-- GROUP BY department;