
--Create function that will combine first name and last name fields in Person.Person to display them as a full name
create function fnFullName (@FirstName nvarchar(50), @LastName nvarchar(50))
returns varchar(101)
AS
begin
return (select @FirstName + ' ' + @LastName )
end

SELECT dbo.fnFullName(FirstName, LastName) as FullName FROM Person.Person