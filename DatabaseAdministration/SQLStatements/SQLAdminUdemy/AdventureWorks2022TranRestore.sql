RESTORE LOG [AdventureWorks2022] FROM  DISK = N'C:\SQL_BACKUPS\AdventureWorks2022_tran.trn' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO

RESTORE LOG [AdventureWorks2022] FROM  DISK = N'C:\SQL_BACKUPS\AdventureWorks2022_tran_1.trn' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO

RESTORE LOG [AdventureWorks2022] FROM  DISK = N'C:\SQL_BACKUPS\AdventureWorks2022_tran_2.trn' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [AdventureWorks2022] WITH RECOVERY
GO 
