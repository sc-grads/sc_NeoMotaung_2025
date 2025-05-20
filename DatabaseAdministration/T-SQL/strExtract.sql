DECLARE @myASCII AS varchar(20)

SET @myASCII = 'heLloThere'

SELECT left(@myASCII, 2) as LeftSide, right(@myASCII, 2) as RightSide
SELECT SUBSTRING(@myASCII, 2,5) as Middle

--left(string, n) where n is the nth letter from the first position starting from 1
--right(string, n) where n is the nth letter starting the last letter and going backwards, starting from 1
--Substring(string, n, m) takes a chunk out of the string starting from the nth letter and taking m letters starting from and including the nth letter

select LTRIM(@myASCII) as LeftTrim
select REPLACE(@myASCII, 'll', 'lilililil') as Replaced

SELECT UPPER(@myASCII) AS UPPERCASE
SELECT lower(@myASCII) AS LOWERCASE