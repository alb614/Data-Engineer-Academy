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

/* Viewing table employees_prc */

-- SELECT *
-- FROM employees_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT AVG(salary) average_salary
FROM employees_prc;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     AVG(Salary) AS AverageSalary 
-- FROM 
--     employees_prc;