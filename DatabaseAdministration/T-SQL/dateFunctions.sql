select CURRENT_TIMESTAMP as RightNow
select GETDATE() as RightNow
select SYSDATETIME() as Rightnow
select DATEADD(YEAR, 1, '2025-05-19 23:14:57') AS myYear
select DATENAME(WEEKDAY, GETDATE()) as myAnswer
select DATEPART(hour, '2025-02-14 12:24:16') as myHour
select DATEDIFF(SECOND, '2025-05-19 23:16:12', GETDATE()) as SecondsElapsed