select tblDepartment.Department, DepartmentHead, sum(Amount) as SumOfAmount 
from tblDepartment
left join tblEmployee
on tblDepartment.Department = tblEmployee.Department
left join tblTransactions
on tblEmployee.EmployeeNumber = tblTransactions.EmployeeNumber
group by tblDepartment.Department, DepartmentHead

insert into tblDepartment
values ('Accounts', 'James')

select DepartmentHead, sum(Amount) as SumOfAmount 
from tblDepartment
left join tblEmployee
on tblDepartment.Department = tblEmployee.Department
left join tblTransactions
on tblEmployee.EmployeeNumber = tblTransactions.EmployeeNumber
group by DepartmentHead
order by DepartmentHead

--Aliases

select D.DepartmentHead, sum(T.Amount) as SumOfAmount 
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransactions as T
on E.EmployeeNumber = T.EmployeeNumber
group by D.DepartmentHead
order by D.DepartmentHead