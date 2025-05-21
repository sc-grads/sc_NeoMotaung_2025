--we have to confirm if a view exists before altering or deleting it
--to alter a view we have to drop it first then re-create it

USE [70-461]
GO

select * from sys.views

if exists(select * from sys.views where name = 'ViewByDepartment')
	drop view dbo.ViewByDepartment
GO

if exists(select * from INFORMATION_SCHEMA.VIEWS
WHERE [TABLE_NAME] = 'ViewByDepartment' and [TABLE_SCHEMA] = 'dbo')
	drop view dbo.ViewByDepartment
GO

select * from sys.views

GO

CREATE VIEW ViewByDepartment AS
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount 
FROM tblDepartment as D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransactions AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 AND 139
GO
