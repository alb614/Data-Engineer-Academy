/* Brainstorming section */

-- Select employee data for employees that generated more than $100k in revenue in January 2023.

-- Display the data for these employees.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT COUNT(*) AS num_emp_rev_more_than_100k
-- FROM employee_performance_fact
-- WHERE
--      month = 'January'
--      AND year = 2023
--      AND revenue_generated > 100000;

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

SELECT COUNT(*) AS num_emp_rev_more_than_100k
FROM employee_performance_fact
WHERE
     month = 'January'
     AND year = 2023
     AND revenue_generated > 100000;
     
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT COUNT(*) 
-- FROM employee_performance_fact 
-- WHERE month = 'January' 
-- AND year = 2023 
-- AND revenue_generated > 100000;