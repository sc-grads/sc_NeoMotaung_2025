--Storing theRank as a temp table to be used again and again
with myTable as
(
select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
	rank() over (partition by D.Department order by E.EmployeeNumber) as TheRank
from tblDepartment as D
join tblEmployee as E on D.Department = E.Department),
Transaction2014 as 
(select * from tblTransactions where DateOfTransaction < '2015-01-01')

select * from myTable left join Transaction2014 on myTable.EmployeeNumber = Transaction2014.EmployeeNumber
where TheRank <= 5
ORDER BY Department, myTable.EmployeeNumber