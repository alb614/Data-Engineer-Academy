/* Brainstorming section */

-- directors who directed multiple shows
-- how many shows said directors directed
-- show directors who directed at least 2 shows
-- limit by top 2 highest # of shows
-- Output the Director name, 
-- total shows they have directed 
-- and all show names in an array separated by '|'

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT 
--     person_name,
--     COUNT(DISTINCT title_id) AS total_shows
-- FROM dim_credits_roku AS dcr
-- JOIN dim_titles_roku AS dtr
-- ON dcr.title_id = dtr.title_id
-- WHERE role = 'DIRECTOR'
-- GROUP BY 1
-- HAVING total_shows >= 2
-- ORDER BY 2 DESC
-- LIMIT 2;

-- WITH stage1 AS
-- (
--     SELECT
--         person_id,
--         person_name,
--         title_name AS show_names
--     FROM dim_credits_roku AS dcr
--     JOIN dim_titles_roku AS dtr
--     ON dcr.title_id = dtr.title_id
--     WHERE role = 'DIRECTOR'
--     ORDER BY person_name DESC
-- ),
-- stage2 AS
-- (
--     SELECT
--         person_id,
--         person_name,
--         COUNT(DISTINCT dcr.title_id) AS total_shows
--     FROM dim_credits_roku AS dcr
--     JOIN dim_titles_roku AS dtr
--     ON dcr.title_id = dtr.title_id
--     WHERE role = 'DIRECTOR'
--     GROUP BY person_id
--     ORDER BY person_name DESC
-- ),
-- stage3 AS
-- (
--     SELECT
--         s1.person_name,
--         total_shows,
--         show_names
--     FROM stage1 AS s1
--     JOIN stage2 AS s2
--     ON s1.person_id = s2.person_id
--     ORDER BY total_shows DESC, s1.person_name, show_names
-- ),
-- stage4 AS
-- (
--     SELECT
--         person_name,
--         total_shows,
--         GROUP_CONCAT(show_names ORDER BY show_names SEPARATOR ' | ') AS show_names
--     FROM stage3
--     WHERE total_shows >= 2
--     GROUP BY person_name
--     ORDER BY total_shows DESC, person_name
-- ),
-- stage5 AS
-- (
--     SELECT
--         *,
--         DENSE_RANK() OVER(ORDER BY total_shows DESC) AS rnk
--     FROM stage4
-- )
-- SELECT
--     person_name,
--     total_shows,
--     show_names
-- FROM stage5
-- WHERE rnk < 3;

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

WITH get_dirs_and_titles AS
(
    SELECT
        person_id,
        person_name,
        title_name AS show_names
    FROM dim_credits_roku AS dcr
    JOIN dim_titles_roku AS dtr
    ON dcr.title_id = dtr.title_id
    WHERE role = 'DIRECTOR'
    ORDER BY person_name DESC
),
calc_total_shows AS
(
    SELECT
        person_id,
        person_name,
        COUNT(DISTINCT dcr.title_id) AS total_shows
    FROM dim_credits_roku AS dcr
    JOIN dim_titles_roku AS dtr
    ON dcr.title_id = dtr.title_id
    WHERE role = 'DIRECTOR'
    GROUP BY person_id
    ORDER BY person_name DESC
),
merge_count_and_total AS
(
    SELECT
        s1.person_name,
        total_shows,
        show_names
    FROM get_dirs_and_titles AS s1
    JOIN calc_total_shows AS s2
    ON s1.person_id = s2.person_id
    ORDER BY total_shows DESC, s1.person_name, show_names
),
concat_shows AS
(
    SELECT
        person_name,
        total_shows,
        GROUP_CONCAT(show_names ORDER BY show_names SEPARATOR ' | ') AS show_names
    FROM merge_count_and_total
    WHERE total_shows >= 2
    GROUP BY person_name
    ORDER BY total_shows DESC, person_name
),
rank_dirs_by_count AS
(
    SELECT
        *,
        DENSE_RANK() OVER(ORDER BY total_shows DESC) AS rnk
    FROM concat_shows
)
SELECT
    person_name,
    total_shows,
    show_names
FROM rank_dirs_by_count
WHERE rnk < 3;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT person_name,
--       total_shows,
--       show_names
-- FROM (
--     SELECT 
--         person_name,
--         COUNT(title_name) AS total_shows,
--         GROUP_CONCAT(title_name ORDER BY title_name SEPARATOR ' | ') AS show_names,
--         DENSE_RANK() OVER (ORDER BY COUNT(title_name) DESC) AS rnk
--     FROM dim_titles_roku til
--     JOIN dim_credits_roku cred ON til.title_id = cred.title_id
--     GROUP BY person_name
--     HAVING COUNT(title_name) > 1
-- ) t
-- WHERE rnk <= 2