BEGIN transaction

select count(*) from tblTransactions

delete tblTransactions
from tblEmployee as E
right join tblTransactions as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber is NULL

select count(*) from tblTransactions

rollback transaction

select count(*) from tblTransactions

--Using derived queries in a transaction
BEGIN transaction

select count(*) from tblTransactions
delete tblTransactions
from tblTransactions
where EmployeeNumber in
(
	select TNumber from
	(
		select E.EmployeeNumber as ENumber, E.EmployeeFirstName,
		e.EmployeeLastName, T.EmployeeNumber as TNumber,
		sum(T.Amount) as TotalAmount
		from tblEmployee AS E
		right join tblTransactions as T
		on E.EmployeeNumber = T.EmployeeNumber
		group by E.EmployeeNumber, t.EmployeeNumber, E.EmployeeFirstName,
		E.EmployeeLastName
	) as newTable
where ENumber is NULL)

select count(*) from tblTransactions
rollback transaction --can also use rollback tran

select count(*) from tblTransactions

