select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
sum(A.NumberAttendance) 
over(partition by A.EmployeeNumber, year(A.AttendanceMonth) 
	ORDER BY A.AttendanceMonth
	rows between unbounded preceding and unbounded following
	) --we use unbounded instead of some random long number because we still can't be sure if the large number would cover
as RunningTotal
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
--where A.AttendanceMonth < '20150101'