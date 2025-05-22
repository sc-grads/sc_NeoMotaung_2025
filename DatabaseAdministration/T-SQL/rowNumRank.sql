select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
ROW_NUMBER() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth, A.NumberAttendance ) as TheRowNumber
, RANK() OVER (PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth, A.NumberAttendance) AS TheRank
, DENSE_RANK() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth, A.NumberAttendance) as TheDenseRank
from tblEmployee as E
join (select * from tblAttendance UNION ALL SELECT * FROM tblAttendance) as A
on E.EmployeeNumber = A.EmployeeNumber
--order by is not optional for these functions
--Theres a work around though: ORDER BY(SELECT NULL)
--Used when you don't care about the order