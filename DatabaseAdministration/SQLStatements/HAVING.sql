SELECT COUNT(product_id), model_year
FROM production.products
GROUP BY model_year
HAVING COUNT(product_id) > 4;