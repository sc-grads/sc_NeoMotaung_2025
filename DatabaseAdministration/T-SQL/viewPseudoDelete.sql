--Deletions modify the base tables so it is a problem.
--Especially if the view is made with more than one table

CREATE VIEW ViewSimple
AS
SELECT * FROM tblTransactions
GO

BEGIN TRAN
DELETE FROM ViewSimple WHERE EmployeeNumber =132
SELECT * FROM ViewSimple
ROLLBACK TRAN