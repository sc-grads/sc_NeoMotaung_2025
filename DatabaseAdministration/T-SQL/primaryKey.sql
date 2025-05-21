alter table tblEmployee
ADD constraint PK_TblEmployee PRIMARY KEY (EmployeeNumber)

insert into tblEmployee(EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName.
EmployeeGovernmentID, DateOfBirth, Department)
values (2004, 'MiddleName', 'LastName', 'AB1234FI', '2014-01-01', 'Accounts')

delete from tblEmployee
where EmployeeNumber = 2004

alter table tblEmployee 
drop constraint PK_tblEmployee

create table tblEmployee2
(
EmployeeNumber int CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1),
EmployeeNmae nvarchar(20)
)

insert into tblEmployee2
VALUES ('Ed norton'), ('james blake')

select * from tblEmployee2