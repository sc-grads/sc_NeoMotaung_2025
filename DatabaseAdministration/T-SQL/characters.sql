--char - ASCII - 1 Byte
--varchar - ASCII - 1 Byte
--nchar - UNICODE - 2 Bytes
--nvarchar - UNICODE - 2 Bytes

DECLARE @myChars as nvarchar(10)

SET @myChars = N'helloǽ'

SELECT @myChars as MyString, LEN(@myChars) as myLength, DATALENGTH(@myChars) as myDataLength -- +2 for varchar