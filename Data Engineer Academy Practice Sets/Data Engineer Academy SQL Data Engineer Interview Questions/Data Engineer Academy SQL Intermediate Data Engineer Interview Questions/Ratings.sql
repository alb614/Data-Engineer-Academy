/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH avg_and_highest_rating_per_city AS
-- (
--     SELECT
--         city,
--         ROUND(AVG(ratings), 1) AS avg_rating,
--         MAX(ratings) AS highest_rating
--     FROM dim_businesses_yelp
--     GROUP BY city
-- ),
-- city_ratings_count AS
-- (
--     SELECT
--         city,
--         ratings,
--         COUNT(ratings) AS rating_count
--     FROM dim_businesses_yelp
--     GROUP BY city, ratings
-- ),
-- city_ratings_count_ranked AS
-- (
--     SELECT
--         city,
--         ratings,
--         RANK() OVER(PARTITION BY city ORDER BY rating_count DESC) AS ratings_rank
--     FROM city_ratings_count
-- ),
-- city_ratings_count_top_ranked AS
-- (
--     SELECT
--         a.city,
--         ratings AS most_popular_rating,
--         ratings_rank,
--         highest_rating,
--         avg_rating
--     FROM avg_and_highest_rating_per_city AS a
--     JOIN city_ratings_count_ranked AS c
--     ON a.city = c.city
--     WHERE ratings_rank = 1
-- ),
-- top_of_the_top_ranked AS
-- (
--     SELECT
--         city,
--         most_popular_rating,
--         highest_rating,
--         avg_rating,
--         DENSE_RANK() OVER(PARTITION BY city ORDER BY most_popular_rating DESC) AS top_rnk
--     FROM city_ratings_count_top_ranked
-- )
-- SELECT
--     city,
--     most_popular_rating,
--     highest_rating,
--     avg_rating
-- FROM top_of_the_top_ranked
-- WHERE top_rnk = 1


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table [table1] */

-- SELECT *
-- FROM [table1]
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table [table2] */

-- SELECT *
-- FROM [table2]
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH avg_and_highest_rating_per_city AS
(
    SELECT
        city,
        ROUND(AVG(ratings), 1) AS avg_rating,
        MAX(ratings) AS highest_rating
    FROM dim_businesses_yelp
    GROUP BY city
),
city_ratings_count AS
(
    SELECT
        city,
        ratings,
        COUNT(ratings) AS rating_count
    FROM dim_businesses_yelp
    GROUP BY city, ratings
),
city_ratings_count_ranked AS
(
    SELECT
        city,
        ratings,
        RANK() OVER(PARTITION BY city ORDER BY rating_count DESC) AS ratings_rank
    FROM city_ratings_count
),
city_ratings_count_top_ranked AS
(
    SELECT
        a.city,
        ratings AS most_popular_rating,
        ratings_rank,
        highest_rating,
        avg_rating
    FROM avg_and_highest_rating_per_city AS a
    JOIN city_ratings_count_ranked AS c
    ON a.city = c.city
    WHERE ratings_rank = 1
),
top_of_the_top_ranked AS
(
    SELECT
        city,
        most_popular_rating,
        highest_rating,
        avg_rating,
        DENSE_RANK() OVER(PARTITION BY city ORDER BY most_popular_rating DESC) AS top_rnk
    FROM city_ratings_count_top_ranked
)
SELECT
    city,
    most_popular_rating,
    highest_rating,
    avg_rating
FROM top_of_the_top_ranked
WHERE top_rnk = 1

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH Order_Ratings AS
-- (
-- 	SELECT  City,
-- 			Ratings,
-- 			COUNT(*) AS Frequency,
-- 			DENSE_RANK() OVER (PARTITION BY CITY ORDER BY COUNT(*) DESC) AS Rnk
-- 	FROM dim_businesses_yelp
-- 	GROUP BY City,Ratings),
-- Popular_Ratings as
-- (
-- 	SELECT *,
-- 			DENSE_RANK() OVER (PARTITION BY CITY ORDER BY RATINGS DESC) AS Popular_Vote
-- 	FROM Order_Ratings
-- 	WHERE Rnk = 1)
-- SELECT  A.City,
-- 		Most_Popular_Rating,
-- 		Highest_Rating,
-- 		Avg_Rating
-- FROM
-- (
-- 	SELECT  City,
-- 			Ratings AS Most_Popular_Rating
-- 	FROM Popular_Ratings 
-- 	WHERE Popular_Vote = 1
-- ) A
-- JOIN
-- (
-- 	SELECT  City,
-- 			MAX(Ratings) AS Highest_Rating
-- 	FROM dim_businesses_yelp
-- 	GROUP BY City
-- ) B ON A.City = B.City
-- JOIN
-- (
-- 	SELECT  City,
-- 			ROUND(AVG(Ratings),1) AS Avg_Rating
-- 	FROM dim_businesses_yelp
-- 	GROUP BY City
-- ) C ON A.City = C.City;