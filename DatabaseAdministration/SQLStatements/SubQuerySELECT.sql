SELECT * FROM production.products 
WHERE category_id IN (SELECT category_id FROM production.categories WHERE category_name = 'Electric Bikes');