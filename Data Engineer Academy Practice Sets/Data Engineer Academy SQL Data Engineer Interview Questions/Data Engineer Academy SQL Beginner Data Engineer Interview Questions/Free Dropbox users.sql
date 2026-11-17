/* Brainstorming section */

-- Percent of total Dropbox users who use Dropbox for free, 
-- that is never paid for any monthly subscription, 
-- using SQL JOIN condition.  
-- Column feature_name in the table fact_user_upgrades_dropbox 
-- specifies the plan taken by users.

-- Columns to Display: Percent of users

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT

--     ROUND(100*SUM(CASE WHEN has_feature IS NULL THEN 1 ELSE 0 END) / COUNT(*), 4) AS "Percent_users"

-- FROM dim_users_dropbox AS d
-- LEFT JOIN 
-- (   SELECT 
--         DISTINCT user_id,
--         CASE
--             WHEN feature_name IS NOT NULL THEN "Has feature"
--         END AS has_feature
--     FROM fact_user_upgrades_dropbox
-- ) AS f
-- ON d.user_id = f.user_id;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_users_dropbox */

-- SELECT *
-- FROM dim_users_dropbox
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_account_usage_dropbox */

-- SELECT *
-- FROM fact_account_usage_dropbox
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_user_upgrades_dropbox */

-- SELECT *
-- FROM fact_user_upgrades_dropbox
-- GROUP BY feature_name;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    ROUND(100*SUM(CASE WHEN has_feature IS NULL THEN 1 ELSE 0 END) / COUNT(*), 4) AS "Percent_users"

FROM dim_users_dropbox AS d
LEFT JOIN 
(   SELECT 
        DISTINCT user_id,
        CASE
            WHEN feature_name IS NOT NULL THEN "Has feature"
        END AS has_feature
    FROM fact_user_upgrades_dropbox
) AS f
ON d.user_id = f.user_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT (COUNT(DISTINCT us.user_id))*100/(SELECT COUNT(*) FROM dim_users_dropbox) AS Percent_users
-- FROM dim_users_dropbox us
-- LEFT JOIN fact_user_upgrades_dropbox up
--   ON us.user_id = up.user_id
-- WHERE up.user_id IS NULL;