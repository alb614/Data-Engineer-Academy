/* Brainstorming section */

-- # of users that rejoined after at least 3 months
-- with new subscription feature

-- not same as lsat one (Not paying for 3 months b/w previous subscription 
-- feature & upgraded subscription feature)

-- Columns to Display: 
-- User Name, 
-- previous Feature Name, 
-- upgraded Feature Name, 
-- Upgrade Date

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--     user_name,
--     prev_feature,
--     upgraded_feature,
--     upgrade_date
-- FROM
-- (
--     SELECT 
--         user_name,
--         LAG(feature_name, 1) OVER(PARTITION BY user_name ORDER BY upgrade_date) AS prev_feature,
--         LAG(upgrade_date, 1) OVER(PARTITION BY user_name ORDER BY upgrade_date) AS prev_upgrade_date,
--         feature_name AS upgraded_feature,
--         upgrade_date
--     FROM dim_users_dropbox AS dud
--     JOIN fact_user_upgrades_dropbox AS fud
--     ON dud.user_id = fud.user_id
-- ) AS sub
-- WHERE 
--     DATEDIFF(upgrade_date, prev_upgrade_date) >= 90 
--     AND prev_feature <> upgraded_feature
--     AND prev_feature IS NOT NULL;

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
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
    user_name,
    prev_feature,
    upgraded_feature,
    upgrade_date
FROM
(
    SELECT 
        user_name,
        LAG(feature_name, 1) OVER(PARTITION BY user_name ORDER BY upgrade_date) AS prev_feature,
        LAG(upgrade_date, 1) OVER(PARTITION BY user_name ORDER BY upgrade_date) AS prev_upgrade_date,
        feature_name AS upgraded_feature,
        upgrade_date
    FROM dim_users_dropbox AS dud
    JOIN fact_user_upgrades_dropbox AS fud
    ON dud.user_id = fud.user_id
) AS sub
WHERE 
    DATEDIFF(upgrade_date, prev_upgrade_date) >= 90 
    AND prev_feature <> upgraded_feature
    AND prev_feature IS NOT NULL;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     user_name,
--     prev_feature,
--     feature_name AS upgraded_feature,
--     upgrade_date
-- FROM
-- (
--     SELECT user_id,
--     feature_name,
--     upgrade_date,
--     LAG(feature_name, 1) OVER (PARTITION BY user_id ORDER BY upgrade_date) as prev_feature,
--     LAG(upgrade_date, 1) OVER (PARTITION BY user_id ORDER BY upgrade_date) as prev_upgrade_date
--     FROM fact_user_upgrades_dropbox
-- ) CTE
-- JOIN dim_users_dropbox us
-- ON CTE.user_id = us.user_id
-- WHERE prev_feature IS NOT NULL
--     AND feature_name <> prev_feature
--     AND TIMESTAMPDIFF(month, prev_upgrade_date, upgrade_date) >= 3;