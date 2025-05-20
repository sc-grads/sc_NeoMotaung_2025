select * from tblEmployee where EmployeeNumber = 194
select * from tblTransactions where EmployeeNumber = 3
select * from tblTransactions where EmployeeNumber = 194

--No records in tblTransactions where employeeNumber is 194

begin transaction
select * from tblTransactions where EmployeeNumber = 194
update tblTransactions
set EmployeeNumber = 194
from tblTransactions
where EmployeeNumber = 3 --can use IN for a tuple/list of words or BETWEEN for a range
select * from tblTransactions where EmployeeNumber = 194
rollback tran

begin transaction
--select * from tblTransactions where EmployeeNumber = 194
update tblTransactions
set EmployeeNumber = 194
output inserted.*, deleted.*
from tblTransactions
where EmployeeNumber in (3, 5, 7, 9) --can use IN for a tuple/list of words or BETWEEN for a range
--select * from tblTransactions where EmployeeNumber = 194
rollback tran