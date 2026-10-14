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

SELECT department, AVG(salary) AS AverageSalary
FROM employees
GROUP BY department
HAVING AverageSalary > 60000
ORDER BY AverageSalary DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT department, AVG(salary) AS AverageSalary
-- FROM employees
-- GROUP BY department
-- HAVING AVG(salary) > 60000
-- ORDER BY AverageSalary DESC;