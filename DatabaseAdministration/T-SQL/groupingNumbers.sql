with Numbers as (
select top(select max(EmployeeNumber) from tblTransactions) ROW_NUMBER() 
over(order by (select null)) as RowNumber
from tblTransactions as U),
Transaction2014 as (
select * from tblTransactions where DateOfTransaction >= '2014-01-01' and DateOfTransaction < '2015-01-01')

select U.RowNumber, 
	LAG(RowNumber) over(order by RowNumber) as PreviousRowNumber, 
	LEAD(RowNumber) over(order by RowNumber) - RowNumber as NextRowNumber
from Numbers as U 
left join tblTransactions as T
on U.RowNumber = T.EmployeeNumber
where T.EmployeeNumber is null
order by U.RowNumber