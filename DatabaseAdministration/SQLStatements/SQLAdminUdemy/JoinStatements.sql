use AdventureWorks2022
go

SELECT s.TerritoryID, s.SalesQuota, t.Name, t.SalesYTD FROM [Sales].[SalesPerson] s
join [Sales].[SalesTerritory] t
on s.TerritoryID = t.TerritoryID

SELECT count(*) as TerritoryName,t.Name, s.TerritoryID FROM [Sales].[SalesPerson] s
join [Sales].[SalesTerritory] t
on s.TerritoryID = t.TerritoryID
GROUP BY t.Name, s.TerritoryID