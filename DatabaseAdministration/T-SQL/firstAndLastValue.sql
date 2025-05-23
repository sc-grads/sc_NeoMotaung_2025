select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
FIRST_VALUE(NumberAttendance)
over (partition by E.employeeNumber order by A.attendanceMonth 
	  rows between 2 preceding and current row) as FirstMonth,
LAST_VALUE(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber order by A.AttendanceMonth
rows between unbounded preceding and 2 following) as LastMonth
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber