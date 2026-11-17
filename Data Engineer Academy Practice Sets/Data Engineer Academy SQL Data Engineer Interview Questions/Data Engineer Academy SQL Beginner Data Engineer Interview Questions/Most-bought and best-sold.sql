/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the most-bought cryptocurrency and the best-sold cryptocurrency.

-- SELECT *
-- FROM
-- (
-- SELECT
--     cryptocurrency,
--     CASE 
--     WHEN num_times_bought = 
--         (SELECT MAX(num_times_bought_f1) 
--          FROM
--          (
--             SELECT
--                 f1.cryptocurrency, 
--                 CASE
--                     WHEN f1.transaction_type = 'buy'
--                     THEN COUNT(f1.cryptocurrency)
--                 END AS num_times_bought_f1,
--                 SUM(f1.number_of_coins * d1.price) AS total_sales_f1
--             FROM fact_transactions_coinbase AS f1
--             JOIN dim_crypto_coinbase AS d1
--             ON f1.cryptocurrency = d1.Cryptocurrency 
--                 AND DATE_FORMAT(f1.date, '%Y-%m-%d') = DATE_FORMAT(d1.date, '%Y-%m-%d')
--             GROUP BY f1.cryptocurrency
--          ) AS times_bought_1
--         ) THEN 'Most-bought coin'
--     WHEN total_sales = 
--         (SELECT MAX(total_sales_f2) 
--          FROM
--          (
--             SELECT
--                 f2.cryptocurrency, 
--                 COUNT(f2.cryptocurrency) AS num_times_bought_f2,
--                 CASE
--                     WHEN f2.transaction_type = 'sale'
--                     THEN SUM(f2.number_of_coins * d2.price) 
--                 END AS total_sales_f2
--             FROM fact_transactions_coinbase AS f2
--             JOIN dim_crypto_coinbase AS d2
--             ON f2.cryptocurrency = d2.Cryptocurrency 
--                 AND DATE_FORMAT(f2.date, '%Y-%m-%d') = DATE_FORMAT(d2.date, '%Y-%m-%d')
--             GROUP BY f2.cryptocurrency
--          )times_bought_2
--         ) THEN 'Best-sold coin'
--     ELSE 'No status'
--     END AS status
-- FROM
-- (
--     SELECT
--         f.cryptocurrency, 
--         CASE
--             WHEN f.transaction_type = 'buy'
--             THEN COUNT(f.cryptocurrency)
--         END AS num_times_bought,
--         CASE
--             WHEN f.transaction_type = 'sale'
--             THEN SUM(f.number_of_coins * d.price) 
--         END AS total_sales
--     FROM fact_transactions_coinbase AS f
--     JOIN dim_crypto_coinbase AS d
--     ON f.cryptocurrency = d.Cryptocurrency 
--         AND DATE_FORMAT(f.date, '%Y-%m-%d') = DATE_FORMAT(d.date, '%Y-%m-%d')
--     GROUP BY f.cryptocurrency
-- ) AS times_bought
-- ) AS status_info
-- WHERE status IN ('Best-sold coin', 'Most-bought coin');

-- Display the results in a single two-row table with the output as follows:

-- cryptocurrency, status
-- Hint : status - where the two values in status are 'Most-bought coin' 
-- and 'Best-sold coin'



/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_transactions_coinbase */

-- SELECT *
-- FROM fact_transactions_coinbase
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_users_coinbase */

-- SELECT *
-- FROM dim_users_coinbase
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_crypto_coinbase */

