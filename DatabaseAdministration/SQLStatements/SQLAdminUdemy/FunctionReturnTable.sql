
--Create function that will combine first name and last name fields in Person.Person to display them as a full name
create function fnFullName (@FirstName nvarchar(50), @LastName nvarchar(50))
returns varchar(101)
AS
begin
return (select @FirstName + ' ' + @LastName )
end

SELECT dbo.fnFullName(FirstName, LastName) as FullName FROM Person.Person

--Displays a table of employees and Sets the job title to unemployed for those hired before 2011
create function fnGetEmployee()
returns @Emp Table
(
EmpId int,
JobTitle nvarchar(50),
hiredate date
)
as
begin
insert into @Emp select e.NationalIDNumber, e.JobTitle, e.HireDate from HumanResources.Employee e;
update @Emp set JobTitle = 'Unemployed' where year(HireDate) < '2011'
return
end

select * from dbo.fnGetEmployee()
