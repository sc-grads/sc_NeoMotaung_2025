Use AdventureWorks2022
go

--shows records where safety stock level is greater than 500
SELECT * FROM [Production].[Product] WHERE SafetyStockLevel > 500

--select records that were sold after 2011
SELECT * FROM [Production].[Product] WHERE SellStartDate <= '2011-12-31 00:00:00.000'

--Shows number of products sold in 2011 and older
SELECT count(*) As Old FROM [Production].[Product] WHERE SellStartDate <= '2011-12-31 00:00:00.000'

--Shows People that have a last name beginning with an M
SELECT * FROM [Person].[Person] WHERE LastName LIKE 'M%'

--Shows People that have a last name ending with an M
SELECT * FROM [Person].[Person] WHERE LastName LIKE '%M'


--Display sale orders that were over 3000 in price and modified before june
SELECT * FROM [Sales].[SalesOrderDetail] WHERE UnitPrice > 3000 AND ModifiedDate <= '2011-06-01 00:00:00.000'

SELECT * FROM [Sales].[SalesOrderDetail] WHERE (UnitPrice > 3000 AND ModifiedDate <= '2011-06-01 00:00:00.000') OR UnitPrice < 100

--Show sales orders where product ID is either 710, 711 or 712
SELECT * FROM [Sales].[SalesOrderDetail] WHERE ProductID in (710, 711, 712)

--Display record where Middle name field is null ie. The people that don't have a middle name
SELECT * FROM [Person].[Person] WHERE MiddleName IS NULL

--Display record where Middle name field is not null ie. The people that do have a middle name
SELECT * FROM [Person].[Person] WHERE MiddleName IS NOT NULL

