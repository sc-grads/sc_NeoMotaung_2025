select * from tblEmployee where EmployeeMiddleName is null

declare @myOption as varchar(10) = 'declare'
select isnull(@myOption, 'No Option') as MyOptions
go

declare @myFirstOption as varchar(10)
declare @mySecondOption as varchar(10)

select coalesce(@myFirstOption, @mySecondOption, 'No option') as MyOptions

select isnull('ABC', 1) as MyAnswer
select coalesce('ABC', 1) as myOtherAnswer
go

select isnull(null, null) as MyAnswer
select coalesce(null, null) as myOtherAnswer
go



