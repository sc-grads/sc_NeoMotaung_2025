use MyFirstDB
go

update StudentInfo set StudentCity = 'Joburg'

update StudentInfo set StudentAge = StudentAge + 5

update StudentInfo set StudentCity = 'Durban' where StudentAge = 32

select * from StudentInfo

