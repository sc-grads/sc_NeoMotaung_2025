use AdventureWorks2022
go

create table graduates(
GradID int identity,
FirstName nvarchar(50),
LastName nvarchar(50),
Age int,
)

drop table GradHistory

select * from graduates

create table GradHistory(
ID int,
Action nvarchar(50)
)

INSERT INTO graduates VALUES ('John', 'Smith', 24)

create trigger GradInsert
ON graduates
AFTER INSERT
AS
BEGIN
insert into GradHistory values ((select max(GradID) from graduates), 'Insert action')
END
GO

select * from GradHistory