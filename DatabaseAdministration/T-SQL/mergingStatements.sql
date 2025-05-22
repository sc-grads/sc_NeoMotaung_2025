BEGIN TRAN
MERGE INTO tblTransactions as T
USING tblTransactionNew as S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
	UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Amount], [DateOfTransaction], [EmployeeNumber])
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber);
ROLLBACK TRAN

SELECT EmployeeNumber, DateOfTransaction, COUNT(*) 
FROM tblTransactionNew
group by EmployeeNumber, DateOfTransaction
having count(*) > 1

SELECT EmployeeNumber, DateOfTransaction, sum(Amount) as TotalAmount 
FROM tblTransactionNew
group by EmployeeNumber, DateOfTransaction --copied these 3 lines into the merge statements after USING
having count(*) > 1

BEGIN TRAN
MERGE INTO tblTransactions as T
USING (SELECT EmployeeNumber, DateOfTransaction, sum(Amount) as Amount 
FROM tblTransactionNew
group by EmployeeNumber, DateOfTransaction) as S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
	UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Amount], [DateOfTransaction], [EmployeeNumber])
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
OUTPUT inserted.*,deleted.*;
ROLLBACK TRAN

BEGIN TRAN
ALTER TABLE tblTransactions
ADD Comments varchar(50) NULL
GO
MERGE INTO tblTransactions as T
USING (SELECT EmployeeNumber, DateOfTransaction, sum(Amount) as Amount 
FROM tblTransactionNew
group by EmployeeNumber, DateOfTransaction) as S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
	UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updated row'
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Amount], [DateOfTransaction], [EmployeeNumber], Comments)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted row')
WHEN NOT MATCHED BY SOURCE THEN
	UPDATE SET Comments = 'Unchanged';
--OUTPUT inserted.*,deleted.*;
SELECT * FROM tblTransactions
ROLLBACK TRAN