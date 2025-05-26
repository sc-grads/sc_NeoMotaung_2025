
CREATE FUNCTION AmountPlusOne (@Amount smallmoney)
RETURNS smallmoney
AS
BEGIN

    RETURN @Amount + 1

END
go


select DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) as AmountAddOne from tblTransactions

declare @myValue smallmoney
set @myValue = dbo.AmountPlusOne(355.56)
select @myValue