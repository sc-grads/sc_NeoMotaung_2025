select *
from tblTransactions as T
where EmployeeNumber <> any --does not work properly
	(select EmployeeNumber from tblEmployee WHERE EmployeeLastName like 'y%')
order by EmployeeNumber

select *
from tblTransactions as T
where EmployeeNumber <> all 
	(select EmployeeNumber from tblEmployee WHERE EmployeeLastName like 'y%')
order by EmployeeNumber