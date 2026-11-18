/* Brainstorming section */

-- Group the table by category.

-- In the grouped table, calculate the sum of the quantity in stock per category.

-- Return/display the calculations per category.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--      category,
--      SUM(quantityinstock) AS tot_quantity
-- FROM products_prc
-- GROUP BY category;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table products_prc */

-- SELECT *
-- FROM products_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

     category,
     SUM(quantityinstock) AS tot_quantity
     
FROM products_prc
GROUP BY category;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT p.category, SUM(p.quantityinstock) AS TotalQuantityInStock
-- FROM products_prc p
-- GROUP BY p.category;