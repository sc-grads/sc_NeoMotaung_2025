declare @mydateoffset as datetimeoffset = '2025-06-12 01:02:03.456 +05:30'
select @mydateoffset as myDateOffset
go

declare @myDate as datetime2 = '2025-05-23 01:02:03.456'
select TODATETIMEOFFSET(@myDate, '+05:30') as MyDateOffset

select DATETIME2FROMPARTS(2025,06,24,1,2,3,456,     3)
select DATETIMEOFFSETFROMPARTS(2025,06,24,1,2,3,456,5,30, 3) AS MyDateOffset

select SYSDATETIMEOFFSET() as TimeNowWithOffset
select SYSDATETIME() as TimeNowUTC;

declare @myDateOffset as datetimeoffset = '2015-06-01 01:02:03.456 +05:30'
select SWITCHOFFSET(@myDateOffset, '+05:40') as mydateoffsettexas