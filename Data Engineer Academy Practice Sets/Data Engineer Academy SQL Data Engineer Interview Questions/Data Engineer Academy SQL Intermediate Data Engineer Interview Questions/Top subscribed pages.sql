/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT page_name, COUNT(DISTINCT user_id) AS total_subscribers
-- FROM dim_fb_pages AS dfp
-- JOIN fb_users_subscription AS fus
-- ON dfp.page_id = fus.page_id
-- WHERE subscribed = TRUE
-- GROUP BY page_name
-- ORDER BY total_subscribers DESC
-- LIMIT 1;

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
FROM dim_fb_pages AS dfp
JOIN fb_users_subscription AS fus
ON dfp.page_id = fus.page_id
WHERE subscribed = TRUE
GROUP BY page_name
ORDER BY total_subscribers DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT page_name,
--   COUNT(DISTINCT user_id) AS total_subscribers
-- FROM fb_users_subscription fus
-- LEFT JOIN dim_fb_pages dfp ON dfp.page_id = fus.page_id
-- WHERE subscribed = TRUE
-- GROUP BY 1
-- ORDER BY 2 DESC
-- LIMIT 1;