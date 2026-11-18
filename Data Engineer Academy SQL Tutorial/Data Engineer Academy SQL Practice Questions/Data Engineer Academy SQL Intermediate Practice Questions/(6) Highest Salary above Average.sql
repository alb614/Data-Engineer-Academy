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

SELECT

    employeeid,
    name,
    salary

FROM employees_prc
WHERE

    salary = (SELECT MAX(salary) FROM employees_prc) AS max_salary 
    AND salary > (SELECT AVG(salary) FROM employees_prc) AS average_salary;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     employeeid, name, salary
-- FROM 
--     employees_prc
-- WHERE 
--     salary > (SELECT AVG(salary) FROM employees_prc)
-- ORDER BY 
--     salary DESC
-- LIMIT 1;