/* Brainstorming section */

-- Select the employees on the table.

-- Calculate the max salary of the employees on the table (Use subquery).

-- Filter out the employee whose salary is equal to the max salary.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT *
-- FROM employee_dimension
-- WHERE salary = 
-- (
--      SELECT MAX(salary)
--      FROM employee_dimension
-- );

/*----------------------------------------------------------------------------------------------*/

-- WITH maximum_salary AS
-- (
--      SELECT 
--          MAX(salary) AS max_salary
--      FROM employee_dimension
-- )
-- SELECT *
-- FROM employee_dimension
-- WHERE salary = (SELECT max_salary FROM maximum_salary);


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

SELECT *
FROM employee_dimension
WHERE salary = 
(
     SELECT MAX(salary)
     FROM employee_dimension
);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT *
-- FROM employee_dimension
-- WHERE salary = (
--     SELECT MAX(salary) FROM employee_dimension
-- );