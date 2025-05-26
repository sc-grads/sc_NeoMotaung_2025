begin tran
alter table tblEmployee
add Manager int
go
update tblEmployee
set Manager = ((EmployeeNumber-123)/10)+123
where EmployeeNumber>123;
with myTable as
(
select EmployeeNumber, EmployeeFirstName, EmployeeLastName, 0 as BossLevel from tblEmployee
where Manager is null
--Anchor^
UNION ALL
SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, myTable.BossLevel + 1
FROM tblEmployee as E
join myTable on E.Manager = myTable.EmployeeNumber 
)

select * from myTable

rollback tran