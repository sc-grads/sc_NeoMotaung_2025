--Order the records using model_year in descending order (newest at the top)

SELECT TOP (1000) [product_id]
      ,[product_name]
      ,[brand_id]
      ,[category_id]
      ,[model_year]
      ,[list_price]
  FROM [BikeStores].[production].[products]
  ORDER BY model_year DESC

  --Use ASC to order in ascending order
