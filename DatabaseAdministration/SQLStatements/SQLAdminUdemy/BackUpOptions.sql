BACKUP DATABASE AdventureWorks2022 TO DISK = 'C:\AdventureWorks2022.bak'
BACKUP DATABASE AdventureWorks2022 FILE = 'TestBackUp' TO DISK = 'C:\TestBackup_TestBackup.FIL'
BACKUP DATABASE AdventureWorks2022 FILEGROUP = 'ReadOnly' TO DISK = 'C:\TestBackup_TestBackup.FLG'

BACKUP DATABASE AdventureWorks2022 TO DISK = 'C:\SQL_BACKUPS\AdventureWorks2022_1.bak',DISK = 'C:\SQL_BACKUPS\AdventureWorks2022_2.bak',DISK = 'C:\SQL_BACKUPS\AdventureWorks2022_3.bak'


BACKUP DATABASE AdventureWorks2022 TO DISK = 'C:\SQL_BACKUPS\AdventureWorks2022.bak' WITH PASSWORD = 'Pass@123'
BACKUP DATABASE AdventureWorks2022 TO DISK = 'C:\AdventureWorks2022.BAK' WITH STATS
BACKUP DATABASE AdventureWorks2022 TO DISK = 'C:\AdventureWorks2022.BAK' WITH DESCRIPTION = 'Full backup for adventureworks2022'
BACKUP DATABASE AdventureWorks2022 TO DISK = 'C:\AdventureWorks2022.BAK' MIRROR TO DISK = 'D:\AdventureWorks2022_mirror.BAK' WITH FORMAT