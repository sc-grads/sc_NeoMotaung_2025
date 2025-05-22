if object_ID('NameEmployees', 'P') IS NOT NULL --P for procedures
	drop proc NameEmployees
go
create proc NameEmployees (@EmployeeNumberOne int, @EmployeeNumberTwo int, @NumberOfRows int OUTPUT) as
begin
	if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberOne and @EmployeeNumberTwo)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName 
		from tblEmployee
		where EmployeeNumber between @EmployeeNumberOne and @EmployeeNumberTwo
		SET @NumberOfRows = @@ROWCOUNT
		RETURN 0
	end
	else
	begin
		SET @NumberOfRows = 0
		RETURN 1
	end
end
go
DECLARE @NumberRows int, @ReturnStatus int
execute @ReturnStatus = NameEmployees 4, 7, @NumberRows OUTPUT
select @NumberRows AS MyRowCount, @ReturnStatus as Return_Status
exec NameEmployees @EmployeeNumberOne = 324, @EmployeeNumberTwo = 327, @NumberOfRows = @NumberRows OUTPUT