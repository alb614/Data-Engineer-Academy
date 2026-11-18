/* Brainstorming section */

-- Calculate the maximum salary in each department.

-- Display the department name and the max salary for each department.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT department, MAX(salary)
-- FROM employees_prc
-- GROUP BY department;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employees_prc */

-- SELECT *
-- FROM employees_prc;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT department, MAX(salary) AS max_salary
FROM employees_prc
GROUP BY department;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT Department, MAX(Salary) AS MaxSalary
-- FROM employees_prc
-- GROUP BY department;