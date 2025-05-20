SELECT LEFT(EmployeeLastName, 1) as Initial, count(*) as CountInitials 
from tblEmployee
group by LEFT(EmployeeLastName, 1)
ORDER BY COUNT(*) DESC 

SELECT LEFT(EmployeeLastName, 1) as Initial, count(*) as CountInitials 
from tblEmployee
group by LEFT(EmployeeLastName, 1)
HAVING count(*) >= 20
ORDER BY CountInitials DESC 