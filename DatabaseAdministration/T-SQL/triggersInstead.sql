--Template
CREATE TRIGGER TRIGGER_NAME ON TABLE_NAME
INSTEAD OF DELETE, INSERT
AS
BEGIN
SET NOCOUNT ON
END

GO

CREATE TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
	SELECT *, 'ViewByDepartment' FROM deleted
END

BEGIN TRAN
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 and EmployeeNumber = 132
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 and EmployeeNumber = 132
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 and EmployeeNumber = 132
ROLLBACK TRAN
