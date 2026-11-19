/* Brainstorming section */

-- Pick the employees who completed projects and have a Ph.D.

-- Of those employees, pick the employees that completed projects in January 2023.

-- Then, calculate the revenue generated per project.

-- Finally, find the average revenue generated per project.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH emp_data1 AS
--      SELECT employee_id, education_level, projects_completed, revenue_generated, revenue_generated / projects_completed AS rev_per_proj
--      FROM employee_performance_fact JOIN qualificationandskills USING(employee_id)
--      WHERE projects_completed > 0 AND education_level = 'Ph.D.' AND month = 'January' AND year = '2023'
-- SELECT
--      AVG(rev_per_proj) AS avg_rev_per_proj
-- FROM emp_data1
-- GROUP BY education_level;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH emp_data1 AS
(
     SELECT 
     
        employee_id, 
        education_level, 
        projects_completed, 
        revenue_generated 
        
        
     FROM employee_performance_fact 
     JOIN qualificationandskills 
     USING(employee_id)
     WHERE 
        
        projects_completed > 0 
        AND education_level = 'Ph.D.' 
        AND month = 'January' 
        AND year = '2023'
),
emp_data2 AS
(
    SELECT

        SUM(revenue_generated) AS tot_rev,
        SUM(projects_completed) AS tot_projs

    FROM emp_data1
)
SELECT

    tot_rev / tot_projs AS avg_rev_per_proj
    
FROM emp_data2;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT SUM(ep.revenue_generated) / SUM(ep.projects_completed) AS Avg_Revenue_Per_Project
-- FROM employee_performance_fact ep
-- JOIN qualificationandskills q ON ep.employee_id = q.employee_id
-- WHERE ep.month = 'January' AND ep.year = 2023
-- AND q.education_level = 'Ph.D.';