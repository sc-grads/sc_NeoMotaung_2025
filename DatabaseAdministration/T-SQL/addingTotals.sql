select E.Department, E.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance 
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
--order by Department, EmployeeNumber, AttendanceMonth
UNION
select E.Department, E.EmployeeNumber, null as AttendanceMonth, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
group by E.Department, E.EmployeeNumber
--order by Department, EmployeeNumber, isNullValue, AttendanceMonth
union
select E.Department, null, null as AttendanceMonth, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
group by E.Department, E.EmployeeNumber
--order by Department, EmployeeNumber, AttendanceMonth
union
select null, null, null as AttendanceMonth, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
group by E.Department, E.EmployeeNumber
--order by Department, EmployeeNumber, isNullValue, AttendanceMonth