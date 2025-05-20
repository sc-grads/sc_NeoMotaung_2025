select * from tblEmployee
where EmployeeLastName like '[r-t]%' --In the range rst

select * from tblEmployee
where EmployeeLastName like '[BEL]%' --Start with B, E or L

select * from tblEmployee
where EmployeeLastName like '[^BEL]%' --Does NOT start with B, E or L