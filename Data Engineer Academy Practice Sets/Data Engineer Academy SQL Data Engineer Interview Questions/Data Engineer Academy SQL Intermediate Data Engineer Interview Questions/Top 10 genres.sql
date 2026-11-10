/* Brainstorming section */

-- List the top 10 genres based on 
-- the count of movies of each genre

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT *
-- FROM
-- (
--     SELECT
--         genres AS genre_category,
--         COUNT(*) AS total_shows
--     FROM dim_titles_roku
--     GROUP BY genre_category
-- ) AS sub
-- ORDER BY total_shows DESC;

-- SELECT 
--     genre_category,
--     COUNT(*) AS total_shows
-- FROM
-- (
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'drama') > 0 THEN SUBSTRING(genres, INSTR(genres, 'drama'), 5)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'romance') > 0 THEN SUBSTRING(genres, INSTR(genres, 'romance'), 7)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'thriller') > 0 THEN SUBSTRING(genres, INSTR(genres, 'thriller'), 8)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'comedy') > 0 THEN SUBSTRING(genres, INSTR(genres, 'comedy'), 6)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'action') > 0 THEN SUBSTRING(genres, INSTR(genres, 'action'), 6)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'scifi') > 0 THEN SUBSTRING(genres, INSTR(genres, 'scifi'), 5)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'family') > 0 THEN SUBSTRING(genres, INSTR(genres, 'family'), 6)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'crime') > 0 THEN SUBSTRING(genres, INSTR(genres, 'crime'), 5)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'fantasy') > 0 THEN SUBSTRING(genres, INSTR(genres, 'fantasy'), 7)
--         END AS genre_category
--     FROM dim_titles_roku
    
--     UNION ALL
    
--     SELECT
--         CASE
--             WHEN INSTR(genres, 'animation') > 0 THEN SUBSTRING(genres, INSTR(genres, 'animation'), 9)
--         END AS genre_category
--     FROM dim_titles_roku
-- ) AS sub
-- GROUP BY genre_category
-- HAVING genre_category IS NOT NULL
-- ORDER BY total_shows DESC;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_credits_roku */

-- SELECT *
-- FROM dim_credits_roku
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_titles_roku */

-- SELECT *
-- FROM dim_titles_roku
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 
    genre_category,
    COUNT(*) AS total_shows
FROM
(
    SELECT
        CASE
            WHEN INSTR(genres, 'drama') > 0 THEN SUBSTRING(genres, INSTR(genres, 'drama'), 5)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'romance') > 0 THEN SUBSTRING(genres, INSTR(genres, 'romance'), 7)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'thriller') > 0 THEN SUBSTRING(genres, INSTR(genres, 'thriller'), 8)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'comedy') > 0 THEN SUBSTRING(genres, INSTR(genres, 'comedy'), 6)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'action') > 0 THEN SUBSTRING(genres, INSTR(genres, 'action'), 6)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'scifi') > 0 THEN SUBSTRING(genres, INSTR(genres, 'scifi'), 5)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'family') > 0 THEN SUBSTRING(genres, INSTR(genres, 'family'), 6)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'crime') > 0 THEN SUBSTRING(genres, INSTR(genres, 'crime'), 5)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'fantasy') > 0 THEN SUBSTRING(genres, INSTR(genres, 'fantasy'), 7)
        END AS genre_category
    FROM dim_titles_roku
    
    UNION ALL
    
    SELECT
        CASE
            WHEN INSTR(genres, 'animation') > 0 THEN SUBSTRING(genres, INSTR(genres, 'animation'), 9)
        END AS genre_category
    FROM dim_titles_roku
) AS sub
GROUP BY genre_category
HAVING genre_category IS NOT NULL
ORDER BY total_shows DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH CTE AS
-- (
--     SELECT 
--         -- DISTINCT title_name,  /* This is extraneous */
--         -- genres,               /* This is extraneous */
--         REPLACE(SUBSTR(genres, 2, CHAR_LENGTH(genres)-2), ' ', '') AS genre
--     FROM dim_titles_roku
-- )

-- SELECT 
--     genre_category,
--     COUNT(*) AS total_shows
-- FROM
-- (
--     SELECT 
--         -- title_name,           /* This is extraneous */
--         SUBSTRING_INDEX(SUBSTRING_INDEX(genre, ',', n.n), ',', -1) AS genre_category
--     FROM CTE y
--     JOIN
--     (
--         SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL
--         SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL
--         SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
--     ) n
--     ON CHAR_LENGTH(genre) - CHAR_LENGTH(REPLACE(genre, ',', '')) >= n.n - 1
-- ) CTE1
-- GROUP BY genre_category
-- ORDER BY total_shows DESC
-- LIMIT 10;