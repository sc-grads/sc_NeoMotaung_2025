CREATE UNIQUE CLUSTERED INDEX [idx_tblEmployee] ON [dbo].[tblEmployee]
([EmployeeNumber])

GO

CREATE UNIQUE CLUSTERED INDEX [idx_tblTransactions] ON [dbo].[tblTransactions]
([EmployeeNumber],[DateOfTransaction],[Amount])

GO
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransactions] as T
on E.EmployeeNumber = T.EmployeeNumber

select *
into dbo.tblEmployeeNoIndex
from dbo.tblEmployee

select *
into dbo.tblTransactionsNoIndex
from dbo.tblTransactions

select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransactions] as T
on E.EmployeeNumber = T.EmployeeNumber

select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployeeNoIndex] as E
left join [dbo].[tblTransactionsNoIndex] as T
on E.EmployeeNumber = T.EmployeeNumber
