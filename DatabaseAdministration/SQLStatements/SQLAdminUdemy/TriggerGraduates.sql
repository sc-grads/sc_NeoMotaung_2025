use AdventureWorks2022
go

--Create graduate table
--Graduate table is used to test triggers
create table graduates(
GradID int identity,
FirstName nvarchar(50),
LastName nvarchar(50),
Age int,
)

drop table GradHistory

--Display graduates
select * from graduates

--Tracks Trigger logs
create table GradHistory(
ID int,
Action nvarchar(50)
)

--Insert values into graduates table to test trigger
INSERT INTO graduates VALUES ('John', 'Smith', 24)

--Create trigger gradinsert
--Triggers whenever a row is inserted into table graduates
create trigger GradInsert
ON graduates
AFTER INSERT
AS
BEGIN
insert into GradHistory values ((select max(GradID) from graduates), 'Insert action')
END
GO

--Display trigger log table
select * from GradHistory