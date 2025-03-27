IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTestDev')
BEGIN
    CREATE DATABASE AutoTestDev;
    PRINT 'Database AutoTestDev created successfully.';
END
ELSE
BEGIN
    PRINT 'Database AutoTestDev already exists.';
END
