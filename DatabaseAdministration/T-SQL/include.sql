CREATE NONCLUSTERED INDEX idx_tblEmployee_Employee  
    ON dbo.tblEmployee(EmployeeNumber) include (EmployeeFirstName);

DROP INDEX idx_tblEmployee_Employee ON dbo.tblEmployee

select * 
from tblEmployee
where EmployeeNumber between 140 and 150

create nonclustered index idx_dateofBirthWithIncludes
on tblEmployee.EmployeeNumber, dateofbirth
include empl