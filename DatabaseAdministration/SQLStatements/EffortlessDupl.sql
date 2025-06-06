create table TestDupl
(
TestID INT IDENTITY(1,1) PRIMARY KEY,
TheName varchar(50) unique
)

insert into TestDupl 
values ('John'), ('James'), ('John'), ('Jackson')

MERGE INTO TestDupl AS target
USING (SELECT 'Jackson' AS TheName) AS source
ON target.TheName = source.TheName
WHEN NOT MATCHED THEN
    INSERT (TheName) VALUES (source.TheName);

select * from TestDupl

