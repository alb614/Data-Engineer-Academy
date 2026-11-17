/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Fetch the first 3 youtubers 
-- from each category 
-- who have the most video views

-- WITH ranked_youtubers AS
-- (
--     SELECT
    
--         category,
--         youtuber,
--         video_views,
--         DENSE_RANK() OVER(PARTITION BY category ORDER BY video_views DESC) AS rnk
    
--     FROM youtubers_table
-- )
-- SELECT *
-- FROM ranked_youtubers
-- WHERE rnk <= 3;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table youtubers_table */

-- SELECT *
-- FROM youtubers_table
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_countries_youtube */

-- SELECT *
-- FROM dim_countries_youtube
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_category_youtube */

-- SELECT *
-- FROM dim_category_youtube
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

WITH ranked_youtubers AS
(
    SELECT
    
        category,
        youtuber,
        video_views,
        ROW_NUMBER() OVER(PARTITION BY category ORDER BY video_views DESC) AS rnk
    
    FROM youtubers_table
)
SELECT *
FROM ranked_youtubers
WHERE rnk <= 3;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- SELECT *
-- FROM 
-- (

--     SELECT
    
--         category,
--         youtuber,
--         video_views,
--         ROW_NUMBER() OVER(PARTITION BY category ORDER BY video_views DESC) AS rnk
    
--     FROM youtubers_table

-- ) AS ranked_youtubers
-- WHERE rnk <= 3;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT category, youtuber , video_views, rnk FROM (
--     SELECT *,
--     RANK() OVER (PARTITION BY category ORDER BY video_views DESC) AS rnk
--     FROM youtubers_table
-- ) t
-- WHERE t.rnk <= 3;