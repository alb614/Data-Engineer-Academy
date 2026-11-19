/* Brainstorming section */

-- Pick the employees who completed projects in January 2023 and also have expertise
-- in Python and SQL.

-- Of those employees, pick the employee with the maximum number of completed projects.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT employee_id, role, department
-- FROM employee_dimension ed JOIN employee_performance_fact epf JOIN qualificationandskills q USING(employee_id)
-- WHERE month = 'January' AND year = '2023' AND technical_skills IN ('%Python%', '%SQL%') 
-- AND projects_completed = (SELECT MAX(projects_completed) FROM epf WHERE month = 'January' AND year = '2023' AND technical_skills IN ('%Python%', '%SQL%'))

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT 

--     employee_id, 
--     role, 
--     department
    
-- FROM employee_dimension ed 
-- JOIN employee_performance_fact epf 
-- USING(employee_id)
-- JOIN qualificationandskills q 
-- USING(employee_id)
-- WHERE 

--     month = 'January' 
--     AND year = 2023
--     AND technical_skills LIKE '%Python%'
--     AND technical_skills LIKE '%SQL%' 
--     AND projects_completed = 
--     (
--         SELECT 
        
--             MAX(projects_completed) 
            
--         FROM employee_dimension ed 
--         JOIN employee_performance_fact epf 
--         USING(employee_id)
--         JOIN qualificationandskills q 
--         USING(employee_id) 
--         WHERE 
        
--             month = 'January' 
--             AND year = 2023 
--             -- AND technical_skills LIKE '%Python%'
--             -- AND technical_skills LIKE '%SQL%' 
--     );

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- SELECT 

--     employee_id, 
--     role, 
--     department
    
-- FROM employee_dimension ed 
-- JOIN employee_performance_fact epf 
-- USING(employee_id)
-- JOIN qualificationandskills q 
-- USING(employee_id)
-- WHERE 

--     month = 'January' 
--     AND year = 2023
--     AND technical_skills LIKE '%Python%'
--     AND technical_skills LIKE '%SQL%' 
--     AND projects_completed = 
--     (
--         SELECT 
        
--             MAX(projects_completed) 
            
--         FROM employee_dimension ed 
--         JOIN employee_performance_fact epf 
--         USING(employee_id)
--         JOIN qualificationandskills q 
--         USING(employee_id) 
--         WHERE 
        
--             month = 'January' 
--             AND year = 2023 
            
--         GROUP BY employee_id
--     );
    
/*----------------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- WITH max_projects AS
-- (
--     SELECT 
        
--         MAX(projects_completed) 
            
--     FROM employee_dimension ed 
--     JOIN employee_performance_fact epf 
--     USING(employee_id)
--     JOIN qualificationandskills q 
--     USING(employee_id) 
--     -- WHERE 
        
--         -- month = 'January' 
--         -- AND year = 2023 
            
--     -- GROUP BY employee_id
-- )
-- SELECT 

--     ed.employee_id, 
--     role, 
--     department
    
-- FROM employee_dimension ed 
-- JOIN employee_performance_fact epf 
-- USING(employee_id)
-- JOIN qualificationandskills q 
-- USING(employee_id)
-- WHERE 

--     month = 'January' 
--     AND year = 2023
--     AND technical_skills LIKE '%Python%'
--     AND technical_skills LIKE '%SQL%' 
--     AND projects_completed = 
--     (
--         SELECT *
--         FROM max_projects
--     );

/*----------------------------------------------------------------------------------------------*/

/* Implementation #4 */

/* One possible correct solution using subquery */

-- SELECT 

--     ed.employee_id, 
--     role, 
--     department
    
-- FROM employee_dimension ed 
-- JOIN employee_performance_fact epf 
-- USING(employee_id)
-- JOIN qualificationandskills q 
-- USING(employee_id)
-- WHERE 

--     month = 'January' 
--     AND year = 2023
--     AND technical_skills LIKE '%Python%'
--     AND technical_skills LIKE '%SQL%'
--     AND projects_completed = 
--     (
--         SELECT 
        
--             MAX(projects_completed) 
            
--         FROM employee_dimension ed 
--         JOIN employee_performance_fact epf 
--         USING(employee_id)
--         JOIN qualificationandskills q 
--         USING(employee_id)
--         WHERE
--             month = 'January' 
--             AND year = 2023
--             AND technical_skills LIKE '%Python%'
--             AND technical_skills LIKE '%SQL%'
--     )
-- LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 (using CTE): */

-- WITH max_projects AS
-- (
--     SELECT 
        
--         MAX(projects_completed) 
            
--     FROM employee_dimension ed 
--     JOIN employee_performance_fact epf 
--     USING(employee_id)
--     JOIN qualificationandskills q 
--     USING(employee_id)
--     WHERE
--         month = 'January' 
--         AND year = 2023
--         AND technical_skills LIKE '%Python%'
--         AND technical_skills LIKE '%SQL%'
-- )
-- SELECT 

--     ed.employee_id, 
--     role, 
--     department
    
-- FROM employee_dimension ed 
-- JOIN employee_performance_fact epf 
-- USING(employee_id)
-- JOIN qualificationandskills q 
-- USING(employee_id)
-- WHERE 

--     month = 'January' 
--     AND year = 2023
--     AND technical_skills LIKE '%Python%'
--     AND technical_skills LIKE '%SQL%'
--     AND projects_completed = 
--     (
--         SELECT *
--         FROM max_projects
--     )
-- LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 (using CTE): */

WITH employeesWithMostProjectsCompleted AS
(
    SELECT 
        SUM(projects_completed) AS total_projects_completed, 
        employee_id, 
        role, 
        department
    FROM employee_dimension
    JOIN employee_performance_fact 
    USING(employee_id)
    JOIN qualificationandskills 
    USING(employee_id)
    WHERE 
    month = 'January' 
    AND year = 2023
    AND technical_skills LIKE '%Python%'
    AND technical_skills LIKE '%SQL%'
    GROUP BY employee_id
    ORDER BY total_projects_completed DESC
)
SELECT 
    employee_id, 
    role, 
    department
FROM employeesWithMostProjectsCompleted
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT employee_id,
--     role,
--     department
-- FROM (
--     SELECT 
--         e.employee_id as employee_id,
--         e.role as role,
--         e.department as department,
--         SUM(ep.projects_completed) AS total_projects,
--         RANK() OVER (ORDER BY SUM(ep.projects_completed) DESC) AS rnk
--     FROM employee_dimension e
--     JOIN employee_performance_fact ep 
--         ON e.employee_id = ep.employee_id
--     JOIN qualificationandskills q 
--         ON e.employee_id = q.employee_id
--     WHERE ep.month = 'January'
--       AND ep.year = 2023
--       AND q.technical_skills LIKE '%Python%'
--       AND q.technical_skills LIKE '%SQL%'
--       AND e.salary > 73000
--     GROUP BY e.employee_id, e.role, e.department
-- ) t
-- WHERE rnk = 1;