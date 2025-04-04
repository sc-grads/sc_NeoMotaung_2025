--Create AutoTest_NM_04April
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoTest_NM_04April')
        CREATE DATABASE AutoTest_NM_04April;
    PRINT 'Database AutoTest_NM_04April created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating database: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--Switch context to AutoTest_NM_04April
BEGIN TRY
    USE AutoTest_NM_04April;
    PRINT 'Switched to AutoTest_NM_04April database.';
END TRY
BEGIN CATCH
    PRINT 'Error switching to database: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--Create table user
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'user')
        CREATE TABLE [dbo].[user] (
            ID INT IDENTITY(1,1) PRIMARY KEY,
            Name NVARCHAR(100),
            Surname NVARCHAR(100),
            Email NVARCHAR(100)
        );
    PRINT 'Table [dbo].[user] created successfully or already exists.';
END TRY
BEGIN CATCH
    PRINT 'Error creating table: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--Delete stored procedure InsertUser if it exists
BEGIN TRY
    IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'InsertUser')
        DROP PROCEDURE InsertUser;
    PRINT 'Dropped existing procedure.';
END TRY
BEGIN CATCH
    PRINT 'Error dropping procedure: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

--Create stored prcoedure InsertUser
CREATE PROCEDURE InsertUser
    @Name NVARCHAR(100),
    @Surname NVARCHAR(100),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO [dbo].[user] (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END;
PRINT 'Stored procedure InsertUser created successfully.';
GO

--Execite InsertUser
BEGIN TRY
    EXEC InsertUser 'Leonardo', 'Yoshi', 'l.yoshi@example.com';
END TRY
BEGIN CATCH
    PRINT 'Error inserting record: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO

BEGIN TRY
    EXEC InsertUser 'Donatello', 'Dexter', 'd.dexter@example.com';
END TRY
BEGIN CATCH
    PRINT 'Error inserting second user: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
GO
