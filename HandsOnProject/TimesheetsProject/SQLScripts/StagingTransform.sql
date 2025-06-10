DELETE FROM StagingTable WHERE SlotDate IS NULL;

DELETE FROM StagingTable WHERE StartDate IS NULL AND EndTime IS NULL;

UPDATE StagingTable SET 
SlotDate = CAST(SlotDate AS DATE), 

DOfWeek = CAST(DOfWeek AS nvarchar(10)),

Client = CAST(Client AS nvarchar(50))
,
ClientProjectName = CAST(ClientProjectName AS nvarchar(50))
,
ActivityDesc = CAST(ActivityDesc AS nvarchar(50))
,
Comments = CAST(Comments AS nvarchar(max))
,
TotalHours = CAST(TotalHours AS TIME)
,
StartTime = CAST(StartTime AS TIME),
EndTime = CAST(EndTime AS TIME),
WHERE IsProcessed = 0;