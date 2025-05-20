declare @mydate as datetime = '2025-06-24 23:40:57.124'
select @mydate as MyDate

declare @mydate2 as datetime2(3) = '20250624 23:40:57.124'
select @mydate2 as MyDate

select DATEFROMPARTS(2025,05,19) as ThisDate
select DATETIME2FROMPARTS(2025,05,19,12,34,56,124,3) as ThatDate
select year(@mydate) as myYear, MONTH(@mydate) as myMonth, DAY(@mydate) as myDay
