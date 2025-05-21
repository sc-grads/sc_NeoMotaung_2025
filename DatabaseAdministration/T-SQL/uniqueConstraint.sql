alter table tblEmployee
add constraint unqGovernmentID UNIQUE (EmployeeGovernmentID)

--Displays which governmentID's are being repeated and by how much.
select EmployeeGovernmentID, count(EmployeeGovernmentID) as myCount  
from tblEmployee
group by EmployeeGovernmentID
having count(EmployeeGovernmentID)>1

--Checks the records with repeating govID
select * from tblEmployee where EmployeeGovernmentID IN ('HDIDHIDD', 'EIEEISS')

--Deletes repeating records
BEGIN TRAN 
DELETE FROM tblEmployee
WHERE EmployeeNumber < 3
delete top(2) from tblEmployee
WHERE EmployeeNumber in (131, 132)
COMMIT TRAN

--Constraint kept in keys because sql is forming a dictorionary of constraints

--Constraints for multiple columns

alter table tblTransactions
add constraint unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber)

--Constraints for new table

create table tblTransaction2
(
	Amount smallmoney NOT NULL,
	DateOfTransaction smallDATETIME not NULL,
	EmployeeNumber int not null,
	CONSTRAINT unqTransaction2 UNIQUE (Amount, DateOfTransaction, EmployeeNumber))

--The combination of rows must be unique, but not the individual rows for a compound constraint
INSERT INTO tblTransaction2 VALUES (12.56, '1995-01-01', 1002), (13.56, '1995-01-01', 1003)

INSERT INTO tblTransaction2 VALUES (12.55, '1996-09-09', 1004), (12.55, '1996-09-09', 1004)


drop table tblTransaction2