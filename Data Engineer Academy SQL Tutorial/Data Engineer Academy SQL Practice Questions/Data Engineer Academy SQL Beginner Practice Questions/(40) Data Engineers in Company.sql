/* Brainstorming section */

-- Count the number of employees whose role in the company is Data Engineer.

-- Display the result.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT count of employees in company
-- FROM employee_dimension
-- WHERE role = Data Engineer;

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

SELECT 

    COUNT(employee_id) AS num_data_engineers

FROM employee_dimension
WHERE role = 'Data Engineer';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT COUNT(*) 
-- FROM employee_dimension 
-- WHERE Role = 'Data Engineer';