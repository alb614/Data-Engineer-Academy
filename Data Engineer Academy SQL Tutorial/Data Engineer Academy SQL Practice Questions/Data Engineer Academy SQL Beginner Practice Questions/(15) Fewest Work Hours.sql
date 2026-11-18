/* Brainstorming section */

-- Pick the data for the individual employee who worked the fewest hours in January 2023.

-- Display all the employee's data.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT *
-- FROM employee_performance_fact
-- WHERE
--      month = 'January'
--      AND year = 2023
--      AND hours_worked = (SELECT MIN(hours_worked) FROM employee_performance_fact);

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT *
FROM employee_performance_fact
WHERE
     month = 'January'
     AND year = 2023
     AND hours_worked = (SELECT MIN(hours_worked) FROM employee_performance_fact);
     -- Keep in mind that the subquery above in the WHERE clause will find the minimum
     -- hours worked among all the employee in the table.  We're only concerned with the 
     -- employees that worked on January 2023.  Therefore, using a WHERE clause in the 
     -- subquery would make sense to filter only the January 2023 working employees before
     -- find the minimum hours worked.
     
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     *
-- FROM
--     employee_performance_fact
-- WHERE
--     hours_worked=(
--         SELECT
--             MIN(hours_worked)
--         FROM
--             employee_performance_fact
--         WHERE
--             month ='January'
--         AND
--             year=2023
--     )
-- AND
--     month ='January'
-- AND
--     year=2023;