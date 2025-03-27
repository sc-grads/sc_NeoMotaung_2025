USE AutoTest_NM_27Mar; 
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'User_NM_27Mar' AND type = 'U')
BEGIN
    CREATE TABLE User_NM_27Mar (
        fName VARCHAR(50) NOT NULL,
        Surname VARCHAR(50) NOT NULL,
        Email VARCHAR(50) NOT NULL
    );
    PRINT 'Table User_NM_27Mar created successfully.';
END
ELSE
BEGIN
    PRINT 'Table User_NM_27Mar already exists.';
END
