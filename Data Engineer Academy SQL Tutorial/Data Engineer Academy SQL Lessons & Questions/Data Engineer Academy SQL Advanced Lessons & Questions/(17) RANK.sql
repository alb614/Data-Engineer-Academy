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

SELECT

    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
    first_name,
    last_name,
    salary,
    department
    
FROM employees;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
--     first_name,
--     last_name,
--     salary,
--     department
-- FROM
--     employees;