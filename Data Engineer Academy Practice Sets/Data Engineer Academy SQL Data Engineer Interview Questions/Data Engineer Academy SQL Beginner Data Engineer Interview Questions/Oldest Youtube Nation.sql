/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the oldest country on youtube 
-- (The country with the most YouTubers starting in the most senior year)

-- If multiple cases, 
-- then get the country that is first based on alphabetical order ascending 
 
-- Cloumns to Display: Country, total_number_of_youtubers

-- WITH CTE AS
-- (
-- SELECT
--     country,
--     started,
--     COUNT(*) AS num_youtubers
-- FROM youtubers_table
-- JOIN dim_countries_youtube
-- USING(youtuber_id)
-- GROUP BY country, started
-- ORDER BY country, started
-- ),
-- CTE2 AS
-- (
-- SELECT
--     country,
--     num_youtubers,
--     RANK() OVER(PARTITION BY country ORDER BY started) AS rnk
-- FROM CTE
-- ),
-- CTE3 AS
-- (
-- SELECT country, num_youtubers
-- FROM CTE2
-- WHERE rnk = 1
-- )
-- SELECT *
-- FROM CTE3
-- WHERE num_youtubers =
--     (SELECT MAX(num_youtubers) FROM CTE3)
-- ORDER BY country
-- LIMIT 1;

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

WITH num_youtubers_per_country_per_year AS
(
    SELECT
    
        country,
        started,
        COUNT(*) AS num_youtubers
        
    FROM youtubers_table
    JOIN dim_countries_youtube
    USING(youtuber_id)
    GROUP BY country, started
    ORDER BY country, started
),
ranked_num_youtubers_per_country_per_year AS
(
    SELECT
    
        country,
        num_youtubers,
        RANK() OVER(PARTITION BY country ORDER BY started) AS rnk
        
    FROM num_youtubers_per_country_per_year
),
top_num_youtubers_per_country AS
(
    SELECT 
    
        country, 
        num_youtubers
    
    FROM ranked_num_youtubers_per_country_per_year
    WHERE rnk = 1
)
SELECT *
FROM top_num_youtubers_per_country
WHERE num_youtubers = (SELECT MAX(num_youtubers) FROM top_num_youtubers_per_country)
ORDER BY country
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #1 */

-- WITH ranked_countries AS (
--     SELECT 
--         Country,
--         COUNT(DISTINCT Youtuber_id) AS total_number_of_youtubers,
--         ROW_NUMBER() OVER (
--             ORDER BY 
--                 COUNT(DISTINCT Youtuber_id) DESC,
--                 Country ASC
--         ) AS rn
--     FROM youtubers_table
--     JOIN dim_countries_youtube
--     USING (Youtuber_id)
--     WHERE started = (
--         SELECT MIN(started) 
--         FROM youtubers_table
--     )
--     GROUP BY Country
-- )

-- SELECT 
--     Country,
--     total_number_of_youtubers
-- FROM ranked_countries
-- WHERE rn = 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #2 */

-- SELECT 
-- 	country,
-- 	COUNT(*) AS total_num_youtubers
-- FROM youtubers_table
-- JOIN dim_countries_youtube
-- USING(youtuber_id)
-- WHERE started = (SELECT MIN(started) FROM youtubers_table)
-- GROUP BY country
-- ORDER BY total_num_youtubers DESC
-- LIMIT 1;