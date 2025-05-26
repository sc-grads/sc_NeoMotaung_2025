select * from tblEmployee where EmployeeNumber = 129;
go
declare @command as varchar(255);
set @command = 'SELECT * FROM tblEmployee where EmployeeNumber = 129;'
set @command = 'select * from tblTransactions'
execute(@command)
go

declare @command as varchar(255), @param as varchar(50);
set @command = 'SELECT * FROM tblEmployee where EmployeeNumber = '
set @param = '129'
execute(@command + @param)
go

--sql injection
declare @command as varchar(255), @param as varchar(50);
set @command = 'SELECT * FROM tblEmployee where EmployeeNumber = '
set @param = '129 or 1=1'
execute(@command + @param)
go

declare @command as nvarchar(255), @param as nvarchar(50);
set @command = N'SELECT * FROM tblEmployee where EmployeeNumber = @ProductID'
set @param = N'129 or 1=1'
execute sys.sp_executesql @statement = @command, @params = N'@ProductID int', @ProductID = @param;
go

