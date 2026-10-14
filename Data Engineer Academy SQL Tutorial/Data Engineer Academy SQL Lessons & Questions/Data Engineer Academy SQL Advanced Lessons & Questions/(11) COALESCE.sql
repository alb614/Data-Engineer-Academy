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

/* My solution #1 */

-- SELECT

--     a.employee_id,
--     a.first_name AS employee_first_name,
--     COALESCE(b.employee_id, 'X') AS manager_id,
--     COALESCE(b.first_name, 'Manager') AS manager_name
    
-- FROM employees AS a
-- LEFT JOIN employees AS b
-- ON a.manager_id = b.employee_id;

/*---------------------------------------------------------------------------------------------*/

/* My solution #2 */

SELECT

	e1.employee_id,
	e1.first_name AS employee_first_name,
	COALESCE(e1.manager_id, 'X') AS manager_id,
	CASE
	WHEN e1.manager_id = e2.employee_id AND e1.manager_id IS NOT NULL THEN e2.first_name
	ELSE 'Manager'
	END AS manager_name

FROM employees AS e1
LEFT JOIN employees AS e2
ON e1.manager_id = e2.employee_id

UNION

FROM employees AS e1
RIGHT JOIN employees AS e2
ON e1.manager_id = e2.employee_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
-- e.employee_id,
--     e.first_name AS employee_first_name,
--     COALESCE(m.employee_id, 'X') AS manager_id,
--     COALESCE(m.first_name, 'Manager') AS manager_name
-- FROM 
--     employees e
-- LEFT JOIN 
--     employees m
-- ON
--     m.employee_id = e.manager_id;