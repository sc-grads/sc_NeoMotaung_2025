select A.EmployeeNumber, A.AttendanceMonth,
A.NumberAttendance,
CUME_DIST() OVER(PARTITION BY E.EmployeeNumber
			ORDER BY A.numberattendance) as MyCume_List,
PERCENT_RANK() OVER(PARTITION BY E.EmployeeNumber
			ORDER BY A.numberattendance) as MyCume_List
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber