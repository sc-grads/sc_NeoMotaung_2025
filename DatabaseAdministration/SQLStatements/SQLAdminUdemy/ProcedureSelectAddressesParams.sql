
--Procedure with parameter, helps with filtering
CREATE PROCEDURE SelectAllPersonAddressParam (@City nvarchar(30))
AS

BEGIN 

SELECT * FROM [Person].[Address] where City = @City

END

execute SelectAllPersonAddressParam @City = 'Miami'

drop procedure SelectAllPersonAddressParam

--Procedure with pre-defined parameter value
CREATE PROCEDURE SelectAllPersonAddressParam (@City nvarchar(30) = 'New York')
AS

BEGIN 

SELECT * FROM [Person].[Address] where City = @City

END

execute SelectAllPersonAddressParam 