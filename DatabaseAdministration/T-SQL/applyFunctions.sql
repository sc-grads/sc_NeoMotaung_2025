select * from dbo.TransList(123)
go

select *, (select count(*) from dbo.TransList(E.EmployeeNumber)) as NumTransactions
from tblEmployee as E

--Do not do this. 
--Can't join a table with the return result of a function
--It's like:
--  123 left join TransList(123)
--We need apply
/*select * from tblEmployee
left join TransList(E.EmployeeNumber) as T
On E.EmployeeNumber = T.EmployeeNumber*/

select * from tblEmployee as E
outer apply TransList(E.EmployeeNumber) as T

select * from tblEmployee as E
cross apply TransList(E.EmployeeNumber) as T

select * from tblEmployee as E
where (select count(*) from dbo.TransList(E.EmployeeNumber)) > 3



