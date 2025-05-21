--ORDER BY INVALID FOR VIEWS

SELECT 1 
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


CREATE VIEW ViewSummary AS
SELECT D.Department, T.EmployeeNumber AS EmpNum, sum(T.Amount) AS TotalAmount 
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
ON D.Department = E.Department
LEFT JOIN tblTransactions as T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY D.Department, T.EmployeeNumber
GO

SELECT * FROM ViewSummary

SELECT * FROM ViewByDepartment


