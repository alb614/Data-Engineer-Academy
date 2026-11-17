/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- By user count, 
-- what are the top 10 subscribed pages in descending order 
-- and page name in ascending order? 

-- *Output should be page_name, total_subscribers

-- SELECT 
--     page_name, 
--     COUNT(*) AS total_subscribers
-- FROM dim_fb_pages JOIN fb_users_subscription
-- WHERE subscribed IS TRUE
-- GROUP BY page_id
-- ORDER BY total_subscribers DESC, page_name
-- LIMIT 10;

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

SELECT 
    page_name, 
    COUNT(DISTINCT user_id) AS total_subscribers
FROM dim_fb_pages dfp
JOIN fb_users_subscription fus
USING(page_id)
WHERE subscribed IS TRUE
GROUP BY page_id
ORDER BY total_subscribers DESC, page_name
LIMIT 10;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT page_name,
--   COUNT(distinct user_id) AS total_subscribers
-- FROM fb_users_subscription fus
-- LEFT JOIN dim_fb_pages dfp ON dfp.page_id = fus.page_id
-- WHERE subscribed = TRUE
-- GROUP BY fus.page_id
-- ORDER BY total_subscribers DESC, page_name ASC
-- LIMIT 10;