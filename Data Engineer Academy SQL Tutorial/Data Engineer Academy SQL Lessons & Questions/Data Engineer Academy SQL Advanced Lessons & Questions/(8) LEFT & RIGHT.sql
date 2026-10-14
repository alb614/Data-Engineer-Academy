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

    employee_id,
    CONCAT(first_name, ' ', last_name) AS FullName,
    LEFT(department, 3) AS ShortDeptName
    
FROM employees;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     employee_id,
--     CONCAT(first_name, ' ', last_name) AS FullName,
--     LEFT(department, 3) as ShortDeptName
-- FROM
--     employees;