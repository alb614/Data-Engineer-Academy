/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH dim_matchHistory_espn_formatted AS
-- (
--     SELECT
--         DISTINCT DATE_FORMAT(match_started_time, "%m-%d-%Y") AS match_started_time_formatted,
--         score
--     FROM dim_matchHistory_espn
-- ),
-- dim_matchHistory_espn_formatted_filtered AS
-- (
--     SELECT 
--         *
--     FROM dim_matchHistory_espn_formatted
--     WHERE match_started_time_formatted >= "01-01-2020"
-- ),
-- ranked AS
-- (
--     SELECT 
--         *, 
--         ROW_NUMBER() OVER(ORDER BY score) AS match_num
--     FROM dim_matchHistory_espn_formatted_filtered
-- ),
-- calc_median_score AS
-- (
--     SELECT
--         CASE
--             WHEN MAX(match_num) % 2 = 0 THEN (SELECT ROUND(AVG(score), 4) FROM ranked WHERE match_num IN ((SELECT MAX(match_num) / 2.0 FROM ranked), (SELECT MAX(match_num) / 2.0 FROM ranked)+1))
--             WHEN MAX(match_num) % 2 = 1 THEN (SELECT ROUND(AVG(score), 4) FROM ranked WHERE match_num = (((SELECT MAX(match_num) FROM ranked)-1) / 2.0)+1)
--         END AS median_score
--     FROM ranked
-- )
-- SELECT median_score
-- FROM calc_median_score;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_cricket_players_espn */

-- SELECT *
-- FROM dim_cricket_players_espn
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_matchHistory_espn */

-- SELECT *
-- FROM dim_matchHistory_espn
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

-- WITH dim_matchHistory_espn_formatted AS
-- (
--     SELECT
--         DISTINCT DATE_FORMAT(match_started_time, "%m-%d-%Y") AS match_started_time_formatted,
--         score
--     FROM dim_matchHistory_espn
-- ),
-- dim_matchHistory_espn_formatted_filtered AS
-- (
--     SELECT 
--         *
--     FROM dim_matchHistory_espn_formatted
--     WHERE match_started_time_formatted >= "01-01-2020"
-- ),
-- ranked AS
-- (
--     SELECT 
--         *, 
--         ROW_NUMBER() OVER(ORDER BY score) AS match_num
--     FROM dim_matchHistory_espn_formatted_filtered
-- ),
-- calc_median_score AS
-- (
--     SELECT
--         CASE
--             WHEN MAX(match_num) % 2 = 0 THEN (SELECT ROUND(AVG(score), 4) FROM ranked WHERE match_num IN ((SELECT MAX(match_num) / 2.0 FROM ranked), (SELECT MAX(match_num) / 2.0 FROM ranked)+1))
--             WHEN MAX(match_num) % 2 = 1 THEN (SELECT ROUND(AVG(score), 4) FROM ranked WHERE match_num = (((SELECT MAX(match_num) FROM ranked)-1) / 2.0)+1)
--         END AS median_score
--     FROM ranked
-- )
-- SELECT median_score
-- FROM calc_median_score;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

WITH RankedScores AS (
    -- 1. Filter the data and assign a row number (rank) based on the score.
    SELECT
        score,
        -- Calculate the total count of scores in the filtered set
        COUNT(score) OVER () AS total_count,
        -- Assign a unique rank to each score in ascending order
        ROW_NUMBER() OVER (ORDER BY score ASC) AS rn
    FROM
        dim_matchHistory_espn
    WHERE
        -- Filter condition: matches started on or after Jan 1, 2020
        match_started_time >= '2020-01-01'
)
SELECT
    -- 2. Calculate the Median: Average of the middle one or two scores.
    -- We use ROUND(..., 4) to ensure the output is precisely formatted to 4 decimal places.
    ROUND(AVG(score), 4) AS median_score
FROM
    RankedScores
WHERE
    rn IN (
        -- Calculate the position of the middle score(s)
        CEIL(total_count / 2.0),
        FLOOR(total_count / 2.0) + 1
    );