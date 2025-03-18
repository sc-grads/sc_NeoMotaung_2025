USE [AdventureWorks2022_RestoreTest]
GO
CREATE USER [SAMBE2025020\winuser21] WITH DEFAULT_SCHEMA=[dbo]
GO

GRANT ALTER ON SCHEMA::Sales TO [SAMBE2025020\winuser21]

SELECT pe.state_desc, pe.permission_name FROM sys.database_principals pr INNER JOIN  sys.database_permissions pe
ON pr.principal_id = pe.grantee_principal_id WHERE pr.principal_id = USER_ID('SAMBE2025020\winuser21')

