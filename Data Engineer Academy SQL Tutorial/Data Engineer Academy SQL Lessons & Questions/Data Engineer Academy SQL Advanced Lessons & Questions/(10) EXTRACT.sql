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

/* Viewing table customers */

-- SELECT *
-- FROM customers
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders */

-- SELECT *
-- FROM orders
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT

--     DATE_FORMAT(order_date, '%M %d, %Y') AS formatted_date
    
-- FROM orders;

/*----------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- SELECT

--   EXTRACT(MONTH FROM DATE_FORMAT(order_date, '%M %d, %Y')) AS MonthInWords
   
-- FROM orders;

/*----------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- SELECT

--   EXTRACT(MONTH FROM (SELECT DATE_FORMAT(order_date, '%M %d, %Y') AS formatted_date FROM orders)) AS MonthInWords
   
-- FROM orders;

/*----------------------------------------------------------------------------------------*/

/* Implementation #4 */

-- SELECT

--     o.order_id,
--     o.order_amount,
--     EXTRACT(MONTH FROM DATE_FORMAT(order_date, '%Y %M, %d')) AS MonthInWords,
--     o.order_status,
--     c.customer_id,
--     c.customer_name
    
-- FROM customers AS c
-- JOIN orders AS o
-- USING(customer_id);

/*----------------------------------------------------------------------------------------*/

/* Implementation #5 */

-- SELECT

--     o.order_id,
--     o.order_amount,
--     DATE_FORMAT(EXTRACT(MONTH FROM o.order_date), '%M') AS MonthInWords,
--     o.order_status,
--     c.customer_id,
--     c.customer_name
    
-- FROM customers AS c
-- JOIN orders AS o
-- USING(customer_id);

/*----------------------------------------------------------------------------------------*/

/* Implementation #6 */

/* This is my own solution query by retrieving the month in words from the order date by using
the MONTHNAME function.  This is a way around the usage of the EXTRACT function if not
implemented using CASE. */

-- SELECT

--     o.order_id,
--     o.order_amount,
--     MONTHNAME(o.order_date) AS MonthInWords,
--     o.order_status,
--     c.customer_id,
--     c.customer_name
    
-- FROM customers AS c
-- JOIN orders AS o
-- USING(customer_id);

/*----------------------------------------------------------------------------------------*/

/* My solution #1 */

/* The query can also be written using the CASE clause in order to generate a column of months
in words by extracting the months as numbers and then providing the month names on a case by 
case bases. */

-- SELECT

--     o.order_id,
--     o.order_amount,
--     (CASE EXTRACT(MONTH FROM o.order_date)
--     WHEN 1 THEN 'January'
--     WHEN 2 THEN 'February'
--     WHEN 3 THEN 'March'
--     WHEN 4 THEN 'April'
--     WHEN 5 THEN 'May'
--     WHEN 6 THEN 'June'
--     WHEN 7 THEN 'July'
--     WHEN 8 THEN 'August'
--     WHEN 9 THEN 'September'
--     WHEN 10 THEN 'October'
--     WHEN 11 THEN 'November'
--     WHEN 12 THEN 'December'
--     END) AS MonthInWords,
--     o.order_status,
--     c.customer_id,
--     c.customer_name
    
-- FROM customers AS c
-- JOIN orders AS o
-- USING(customer_id);

/*----------------------------------------------------------------------------------------*/

/* My solution #2 */

SELECT

	o.order_id,
	o.order_status,
	o.order_amount,
	CASE
	WHEN EXTRACT(MONTH FROM o.order_date) = 1 THEN 'January'
	WHEN EXTRACT(MONTH FROM o.order_date) = 2 THEN 'February'
	WHEN EXTRACT(MONTH FROM o.order_date) = 3 THEN 'March' 
	WHEN EXTRACT(MONTH FROM o.order_date) = 4 THEN 'April'
	WHEN EXTRACT(MONTH FROM o.order_date) = 5 THEN 'May' 
	WHEN EXTRACT(MONTH FROM o.order_date) = 6 THEN 'June' 
	WHEN EXTRACT(MONTH FROM o.order_date) = 7 THEN 'July' 
	WHEN EXTRACT(MONTH FROM o.order_date) = 8 THEN 'August' 
	WHEN EXTRACT(MONTH FROM o.order_date) = 9 THEN 'September'
	WHEN EXTRACT(MONTH FROM o.order_date) = 10 THEN 'October'
	WHEN EXTRACT(MONTH FROM o.order_date) = 11 THEN 'November'
	WHEN EXTRACT(MONTH FROM o.order_date) = 12 THEN 'December'
	END AS MonthInWords,
	c.customer_id,
	c.customer_name

FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     o.order_id
--     ,o.order_amount
--     ,(CASE EXTRACT(MONTH FROM o.order_date)
--         WHEN 1 THEN 'January'
--         WHEN 2 THEN 'February'
--         WHEN 3 THEN 'March'
--         WHEN 4 THEN 'April'
--         WHEN 5 THEN 'May'
--         WHEN 6 THEN 'June'
--         WHEN 7 THEN 'July'
--         WHEN 8 THEN 'August'
--         WHEN 9 THEN 'September'
--         WHEN 10 THEN 'October'
--         WHEN 11 THEN 'November'
--         WHEN 12 THEN 'December'
--     END) AS MonthInWords
--     ,o.order_status
--     ,c.customer_id
--     ,c.customer_name
-- FROM
--     orders o
-- INNER JOIN
--     customers c
-- ON
--     o.customer_id = c.customer_id;