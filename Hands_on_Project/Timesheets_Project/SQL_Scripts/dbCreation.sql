BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TheNINES')
        CREATE DATABASE TheNINES;
    PRINT 'Database theNINES created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating database: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

BEGIN TRY
    USE TheNINES;
    PRINT 'Switched to TheNINES database.';
END TRY
BEGIN CATCH
    PRINT 'Error switching to database: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tblTimesheets')
        CREATE TABLE [dbo].[tblTimesheets] (
            ID INT IDENTITY(1,1) PRIMARY KEY,
			graduateName varchar(15),
            entryDate DATE,
			Client varchar(50),
			projectName varchar(50),
			entryDesc varchar(50),
			BillOrNonBill varchar(50),
			Comments nvarchar(max),
			totalHours TIME(0),
			startTime TIME(0),
			endTime TIME(0)
        );
    PRINT 'Table [dbo].[tblTimesheets] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tblGrads')
        CREATE TABLE [dbo].[tblGrads] (
            gradID INT IDENTITY(1,1) PRIMARY KEY,
			FirstName varchar(15),
			LastName varchar(20),

        );
    PRINT 'Table [dbo].[tblGrads] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

SELECT * FROM tblTimesheets