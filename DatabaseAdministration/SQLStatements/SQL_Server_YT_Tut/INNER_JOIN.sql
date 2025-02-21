--INNER JOIN with product table and brand table using aliases through brand id 
--Another INNER JOIN with product table and categories table through category_id

SELECT TOP (1000) 
      *
  FROM [BikeStores].[production].[products] p
  INNER JOIN [BikeStores].[production].[brands] b
  ON p.brand_id = b.brand_id
  INNER JOIN [BikeStores].[production].[categories] c
  ON p.category_id = c.category_id;
  
