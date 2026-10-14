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

SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > 70000 OR department = 'Finance';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT employee_id,first_name, last_name
-- FROM employees
-- WHERE Salary > 70000 OR department = 'Finance';