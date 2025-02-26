--Shows the lowest, highest, average, sum and the number of products with an above average list price

SELECT MIN(list_price) AS lowest_price
	,MAX(list_price) AS highest_price
	,AVG(list_price) AS average_price
	,SUM(list_price) AS total
	,(SELECT COUNT(*) FROM production.products WHERE list_price > (SELECT AVG(list_price) FROM production.products)) AS above_average
	,COUNT(*) AS number_of_products
FROM production.products;