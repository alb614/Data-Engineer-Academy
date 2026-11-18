/* Brainstorming section */

-- Calculate the average hours worked by all the employees on the entire table (no grouping).

-- Display the average

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT AVG(hours_worked) AS avg_hours_worked
-- FROM employee_performance_fact
-- WHERE
--      month = 'January'
--      AND year = 2023;

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

SELECT AVG(hours_worked) AS avg_hours_worked
FROM employee_performance_fact
WHERE
     month = 'January'
     AND year = 2023;
     
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT AVG(hours_worked) 
-- FROM employee_performance_fact 
-- WHERE Month = 'January' 
-- AND Year = 2023;