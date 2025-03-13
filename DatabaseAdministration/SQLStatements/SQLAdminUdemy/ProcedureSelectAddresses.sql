CREATE PROCEDURE SelectAllPersonAddress
AS 
SELECT * FROM [Person].[Address]
go;

execute SelectAllPersonAddress

drop procedure SelectAllPersonAddress