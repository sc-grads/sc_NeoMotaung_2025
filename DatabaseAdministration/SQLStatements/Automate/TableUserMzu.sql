USE neoAutoTest; 
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'neoUser' AND type = 'U')
BEGIN
    CREATE TABLE neoUser (
        fName VARCHAR(50) NOT NULL,
        Surname VARCHAR(50) NOT NULL,
        Email VARCHAR(50) NOT NULL
    );
    PRINT 'Table neoUser created successfully.';
END
ELSE
BEGIN
    PRINT 'Table neoUser already exists.';
END