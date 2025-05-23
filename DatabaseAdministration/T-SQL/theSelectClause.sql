select *, (select COUNT(T.EmployeeNumber)  
		   from tblTransactions as T
		   where T.EmployeeNumber = E.EmployeeNumber) as NumTransactions,
		   (select SUM(Amount)  
		   from tblTransactions as T
		   where T.EmployeeNumber = E.EmployeeNumber) as TotalAmount
from tblEmployee as E
WHERE E.EmployeeLastName like 'y%'

select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, COUNT(T.EmployeeNumber) as NumTransactions
from tblTransactions as T
inner join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeLastName like 'y%'
group by E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
order by E.EmployeeNumber