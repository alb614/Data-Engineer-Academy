/* Brainstorming section */

-- Filter out the data for the month of January and the year 2023.

-- Sum up the total number of projects for the filtered data.

-- Retrieve the calculated sum and display the result.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT [sum of completed project number]
-- FROM employee_performance_fact
-- WHERE
--      month = 'January'
--      AND year = 2023

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

SELECT 

    SUM(projects_completed) AS total_num_projects
    
FROM employee_performance_fact
WHERE
     month = 'January'
     AND year = 2023;
     
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT SUM(projects_completed) 
-- FROM employee_performance_fact 
-- WHERE Month = 'January' 
-- AND Year = 2023;