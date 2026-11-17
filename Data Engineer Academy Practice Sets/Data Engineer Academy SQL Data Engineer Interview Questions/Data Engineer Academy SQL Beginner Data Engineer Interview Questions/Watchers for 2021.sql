/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- List down the top 5 watchers 
-- who have spent more than 40 Hours 
-- for year 2021. 
-- Output should be the name,  total_minutes.

-- Cloumns to Display: name, total_minutes

-- WITH CTE AS
-- (
-- SELECT name, SUM(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS total_minutes 
-- FROM netflix_users
-- JOIN netflix_watch_history 
-- USING(user_id)
-- WHERE YEAR(start_time) = 2021
-- GROUP BY user_id
-- )
-- SELECT *
-- FROM CTE
-- WHERE total_minutes > 60 * 40
-- ORDER BY total_minutes DESC
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table netflix_titles */

-- SELECT *
-- FROM netflix_titles
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table netflix_users */

-- SELECT *
-- FROM netflix_users
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table netflix_watch_history */

-- SELECT *
-- FROM netflix_watch_history
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH user_name_total_minutes AS
(
    SELECT 
    
        name, 
        SUM(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS total_minutes 
    
    FROM netflix_users
    JOIN netflix_watch_history 
    USING(user_id)
    WHERE YEAR(start_time) = 2021
    GROUP BY user_id
)
SELECT *
FROM user_name_total_minutes
WHERE total_minutes > 60 * 40
ORDER BY total_minutes DESC
LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--   nu.name,
--   SUM(TIMESTAMPDIFF(MINUTE, nwh.start_time, nwh.end_time)) AS total_minutes
-- FROM netflix_watch_history nwh
-- JOIN netflix_users nu ON nu.user_id = nwh.user_id
-- WHERE YEAR(nwh.start_time) = 2021
-- GROUP BY nu.name
-- HAVING total_minutes > 2400
-- ORDER BY total_minutes DESC
-- LIMIT 5;