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

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     employee_id,
--     first_name,
--     last_name,
--     salary
-- FROM employees
-- WHERE 
--     salary > (SELECT 
--                 AVG(salary)
--               FROM employees);