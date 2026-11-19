/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Identify the employee with the highest projects-to-hours ratio in January 2023.
-- SELECT employee_id, month, year, projects_completed, hours_worked, revenue_generated, project_to_hours_ratio
-- MAX(projects_completed/hours_worked)
-- WHERE month = 'January' AND year = 2023

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact
-- LIMIT 10;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

SELECT *
FROM
(
    SELECT 
    
        employee_id, 
        month, 
        year, 
        projects_completed, 
        hours_worked, 
        revenue_generated, 
        projects_completed / hours_worked AS project_to_hours_ratio
        
    FROM employee_performance_fact
    WHERE month = 'January' AND year = 2023
) AS employee_data_1
WHERE project_to_hours_ratio =
(

    SELECT MAX(project_to_hours_ratio)
    FROM 
    (
    
        SELECT 
        
            employee_id, 
            month, 
            year, 
            projects_completed, 
            hours_worked, 
            revenue_generated, 
            projects_completed / hours_worked AS project_to_hours_ratio
            
        FROM employee_performance_fact
        WHERE month = 'January' AND year = 2023
    
    ) AS employee_data_2

)

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- WITH employee_data AS
-- (
--     SELECT 
    
--         employee_id, 
--         month, 
--         year, 
--         projects_completed, 
--         hours_worked, 
--         revenue_generated, 
--         projects_completed / hours_worked AS project_to_hours_ratio
        
--     FROM employee_performance_fact
--     WHERE month = 'January' AND year = 2023
-- )
-- SELECT *
-- FROM employee_data
-- WHERE project_to_hours_ratio =
-- (SELECT MAX(project_to_hours_ratio) FROM employee_data)

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT *, (projects_completed / hours_worked) AS Projects_to_Hours_Ratio 
-- FROM employee_performance_fact 
-- WHERE month = 'January' 
-- AND year = 2023 
-- ORDER BY Projects_to_Hours_Ratio DESC 
-- LIMIT 1;