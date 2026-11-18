/* Brainstorming section */

-- Calculate the difference between current salary and previous year salary to get the 
-- average salary per employee.

-- Select the employee name and average salary and display them.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT 
--      employeeid,
--      name,
--      CAST(salary - previousyearsalary AS DECIMAL(10, 6)) AS average_salary_increase
-- FROM employees_prc;

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

-- For the usage of the CAST function to get the calculation to 6 significant
-- figures, one could have used the AVG function as well in this case.

SELECT

     employeeid,
     name,
     ROUND(CAST(salary - previousyearsalary AS DECIMAL(10, 6)), 2) AS average_salary_increase
 
FROM employees_prc;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT employeeid, name, (salary - previousyearsalary) AS SalaryIncrease
-- FROM employees_prc;