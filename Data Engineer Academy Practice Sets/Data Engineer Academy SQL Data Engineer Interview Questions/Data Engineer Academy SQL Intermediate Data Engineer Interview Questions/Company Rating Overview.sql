/* Brainstorming section */

-- List companies with at least 3 job listings 
-- and at least one listing from their headquarters. 
-- For each, show the average rating for:

-- Base location (the headquarters)

-- Other locations


-- Columns to Display: 
-- company_name, 
-- other_location_rating, 
-- base_location_rating


-- Hint: Order the results by other_location_rating in descending order

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH stage1 AS
-- (
--     SELECT
--         company_name,
--         COUNT(job_listing_id) AS num_job_listings
--     FROM dim_job_listings_linkedin jl
--     JOIN dim_job_detail_linkedin jd
--     USING(job_position_id)
--     GROUP BY company_name
-- ),
-- stage2 AS
-- (
--     SELECT
--         company_name,
--         COUNT(job_listing_id) as num_hq_job_listings
--     FROM dim_job_listings_linkedin jl
--     JOIN dim_job_detail_linkedin jd
--     USING(job_position_id)
--     WHERE company_location = company_headquarter
--     GROUP BY company_name
-- ),
-- stage3 AS
-- (
--     SELECT
--         jl.company_name,
--         ROUND(AVG(job_rating), 2) AS other_location_rating
--     FROM dim_job_listings_linkedin jl
--     JOIN dim_job_detail_linkedin jd
--     USING(job_position_id)
--     JOIN stage1
--     ON jl.company_name = stage1.company_name
--     JOIN stage2
--     ON jl.company_name = stage2.company_name
--     WHERE num_job_listings >= 3 AND num_hq_job_listings >= 1 AND company_location <> company_headquarter
--     GROUP BY company_name
-- ),
-- stage4 AS
-- (
--     SELECT
--         jl.company_name,
--         ROUND(AVG(job_rating), 2) AS base_location_rating
--     FROM dim_job_listings_linkedin jl
--     JOIN dim_job_detail_linkedin jd
--     USING(job_position_id)
--     JOIN stage1
--     ON jl.company_name = stage1.company_name
--     JOIN stage2
--     ON jl.company_name = stage2.company_name
--     WHERE num_job_listings >= 3 AND num_hq_job_listings >= 1 AND company_location = company_headquarter
--     GROUP BY company_name
-- )
-- SELECT *
-- FROM stage3
-- LEFT JOIN stage4
-- USING(company_name)

-- UNION

-- SELECT *
-- FROM stage3
-- RIGHT JOIN stage4
-- USING(company_name)
-- ORDER BY base_location_rating DESC;



/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_job_detail_linkedin */

-- SELECT *
-- FROM dim_job_detail_linkedin
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_job_listings_linkedin */

-- SELECT *
-- FROM dim_job_listings_linkedin
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH calc_job_listings_count AS
(
    SELECT
        company_name,
        COUNT(job_listing_id) AS num_job_listings
    FROM dim_job_listings_linkedin jl
    JOIN dim_job_detail_linkedin jd
    USING(job_position_id)
    GROUP BY company_name
),
calc_hq_job_listings_count AS
(
    SELECT
        company_name,
        COUNT(job_listing_id) as num_hq_job_listings
    FROM dim_job_listings_linkedin jl
    JOIN dim_job_detail_linkedin jd
    USING(job_position_id)
    WHERE company_location = company_headquarter
    GROUP BY company_name
),
other_location_avg_rating AS
(
    SELECT
        jl.company_name,
        ROUND(AVG(job_rating), 2) AS other_location_rating
    FROM dim_job_listings_linkedin jl
    JOIN dim_job_detail_linkedin jd
    USING(job_position_id)
    JOIN calc_job_listings_count
    ON jl.company_name = calc_job_listings_count.company_name
    JOIN calc_hq_job_listings_count
    ON jl.company_name = calc_hq_job_listings_count.company_name
    WHERE num_job_listings >= 3 AND num_hq_job_listings >= 1 AND TRIM(LOWER(company_location)) <> TRIM(LOWER(company_headquarter))
    GROUP BY company_name
),
base_location_avg_rating AS
(
    SELECT
        jl.company_name,
        ROUND(AVG(job_rating), 2) AS base_location_rating
    FROM dim_job_listings_linkedin jl
    JOIN dim_job_detail_linkedin jd
    USING(job_position_id)
    JOIN calc_job_listings_count
    ON jl.company_name = calc_job_listings_count.company_name
    JOIN calc_hq_job_listings_count
    ON jl.company_name = calc_hq_job_listings_count.company_name
    WHERE num_job_listings >= 3 AND num_hq_job_listings >= 1 AND TRIM(LOWER(company_location)) = TRIM(LOWER(company_headquarter))
    GROUP BY company_name
)
SELECT
    company_name,
    other_location_rating,
    base_location_rating
FROM other_location_avg_rating
RIGHT JOIN base_location_avg_rating
USING(company_name)
ORDER BY other_location_rating DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH normalized_listings AS (
--     SELECT 
--         company_name,
--         job_rating,
--         TRIM(LOWER(company_location)) AS location,
--         TRIM(LOWER(company_headquarter)) AS headquarter
--     FROM dim_job_listings_linkedin
-- ),
-- eligible_companies AS (
--     SELECT 
--         company_name
--     FROM normalized_listings
--     GROUP BY company_name
--     HAVING COUNT(*) >= 3
--       AND COUNT(CASE WHEN location = headquarter THEN 1 END) >= 1
-- ),
-- ratings AS (
--     SELECT 
--         company_name,
--         ROUND(AVG(CASE WHEN location <> headquarter THEN job_rating END), 2) AS other_location_rating,
--         ROUND(AVG(CASE WHEN location = headquarter THEN job_rating END), 2) AS base_location_rating
--     FROM normalized_listings
--     JOIN eligible_companies USING (company_name)
--     GROUP BY company_name
-- )
-- SELECT *
-- FROM ratings
-- ORDER BY other_location_rating DESC;