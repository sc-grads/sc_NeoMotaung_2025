select EmployeeNumber, SUM(Amount) as TotalAmount
FROM tblTransactions
GROUP BY EmployeeNumber

select * from tblEmployee
join tblTransactions
on tblEmployee.EmployeeNumber = tblTransactions.EmployeeNumber

select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
from tblEmployee
join tblTransactions
on tblEmployee.EmployeeNumber = tblTransactions.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY tblEmployee.EmployeeNumber

