SELECT DATENAME(MONTH, DateOfBirth) as nameofMonth, count(*) as EmployeeNumber, 
COUNT(EmployeeMiddleName) as NumberofMiddleNames,
COUNT(*) - COUNT(EmployeeMiddleName) as NoMiddleName,
min(DateOfBirth) as EarliestDOB,
format(max(DateOfBirth), 'D') as LatestDOB
from tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth), DATEPART(MONTH, DateOfBirth)
ORDER BY DATEPART(MONTH, DateOfBirth)