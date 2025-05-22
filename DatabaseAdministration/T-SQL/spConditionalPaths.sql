if object_ID('NameEmployees', 'P') IS NOT NULL --P for procedures
	drop proc NameEmployees
go
create proc NameEmployees (@EmployeeNumber int) as
begin
	if exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
	begin
		if @EmployeeNumber < 300
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName 
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
		end
		else
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName 
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
			select * from tblTransactions where EmployeeNumber = @EmployeeNumber
		end
	end
end
go
NameEmployees 4

execute NameEmployees 123
exec NameEmployees 324