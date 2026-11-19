/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- List all employees 

-- SELECT employee_id, role, department
-- FROM table1
-- JOIN table2
-- USING(employee_id)
-- JOIN table3
-- USING(employee_id)

-- in the "Data Analyst" role 
-- who have expertise in "Python" 
-- and have worked more than the average hours worked by employees in the "Data Analyst" role.

-- WHERE role = 'Data Analyst'
-- AND technical_skills = '%Python%'
-- AND hours_worked > (SELECT AVG(hours_worked) FROM employee_performance_fact WHERE role = 'Data Analyst')


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

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

SELECT 

    employee_id,
    role
    
FROM employee_dimension ed
JOIN employee_performance_fact epf
USING(employee_id)
JOIN qualificationandskills q
USING(employee_id)
WHERE role = 'Data Analyst'
    AND technical_skills LIKE '%Python%'
    AND epf.hours_worked > 
    (   
        SELECT 
    
            AVG(hours_worked) 
        
        FROM employee_performance_fact 
        JOIN employee_dimension
        USING(employee_id)
        GROUP BY role
        HAVING role = 'Data Analyst'
    );

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- SELECT 

--     employee_id,
--     role
    
-- FROM employee_dimension ed
-- JOIN employee_performance_fact epf
-- USING(employee_id)
-- JOIN qualificationandskills q
-- USING(employee_id)
-- WHERE role = 'Data Analyst'
--     AND technical_skills LIKE '%Python%'
--     AND epf.hours_worked > 
--     (   
--         SELECT 
    
--             AVG(hours_worked) 
        
--         FROM employee_performance_fact 
--         JOIN employee_dimension
--         USING(employee_id)
--         WHERE role = 'Data Analyst'
--     );

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH AvgHoursWorked AS (
--     SELECT AVG(ep.hours_worked) AS Avg_Hours
--     FROM employee_dimension e
--     JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
--     WHERE e.role = 'Data Analyst'
-- )
-- SELECT e.employee_id, e.role
-- FROM employee_dimension e
-- JOIN qualificationandskills q ON e.employee_id = q.employee_id
-- JOIN employee_performance_fact ep ON e.employee_id = ep.employee_id
-- JOIN AvgHoursWorked ahw ON 1=1
-- WHERE e.role = 'Data Analyst'
-- AND q.technical_skills LIKE '%Python%'
-- AND ep.hours_worked > ahw.Avg_Hours;