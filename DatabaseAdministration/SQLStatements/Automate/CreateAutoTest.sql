IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
    PRINT 'Database MyDatabase created successfully.';
END
ELSE
BEGIN
    PRINT 'Database MyDatabase already exists.';
END