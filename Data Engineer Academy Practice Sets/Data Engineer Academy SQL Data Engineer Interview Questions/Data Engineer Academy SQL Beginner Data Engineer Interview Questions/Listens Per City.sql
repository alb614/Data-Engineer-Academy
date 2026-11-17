/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the total number of listening actions 
-- done in each city 
-- and display the result in descending order 
-- of the total listening actions.

-- Columns to Display: city, listening_count

-- SELECT city, COUNT(*) AS listening_count
-- FROM dim_users_spotify
-- JOIN fact_weekly_songs_listens
-- USING(user_id)
-- GROUP BY city
-- ORDER BY listening_count DESC;

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

/* Viewing table fact_weekly_songs_listens */

-- SELECT *
-- FROM fact_weekly_songs_listens
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 

    city, 
    COUNT(*) AS listening_count
    
FROM dim_users_spotify
JOIN fact_weekly_songs_listens
USING(user_id)
GROUP BY city
ORDER BY listening_count DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT city, COUNT(listen_id) AS listening_count
-- FROM fact_weekly_songs_listens
-- JOIN dim_users_spotify
-- USING (user_id)
-- GROUP BY city
-- ORDER BY listening_count DESC;