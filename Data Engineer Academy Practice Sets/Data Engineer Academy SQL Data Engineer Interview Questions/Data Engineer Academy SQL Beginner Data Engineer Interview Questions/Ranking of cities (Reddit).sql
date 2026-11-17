/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the fourth and fifth cities with the most posts

-- Cloums to Display: city, number_of_posts

-- WITH CTE AS
-- (
-- SELECT
--     city, 
--     COUNT(*) AS number_of_posts,
--     DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
-- FROM dim_publishers_reddit
-- JOIN fact_reddit
-- USING(publisher_id)
-- GROUP BY city
-- )
-- SELECT city, number_of_posts
-- FROM CTE
-- WHERE rnk IN (4,5);


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_publishers_reddit */

-- SELECT *
-- FROM dim_publishers_reddit
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_reddit */

-- SELECT *
-- FROM fact_reddit
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH ranked_cities_by_num_posts AS
(
    SELECT
    
        city, 
        COUNT(*) AS number_of_posts,
        DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
        
    FROM dim_publishers_reddit
    JOIN fact_reddit
    USING(publisher_id)
    GROUP BY city
)
SELECT 

    city, 
    number_of_posts

FROM ranked_cities_by_num_posts
WHERE rnk IN (4,5);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH ranking_cities AS
-- (
-- SELECT city,
-- COUNT(*) AS number_of_posts,
-- DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS RNK
-- FROM fact_reddit
-- JOIN dim_publishers_reddit USING (publisher_id)
-- GROUP BY city
-- )
-- SELECT city,
-- number_of_posts
-- FROM ranking_cities
-- WHERE RNK IN (4,5);