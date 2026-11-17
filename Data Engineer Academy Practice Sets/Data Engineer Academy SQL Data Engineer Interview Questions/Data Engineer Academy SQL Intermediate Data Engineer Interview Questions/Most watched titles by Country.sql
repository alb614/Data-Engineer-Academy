/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- List Top 10 most watched titles by each Country 
-- based on the watched time. Only List Out "United States", "Canada", and "Egypt"

-- Columns to Display: Country, Title, Unique_Users_Watched, Total_Time_Spent_Hours. 

-- Hint - Sort by unique users count in descending order

-- WITH time_spent_watching_per_user_per_title AS
-- (
--     SELECT
    
--       nu.country,
--       nt.title,
--       nu.user_id,
--       SUM(TIMESTAMPDIFF(SECOND, nwh.start_time, nwh.end_time)) AS time_spent_hours
    
--     FROM netflix_users AS nu
--     JOIN netflix_watch_history AS nwh
--     ON nu.user_id = nwh.user_id
--     JOIN netflix_titles AS nt
--     ON nwh.video_id = nt.video_id
--     WHERE nu.country IN ('United States', 'Canada', 'Egypt')
--     GROUP BY nu.country, nu.user_id, nwh.video_id
-- ),
-- total_time_spent_watching_per_title AS
-- (
--     SELECT
    
--         country,
--         title,
--         COUNT(user_id) AS unique_users_watched,
--         ROUND(SUM(time_spent_hours) / 3600, 4) AS total_time_spent_hours
        
--     FROM time_spent_watching_per_user_per_title
--     GROUP BY country, title
-- ),
-- ranked AS
-- (
--     SELECT
    
--         country,
--         title,
--         unique_users_watched,
--         total_time_spent_hours,
--         DENSE_RANK() OVER(PARTITION BY country ORDER BY total_time_spent_hours DESC, unique_users_watched DESC) AS rnk
    
--     FROM total_time_spent_watching_per_title
-- )
-- SELECT

--     country,
--     title,
--     unique_users_watched,
--     total_time_spent_hours
    
-- FROM ranked
-- WHERE rnk <= 10
-- ORDER BY unique_users_watched DESC;


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table netflix_titles */

-- SELECT *
-- FROM netflix_titles
-- ORDER BY title
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table netflix_users */

-- SELECT *
-- FROM netflix_users
-- ORDER BY country
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table netflix_watch_history */

-- SELECT *
-- FROM netflix_watch_history
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH time_spent_watching_per_user_per_title AS
(
    SELECT
    
      nu.country,
      nt.title,
      nu.user_id,
      SUM(TIMESTAMPDIFF(SECOND, nwh.start_time, nwh.end_time)) AS time_spent_hours
    
    FROM netflix_users AS nu
    RIGHT JOIN netflix_watch_history AS nwh
    ON nu.user_id = nwh.user_id
    LEFT JOIN netflix_titles AS nt
    ON nwh.video_id = nt.video_id
    WHERE nu.country IN ('United States', 'Canada', 'Egypt')
    GROUP BY nu.country, nu.user_id, nwh.video_id
),
total_time_spent_watching_per_title AS
(
    SELECT
    
        country,
        title,
        COUNT(user_id) AS unique_users_watched,
        ROUND(SUM(time_spent_hours) / 3600, 4) AS total_time_spent_hours
        
    FROM time_spent_watching_per_user_per_title
    GROUP BY country, title
),
ranked AS
(
    SELECT
    
        country,
        title,
        unique_users_watched,
        total_time_spent_hours,
        DENSE_RANK() OVER(PARTITION BY country ORDER BY total_time_spent_hours DESC, unique_users_watched DESC) AS rnk
    
    FROM total_time_spent_watching_per_title
)
SELECT

    country,
    title,
    unique_users_watched,
    total_time_spent_hours
    
FROM ranked
WHERE rnk <= 10
ORDER BY unique_users_watched DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT country,
--       title,
--       unique_users         Unique_Users_Watched,
--       total_minutes / 60 AS Total_Time_Spent_Hours
-- FROM   (SELECT *,
--               Rank()
--                  OVER (
--                   partition BY country
--                   ORDER BY total_minutes DESC) AS rankVal
--         FROM   (SELECT nu.country,
--                       title,
--                       Sum(Timestampdiff(minute, start_time, end_time)) AS
--                       total_minutes,
--                       Count(DISTINCT nwh.user_id)                      AS
--                       unique_users
--                 FROM   netflix_watch_history nwh
--                       LEFT JOIN netflix_users nu
--                               ON nu.user_id = nwh.user_id
--                       LEFT JOIN netflix_titles nt
--                               ON nt.video_id = nwh.video_id
--                 GROUP  BY 1,
--                           2) temp) temp2
-- WHERE  rankval <= 10
-- AND country IN ("United States", "Canada",  "Egypt")
-- ORDER  BY unique_users_watched DESC;