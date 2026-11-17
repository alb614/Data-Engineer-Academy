/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Which users subscribed the highest number of pages in the year of 2022? 

-- WITH page_count AS
-- (
--     SELECT 
    
--         user_id,
--         COUNT(DISTINCT page_id) AS subscribed_page_count
    
--     FROM fb_users_subscription
--     WHERE YEAR(action_timestamp) = 2022 
--         AND subscribed IS TRUE
--     GROUP BY user_id
-- ),
-- ranked AS
-- (
--     SELECT
    
--         user_id,
--         DENSE_RANK() OVER(ORDER BY subscribed_page_count DESC) AS rnk
    
--     FROM page_count
-- )
-- SELECT user_id
-- FROM ranked
-- WHERE rnk = 1;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_fb_pages */

-- SELECT *
-- FROM dim_fb_pages
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fb_users_subscription */

-- SELECT *
-- FROM fb_users_subscription
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH page_count AS
(
    SELECT 
    
        user_id,
        COUNT(DISTINCT page_id) AS subscribed_page_count
    
    FROM fb_users_subscription
    WHERE YEAR(action_timestamp) = 2022 
        AND subscribed IS TRUE
    GROUP BY user_id
),
ranked AS
(
    SELECT
    
        user_id,
        DENSE_RANK() OVER(ORDER BY subscribed_page_count DESC) AS rnk
    
    FROM page_count
)
SELECT user_id
FROM ranked
WHERE rnk = 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT user_id
-- FROM (
--   SELECT user_id,
--     RANK() OVER (ORDER BY count_number DESC) AS rank_val
--   FROM (
--     SELECT user_id,
--       COUNT(DISTINCT fus.page_id) AS count_number
--     FROM fb_users_subscription fus
--     WHERE YEAR(action_timestamp) = 2022 AND subscribed IS TRUE
--     GROUP BY 1
--     ORDER BY 2 DESC
--   ) temp_1
-- ) temp_2
-- WHERE rank_val = 1;