select * from tblEmployee

select T.EmployeeNumber as TNumber,
E.EmployeeNumber as ENumber,
sum(Amount) as SumAmount
from tblTransactions as T
left join tblEmployee as E
on T.EmployeeNumber = E.EmployeeNumber
group by T.EmployeeNumber, E.EmployeeNumber
order by E.EmployeeNumber

BEGIN TRAN
UPDATE tblEmployee
SET DateOfBirth = '2101-01-01'
WHERE EmployeeNumber = 537
SELECT * FROM tblEmployee ORDER BY DateOfBirth DESC
ROLLBACK TRAN

BEGIN TRAN
UPDATE tblEmployee
SET EmployeeGovernmentID = 'aaaa'
WHERE EmployeeNumber BETWEEN 530 and 539
SELECT * FROM tblEmployee ORDER BY EmployeeGovernmentID ASC
ROLLBACK TRAN