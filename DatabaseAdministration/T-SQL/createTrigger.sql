

CREATE TRIGGER tr_tblDepartment
    ON dbo.tblDepartment
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
    SET NOCOUNT ON
    END

go 

CREATE TRIGGER tr_tblTransactions
    ON tblTransactions
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
    select * from inserted
	select * from deleted
    END

GO

BEGIN TRAN
INSERT INTO tblTransactions(Amount, DateOfTransaction, EmployeeNumber)
VALUES (123,'2015-01-010', 123)
ROLLBACK TRAN
GO