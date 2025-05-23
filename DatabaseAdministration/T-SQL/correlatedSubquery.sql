select *, (select COUNT(T.EmployeeNumber)  
		   from tblTransactions as T
		   where T.EmployeeNumber = E.EmployeeNumber) as NumTransactions,
		   (select SUM(Amount)  
		   from tblTransactions as T
		   where T.EmployeeNumber = E.EmployeeNumber) as TotalAmount
from tblEmployee as E
WHERE E.EmployeeLastName like 'y%'

select *, (select EmployeeNumber from tblEmployee as E 
		   where EmployeeLastName like 'y%' and T.EmployeeNumber = E.EmployeeNumber) as doesItExist
from tblTransactions as T
where exists
	(select EmployeeNumber from tblEmployee as E 
	where EmployeeLastName like 'y%' and T.EmployeeNumber = E.EmployeeNumber)
order by EmployeeNumber