/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the name and the content of the last post 
-- published by the top publisher (who has the most posts). 

-- WITH publisher_and_num_posts AS
-- (
-- SELECT

--     d.publisher_id,
--     name,
--     COUNT(*) AS num_posts

-- FROM dim_publishers_reddit AS d
-- JOIN fact_reddit AS f
-- ON d.publisher_id = f.publisher_id
-- GROUP BY d.publisher_id
-- ORDER BY num_posts DESC
-- ),
-- publisher_max_posts AS
-- (
-- SELECT

--     publisher_id,
--     name
    
-- FROM publisher_and_num_posts
-- WHERE num_posts = (SELECT MAX(num_posts) FROM publisher_and_num_posts)
-- ),
-- top_publishers_and_content AS
-- (
-- SELECT 

--     d.publisher_id,
--     d.name,
--     content,
--     creation_date

-- FROM publisher_max_posts AS p
-- JOIN dim_publishers_reddit AS d
-- ON d.publisher_id = p.publisher_id
-- JOIN fact_reddit AS f
-- ON f.publisher_id = p.publisher_id
-- ),
-- top_publishers_and_sorted_content AS
-- (
-- SELECT

--     publisher_id,
--     name,
--     content,
--     creation_date,
--     ROW_NUMBER() OVER(PARTITION BY publisher_id ORDER BY creation_date DESC) AS rnk

-- FROM top_publishers_and_content
-- )
-- SELECT
--     name,
--     content
-- FROM top_publishers_and_sorted_content
-- WHERE rnk = 1;

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

WITH publisher_and_num_posts AS
(
    SELECT
    
        d.publisher_id,
        name,
        COUNT(*) AS num_posts
    
    FROM dim_publishers_reddit AS d
    JOIN fact_reddit AS f
    ON d.publisher_id = f.publisher_id
    GROUP BY d.publisher_id
    ORDER BY num_posts DESC
),
publisher_max_posts AS
(
    SELECT
    
        publisher_id,
        name
        
    FROM publisher_and_num_posts
    WHERE num_posts = (SELECT MAX(num_posts) FROM publisher_and_num_posts)
),
top_publishers_and_content AS
(
    SELECT 
    
        d.publisher_id,
        d.name,
        content,
        creation_date
    
    FROM publisher_max_posts AS p
    JOIN dim_publishers_reddit AS d
    ON d.publisher_id = p.publisher_id
    JOIN fact_reddit AS f
    ON f.publisher_id = p.publisher_id
),
top_publishers_and_sorted_content AS
(
    SELECT
    
        name,
        content,
        creation_date,
        ROW_NUMBER() OVER(PARTITION BY publisher_id ORDER BY creation_date DESC) AS rnk
    
    FROM top_publishers_and_content
)
SELECT

    name,
    content
    
FROM top_publishers_and_sorted_content
WHERE rnk = 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH posts_rankings AS (
--   SELECT name, content,
--          ROW_NUMBER() OVER (PARTITION BY publisher_id ORDER BY creation_date) AS row_num
--   FROM fact_reddit
--   JOIN dim_publishers_reddit USING (publisher_id)
-- )
-- SELECT name, content
-- FROM posts_rankings
-- WHERE row_num = (SELECT MAX(row_num) FROM posts_rankings);