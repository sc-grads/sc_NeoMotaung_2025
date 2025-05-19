DECLARE @mynumber AS numeric(7)
--numeric(total digits, number of decimal places)
--So number of digits before decimal place is total digits - number of decimal places
--In this case 7 - 2 = 5

SET @mynumber = 1134.62

--SELECT @mynumber AS Number 

DECLARE @myfloat as float(24)

SET @myfloat = 123.5

SELECT @myfloat AS MyFloat

