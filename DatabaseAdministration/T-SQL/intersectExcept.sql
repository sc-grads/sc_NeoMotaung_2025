select *, ROW_NUMBER() over(order by (select null)) % 3 as ShouldIDelete
into tblTransactionNew
from tblTransactions



delete from tblTransactionNew
where ShouldIDelete = 1

update tblTransactionNew
set DateOfTransaction = DATEADD(day, 1, DateOfTransaction)
where ShouldIDelete = 2

alter table tblTransactionNew
drop column ShouldIDelete

select * from tblTransactions
union
select * from tblTransactionNew