/* Brainstorming section */

-- Filter out the employees that worked in the month of January and the year of 2023.

-- Calculate the maximum number of hours that a given employee worked.

-- Filter out the employee whose hours_worked is equal to the maximum number of hours worked.

-- Display the query results.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT *
-- FROM employee_performance_fact
-- WHERE
--      month = 'January'
--      AND year = 2023
--      AND hours_worked = 
--      (
--         SELECT MAX(hours_worked) 
--         FROM employee_performance_fact
--         WHERE month = 'January' 
--         AND year = 2023
--      );

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT *
FROM employee_performance_fact
WHERE
     month = 'January'
     AND year = 2023
     AND hours_worked = 
     (
        SELECT MAX(hours_worked) 
        FROM employee_performance_fact
        WHERE month = 'January' 
        AND year = 2023
     );
     
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT * 
-- FROM employee_performance_fact 
-- WHERE month = 'January' 
-- AND year = 2023
-- AND hours_worked=(
--     SELECT
--         MAX(hours_worked)
--     FROM employee_performance_fact 
--     WHERE month = 'January' 
--     AND year = 2023);