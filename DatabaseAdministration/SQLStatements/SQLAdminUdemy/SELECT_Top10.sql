Use AdventureWorks2022
go

--SELECT Top 10 People in Table Person

SELECT TOP (10) * FROM [Person].[Person]

--SELECT TOP 10 EMPLOYEES ONLY SHOWING Title and LastName

SELECT TOP (10) Title, LastName FROM [Person].[Person]