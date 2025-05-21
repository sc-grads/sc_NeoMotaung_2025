begin tran

insert into ViewByDepartment(EmployeeNumber, DateOfTransaction, TotalAmount)
values (132, '2017-02-03', 999.99)

select * from ViewByDepartment where EmployeeNumber = 132 order by Department, EmployeeNumber

rollback tran

begin tran 
select * from ViewByDepartment order by EmployeeNumber, DateOfTransaction
SELECT * FROM tblTransactions WHERE EmployeeNumber IN (132, 142)

UPDATE ViewByDepartment
SET EmployeeNumber = 142
WHERE EmployeeNumber = 132

SELECT * FROM ViewByDepartment ORDER BY EmployeeNumber, DateOfTransaction
ROLLBACK TRAN
