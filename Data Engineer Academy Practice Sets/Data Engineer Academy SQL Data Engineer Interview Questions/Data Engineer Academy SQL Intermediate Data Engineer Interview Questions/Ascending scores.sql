/* Brainstorming section */

-- Find the name of the publisher
-- who has at least 5 posts
-- and with an increasing score over time
-- (the score of any post is strictly superior to the last post's score)
-- Columns to Display: Name

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH at_least_five_posts AS
-- (
--     SELECT
--         fr.publisher_id,
--         COUNT(*) AS num_posts
--     FROM dim_publishers_reddit AS dpr
--     JOIN fact_reddit AS fr
--     ON dpr.publisher_id = fr.publisher_id
--     GROUP BY fr.publisher_id
--     HAVING num_posts >= 5
-- ),
-- prev_curr_scores AS
-- (
--     SELECT
--         fr.publisher_id,
--         name,
--         num_posts,
--         score,
--         LAG(score, 1, 0) OVER(PARTITION BY fr.publisher_id ORDER BY creation_date) AS prev_score
--     FROM dim_publishers_reddit AS dpr
--     JOIN fact_reddit AS fr
--     ON dpr.publisher_id = fr.publisher_id
--     JOIN at_least_five_posts AS a
--     ON fr.publisher_id = a.publisher_id
-- ),
-- calc_score_diff AS
-- (
--     SELECT 
--         *,
--         score - prev_score AS score_diff
--     FROM prev_curr_scores
-- ),
-- is_strictly_increasing AS
-- (
--     SELECT
--         *,
--         SUM(CASE WHEN score_diff > 0 THEN 1 ELSE 0 END) AS strictly_incr_count
--     FROM calc_score_diff
--     GROUP BY publisher_id
--     HAVING num_posts = strictly_incr_count
-- )
-- SELECT name
-- FROM is_strictly_increasing;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_publishers_reddit */

-- SELECT *
-- FROM dim_publishers_reddit
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_reddit */

-- SELECT *
-- FROM fact_reddit
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH at_least_five_posts AS
(
    SELECT
        fr.publisher_id,
        COUNT(*) AS num_posts
    FROM dim_publishers_reddit AS dpr
    JOIN fact_reddit AS fr
    ON dpr.publisher_id = fr.publisher_id
    GROUP BY fr.publisher_id
    HAVING num_posts >= 5
),
prev_curr_scores AS
(
    SELECT
        fr.publisher_id,
        name,
        num_posts,
        score,
        LAG(score, 1, 0) OVER(PARTITION BY fr.publisher_id ORDER BY creation_date) AS prev_score
    FROM dim_publishers_reddit AS dpr
    JOIN fact_reddit AS fr
    ON dpr.publisher_id = fr.publisher_id
    JOIN at_least_five_posts AS a
    ON fr.publisher_id = a.publisher_id
),
calc_score_diff AS
(
    SELECT 
        *,
        score - prev_score AS score_diff
    FROM prev_curr_scores
),
is_strictly_increasing AS
(
    SELECT
        *,
        SUM(CASE WHEN score_diff > 0 THEN 1 ELSE 0 END) AS strictly_incr_count
    FROM calc_score_diff
    GROUP BY publisher_id
    HAVING num_posts = strictly_incr_count
)
SELECT name
FROM is_strictly_increasing;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #1 */

-- WITH RankedPosts AS (
--     -- 1. Order posts by creation date and retrieve the score of the immediately preceding post
--     SELECT
--         Publisher_id,
--         Score,
--         Creation_date,
--         -- Get the previous post's score for the same publisher
--         LAG(Score) OVER (
--             PARTITION BY Publisher_id
--             ORDER BY Creation_date ASC
--         ) AS previous_score
--     FROM
--         fact_reddit
-- ),
-- PublisherScoreCheck AS (
--     -- 2. Check if the current post's score is strictly greater than the previous one
--     SELECT
--         Publisher_id,
--         -- Count the total number of posts for this publisher
--         COUNT(*) OVER (PARTITION BY Publisher_id) AS total_posts,
--         -- Flag posts that are NOT strictly increasing (i.e., Score <= previous_score)
--         SUM(CASE
--             -- Score is the same or decreased OR it is NOT the first post (NULL previous_score)
--             WHEN Score <= previous_score THEN 1
--             ELSE 0
--         END) OVER (PARTITION BY Publisher_id) AS non_increasing_posts_count
--     FROM
--         RankedPosts
--     -- Filter out the very first posts, as they always contribute to an increasing sequence by default
--     -- The check for NULL in the CASE statement handles the score comparison for subsequent posts.
--     WHERE
--         previous_score IS NOT NULL OR 1 = 1 -- Keep all posts to get the correct COUNT in the partition
-- )
-- -- 3. Final selection: Filter for publishers who have >= 5 posts AND 0 non-increasing steps
-- SELECT DISTINCT
--     t1.Name
-- FROM
--     dim_publishers_reddit t1
-- JOIN
--     PublisherScoreCheck t2 ON t1.Publisher_id = t2.Publisher_id
-- WHERE
--     t2.total_posts >= 5  -- Criterion 1: At least 5 posts
--     AND t2.non_increasing_posts_count = 0 -- Criterion 2: Score is strictly increasing (no score was <= previous score)
-- ORDER BY
--     t1.Name;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #2 */

-- WITH time_and_score_rank AS
-- (
-- 	SELECT
-- 	   name,
-- 	   creation_date,
-- 	   score,
-- 	   RANK() OVER(PARTITION BY publisher_id ORDER BY score) AS score_rank,
-- 	   ROW_NUMBER() OVER(PARTITION BY publisher_id ORDER BY creation_date) AS time_rank
-- 	FROM fact_reddit
-- 	JOIN dim_publishers_reddit
-- 	USING(publisher_id)
-- )

-- SELECT DISTINCT name
-- FROM time_and_score_rank
-- WHERE time_rank > 4
-- AND name NOT IN
-- (
-- 	SELECT name
-- 	FROM time_and_score_rank
-- 	WHERE score_rank <> time_rank
-- );