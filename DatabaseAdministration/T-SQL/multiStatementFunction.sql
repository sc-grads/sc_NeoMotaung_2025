ALTER FUNCTION [dbo].[TransactionList](@EmployeeNumber int)
RETURNS TABLE AS RETURN
(
    SELECT * from tblTransactions
	WHERE EmployeeNumber = @EmployeeNumber
)

go

SELECT * FROM dbo.TransactionList(123)
GO
Create FUNCTION TransList(@EmployeeNumber int)
RETURNS @TransList Table
(Amount smallmoney,
DateOfTransaction smalldatetime,
EmployeeNumber int)
AS 
BEGIN
	INSERT INTO @TransList (Amount, DateOfTransaction, EmployeeNumber)
	SELECT Amount, DateOfTransaction, EmployeeNumber FROM tblTransactions
	WHERE EmployeeNumber = @EmployeeNumber
	RETURN
END
--multi line allows more freedom
go
select * from dbo.TransList(123)