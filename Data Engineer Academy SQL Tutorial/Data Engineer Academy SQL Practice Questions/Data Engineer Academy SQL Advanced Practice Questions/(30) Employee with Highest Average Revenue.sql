/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the employee with the highest average revenue per project completed 

-- SELECT 
-- employee_id,
-- role,
-- education_level,
-- AVG(revenue_generated/projects_completed) AS avg_revenue_per_proj
-- FROM table1 JOIN table2 JOIN table3

-- in January 2023, 
-- considering only employees with a Master's degree.

-- WHERE month = 'January'
-- AND year = 2023
-- AND education_level = "Master's Degree"

-- GROUP BY employee_id
-- ORDER BY avg_revenue_per_proj DESC
-- LIMIT 1

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

/* Viewing table employee_performance_fact */

-- SELECT *
-- FROM employee_performance_fact
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills  */

-- SELECT *
-- FROM qualificationandskills
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

SELECT

    employee_id,
    role,
    education_level
    
FROM
(
    SELECT 
    
        employee_id,
        role,
        education_level,
        AVG(revenue_generated/projects_completed) AS avg_revenue_per_proj
        
    FROM employee_dimension 
    JOIN employee_performance_fact
    USING(employee_id)
    JOIN qualificationandskills 
    USING(employee_id)
    WHERE month = 'January'
        AND year = 2023
        AND education_level = "Master's Degree"
    GROUP BY employee_id
    ORDER BY avg_revenue_per_proj DESC
    LIMIT 1
) AS employee_avg_rev_per_proj;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- WITH employee_avg_rev_per_proj AS
-- (
--     SELECT 
    
--         employee_id,
--         role,
--         education_level,
--         AVG(revenue_generated/projects_completed) AS avg_revenue_per_proj
        
--     FROM employee_dimension 
--     JOIN employee_performance_fact
--     USING(employee_id)
--     JOIN qualificationandskills 
--     USING(employee_id)
--     WHERE month = 'January'
--         AND year = 2023
--         AND education_level = "Master's Degree"
--     GROUP BY employee_id
--     ORDER BY avg_revenue_per_proj DESC
--     LIMIT 1
-- )
-- SELECT

--     employee_id,
--     role,
--     education_level
    
-- FROM employee_avg_rev_per_proj;

/*----------------------------------------------------------------------------------------------*/

/* My solution #3 */

-- SELECT

--     employee_id,
--     role,
--     education_level
    
-- FROM
-- (
--     SELECT 
    
--         employee_id,
--         role,
--         education_level,
--         AVG(revenue_generated/projects_completed) AS avg_revenue_per_proj
        
--     FROM employee_dimension 
--     JOIN employee_performance_fact
--     USING(employee_id)
--     JOIN qualificationandskills 
--     USING(employee_id)
--     WHERE month = 'January'
--         AND year = 2023
--         AND education_level = "Master's Degree"
--     GROUP BY employee_id
-- ) AS employee_avg_rev_per_proj
-- WHERE avg_revenue_per_proj =
-- (

--     SELECT MAX(avg_revenue_per_proj)
--     FROM
--     (
--         SELECT 
        
--             AVG(revenue_generated/projects_completed) AS avg_revenue_per_proj
            
--         FROM employee_dimension 
--         JOIN employee_performance_fact
--         USING(employee_id)
--         JOIN qualificationandskills 
--         USING(employee_id)
--         WHERE month = 'January'
--             AND year = 2023
--             AND education_level = "Master's Degree"
--         GROUP BY employee_id
--     ) AS avg_rev

-- );

/*----------------------------------------------------------------------------------------------*/

/* My solution #4 */

-- WITH employee_avg_rev_per_proj AS
-- (
--     SELECT 
    
--         employee_id,
--         role,
--         education_level,
--         AVG(revenue_generated/projects_completed) AS avg_revenue_per_proj
        
--     FROM employee_dimension 
--     JOIN employee_performance_fact
--     USING(employee_id)
--     JOIN qualificationandskills 
--     USING(employee_id)
--     WHERE month = 'January'
--         AND year = 2023
--         AND education_level = "Master's Degree"
--     GROUP BY employee_id
-- )
-- SELECT

--     employee_id,
--     role,
--     education_level
    
-- FROM employee_avg_rev_per_proj
-- WHERE avg_revenue_per_proj = (SELECT MAX(avg_revenue_per_proj) FROM employee_avg_rev_per_proj);


/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH MasterDegreeEmployees AS (
--     SELECT 
--         q.employee_id,
--         q.education_level
--     FROM qualificationandskills q
--     WHERE q.education_level = "Master's Degree"
-- )
-- SELECT e.employee_id, e.role, mde.education_level
-- FROM employee_dimension e
-- JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
-- JOIN MasterDegreeEmployees mde ON e.employee_id = mde.employee_id
-- WHERE ep.month = 'January' AND ep.year = 2023
-- ORDER BY (ep.revenue_generated / ep.projects_completed) DESC
-- LIMIT 1;