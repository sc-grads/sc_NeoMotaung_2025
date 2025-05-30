if object_ID('AverageBalance', 'P') IS NOT NULL --P for procedures
	drop proc AverageBalance
go
create proc AverageBalance (@EmployeeNumberOne int, @EmployeeNumberTwo int, @AverageBalance int OUTPUT) as
begin
	declare @TotalAmount decimal(5,2)
	declare @NumOfEmployee int
	begin try
		select @TotalAmount = sum(Amount) from tblTransactions
		where EmployeeNumber between @EmployeeNumberOne and @EmployeeNumberTwo
		select @NumOfEmployee = count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberOne and @EmployeeNumberTwo
		SET @AverageBalance = @TotalAmount / @NumOfEmployee
		RETURN 0
	end try
	begin catch
		SET @AverageBalance = 0
		if ERROR_NUMBER() = 8134
		BEGIN
			SET @AverageBalance = 0
			RETURN 8134
		END
		ELSE
			throw 56789, 'There is an unknown error', 1
	end catch
end
go
--has other potential of errors like type ranges etc
DECLARE @AvgBalance int, @ReturnStatus int
execute @ReturnStatus = AverageBalance 4, 7, @AvgBalance OUTPUT
select @AvgBalance AS MyRowCount, @ReturnStatus as Return_Status
GO
--divide by 0 error

DECLARE @AvgBalance int, @ReturnStatus int
execute @ReturnStatus = AverageBalance 223, 227, @AvgBalance OUTPUT
select @AvgBalance AS Avg_Balance, @ReturnStatus as Return_Status