-- SELECT *
-- FROM dim_crypto_coinbase
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT *
-- FROM
-- (
--     SELECT
--         cryptocurrency,
--         CASE 
--         WHEN num_times_bought = 
--             (
--                 SELECT MAX(num_times_bought_f1) 
--                 FROM
--                 (
--                     SELECT
--                         f1.cryptocurrency, 
--                         CASE
--                             WHEN f1.transaction_type = 'buy'
--                             THEN COUNT(f1.cryptocurrency)
--                         END AS num_times_bought_f1,
--                         SUM(f1.number_of_coins * d1.price) AS total_sales_f1
--                     FROM fact_transactions_coinbase AS f1
--                     JOIN dim_crypto_coinbase AS d1
--                     ON f1.cryptocurrency = d1.Cryptocurrency 
--                         AND DATE_FORMAT(f1.date, '%Y-%m-%d') = DATE_FORMAT(d1.date, '%Y-%m-%d')
--                     GROUP BY f1.cryptocurrency
--                 ) AS times_bought_1
--             ) THEN 'Most-bought coin'
--         WHEN total_sales = 
--             (
--                 SELECT MAX(total_sales_f2) 
--                 FROM
--                 (
--                     SELECT
--                         f2.cryptocurrency, 
--                         COUNT(f2.cryptocurrency) AS num_times_bought_f2,
--                         CASE
--                             WHEN f2.transaction_type = 'sale'
--                             THEN SUM(f2.number_of_coins * d2.price) 
--                         END AS total_sales_f2
--                     FROM fact_transactions_coinbase AS f2
--                     JOIN dim_crypto_coinbase AS d2
--                     ON f2.cryptocurrency = d2.Cryptocurrency 
--                         AND DATE_FORMAT(f2.date, '%Y-%m-%d') = DATE_FORMAT(d2.date, '%Y-%m-%d')
--                     GROUP BY f2.cryptocurrency
--                 )times_bought_2
--             ) THEN 'Best-sold coin'
--         ELSE 'No status'
--         END AS status
--     FROM
--     (
--         SELECT
--             f.cryptocurrency, 
--             CASE
--                 WHEN f.transaction_type = 'buy'
--                 THEN COUNT(f.cryptocurrency)
--             END AS num_times_bought,
--             CASE
--                 WHEN f.transaction_type = 'sale'
--                 THEN SUM(f.number_of_coins * d.price) 
--             END AS total_sales
--         FROM fact_transactions_coinbase AS f
--         JOIN dim_crypto_coinbase AS d
--         ON f.cryptocurrency = d.Cryptocurrency 
--         AND DATE_FORMAT(f.date, '%Y-%m-%d') = DATE_FORMAT(d.date, '%Y-%m-%d')
--         GROUP BY f.cryptocurrency
--     ) AS times_bought
-- ) AS status_info
-- WHERE status IN ('Best-sold coin', 'Most-bought coin');

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT *
FROM
(
    SELECT
        cryptocurrency,
        CASE 
            WHEN num_coins_bought = 
            (
                SELECT MAX(num_coins_bought_f1) 
                FROM
                (
                    SELECT
                        f1.cryptocurrency, 
                        SUM(f1.number_of_coins) AS num_coins_bought_f1
                    FROM fact_transactions_coinbase AS f1
                    WHERE f1.transaction_type = 'buy'
                    GROUP BY f1.cryptocurrency
                ) AS bought_and_sold_1
            ) THEN 'Most-bought coin'
            WHEN num_coins_sold = 
            (
                SELECT MAX(num_coins_sold_f2) 
                FROM
                (
                    SELECT
                        f2.cryptocurrency,
                        SUM(f2.number_of_coins) AS num_coins_sold_f2
                    FROM fact_transactions_coinbase AS f2
                    WHERE f2.transaction_type = 'sale'
                    GROUP BY f2.cryptocurrency
                )bought_and_sold_2
            ) THEN 'Best-sold coin'
            ELSE 'No status'
        END AS status
    FROM
    (
        SELECT
            bought.cryptocurrency,
            num_coins_bought,
            num_coins_sold
        FROM
        (
            SELECT
                a.cryptocurrency,
                SUM(a.number_of_coins) AS num_coins_bought
            FROM fact_transactions_coinbase AS a
            WHERE a.transaction_type = 'buy'
            GROUP BY a.cryptocurrency
        ) AS bought
        JOIN
        (
            SELECT
                b.cryptocurrency,
                SUM(b.number_of_coins) AS num_coins_sold
            FROM fact_transactions_coinbase AS b
            WHERE b.transaction_type = 'sale'
            GROUP BY b.cryptocurrency
        ) AS sold
        ON bought.cryptocurrency = sold.cryptocurrency
    ) AS bought_and_sold
) AS status_info
WHERE status IN ('Best-sold coin', 'Most-bought coin');

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH crypto_bought AS
-- (
--     SELECT
    	
--     	cryptocurrency
    
--     FROM fact_transactions_coinbase
--     WHERE transaction_type = 'buy'
--     GROUP BY cryptocurrency
--     ORDER BY SUM(number_of_coins) DESC
--     LIMIT 1
-- ),
-- crypto_sold AS
-- (
-- 	SELECT
	
-- 		cryptocurrency

-- 	FROM fact_transactions_coinbase
-- 	WHERE transaction_type = 'sale'
-- 	GROUP BY cryptocurrency
-- 	ORDER BY SUM(number_of_coins) DESC
-- 	LIMIT 1
-- )
-- SELECT 
-- 	*, 
-- 	'Most-bought coin' AS status
-- FROM crypto_bought
-- UNION ALL
-- SELECT 
-- 	*, 
-- 	'Best-sold coin' AS status
-- FROM crypto_sold;