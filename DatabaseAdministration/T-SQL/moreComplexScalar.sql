if exists(SELECT * FROM SYS.objects WHERE name='NumberOfTransactions')
	DROP FUNCTION NumberOfTransactions
	--Can also use obj ID
GO

CREATE FUNCTION NumberOfTransactions(@EmployeeNumber int)
RETURNS int
AS BEGIN
	DECLARE @NumberOfTransactions INT
	SELECT @NumberOfTransactions = COUNT(*) FROM tblTransactions
	WHERE EmployeeNumber = @EmployeeNumber
	RETURN @NumberOfTransactions
END

GO

select *, dbo.NumberOfTransactions(EmployeeNumber) as TransNum
FROM tblEmployee

SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, count(T.EmployeeNumber) as TransNum 
from tblEmployee as E
left join tblTransactions as T
on E.EmployeeNumber = T.EmployeeNumber
group by E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
