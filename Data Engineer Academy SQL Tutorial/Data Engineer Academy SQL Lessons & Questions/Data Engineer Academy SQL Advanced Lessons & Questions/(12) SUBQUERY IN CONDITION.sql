/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table products */

-- SELECT *
-- FROM products
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT

--     product_id,
--     product_name,
--     unit_price,
--     category
    
-- FROM products
-- GROUP BY category
-- HAVING unit_price > (SELECT AVG(unit_price) FROM products) AS avg_per_category;

/*--------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- SELECT

--     p1.product_id,
--     p1.product_name,
--     p1.unit_price,
--     p1.category
    
-- FROM products p1
-- JOIN products p2
-- ON p1.product_id = p2.product_id
-- WHERE p1.unit_price > (SELECT AVG(p2.unit_price) FROM products GROUP BY p2.category);

/*--------------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- SELECT

--     CASE (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs
--     WHEN unit_price > (SELECT category_avg FROM category_avgs) THEN product_id
--     END AS product_id
    
--     CASE (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs
--     WHEN unit_price > (SELECT category_avg FROM category_avgs) THEN product_name
--     END AS product_name
    
--     CASE (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs
--     WHEN unit_price > (SELECT category_avg FROM category_avgs) THEN unit_price
--     END AS unit_price
    
--     CASE (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs
--     WHEN unit_price > (SELECT category_avg FROM category_avgs) THEN category
--     END AS category
    
-- FROM products;

/*--------------------------------------------------------------------------------------------*/

/* Implementation #4 */
    
-- SELECT

--     CASE 
--     WHEN unit_price > (SELECT category_avg FROM (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs) THEN product_id
--     END AS product_id,
    
--     CASE 
--     WHEN unit_price > (SELECT category_avg FROM (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs) THEN product_name
--     END AS product_name,
    
--     CASE 
--     WHEN unit_price > (SELECT category_avg FROM (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs) THEN unit_price
--     END AS unit_price,
    
--     CASE 
--     WHEN unit_price > (SELECT category_avg FROM (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs) THEN category
--     END AS category
    
-- FROM products;
    
/*--------------------------------------------------------------------------------------------*/

/* Implementation #5 */

-- SELECT

--     product_id,
--     product_name,
--     unit_price,
--     category
    
-- FROM products
-- WHERE unit_price > (SELECT AVG(unit_price) FROM products GROUP BY category);

/*--------------------------------------------------------------------------------------------*/

/* Implementation #6 */

-- SELECT

--     product_id,
--     product_name,
--     unit_price,
--     category
    
-- FROM products
-- WHERE 

--     category = (SELECT category FROM (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs) AND
--     unit_price > (SELECT category_avg FROM (SELECT category, AVG(unit_price) AS category_avg FROM products GROUP BY category) AS category_avgs);

/*--------------------------------------------------------------------------------------------*/

/* My solution #1 */

-- SELECT

--     product_id,
--     product_name,
--     unit_price,
--     category
    
-- FROM products
-- WHERE 
    
--     (category = 'Electronics' AND unit_price > (SELECT AVG(unit_price) FROM products GROUP BY category HAVING category = 'Electronics')) OR
--     (category = 'Appliances' AND unit_price > (SELECT AVG(unit_price) FROM products GROUP BY category HAVING category = 'Appliances')) OR
--     (category = 'Office Supplies' AND unit_price > (SELECT AVG(unit_price) FROM products GROUP BY category HAVING category = 'Office Supplies')) OR
--     (category = 'Furniture' AND unit_price > (SELECT AVG(unit_price) FROM products GROUP BY category HAVING category = 'Furniture'));

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* My solution #2 */

SELECT

	product_id,
	product_name,
	unit_price,
	p.category

FROM products AS p
WHERE unit_price >
(
	
	SELECT
	
		AVG(unit_price)
		
    FROM products
	GROUP BY category
	HAVING category = p.category

);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     product_id,
--     product_name,
--     unit_price,
--     category
-- FROM 
--     products p1
-- WHERE 
--     unit_price > (SELECT 
--                 AVG(unit_price)
--             FROM 
--                 products p2
--             WHERE 
--                 p2.category = p1.category);