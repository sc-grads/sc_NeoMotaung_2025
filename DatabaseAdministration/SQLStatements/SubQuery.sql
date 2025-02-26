--Query used to display the product name and their category name based on their category id using subqueries

SELECT product_name, (SELECT category_name FROM production.categories WHERE category_id = 5) AS category_name
FROM production.products;
