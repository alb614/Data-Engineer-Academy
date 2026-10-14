/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employees */

-- SELECT *
-- FROM employees
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT *
-- FROM 
--     (SELECT

--         e1.employee_id AS employee1_id,
--         CONCAT(e1.first_name, ' ', e1.last_name) AS employee1_name,
--         e2.employee_id AS employee2_id,
--         CONCAT(e2.first_name, ' ', e2.last_name) AS employee2_name,
--         e1.manager_id
    
--     FROM employees AS e1 JOIN employees AS e2
--     ON e1.manager_id = e2.manager_id 
--         AND e1.first_name <> e2.first_name 
--         AND e1.last_name <> e2.last_name
--     ORDER BY employee1_id
--     ) AS s
-- WHERE NOT EXISTS
-- (SELECT *
--  FROM s AS s2
--  WHERE s.employee1_id = s2.employee2_id 
--     AND s.employee2_id = s2.employee1_id
-- );

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- SELECT

--   e1.employee_id AS employee1_id,
--   CONCAT(e1.first_name, ' ', e1.last_name) AS employee1_name,
--   e2.employee_id AS employee2_id,
--   CONCAT(e2.first_name, ' ', e2.last_name) AS employee2_name,
--   e1.manager_id
  
-- FROM employees AS e1
-- JOIN employees AS e2
--   ON e1.manager_id = e2.manager_id
--   AND e1.employee_id < e2.employee_id   -- dedupe: keep only one ordering
-- WHERE e1.manager_id IS NOT NULL          -- optional: skip employees without a manager
-- ORDER BY e1.employee_id, e2.employee_id;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    e1.employee_id AS employee1_id,
    CONCAT(e1.first_name, ' ', e1.last_name) AS employee1_name,
    e2.employee_id AS employee2_id,
    CONCAT(e2.first_name, ' ', e2.last_name) AS employee2_name,
    e1.manager_id

FROM employees AS e1
JOIN employees AS e2
ON e1.manager_id = e2.manager_id 
AND e1.employee_id <> e2.employee_id 
AND e1.employee_id <> e1.manager_id
AND e1.employee_id < e2.employee_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     e1.employee_id AS employee1_id,
--     CONCAT(e1.first_name, ' ', e1.last_name) AS employee1_name,
--     e2.employee_id AS employee2_id,
--     CONCAT(e2.first_name, ' ', e2.last_name) AS employee2_name,
--     e1.manager_id
-- FROM 
--     employees e1
-- JOIN 
--     employees e2 
-- ON 
--     e1.manager_id = e2.manager_id 
-- AND e1.employee_id < e2.employee_id
-- WHERE 
--     e1.manager_id IS NOT NULL;