declare @mydate as datetime = '2025-05-19 01:02:03.456'
select 'The date and time is: ' + convert(nvarchar(20), @mydate, 104) as DisplayDate

declare @mydate as datetime = '2025-05-19 01:02:03.456'
select cast(@mydate as nvarchar(20)) as MyCastTime

select convert(date, 'Monday, 19 May 2025') as myConvertedDate
select parse('Monday, 19 May 2025' as date) as MyParsedDate --parse string helps server make sense of the string to convert to date

select format(cast('2025-05-19 01:02:03.456' as datetime), 'D') as MyFormattedLongDate
select format(cast('2025-05-19 01:02:03.456' as datetime), 'd') as MyFormattedShortDate
select format(cast('2025-05-19 01:02:03.456' as datetime), 'dd-MM-yyyy') as MyFormattedBritishDate --Months in capital otherwise it will take the minutes
select format(cast('2025-05-19 01:02:03.456' as datetime), 'D', 'es-ES') as MyFormattedLongDate
