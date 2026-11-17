/* Brainstorming section */

--

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- List Top 2 Organizations 
-- from each country 
-- with the highest ad-spend on Snapchat.

-- Columns to Display: 
-- Country name, 
-- name of organizations 
-- and the total amount spent on ads. 

-- WITH total_ad_spend_per_org AS
-- (
-- SELECT

--     dos.country,
--     dos.organization_name,
--     ROUND(SUM(spend_per_impression * total_impressions), 0) AS total_ad_spend
    
-- FROM dim_organization_snapchat dos
-- JOIN dim_ads_snapchat das
-- ON dos.organization_id = das.organization_id
-- GROUP BY dos.organization_id
-- ORDER BY dos.country
-- ),
-- ranked_ad_spend_per_country AS
-- (
-- SELECT

--     country,
--     organization_name,
--     total_ad_spend,
--     ROW_NUMBER() OVER(PARTITION BY country ORDER BY total_ad_spend DESC) AS rnk

-- FROM total_ad_spend_per_org
-- )
-- SELECT

--     country,
--     organization_name,
--     total_ad_spend

-- FROM ranked_ad_spend_per_country
-- WHERE rnk < 3

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_ads_snapchat */

-- SELECT *
-- FROM dim_ads_snapchat
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_organization_snapchat */

-- SELECT *
-- FROM dim_organization_snapchat
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH total_ad_spend_per_org AS
(
SELECT

    dos.country,
    dos.organization_name,
    ROUND(SUM(spend_per_impression * total_impressions), 0) AS total_ad_spend
    
FROM dim_organization_snapchat dos
JOIN dim_ads_snapchat das
ON dos.organization_id = das.organization_id
GROUP BY dos.organization_id
ORDER BY dos.country
),
ranked_ad_spend_per_country AS
(
SELECT

    country,
    organization_name,
    total_ad_spend,
    ROW_NUMBER() OVER(PARTITION BY country ORDER BY total_ad_spend DESC) AS rnk

FROM total_ad_spend_per_org
)
SELECT

    country,
    organization_name,
    total_ad_spend

FROM ranked_ad_spend_per_country
WHERE rnk < 3

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH TOP_COUNTRY AS
-- (
-- 	SELECT  *,
-- 			DENSE_RANK() OVER (PARTITION BY country ORDER BY total_ad_spend DESC) AS rnk
-- 	FROM
-- 	(
-- 		SELECT  country,
-- 				organization_name,
-- 				ROUND(SUM(spend_per_impression*total_impressions),0) AS total_ad_spend
-- 		FROM dim_ads_snapchat ads
-- 		JOIN dim_organization_snapchat org
-- 		ON ads.organization_id = org.organization_id
-- 		GROUP BY country, organization_name
-- 	) ad_spendings
-- )
-- SELECT  country,
-- 		organization_name,
-- 		total_ad_spend
-- FROM TOP_COUNTRY
-- WHERE rnk <= 2
-- ORDER BY country;