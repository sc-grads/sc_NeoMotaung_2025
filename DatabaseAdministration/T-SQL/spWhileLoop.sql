if object_ID('NameEmployees', 'P') IS NOT NULL --P for procedures
	drop proc NameEmployees
go
create proc NameEmployees (@EmployeeNumberOne int, @EmployeeNumberTwo int) as
begin
	if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberOne and @EmployeeNumberTwo)
	begin
		declare @EmployeeNumber int = @EmployeeNumberOne
		while @EmployeeNumber <= @EmployeeNumberTwo
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName 
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
			SET @EmployeeNumber = @EmployeeNumber + 1 --prevents infinite loop
			--BREAK and CONTINUE are also present in SQL

		end
	end
end
go
NameEmployees 4, 5

execute NameEmployees 123, 223
exec NameEmployees @EmployeeNumberOne = 324, @EmployeeNumberTwo = 327 
--explicit assignment allows parameters can be swapped 
--(@EmployeeNumberTwo = 327, @EmployeeNumberOne = 324) would still be fine
--If the first one is assigned then the second HAS to be too
--@EmployeeNumberOne = 324, 327 would NOT work
-- BUT 324, @EmployeeNumberTwo = 327 works