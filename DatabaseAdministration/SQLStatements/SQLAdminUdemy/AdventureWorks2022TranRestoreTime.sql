-- Transaction restore at specific time, 14:42
RESTORE LOG [AdventureWorks2022_RestoreTest] FROM  DISK = N'C:\SQL_BACKUPS\AdventureWorks2022_tran.trn' WITH  FILE = 2,  NOUNLOAD,  STATS = 10,  STOPAT = N'2025-03-17T14:42:38'
GO
