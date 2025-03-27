IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTest_NM_27March')
BEGIN
    CREATE DATABASE AutoTest_NM_27March;
    PRINT 'Database AutoTest_NM_27March created successfully.';
END
ELSE
BEGIN
    PRINT 'Database AutoTest_NM_27March already exists.';
END
