Use AdventureWorks2022
go

SELECT count(*) as OrderQtyNumber, OrderQty FROM [Sales].[SalesOrderDetail] GROUP BY OrderQty 

--Number of sale orders per orderqty arranged in descding order
SELECT count(*) as OrderQtyNumber, OrderQty FROM [Sales].[SalesOrderDetail] GROUP BY OrderQty ORDER BY OrderQty DESC

--Number of people per person type
SELECT count(*) As PersonTypeCount, PersonType FROM [Person].Person GROUP BY PersonType

