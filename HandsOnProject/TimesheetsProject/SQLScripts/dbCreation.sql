
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

DROP TABLE if exists StagingLeave
DROP TABLE if exists StagingTimesheet
DROP TABLE if exists StagingMasters
DROP TABLE if exists Timesheet
DROP TABLE if exists Leave
DROP TABLE if exists Employee
DROP TABLE if exists Description
DROP TABLE if exists Client
DROP TABLE if exists WorkbookFile
DROP TABLE if exists ErrorLog
DROP TABLE if exists AuditLogs

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

BEGIN TRY
    CREATE TABLE StagingTimesheet (
        StageTimesheetID INT IDENTITY(1,1) PRIMARY KEY,
        SlotDate nvarchar(255),
		DayOfTheWeek nvarchar(255),
		Client nvarchar(255),
		Project nvarchar(255),
		Description nvarchar(255),
		BillOrNonBill nvarchar(255),
		Comments nvarchar(1000),
		TotalHours nvarchar(255),
		StartTime nvarchar(255),
		EndTime nvarchar(255)
    );
    PRINT 'Table [dbo].[StagingTimesheet] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

BEGIN TRY
    CREATE TABLE [dbo].[StagingLeave] (
        StagingLeaveID INT IDENTITY(1,1) PRIMARY KEY,
		TypeOfLeave nvarchar(255),
		StartDate nvarchar(255),
		EndDate nvarchar(255),
		NumberOfDays nvarchar(255),
    );
    PRINT 'Table [dbo].[StagingLeave] created successfully';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

BEGIN TRY
    CREATE TABLE [dbo].[StagingMasters] (
        StagingMasterID INT IDENTITY(1,1) PRIMARY KEY,
		ClientName nvarchar(255),
		DescriptionType nvarchar(255),
		EmployeeName nvarchar(255),
    );
    PRINT 'Table [dbo].[StagingMasters] created successfully';
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
		RowsProcessed int,
		Machine nvarchar(255),
		UserName nvarchar(100),
		LogTime datetime2(7),
		)
    PRINT 'Table [dbo].[AuditLogs] created successfully';
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
		TaskName nvarchar(50),
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
