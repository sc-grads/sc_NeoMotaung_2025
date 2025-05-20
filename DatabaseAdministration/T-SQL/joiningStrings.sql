DECLARE @firstName AS nvarchar(20)
DECLARE @middleName AS nvarchar(20)
DECLARE @lastName AS nvarchar(20)

SET @firstName = 'John'
--SET @middleName = 'Walker'
SET @lastName = 'Smith'

SELECT @firstName + ' ' + @middleName + ' ' + @lastName as FullName

SELECT @firstName + iif(@middleName is NULL, ' ', ' ' + middleName) + @lastName as FullName
SELECT @firstName + CASE WHEN @middleName is Null THEN ' ' ELSE ' ' + @middleName END 


