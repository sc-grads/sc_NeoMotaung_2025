BEGIN TRAN
CREATE SEQUENCE newSeq AS BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
CACHE 50
select NEXT VALUE FOR newSeq as NextValue;
--select *, NEXT VALUE FOR newSeq OVER (ORDER BY DateOfTransaction) as NextNumber from tblTransactions
rollback tran

CREATE SEQUENCE newSeq AS BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
--MAXVALUE 999999
--CYCLE
CACHE 50

alter table tblTransactions
ADD NextNumber int CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq

alter table tblTransactions
drop DF_Transaction
alter table tblTransactions
drop column NextNumber

alter table tblTransactions
add NextNumber int
alter table tblTransactions
add CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq for NextNumber

begin tran
select * from tblTransactions
INSERT INTO tblTransactions(Amount, DateOfTransaction, EmployeeNumber)
VALUES (1,'2017-01-01',123)
select * from tblTransactions WHERE EmployeeNumber = 123;
update tblTransactions
set NextNumber = NEXT VALUE FOR newSeq
where NextNumber is null
select * from tblTransactions --WHERE EmployeeNumber = 123
ROLLBACK TRAN

--SET IDENTITY_INSERT tablename ON
--DBCC CHECKIDENT(tablename,RESEED)

alter sequence newSeq
restart with 1

alter table tblTransactions
drop DF_Transaction
alter table tblTransactions
drop column NextNumber
DROP SEQUENCE newSeq
