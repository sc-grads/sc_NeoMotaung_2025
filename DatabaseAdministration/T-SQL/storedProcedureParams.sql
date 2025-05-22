--if exists(select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees', 'P') IS NOT NULL --P for procedures
	drop proc NameEmployees
go
create proc NameEmployees (@EmployeeNumber int) as
begin
	if exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName 
		from tblEmployee
		where EmployeeNumber = @EmployeeNumber
	end
end
go
NameEmployees 4

execute NameEmployees 123
exec NameEmployees 323

--declare @Emplo