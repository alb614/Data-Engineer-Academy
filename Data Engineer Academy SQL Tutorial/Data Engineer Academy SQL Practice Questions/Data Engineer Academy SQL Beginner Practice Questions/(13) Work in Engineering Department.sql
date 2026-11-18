/* Brainstorming section */

-- Pick the employees who have a salary greater than 70000 and work in Engineering.

-- Display their data.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT *
-- FROM employee_dimension
-- WHERE salary > 70000 AND department = 'Engineering';

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table employee_dimension */

-- SELECT *
-- FROM employee_dimension;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT *
FROM employee_dimension
WHERE salary > 70000 AND department = 'Engineering';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT * 
-- FROM employee_dimension 
-- WHERE salary>70000
-- AND department = 'Engineering';