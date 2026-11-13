/* Brainstorming section */

-- Write a query to find user whose videos are 
-- 'Most viewed', 
-- 'Least liked', 
-- 'Most downloaded' 
-- and 'Most shared' 
-- where followed should be an even number. 
-- Output should also show the number of followers followed. 

-- Columns to Display: 
-- account_id, 
-- name, 
-- metric, 
-- counts, 
-- followers 
-- where metric are those three descriptions above ^

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH stage1 AS
-- (
-- SELECT
--     ta.account_id,
--     name,
--     SUM(views) AS total_views,
--     SUM(likes) AS total_likes,
--     SUM(downloads) AS total_downloads,
--     SUM(share) AS total_shares,
--     COUNT(*) AS counts,
--     SUM(followed) AS followers
-- FROM tiktok_accounts AS ta
-- JOIN tiktok_videos AS tv
-- USING(account_id)
-- WHERE MOD(followed, 2) = 0
-- GROUP BY ta.account_id
-- ),
-- stage2 AS
-- (
--     SELECT
--         account_id,
--         name,
--         CASE
--             WHEN total_views = (SELECT MAX(total_views) FROM stage1) THEN "Most viewed"
--             WHEN total_likes = (SELECT MIN(total_likes) FROM stage1) THEN "Least liked"
--             WHEN total_downloads = (SELECT MAX(total_downloads) FROM stage1) THEN "Most downloaded"
--             WHEN total_shares = (SELECT MAX(total_shares) FROM stage1) THEN "Most shared"
--         END AS metric,
--         counts,
--         followers
--     FROM stage1
-- )
-- select *
-- from stage2
-- WHERE metric IN ("Most viewed", "Least liked", "Most downloaded", "Most shared");

/*----------------------------------------------------------------------------------------------*/

-- SELECT
--     *
-- FROM
-- (
--     SELECT
--         account_id,
--         name,
--         CASE
--             WHEN max_views = (SELECT MAX(max_views) FROM stage1) THEN "Most viewed"
--             WHEN min_likes = (SELECT MIN(min_likes) FROM stage1) THEN "Least liked"
--             WHEN max_downloads = (SELECT MAX(max_downloads) FROM stage1) THEN "Most downloaded"
--             WHEN max_shares = (SELECT MAX(max_shares) FROM stage1) THEN "Most shared" 
--         END AS metric,
--         followers
--     FROM
--     (
--         SELECT
--             ta.account_id,
--             name,
--             MAX(views) AS max_views,
--             MIN(likes) AS min_likes,
--             MAX(downloads) AS max_downloads,
--             MAX(share) AS max_shares,
--             COUNT(*) AS counts,
--             SUM(followed) AS followers
--         FROM tiktok_accounts AS ta
--         JOIN tiktok_videos AS tv
--         USING(account_id)
--         WHERE MOD(followed, 2) = 0
--         GROUP BY ta.account_id
--     ) AS stage1
-- ) AS stage2
-- WHERE metric IN ("Most viewed", "Least liked", "Most downloaded", "Most shared");

/*----------------------------------------------------------------------------------------------*/

-- WITH stage1 AS
-- (
--         SELECT
--             ta.account_id,
--             name,
--             MAX(views) AS max_views,
--             MIN(likes) AS min_likes,
--             MAX(downloads) AS max_downloads,
--             MAX(share) AS max_shares
--         FROM tiktok_accounts AS ta
--         JOIN tiktok_videos AS tv
--         USING(account_id)
--         WHERE MOD(followed, 2) = 0
--         GROUP BY ta.account_id
-- ),
-- stage2 AS
-- (
--     SELECT
--         account_id,
--         name,
--         max_views,
--         min_likes,
--         max_downloads,
--         max_shares,
--         CASE
--             WHEN max_views = (SELECT MAX(max_views) FROM stage1) THEN "Most viewed"
--             WHEN min_likes = (SELECT MIN(min_likes) FROM stage1) THEN "Least liked"
--             WHEN max_downloads = (SELECT MAX(max_downloads) FROM stage1) THEN "Most downloaded"
--             WHEN max_shares = (SELECT MAX(max_shares) FROM stage1) THEN "Most shared" 
--         END AS metric
--     FROM stage1
-- )
-- SELECT
--     account_id,
--     name,
--     metric,
--     CASE
--         WHEN metric = "Most viewed" THEN max_views
--         WHEN metric = "Least liked" THEN min_likes
--         WHEN metric = "Most downloaded" THEN max_downloads
--         WHEN metric = "Most shared" THEN max_shares
--     END AS counts
-- FROM stage2
-- WHERE metric IN ("Most viewed", "Least liked", "Most downloaded", "Most shared");

