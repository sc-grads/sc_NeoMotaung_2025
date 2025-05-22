select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
sum(A.NumberAttendance) over() as TotalAttendance,
convert(decimal(18,7), A.NumberAttendance) / sum(A.NumberAttendance) over() * 100 as PercentageAttendance
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
--group by A.EmployeeNumber, year(a.AttendanceMonth)
--order by A.EmployeeNumber, year(a.AttendanceMonth)

--Over() adds every single attendance