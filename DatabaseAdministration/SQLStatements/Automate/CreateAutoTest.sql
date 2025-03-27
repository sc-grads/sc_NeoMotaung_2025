IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
    PRINT 'Database AutoTest created successfully.';
END
ELSE
BEGIN
    PRINT 'Database AutoTest already exists.';
END