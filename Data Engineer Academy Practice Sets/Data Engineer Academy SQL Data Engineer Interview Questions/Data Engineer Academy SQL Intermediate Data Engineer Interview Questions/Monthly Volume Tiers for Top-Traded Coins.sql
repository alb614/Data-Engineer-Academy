/* Brainstorming section */

-- For each coin, 
-- calculate the total volume traded 
-- and total number of users for each month in 2021.

-- Then, assign a volume tier based on total monthly volume:

-- 'High' if volume > 1,000,000
-- 'Medium' if between 500,000 and 1,000,000
-- 'Low' if below 500,000

-- Columns to Display: 
-- name (coin name), 
-- symbol, 
-- month (in YYYY-MM format), 
-- total_volume, 
-- total_users 
-- & volume_tier

-- Only include coins that were traded by at least 100,000 users total across the year

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH coin_agg AS
-- (
--     SELECT 
--         name,
--         coins.symbol,
--         DATE_FORMAT(date, "%Y-%m") AS month,
--         SUM(volume_24h) AS total_volume,
--         SUM(users_traded) AS total_users
--     FROM dim_crypto_coins_binance AS coins
--     JOIN dim_crypto_quote_binance AS quote
--     USING(symbol)
--     WHERE YEAR(date) = 2021
--     GROUP BY symbol, MONTH(date)
--     HAVING coins.symbol IN 
--     (
--         SELECT symbol 
--         FROM 
--         (
--             SELECT 
--                 quote2.symbol, 
--                 SUM(quote2.users_traded) AS tu
--             FROM dim_crypto_quote_binance AS quote2
--             WHERE YEAR(quote2.date) = 2021
--             GROUP BY quote2.symbol
--         ) AS sub1
--         WHERE sub1.tu >= 100000
--     )
-- )
-- SELECT
--     symbol,
--     name,
--     month,
--     total_volume,
--     total_users,
--     CASE
--         WHEN total_volume > 1000000 THEN "High"
--         WHEN total_volume BETWEEN 500000 AND 1000000 THEN "Medium"
--         WHEN total_volume < 500000 THEN "Low"
--     END AS volume_tier
-- FROM coin_agg
-- ORDER BY name, month;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_crypto_coins_binance */

-- SELECT *
-- FROM dim_crypto_coins_binance
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_crypto_quote_binance */

-- SELECT *
-- FROM dim_crypto_quote_binance
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH coin_agg AS
(
    SELECT 
        name,
        coins.symbol,
        DATE_FORMAT(date, "%Y-%m") AS month,
        SUM(volume_24h) AS total_volume,
        SUM(users_traded) AS total_users
    FROM dim_crypto_coins_binance AS coins
    JOIN dim_crypto_quote_binance AS quote
    USING(symbol)
    WHERE YEAR(date) = 2021
    GROUP BY symbol, MONTH(date)
    HAVING coins.symbol IN 
    (
        SELECT symbol 
        FROM 
        (
            SELECT 
                quote2.symbol, 
                SUM(quote2.users_traded) AS tu
            FROM dim_crypto_quote_binance AS quote2
            WHERE YEAR(quote2.date) = 2021
            GROUP BY quote2.symbol
        ) AS sub1
        WHERE sub1.tu >= 100000
    )
)
SELECT
    symbol,
    name,
    month,
    total_volume,
    total_users,
    CASE
        WHEN total_volume > 1000000 THEN "High"
        WHEN total_volume BETWEEN 500000 AND 1000000 THEN "Medium"
        WHEN total_volume < 500000 THEN "Low"
    END AS volume_tier
FROM coin_agg
ORDER BY name, month;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH yearly_users AS (
--   SELECT 
--     symbol,
--     SUM(users_traded) AS yearly_user_count
--   FROM dim_crypto_quote_binance
--   WHERE YEAR(date) = 2021
--   GROUP BY symbol
-- ),
-- monthly_stats AS (
--   SELECT 
--     q.symbol,
--     c.name,
--     DATE_FORMAT(q.date, '%Y-%m') AS month,
--     SUM(q.volume_24h) AS total_volume,
--     SUM(q.users_traded) AS total_users
--   FROM dim_crypto_quote_binance q
--   JOIN dim_crypto_coins_binance c ON q.symbol = c.symbol
--   WHERE YEAR(q.date) = 2021
--   GROUP BY q.symbol, c.name, DATE_FORMAT(q.date, '%Y-%m')
-- ),
-- filtered_stats AS (
--   SELECT 
--     m.*,
--     CASE 
--       WHEN total_volume > 1000000 THEN 'High'
--       WHEN total_volume >= 500000 THEN 'Medium'
--       ELSE 'Low'
--     END AS volume_tier
--   FROM monthly_stats m
--   JOIN yearly_users y ON m.symbol = y.symbol
--   WHERE y.yearly_user_count >= 100000
-- )
-- SELECT *
-- FROM filtered_stats
-- ORDER BY symbol, month;