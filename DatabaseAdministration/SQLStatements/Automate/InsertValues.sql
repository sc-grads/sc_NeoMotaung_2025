USE AutoTestDev_27Mar
GO

CREATE PROCEDURE InsertUser
    @fName VARCHAR(50),
    @sName VARCHAR(50),
	@Email VARCHAR(50)
AS
BEGIN
	IF @Email IS NOT NULL AND EXISTS (
        SELECT 1 FROM tUser WHERE Email = @Email AND fName = @fName AND Surname = @sName
    )
    BEGIN
		RAISERROR('Customer with this email already exists.', 16, 1);
        RETURN;
    END
    -- Insert statement
    INSERT INTO tUser(fName, Surname, Email)
    VALUES (@fName, @sName, @Email);
END;

-- Execute the stored procedure with sample values
EXEC InsertUser @fName = 'Leonardo', @sName = 'Smith', @Email = 'l.smith@gmail.com';

EXEC InsertUser @fName = 'Donatello', @sName = 'Doe', @Email = 'd.doe@gmail.com';

EXEC InsertUser @fName = 'Michaelangelo', @sName = 'Johnson', @Email = 'm.Johnson@gmail.com';

EXEC InsertUser @fName = 'Raphael', @sName = 'Johnson', @Email = 'r.johnson@gmail.com';
