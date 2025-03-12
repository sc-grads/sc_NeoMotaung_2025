use AdventureWorks2022
go

--Highlight and execute individual SELECT statements to run them individually
-- Display products table

 SELECT * FROM [Production].[Product]

--Display name and colour of product

SELECT Name, Color FROM [Production].[Product]

--Display top 10 

SELECT TOP (10) * FROM [Production].[Product]