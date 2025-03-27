IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTest_NM_27Mar')
BEGIN
    CREATE DATABASE AutoTest_NM_27Mar;
    PRINT 'Database AutoTest_NM_27Mar created successfully.';
END
ELSE
BEGIN
    PRINT 'Database AutoTest_NM_27Mar already exists.';
END
