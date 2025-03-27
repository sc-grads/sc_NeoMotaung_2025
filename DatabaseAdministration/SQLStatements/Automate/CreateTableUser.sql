USE AutoTestDev;  -- Specify your database name here
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tUser' AND type = 'U')
BEGIN
    CREATE TABLE tUser (
        fName VARCHAR(50) NOT NULL,
        Surname VARCHAR(50) NOT NULL,
        Email VARCHAR(50) NOT NULL
    );
    PRINT 'Table User created successfully.';
END
ELSE
BEGIN
    PRINT 'Table User already exists.';
END
