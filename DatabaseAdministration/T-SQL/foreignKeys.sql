alter table tblTransactions
add constraint FK_tblTransaction FOREIGN KEY (EmployeeNumber)
REFERENCES tblEmployee (EmployeeNumber)

BEGIN TRAN
ALTER TABLE tblTransactions ALTER COLUMN EmployeeNumber INT NULL
ALTER TABLE tblTransactions ADD CONSTRAINT DF_tblTransaction DEFAULT 124 FOR EmployeeNumber
ALTER TABLE tblTransactions WITH NOCHECK
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)
REFERENCES tblEmployee (EmployeeNumber)

ON UPDATE CASCADE
ON DELETE SET DEFAULT
--UPDATE tblEmployee SET EmployeeNumber = 9123 WHERE EmployeeNumber = 123
DELETE tblEmployee WHERE EmployeeNumber = 123

SELECT E.EmployeeNumber, T.*
FROM tblEmployee as E
RIGHT JOIN tblTransactions as T
on E.EmployeeNumber = T.EmployeeNumber
WHERE T.Amount IN (-179.47, 786.22, -967.36, 957.03)

ROLLBACK TRAN