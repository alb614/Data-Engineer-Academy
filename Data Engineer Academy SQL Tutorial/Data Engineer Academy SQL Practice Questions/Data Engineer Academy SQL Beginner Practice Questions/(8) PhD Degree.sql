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

/* Viewing table qualificationandskills */

-- SELECT *
-- FROM qualificationandskills
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT *
FROM qualificationandskills
WHERE education_level = "Ph.D." AND field_of_study = "Data Science";

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT * 
-- FROM qualificationandskills 
-- WHERE education_level = 'Ph.D.' 
-- AND field_of_study = 'Data Science';