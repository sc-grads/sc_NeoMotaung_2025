drop database TheNINES

--CREATE TIMESHEETDB
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TimesheetDB')
        CREATE DATABASE TimesheetDB;
    PRINT 'Database TimesheetDB created successfully or already exists.';
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


--TIMESHEET TABLE CREATION
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Timesheet')
        CREATE TABLE [dbo].[Timesheet] (
            TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
			EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
            EntryDate DATE,
			ClientID int FOREIGN KEY REFERENCES Client(ClientID),
			Project varchar(50),
			EntryDesc varchar(50),
			BillOrNonBill varchar(50),
			Comments nvarchar(max),
			TotalHours TIME(0),
			StartTime TIME(0),
			EndTime TIME(0)
        );
    PRINT 'Table [dbo].[Timesheets] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--TABLE EMPLOYEE CREATION
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Employee')
        CREATE TABLE [dbo].[Employee] (
            EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
			EmployeeName nvarchar(50),
			
        );
    PRINT 'Table [dbo].[Employee] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

alter table dbo.Employee
alter column EmployeeName varchar(50)

alter table Employee
drop column Email


--LEAVE TABLE CREATION
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Leave')
        CREATE TABLE [dbo].[Leave] (
            LeaveID INT IDENTITY(1,1) PRIMARY KEY,
			TimesheetID int FOREIGN KEY REFERENCES Timesheet(TimesheetID),
			EmployeeID int FOREIGN KEY REFERENCES Employee(EmployeeID),
			TypeOfLeave varchar(50),
			StartDate DATE,
			EndDate DATE,
			NumberOfDays smallint,
        );
    PRINT 'Table [dbo].[Leave] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

ALTER TABLE Leave
ADD Approved nvarchar(15), DateOfApplication DATE;

alter table Leave
drop column DateOfApplication

create table TestEmployees 
(
	TestID INT IDENTITY(1,1) PRIMARY KEY,
	Employees varchar(50),
    EntryDate DATE,
	EntryDesc varchar(50),
	BillOrNonBill varchar(50),
	Comments nvarchar(max),
	TotalHours TIME(0),
	StartTime TIME(0),
	EndTime TIME(0)
)

--drop table Project


--PROJECT TABLE CREATION
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Project')
        CREATE TABLE [dbo].[Project] (
            ProjectID INT IDENTITY(1,1) PRIMARY KEY,
			ClientID int FOREIGN KEY REFERENCES Client(ClientID),
			ProjectName varchar(20),
        );
    PRINT 'Table [dbo].[Project] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--CLIENT TABLE CREATION
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Client')
        CREATE TABLE [dbo].[Client] (
            ClientID INT IDENTITY(1,1) PRIMARY KEY,
			ClientName varchar(20),
        );
    PRINT 'Table [dbo].[Client] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

alter table Client
alter column ClientName varchar(50)

drop table TestEmployees
drop table Leave
drop table Timesheet
drop table Project
drop table Client

--SELECT * FROM Timesheet