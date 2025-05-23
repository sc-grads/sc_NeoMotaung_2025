select A.EmployeeNumber, A.AttendanceMonth, a.NumberAttendance,
lag(NumberAttendance, 3, 707) over(partition by E.employeeNumber order by A.AttendanceMonth) 
			as myLag,
lead(NumberAttendance, 3, 707) over(partition by E.employeeNumber order by A.attendanceMonth)
			as myLead,
NumberAttendance - lag(NumberAttendance, 1) over (partition by E.employeeNumber order by A.attendanceMonth) as myDiff
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

--Third parameter of lead and lag is a placeholder int for NULL values.