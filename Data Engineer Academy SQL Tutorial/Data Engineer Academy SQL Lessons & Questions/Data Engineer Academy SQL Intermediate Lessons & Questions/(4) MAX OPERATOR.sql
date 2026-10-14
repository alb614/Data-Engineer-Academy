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

SELECT employee_id, first_name, last_name, department, salary
FROM employees
WHERE salary IN (SELECT MAX(salary) FROM employees GROUP BY department);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT employee_id, first_name, last_name, department, salary
-- FROM employees e1
-- WHERE salary = (
--     SELECT MAX(salary)
--     FROM employees e2
--     WHERE e1.department = e2.department
-- );