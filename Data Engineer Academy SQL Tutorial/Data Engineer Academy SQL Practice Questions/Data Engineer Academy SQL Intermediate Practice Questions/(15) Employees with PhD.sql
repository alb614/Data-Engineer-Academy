/* Brainstorming section */

-- Filter the table to show only employees that have a Ph.D. and have expertise in Python and R.

-- Retrieve the requested employee data.

-- Display query results.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT *
-- FROM qualificationandskills
-- WHERE education_level = 'Ph.D.' 
--      AND technical_skills LIKE '%Python%' 
--      AND technical_skills LIKE '%, R,%';

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
WHERE education_level = 'Ph.D.' 
     AND technical_skills LIKE '%Python%' 
     AND technical_skills LIKE '%, R,%';
     
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT * 
-- FROM qualificationandskills 
-- WHERE education_level = 'Ph.D.' 
-- AND technical_skills LIKE '%Python%' 
-- AND technical_skills LIKE '%R,%';