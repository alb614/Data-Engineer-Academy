/* Brainstorming section */

-- Get the year from the order_dates.

-- Group by the years from the order dates.

-- Calculate the sum of the order amounts per year to get the total sales amount.

-- Display the total sales amount.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT EXTRACT(YEAR FROM order_date) AS year, SUM(amount) AS total_sales_amount
-- FROM orders_prc
-- GROUP BY EXTRACT(YEAR FROM order_date);

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT 
    
    EXTRACT(YEAR FROM order_date) AS year, 
    SUM(amount) AS total_sales_amount
    
FROM orders_prc
GROUP BY EXTRACT(YEAR FROM order_date);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT YEAR(order_date) AS OrderYear, SUM(amount) AS TotalSales
-- FROM orders_prc
-- GROUP BY OrderYear;