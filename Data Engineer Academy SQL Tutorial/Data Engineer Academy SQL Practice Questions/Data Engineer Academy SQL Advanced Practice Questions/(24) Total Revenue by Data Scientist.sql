/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Calculate the total revenue generated 

-- SUM(revenue_generated) AS total_revenue

-- by data scientists in January 2023.

-- WHERE role = 'Data Scientist' AND month = 'January' AND year = 2023



/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension
-- LIMIT 10;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact  */

-- SELECT *
-- FROM employee_performance_fact 
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    SUM(revenue_generated) AS total_revenue
    
FROM employee_dimension
JOIN employee_performance_fact
USING(employee_id)
WHERE role = 'Data Scientist' 
    AND month = 'January' 
    AND year = 2023;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT SUM(revenue_generated) 
-- FROM employee_performance_fact 
-- WHERE month = 'January' 
-- AND year = 2023 
-- AND employee_id IN (SELECT employee_id 
--                     FROM employee_dimension 
--                     WHERE role = 'Data Scientist');