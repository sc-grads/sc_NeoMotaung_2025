if exists(select * from INFORMATION_SCHEMA.VIEWS
WHERE [TABLE_NAME] = 'ViewByDepartment' and [TABLE_SCHEMA] = 'dbo')
	drop view dbo.ViewByDepartment
GO

select * from sys.views

GO

CREATE VIEW ViewByDepartment with schemabinding AS
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount 
FROM dbo.tblDepartment as D
inner JOIN dbo.tblEmployee AS E
ON D.Department = E.Department
inner JOIN dbo.tblTransactions AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 127 AND 139
GO

DELETE FROM dbo.ViewByDepartment WHERE EmployeeNumber = 123

CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment on dbo.ViewByDepartment(EmployeeNumber, Department)

BEGIN TRAN
DROP TABLE tblEmployee
ROLLBACK TRAN