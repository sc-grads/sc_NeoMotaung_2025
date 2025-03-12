USE AdventureWorks2022
GO

--Display sales order details arranged in descending order for unit price
SELECT * FROM [Sales].[SalesOrderDetail] ORDER BY UnitPrice DESC

--Display sales order details arranged in ascending order for unit price
SELECT * FROM [Sales].[SalesOrderDetail] ORDER BY UnitPrice ASC

--Display sales order details that were sold in 2013, ordered in chronological order
SELECT * FROM [Sales].[SalesOrderDetail]  WHERE Year(ModifiedDate) = '2013' ORDER BY ModifiedDate ASC

--Display sales order details that were sold on 01 Jan 2013, from most to least expensive
SELECT * FROM [Sales].[SalesOrderDetail]  WHERE ModifiedDate = '2013-01-01 00:00:00.000' ORDER BY UnitPrice ASC