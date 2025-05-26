
CREATE FUNCTION TransactionList(@EmployeeNumber int)
RETURNS TABLE AS RETURN
(
    SELECT * from tblTransactions
	WHERE EmployeeNumber = @EmployeeNumber
)

go

select * from TransactionList(123)

--checks
select * from tblEmployee
where exists(select * from dbo.TransactionList(EmployeeNumber))
--checks for all the records in tblemployee that exist in transaction list

--Does the same thing as transaction list, to see if transaction list is legit
select distinct E.*
from tblEmployee as E
join tblTransactions as T
on E.EmployeeNumber = T.EmployeeNumber

select * from tblEmployee as E
where exists(select EmployeeNumber from tblTransactions as T 
where E.EmployeeNumber = T.EmployeeNumber)