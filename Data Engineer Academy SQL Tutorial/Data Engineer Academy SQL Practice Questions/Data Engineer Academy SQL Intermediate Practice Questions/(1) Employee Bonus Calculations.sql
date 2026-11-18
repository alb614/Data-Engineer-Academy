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

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    employee_id,
    salary,
    previousyearsalary,
    0.05 * salary AS bonus
    
FROM employee_dimension AS ed JOIN employee_performance_fact AS epf
USING(employee_id)
WHERE revenue_generated > 75000;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- select employee_id, salary, previousyearsalary, (salary * 0.05) as bonus
-- from employee_dimension
-- WHERE employee_id IN (
--     SELECT employee_id
--     FROM employee_performance_fact
--     WHERE revenue_generated > 75000);