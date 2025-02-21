--Only shows the records where the model were made in 2017 and brand id is 2

SELECT TOP (1000) [product_id]
      ,[product_name]
      ,[brand_id]
      ,[category_id]
      ,[model_year]
      ,[list_price]
  FROM [BikeStores].[production].[products]
  WHERE model_year = 2017 AND brand_id = 2