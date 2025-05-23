select * 
from tblTransactions as T
WHERE EmployeeNumber in
	(SELECT EmployeeNumber FROM tblEmployee where EmployeeLastName not like 'y%')
order by EmployeeNumber
--must be in tblEmployee and tblTransaction, and not 126-129
--INNER JOIN

select * 
from tblTransactions as T
WHERE EmployeeNumber not in
	(SELECT EmployeeNumber FROM tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber
--must be in tblTransactions and not 126-129
--LEFT JOIN