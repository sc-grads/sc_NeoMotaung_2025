use AdventureWorks2022
go

--Sub query exercise used to show the employees who were part of department 6
SELECT * FROM [HumanResources].[Employee]
WHERE BusinessEntityID in (SELECT BusinessEntityID FROM [HumanResources].[EmployeeDepartmentHistory] where DepartmentID = 6)

