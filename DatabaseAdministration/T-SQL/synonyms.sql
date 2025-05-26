create synonym EmployeeTable
for tblEmployee
go

select * from EmployeeTable

--synonyms can be created before the table itself is even created
--The synonym won't actually work but once that table is created it will

/*create synonym Dates
for tblDate
go

select * from Dates*/

--Dates will be stored but the select query wont work until tblDate itself is made
