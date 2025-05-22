select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
sum(A.NumberAttendance) 
over(partition by A.EmployeeNumber, year(A.AttendanceMonth) 
	ORDER BY A.AttendanceMonth
	rows between unbounded preceding and current row
	)
as RowsTotal,
sum(A.NumberAttendance) 
over(partition by A.EmployeeNumber, year(A.AttendanceMonth) 
	ORDER BY A.AttendanceMonth
	range between unbounded preceding and current row
	)
as RangeTotal
from tblEmployee as E 
join (select * from tblAttendance UNION ALL select * from tblAttendance) as A
on E.EmployeeNumber = A.EmployeeNumber
order by A.EmployeeNumber, A.AttendanceMonth
--where A.AttendanceMonth < '20150101'

--unbounded preceding and current row
--current row and unbounded following
--unbounded preceding and unbounded following - RANGE and ROWS
--Range is slower, only used to checking for ties.
--Range is the default when there is no order by