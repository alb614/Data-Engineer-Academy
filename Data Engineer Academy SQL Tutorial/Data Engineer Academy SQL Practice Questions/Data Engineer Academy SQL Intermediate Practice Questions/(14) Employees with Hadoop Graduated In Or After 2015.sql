/* Brainstorming section */

-- Filter out the employees that have a tech skill in Hadoop and graduated in or after 2015.

-- Retrieve the employee_id and any other request employee data.

-- Display the result set.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT *
-- FROM qualificationandskills
-- WHERE technical_skills LIKE '%Hadoop%' AND graduation_year >= 2015;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT *
FROM qualificationandskills
WHERE technical_skills LIKE '%Hadoop%' AND graduation_year >= 2015;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT * 
-- FROM qualificationandskills 
-- WHERE technical_skills LIKE '%Hadoop%' 
-- AND graduation_year >= 2015;