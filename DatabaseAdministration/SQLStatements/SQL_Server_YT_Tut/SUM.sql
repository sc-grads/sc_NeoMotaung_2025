--Aggregate function: SUM - Adds all values under column specified

SELECT TOP (1000) 
	SUM(list_price) as Sum
  FROM [BikeStores].[sales].[order_items]
