select *
into dbo.tblTransactionBig
from [dbo].[tblTransactions]

insert into dbo.tblTransactionBig ([Amount], [DateOfTransaction], [EmployeeNumber])
select T1.Amount, T2.DateOfTransaction, 1 as EmployeeNumber
from [dbo].[tblTransactions] as T1
cross join (select * from [dbo].[tblTransactions] where EmployeeNumber<200) as T2

create nonclustered index idx_tbltblTransactionBig on dbo.tblTransactionBig(EmployeeNumber)
go
create proc procTransactionBig(@EmployeeNumber as int) WITH RECOMPILE
as
select *
from tblTransactionBig as T
left join tblEmployee as E
on T.EmployeeNumber = E.EmployeeNumber
where T.EmployeeNumber = @EmployeeNumber

exec procTransactionBig 1
exec procTransactionBig 132
