select E.EmployeeNumber as ENumber, E.EmployeeFirstName,
	E.EmployeeLastName, T.EmployeeNumber AS TNumber,
	sum(T.Amount) as TotalAmount
from tblEmployee as E
left join tblTransactions as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber is NULL
group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
E.EmployeeLastName
ORDER BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, 
E.EmployeeLastName

--derived table

select * from
( 
select E.EmployeeNumber as ENumber, E.EmployeeFirstName,
	E.EmployeeLastName, T.EmployeeNumber AS TNumber,
	sum(T.Amount) as TotalAmount
from tblEmployee as E
left join tblTransactions as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber is NULL
group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
E.EmployeeLastName
) as newTable
WHERE TNumber is null
ORDER BY ENumber, TNumber, EmployeeFirstName, 
EmployeeLastName
--for derived queries, order by cannot be inside the "inner" query.
--Use the custom(?) names given to the columns in the inner query select statement
--When working with the columns outside the inner query
