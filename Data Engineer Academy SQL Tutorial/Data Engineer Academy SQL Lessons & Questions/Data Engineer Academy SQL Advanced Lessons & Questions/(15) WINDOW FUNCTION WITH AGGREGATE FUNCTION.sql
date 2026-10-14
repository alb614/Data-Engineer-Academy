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

WITH stage_1 AS
(
    SELECT 
    
        first_name,
        last_name,
        salary,
        AVG(salary) OVER (PARTITION BY department) AS avg_department_salary
        
    FROM employees
)
SELECT

    first_name,
    last_name,
    salary,
    avg_department_salary,
    salary - avg_department_salary AS salary_difference
    
FROM stage_1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     first_name,
--     last_name,
--     salary,
--     AVG(salary) OVER(PARTITION BY department) AS avg_department_salary,
--     salary - AVG(salary) OVER(PARTITION BY department) AS salary_difference
-- FROM
--     employees;