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

/* Implementation #1 */

-- SELECT *
-- FROM employee_dimension
-- GROUP BY department
-- HAVING 
-- department IN
-- (
--     SELECT
--         department
--     FROM employee_dimension
--     WHERE department = 'Analytics'
-- ) AND
-- salary IN
-- (
--     SELECT
--         MAX(salary)
--     FROM employee_dimension
-- );

/*-------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- SELECT *
-- FROM employee_dimension
-- WHERE 
--     department = 'Analytics' AND
--     salary IN
--     (
--         SELECT
--             MAX(salary)
--         FROM employee_dimension
--         GROUP BY department
--     );

/*-------------------------------------------------------------------------------------------*/

/* My solution */

SELECT *
FROM employee_dimension
WHERE 
    department = 'Analytics' AND
    salary IN
    (
        SELECT
            MAX(salary)
        FROM employee_dimension
        WHERE department = 'Analytics'
        GROUP BY department -- This part isn't necessary since we're only interested in the 
                            -- maximum salary from the Analytics department (not every
                            -- department).
    );

/*-------------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- SELECT

--     employee_id,
--     role,
--     department,
--     experience_years,
--     MAX(salary),
--     previousyearsalary,
--     location
    
-- FROM employee_dimension
-- WHERE department = 'Analytics'
-- GROUP BY department;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     *
-- FROM
--     employee_dimension
-- WHERE
--     department ='Analytics'
-- AND
--     salary=(
--         SELECT 
--             MAX(salary)
--         FROM
--             employee_dimension
--         WHERE
--             department='Analytics'
-- );