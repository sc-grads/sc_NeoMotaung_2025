SELECT Department, COUNT(*) as NumberOfDepartment 
from tblEmployee
GROUP BY Department

--Derived Table

SELECT Department
FROM
(select Department, COUNT(*) as NumberOfDepartment from tblEmployee
GROUP BY Department) as NewTable

select distinct Department
from tblEmployee

select distinct Department, '' as DepartmentHead
from tblEmployee

select distinct Department, convert(varchar(20), '') as DepartmentHead
into tblDepartment
from tblEmployee

drop table tblDepartment