select * from sys.syscomments
select * from sys.views

--we want to join these to see the text associated with the views we created

select V.name, S.text from sys.syscomments as S
inner join sys.views as V
on S.id = V.object_id

select OBJECT_DEFINITION(OBJECT_ID('dbo.ViewByDepartment'))

select * from sys.sql_modules

--definition is easy to get, not secure

--to Secure: 

--Add WITH ENCYRPTION before AS when creating the view

if exists(select * from INFORMATION_SCHEMA.VIEWS
WHERE [TABLE_NAME] = 'ViewByDepartment' and [TABLE_SCHEMA] = 'dbo')
	drop view dbo.ViewByDepartment
GO

select * from sys.views

GO

CREATE VIEW ViewByDepartment WITH ENCRYPTION AS
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount 
FROM tblDepartment as D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransactions AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 AND 139
GO