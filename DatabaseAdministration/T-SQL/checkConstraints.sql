alter table tblTransactions
add constraint chkAmount check (Amount > -1000 and Amount < 1000)

insert into tblTransactions
values (1010, '2017-01-01', 1)

insert into tblTransactions
values (101, '2017-01-01', 1)

alter table tblEmployee with nocheck
add constraint chkMiddleName check 
(REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)

alter table tblEmployee
drop constraint chkMiddleName

begin tran
	insert into tblEmployee
	values (2003, 'A', 'B', 'C', 'D', '2014-01-01', 'Accounts')
	SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003
rollback tran

--Can be added along side the creation of a table

create table tblEmployee2
(EmployerMiddleName varchar(50) null, check
(Replace(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)
)