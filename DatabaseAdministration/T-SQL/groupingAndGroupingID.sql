select E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance,
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy,
GROUPING_ID(E.EmployeeNumber) AS EmployeeNumberGroupedByID
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
group by rollup (E.Department, E.EmployeeNumber, A.AttendanceMonth)
order by Department, EmployeeNumber, AttendanceMonth