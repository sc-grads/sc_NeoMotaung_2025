SELECT COUNT(product_id), category_id
FROM production.products
GROUP BY category_id;