/*----------------------------------------------------------------------------------------------*/

-- WITH user_data AS
-- (
--     SELECT
--         ta.account_id,
--         name,
--         views,
--         likes,
--         downloads,
--         share,
--         followed,
--         MAX(views) OVER() AS max_views,
--         MIN(likes) OVER() AS min_likes,
--         MAX(downloads) OVER() AS max_downloads,
--         MAX(share) OVER() AS max_shares
--     FROM tiktok_accounts AS ta
--     JOIN tiktok_videos AS tv
--     USING(account_id)
--     WHERE MOD(followed, 2) = 0
-- ),
-- calc_metric AS 
-- (
--     SELECT
--         account_id,
--         name,
--         views,
--         likes,
--         downloads,
--         share,
--         followed,
--         CASE
--             WHEN views = max_views THEN "Most viewed"
--             WHEN likes = min_likes THEN "Least liked"
--             WHEN downloads = max_downloads THEN "Most downloaded"
--             WHEN share = max_shares THEN "Most shared" 
--         END AS metric
--     FROM user_data
-- )
-- SELECT
--     account_id,
--     name, 
--     metric,
--     CASE
--         WHEN metric = "Most viewed" THEN views
--         WHEN metric = "Least liked" THEN likes
--         WHEN metric = "Most downloaded" THEN downloads
--         WHEN metric = "Most shared" THEN share
--     END AS counts,
--     followed AS followers
-- FROM calc_metric
-- WHERE metric IN ("Most viewed", "Least liked", "Most downloaded", "Most shared");


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table tiktok_accounts */

-- SELECT *
-- FROM tiktok_accounts
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table tiktok_videos */

-- SELECT *
-- FROM tiktok_videos
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH user_data AS
(
    SELECT
        ta.account_id,
        name,
        views,
        likes,
        downloads,
        share,
        followed,
        MAX(views) OVER() AS max_views,
        MIN(likes) OVER() AS min_likes,
        MAX(downloads) OVER() AS max_downloads,
        MAX(share) OVER() AS max_shares
    FROM tiktok_accounts AS ta
    JOIN tiktok_videos AS tv
    USING(account_id)
    WHERE MOD(followed, 2) = 0
),
calc_metric AS 
(
    SELECT
        account_id,
        name,
        views,
        likes,
        downloads,
        share,
        followed,
        CASE
            WHEN views = max_views THEN "Most viewed"
            WHEN likes = min_likes THEN "Least liked"
            WHEN downloads = max_downloads THEN "Most downloaded"
            WHEN share = max_shares THEN "Most shared" 
        END AS metric
    FROM user_data
)
SELECT
    account_id,
    name, 
    metric,
    CASE
        WHEN metric = "Most viewed" THEN views
        WHEN metric = "Least liked" THEN likes
        WHEN metric = "Most downloaded" THEN downloads
        WHEN metric = "Most shared" THEN share
    END AS counts,
    followed AS followers
FROM calc_metric
WHERE metric IN ("Most viewed", "Least liked", "Most downloaded", "Most shared");

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH cte
--      AS (SELECT a.account_id,
--                 'Most viewed' AS metric,
--                 a.views       AS Counts,followed
--          FROM   tiktok_videos a
--          WHERE  a.views = (SELECT Max(aa.views)
--                           FROM   tiktok_videos aa where followed%2 =0)
                           
--          UNION
--          SELECT b.account_id,
--                 'Least liked' AS metric,
--                 b.likes      AS Counts,followed
--          FROM   tiktok_videos b
--          WHERE  b.likes = (SELECT min(bb.likes)
--                           FROM   tiktok_videos bb where followed%2 =0)
                              
--          UNION
--          SELECT c.account_id,
--                 'Most downloaded' AS metric,
--                 c.downloads      AS Counts,followed
--          FROM   tiktok_videos c
--          WHERE  c.downloads = (SELECT Max(cc.downloads)
--                               FROM   tiktok_videos cc where followed%2 =0)
                              
--          UNION
--          SELECT d.account_id,
--                 'Most shared' AS metric,
--                 d.share       AS Counts,followed
--          FROM   tiktok_videos d
--          WHERE  d.share = (SELECT Max(dd.share)
--                           FROM   tiktok_videos dd where followed%2 =0)
                             
--                           )
                          
                          
-- SELECT cte.account_id,
--       name,
--       metric,
--       counts, followed as followers
-- FROM   cte 
--       LEFT JOIN tiktok_accounts y
--               ON cte.account_id = y.account_id;