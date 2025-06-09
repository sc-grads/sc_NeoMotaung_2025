CREATE TABLE StagingTable (
    StagingID INT IDENTITY(1,1),
    SlotDate NVARCHAR(255),
    DOfWeek NVARCHAR(255),
	Client NVARCHAR(255),
	ClientProjectName NVARCHAR(255),
	ActivityDesc NVARCHAR(255),
	BillOrNonBill NVARCHAR(255),
	Comments NVARCHAR(1000),
	TotalHours NVARCHAR(255),
	StartTime NVARCHAR(255),
	EndTime NVARCHAR(255),
    -- Add all columns from your Excel file
    IsValid BIT DEFAULT 0,
    ProcessingNotes NVARCHAR(500),
    -- Other metadata columns as needed
    LoadDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE ResultTestTable (
    StagingID INT IDENTITY(1,1),
    SlotDate NVARCHAR(255),
    DOfWeek NVARCHAR(255),
	Client NVARCHAR(255),
	ClientProjectName NVARCHAR(255),
	ActivityDesc NVARCHAR(255),
	BillOrNonBill NVARCHAR(255),
	Comments NVARCHAR(1000),
	TotalHours NVARCHAR(255),
	StartTime NVARCHAR(255),
	EndTime NVARCHAR(255),
    -- Add all columns from your Excel file
    IsValid BIT DEFAULT 0,
    ProcessingNotes NVARCHAR(500),
    -- Other metadata columns as needed
    LoadDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE FinalStageTest(
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[EntryDate] [date] NULL,
	[ClientID] [int] NULL,
	[Project] [varchar](50) NULL,
	[EntryDesc] [varchar](50) NULL,
	[BillOrNonBill] [varchar](50) NULL,
	[Comments] [nvarchar](max) NULL,
	[TotalHours] [time](0) NULL,
	[StartTime] [time](0) NULL,
	[EndTime] [time](0) NULL
)

use TimesheetDB
select * from StagingTable
select * from FinalStageTest
--drop table StagingTable

truncate table StagingTable
truncate table FinalStageTest