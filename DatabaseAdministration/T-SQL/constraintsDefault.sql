alter table tblTransactions
add dateofentry datetime

alter table tblTransactions
add constraint defDateOfEntry DEFAULT GETDATE() FOR dateofentry 
--GETDATE() is a non-deterministic value because it changes each entry.

delete from tblTransactions where EmployeeNumber < 3

insert into tblTransactions (Amount, DateOfTransaction, EmployeeNumber)
VALUES (1, '2014-01-01', 1)

insert into tblTransactions
VALUES (2, '2014-02-02', 1, '2013-01-01')

select * from tblTransactions where EmployeeNumber < 3

alter table tblTransactions
drop column dateofentry
--SQL doesnt know what to do with the constraint when deleting the column first

--drop the constraint first
alter table tblTransactions
drop constraint defDateOfEntry

select * from tblTransactions

