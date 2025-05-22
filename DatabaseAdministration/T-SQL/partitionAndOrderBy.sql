select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
sum(A.NumberAttendance) over(partition by A.EmployeeNumber, year(A.AttendanceMonth) ORDER BY A.AttendanceMonth) as RunningTotal
--,convert(decimal(18,7), A.NumberAttendance) / sum(A.NumberAttendance) over(partition by A.employeeNumber) * 100 as PercentageAttendance
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
--where A.AttendanceMonth < '20150101'
order by A.EmployeeNumber, A.AttendanceMonth