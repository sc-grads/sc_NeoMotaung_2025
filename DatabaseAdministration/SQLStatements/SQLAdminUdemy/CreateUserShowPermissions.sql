USE [AdventureWorks2022_RestoreTest]
GO
CREATE USER [Auto_user] FOR LOGIN [Auto_user]
GO

SELECT pe.state_desc, pe.permission_name FROM sys.database_principals pr INNER JOIN  sys.database_permissions pe
ON pr.principal_id = pe.grantee_principal_id WHERE pr.principal_id = USER_ID('Auto_user')