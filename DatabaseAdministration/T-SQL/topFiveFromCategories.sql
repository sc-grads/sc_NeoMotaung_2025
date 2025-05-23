select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
		rank() over(partition by D.Department order by E.EmployeeNumber) as TheRank
from tblDepartment as D
join tblEmployee as E 
on D.Department = E.Department
order by D.Department, EmployeeNumber

select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
		rank() over(partition by D.Department order by E.EmployeeNumber) as TheRank
from tblDepartment as D
join tblEmployee as E 
on D.Department = E.Department
where rank() over(partition by D.Department order by E.EmployeeNumber) <= 5
order by D.Department, EmployeeNumber

select * 
from (select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
		rank() over(partition by D.Department order by E.EmployeeNumber) as TheRank
from tblDepartment as D
join tblEmployee as E 
on D.Department = E.Department
--where rank() over(partition by D.Department order by E.EmployeeNumber) <= 5
) as MyTable
order by Department, EmployeeNumber