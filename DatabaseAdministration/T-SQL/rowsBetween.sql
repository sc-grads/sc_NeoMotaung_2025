select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
sum(A.NumberAttendance) 
over(partition by A.EmployeeNumber, year(A.AttendanceMonth) 
	ORDER BY A.AttendanceMonth
	rows between 1 preceding and 1 following
	)
as RunningTotal
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
--where A.AttendanceMonth < '20150101'
