begin tran MyTrans with MARK 'MyTransaction'

select * from tblEmployee
update tblEmployee set EmployeeNumber = 122 where EmployeeNumber = 123

rollback tran myTrans