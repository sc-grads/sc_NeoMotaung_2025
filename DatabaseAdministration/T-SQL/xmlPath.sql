select E.EmployeeFirstName as '@EmployeeFirstName'
	   , E.EmployeeLastName as '@EmployeeLastName'
	   , E.EmployeeNumber
       , E.DateOfBirth
	   , T.Amount as 'Transactions/Amount'
	   , T.DateOfTransaction as 'Transactions/DateOfTransaction#'
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransactions] as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber between 200 and 202
for xml path('Employees'), ROOT('MyXML')
