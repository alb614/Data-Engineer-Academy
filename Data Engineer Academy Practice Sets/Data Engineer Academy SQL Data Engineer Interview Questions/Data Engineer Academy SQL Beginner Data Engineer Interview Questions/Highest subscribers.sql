/* Brainstorming section */

-- Given below are the tables of users subscribing to different facebook pages.

-- Find the admins with highest number of pages subscribed to in the year of 2022
-- Columns to Display: admin_id

-- Hint: user_id in the above table are of the admis


-- 0 - Not Subscriber
-- 1 - Subscribed

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH num_subscribed_2022 AS
-- (
--     SELECT
--         user_id,
--         COUNT(DISTINCT page_id) AS num_subscribed
--     FROM fb_users_subscription
--     WHERE YEAR(action_timestamp) = 2022 AND subscribed = 1
--     GROUP BY user_id
-- )
-- SELECT user_id as admin_id
-- FROM num_subscribed_2022
-- WHERE num_subscribed = (SELECT MAX(num_subscribed) FROM num_subscribed_2022);

-- SELECT 
--     user_id,
--     page_id,
--     action_timestamp,
--     subscribed
-- FROM fb_users_subscription
-- WHERE YEAR(action_timestamp) = 2022 AND user_id = 'user3'
-- ORDER BY user_id;

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

WITH num_subscribed_2022 AS
(
    SELECT
        user_id,
        COUNT(DISTINCT page_id) AS num_subscribed
    FROM fb_users_subscription
    WHERE YEAR(action_timestamp) = 2022 AND subscribed = 1
    GROUP BY user_id
)
SELECT user_id as admin_id
FROM num_subscribed_2022
WHERE num_subscribed = (SELECT MAX(num_subscribed) FROM num_subscribed_2022);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH tmp AS (
--     SELECT 
--         user_id as admin_id,
--         COUNT(DISTINCT page_id) AS num_pages
--     FROM 
--         fb_users_subscription
--     WHERE 
--         YEAR(action_timestamp) = '2022' 
--         AND subscribed = 1
--     GROUP BY 
--         user_id
-- )

-- SELECT 
--     admin_id
-- FROM 
--     tmp
-- WHERE 
--     num_pages = (
--         SELECT 
--             MAX(num_pages) 
--         FROM 
--             tmp
--     );