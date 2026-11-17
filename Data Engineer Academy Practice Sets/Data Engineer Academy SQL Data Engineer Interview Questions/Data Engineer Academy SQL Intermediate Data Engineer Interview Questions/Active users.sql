/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- An active user is a user who logins in the current month 
-- and has logged in in the previous month. 
-- Find the number of active users of each month.

-- Columns to Display: mth, monthly_active_users

-- WITH monthly_logins_per_user AS
-- (
-- SELECT
--     user_id,
--     RIGHT(DATE_FORMAT(login_date, '%m'), 1) as mth,
--     SUM(CASE WHEN login_id IS NOT NULL THEN 1 ELSE 0 END) AS num_mthly_logins
-- FROM dim_users_hinge
-- LEFT JOIN fact_logins_hinge
-- USING(user_id)
-- GROUP BY mth, user_id
-- ORDER BY user_id, mth
-- ),
-- current_and_prev_mth_user_activity AS
-- (
-- SELECT
--     *,
--     LAG(mth, 1) OVER(PARTITION BY user_id) AS prev_mth,
--     LAG(num_mthly_logins, 1, 0) OVER(PARTITION BY user_id) AS prev_num_logins
-- FROM monthly_logins_per_user
-- ),
-- mthly_user_status_data AS
-- (
-- SELECT
--     mth,
--     CASE
--         WHEN mth - prev_mth = 1 AND prev_mth IS NOT NULL AND num_mthly_logins > 0 AND prev_num_logins > 0 THEN 'Active' 
--         ELSE 'Not Active' 
--     END AS user_status
-- FROM current_and_prev_mth_user_activity
-- ORDER BY mth
-- )
-- SELECT
--     mth,
--     SUM(CASE WHEN user_status = 'Active' THEN 1 ELSE 0 END) AS monthly_active_users
-- FROM mthly_user_status_data
-- GROUP BY mth
-- HAVING monthly_active_users > 0
-- ORDER BY mth;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_users_hinge */

-- SELECT *
-- FROM dim_users_hinge
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_logins_hinge */

-- SELECT *
-- FROM fact_logins_hinge
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH monthly_logins_per_user AS
(
SELECT
    user_id,
    RIGHT(DATE_FORMAT(login_date, '%m'), 1) as mth,
    SUM(CASE WHEN login_id IS NOT NULL THEN 1 ELSE 0 END) AS num_mthly_logins
FROM dim_users_hinge
LEFT JOIN fact_logins_hinge
USING(user_id)
GROUP BY mth, user_id
ORDER BY user_id, mth
),
current_and_prev_mth_user_activity AS
(
SELECT
    *,
    LAG(mth, 1) OVER(PARTITION BY user_id) AS prev_mth,
    LAG(num_mthly_logins, 1, 0) OVER(PARTITION BY user_id) AS prev_num_logins
FROM monthly_logins_per_user
),
mthly_user_status_data AS
(
SELECT
    mth,
    CASE
        WHEN mth - prev_mth = 1 AND prev_mth IS NOT NULL AND num_mthly_logins > 0 AND prev_num_logins > 0 THEN 'Active' 
        ELSE 'Not Active' 
    END AS user_status
FROM current_and_prev_mth_user_activity
ORDER BY mth
)
SELECT
    mth,
    SUM(CASE WHEN user_status = 'Active' THEN 1 ELSE 0 END) AS monthly_active_users
FROM mthly_user_status_data
GROUP BY mth
HAVING monthly_active_users > 0
ORDER BY mth;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH cte AS(
--         SELECT
--             MONTH(login_date) as mth,
--             user_id
--         FROM fact_logins_hinge f
--         GROUP BY 1,2
-- )
-- SELECT
--     c2.mth,
--     COUNT(c1.user_id) as monthly_active_users
-- FROM cte c1
-- JOIN cte c2
-- ON c1.user_id = c2.user_id
-- AND (c2.mth - c1.mth) = 1
-- GROUP BY 1
-- ORDER BY mth;