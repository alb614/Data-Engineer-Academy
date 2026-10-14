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

/* Viewing table employees */

-- SELECT *
-- FROM employees
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT department, SUM(salary) AS TotalSalaryExpenses
FROM employees
GROUP BY department
ORDER BY TotalSalaryExpenses DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT department, SUM(salary) AS TotalSalaryExpenses
-- FROM employees
-- GROUP BY department
-- ORDER BY TotalSalaryExpenses DESC;