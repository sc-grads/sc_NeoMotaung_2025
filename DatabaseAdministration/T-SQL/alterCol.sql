ALTER TABLE tblEmployee
ADD Department VARCHAR(10);

SELECT * FROM tblEmployee

ALTER TABLE tblEmployee
ALTER COLUMN Department VARCHAR(30);

INSERT INTO tblEmployee 
VALUES (132, 'Dylan', 'A', 'Word', 'HV137770', '19920914', 'Customer Relations')

select * from tblEmployee