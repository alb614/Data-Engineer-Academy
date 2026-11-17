/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the cumulative number of song plays for each user as of 10 November 2022, 
-- combining both historical data and recent listens.

-- Historical listens are stored in the fact_historical_songs_listens table, 
-- while more recent events are recorded in the fact_weekly_songs_listens table.

-- Only include listens from fact_weekly_songs_listens that occurred before 10 November 2022.

-- Return the top 3 users based on their total cumulative plays.

-- Columns to Display: user_id, songs_count.

-- SELECT

--     user_id,
--     SUM(total_plays) AS songs_count
    
-- FROM
-- (
--     SELECT
    
--         user_id,
--         SUM(song_plays) AS total_plays
        
--     FROM fact_historical_songs_listens
--     GROUP BY user_id
    
--     UNION ALL
    
--     SELECT
    
--         user_id,
--         COUNT(*) AS total_plays
    
--     FROM fact_weekly_songs_listens
--     WHERE DATE(listen_time) < '2022-11-10'
--     GROUP BY user_id
-- ) AS total_current_and_historical_plays
-- GROUP BY user_id
-- ORDER BY songs_count DESC
-- LIMIT 3;
    



/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_users_spotify */

-- SELECT *
-- FROM dim_users_spotify
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_historical_songs_listens */

-- SELECT *
-- FROM fact_historical_songs_listens
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_weekly_songs_listens */

-- SELECT *
-- FROM fact_weekly_songs_listens
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    user_id,
    SUM(total_plays) AS songs_count
    
FROM
(
    SELECT
    
        user_id,
        SUM(song_plays) AS total_plays
        
    FROM fact_historical_songs_listens
    GROUP BY user_id
    
    UNION ALL
    
    SELECT
    
        user_id,
        COUNT(*) AS total_plays
    
    FROM fact_weekly_songs_listens
    WHERE DATE(listen_time) < '2022-11-10'
    GROUP BY user_id
) AS total_current_and_historical_plays
GROUP BY user_id
ORDER BY songs_count DESC
LIMIT 3;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH history AS (
--   SELECT user_id, SUM(song_plays) AS song_plays
--   FROM fact_historical_songs_listens
--   GROUP BY user_id
--   UNION ALL
--   SELECT user_id, COUNT(listen_id) AS song_plays
--   FROM fact_weekly_songs_listens
--   WHERE listen_time <= '2022-11-10'
--   GROUP BY user_id
-- )
-- SELECT
--   user_id,
--   SUM(song_plays) AS songs_count
-- FROM history
-- GROUP BY user_id
-- ORDER BY songs_count DESC
-- LIMIT 3;