/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the country with the fourth most video_views. 
 
-- Columns to Display: country, total_views_per_country

-- SELECT
--     country,
--     SUM(video_views) AS total_views_per_country
-- FROM dim_countries_youtube
-- JOIN youtubers_table
-- USING(youtuber_id)
-- GROUP BY country
-- ORDER BY total_views_per_country DESC
-- LIMIT 1
-- OFFSET 3;

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

/* My solution */

SELECT
    country,
    SUM(video_views) AS total_views_per_country
FROM dim_countries_youtube
JOIN youtubers_table
USING(youtuber_id)
GROUP BY country
ORDER BY total_views_per_country DESC
LIMIT 1
OFFSET 3;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT country, SUM(video_views) AS total_views_per_country
-- FROM youtubers_table
-- JOIN dim_countries_youtube USING (youtuber_id)
-- GROUP BY country
-- ORDER BY total_views_per_country DESC
-- LIMIT 3,1;