begin tran

select * from tblEmployee
update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123

--commit tran
rollback tran