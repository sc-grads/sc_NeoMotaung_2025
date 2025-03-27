IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTestDev_27Mar')
BEGIN
    CREATE DATABASE AutoTestDev_27Mar;
    PRINT 'Database AutoTestDev_27Mar created successfully.';
END
ELSE
BEGIN
    PRINT 'Database AutoTestDev_27Mar already exists.';
END
