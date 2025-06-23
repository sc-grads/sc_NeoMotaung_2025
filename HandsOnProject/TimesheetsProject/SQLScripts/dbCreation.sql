
--CREATE TIMESHEETDB
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TimesheetDB')
        CREATE DATABASE TimesheetDB;
    PRINT 'Database TimesheetDB created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating database: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--SWITCH CONTEXT TO TimesheetDB
BEGIN TRY
    USE TimesheetDB;
    PRINT 'Switched to TimesheetDB database.';
END TRY
BEGIN CATCH
    PRINT 'Error switching to database: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

DROP TABLE Timesheet
DROP TABLE Leave
DROP TABLE Employee
DROP TABLE Description
DROP TABLE Client
DROP TABLE WorkbookFile
DROP TABLE ErrorLog
DROP TABLE AuditLogs

--TABLE EMPLOYEE CREATION

BEGIN TRY
    CREATE TABLE [dbo].[Employee] (
        EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
		EmployeeName nvarchar(50),
    );
    PRINT 'Table [dbo].[Employee] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

-- TABLE WORKBOOKFILE 

BEGIN TRY
    CREATE TABLE [dbo].[WorkbookFile] (
        WorkbookFileID INT IDENTITY(1,1) PRIMARY KEY,
		NameOfFile nvarchar(255),
    );
    PRINT 'Table [dbo].[WorkbookFile] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--TABLE DESCRIPTION

BEGIN TRY
    CREATE TABLE [dbo].[Description] (
        DescriptionID INT IDENTITY(1,1) PRIMARY KEY,
		DescText nvarchar(50),
    );
    PRINT 'Table [dbo].[Description] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--CLIENT TABLE CREATION

BEGIN TRY
	CREATE TABLE [dbo].[Client] (
        ClientID INT IDENTITY(1,1) PRIMARY KEY,
		ClientName nvarchar(50),
    );
    PRINT 'Table [dbo].[Client] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--LEAVE TABLE CREATION

BEGIN TRY
    CREATE TABLE [dbo].[Leave] (
        LeaveID INT IDENTITY(1,1) PRIMARY KEY,
		WorkbookFileID int FOREIGN KEY REFERENCES WorkbookFile(WorkbookFileID),
		EmployeeID int FOREIGN KEY REFERENCES Employee(EmployeeID),
		TypeOfLeave nvarchar(50),
		StartDate DATE,
		EndDate DATE,
		NumberOfDays smallint,
    );
    PRINT 'Table [dbo].[Leave] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--TIMESHEET TABLE CREATION

BEGIN TRY
    CREATE TABLE Timesheet (
        TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
		EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
        EntryDate DATE,
		DayOfTheWeek nvarchar(10),
		ClientID int FOREIGN KEY REFERENCES Client(ClientID),
		Project nvarchar(50),
		DescriptionID int FOREIGN KEY REFERENCES Description(DescriptionID),
		BillOrNonBill nvarchar(50),
		Comments nvarchar(max),
		TotalHours TIME(0),
		StartTime TIME(0),
		EndTime TIME(0)
    );
    PRINT 'Table [dbo].[Timesheet] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO





--TABLE AUDIT LOGS

BEGIN TRY
	CREATE TABLE AuditLogs
		(
		LogID  INT IDENTITY(1,1) PRIMARY KEY,
		EventType nvarchar(100),
		FileName nvarchar(100),
		PackageName nvarchar(100),
		TaskName nvarchar(100),
		DestinationTable nvarchar(50),
		ActionType nvarchar(50),
		RowsInitialized int,
		RowsProcessed int,
		Machine nvarchar(255),
		UserName nvarchar(100),
		LogTime datetime2(7),
		)
    PRINT 'Table [dbo].[AuditLog] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--TABLE ERRORS

BEGIN TRY
    CREATE TABLE [dbo].[ErrorLog] (
        ErrorID INT IDENTITY(1,1) PRIMARY KEY,
		SheetFileName nvarchar(255),
		ErrorCode int,
		ErrorMsg nvarchar(1000),
		ErrorTime DATETIME DEFAULT GETDATE()
    );
    PRINT 'Table [dbo].[ErrorLog] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO
