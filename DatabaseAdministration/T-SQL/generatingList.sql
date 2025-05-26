select * from tblEmployee as E
LEFT JOIN tblTransactions as T
on e.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber IS NULL
ORDER BY E.EmployeeNumber

SELECT * FROM tblTransactions
ORDER BY EmployeeNumber ASC

--missing employee numbers
with Numbers as (
SELECT row_Number() OVER(ORDER BY (SELECT NULL)) AS RowNumber
from tblTransactions as U)

select U.RowNumber from Numbers as U
left join tblTransactions as T
on U.RowNumber = T.EmployeeNumber
WHERE T.EmployeeNumber is null