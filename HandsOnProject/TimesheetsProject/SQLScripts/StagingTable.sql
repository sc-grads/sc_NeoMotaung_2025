CREATE TABLE StagingTable (
    StagingID INT IDENTITY(1,1),
    ExcelRowNumber INT,
    SlotDate VARCHAR(255),
    DOfWeek VARCHAR(255),
	Client VARCHAR(255),
	ClientProjectName VARCHAR(255),
	ActivityDesc VARCHAR(255),
	BillOrNonBill VARCHAR(255),
	Comments VARCHAR(255),
	TotalHours VARCHAR(255),
	StartTime VARCHAR(255),
	EndTime VARCHAR(255),
    -- Add all columns from your Excel file
    IsValid BIT DEFAULT 0,
    ProcessingNotes VARCHAR(500),
    -- Other metadata columns as needed
    LoadDate DATETIME DEFAULT GETDATE()
);

select * from StagingTable