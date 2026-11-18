/* Brainstorming section */

-- Group the table by department.

-- Calculate the total number of employees in each department (display as new column).

-- Calculate the maximum value of the total number of employees per department.

-- Filter out the department(s) whose total number of employees is equal to the maximum
-- value of the total number of employees per department.

-- Order the table by department name (ascend).

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT *
-- FROM
-- (
--      SELECT
--          department,
--          COUNT(*) AS total_num_employees
--      FROM employee_dimension
--      GROUP BY department
-- ) AS stage1
-- WHERE total_num_employees = 
-- (SELECT MAX(total_num_employees) 
--  FROM
--      (
--          SELECT
--              department,
--              COUNT(*) AS total_num_employees
--          FROM employee_dimension
--          GROUP BY department
--      ) AS stage2
-- )
-- ORDER BY department
-- LIMIT 1;

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

/* My solution */

-- Note: Once you use the ORDER BY clause in the query (making sure to order by the total
-- number of employees per department in descending order first and then the department in 
-- ascending order second), this will allow for the selection of the department with the 
-- maximum total number of employees without having the use derived table using subqueries.

SELECT *
FROM
(
     SELECT
         department,
         COUNT(*) AS total_num_employees
     FROM employee_dimension
     GROUP BY department
) AS stage1
WHERE total_num_employees = 
(SELECT MAX(total_num_employees) 
 FROM
     (
         SELECT
             department,
             COUNT(*) AS total_num_employees
         FROM employee_dimension
         GROUP BY department
     ) AS stage2
)
ORDER BY department
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     Department, 
--     COUNT(*) AS MostCommonDepartment
-- FROM employee_dimension 
-- GROUP BY Department 
-- ORDER BY COUNT(*) DESC, Department ASC
-- LIMIT 1;